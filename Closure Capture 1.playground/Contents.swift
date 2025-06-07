import UIKit
import SwiftUI

enum NetworkingError: Error {
    case failedToLoad
}

class NetworkingManager {
    var storedCompletionBlock: ((Result<Data, NetworkingError>) -> Void)?
    
    func requestDataFromServer(withURL: String, completion: @escaping (Result<Data, NetworkingError>) -> Void) -> Void  {
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            [weak self ] in
                print("requesting data from server")
                
                /// Here the strong reference received is saved into a variable storedCompletionBlock
            self?.storedCompletionBlock = completion
                
            self?.storedCompletionBlock?(.success(Data()))
        })
         //self.storedCompletionBlock = nil
    }
    /*
     
     The ViewModel still has a strong reference to NetworkingManager
     [ var networkingManager: NetworkingManager? = NetworkingManager() ]
     The NetworkingManager still has a strong reference to the closure
     [ self.storedCompletionBlock = completion]
     The closure still has a strong reference to the ViewModel
     [ self.receievedData = data]
     
     
     */
    deinit {
        print("NetworkingManager dealloc")
    }
}

class ViewModel {
    
    var networkingManager: NetworkingManager? = NetworkingManager()
    var receievedData: Data?
    
    func requestDataFromAPI() {
        
        networkingManager?.requestDataFromServer(withURL: "MyAPIURL/EndPoint", completion: {[weak self] result in
            print("Completion")
            switch result {
            case .success(let data):
                self?.receievedData = data
                // retain cycle might be created here , Instance of VM, increase ARC by 1
                //It is then passed to requestDataFromServer function
                
            case .failure( _): break
            }
        })
        
    }
    
    deinit {
        print("ViewModel dealloc")
    }
}

var viewModel: ViewModel? = ViewModel()
viewModel?.requestDataFromAPI()
viewModel = nil


/*
 
 Before viewModel = nil:

 Your variable viewModel → ViewModel instance (Reference Count: 2)
 Closure → ViewModel instance (through self)
 ViewModel instance → NetworkingManager (Reference Count: 1)
 NetworkingManager → Closure (Reference Count: 1)

 After viewModel = nil:

 Your variable viewModel (removed)
 Closure → ViewModel instance (Reference Count: 1) ← Still alive!
 ViewModel instance → NetworkingManager (Reference Count: 1) ← Still alive!
 NetworkingManager → Closure (Reference Count: 1) ← Still alive!
 
 
 */
