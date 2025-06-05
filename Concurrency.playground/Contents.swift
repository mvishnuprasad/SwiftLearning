import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution=true
//
//DispatchQueue.global(qos: .background).async {
//    for i in 0...11{
//        print("\(i)")
//    }
//}
//DispatchQueue.global(qos: .userInitiated).async {
//    for i in 12...18{
//        print("\(i)")
//    }
//}

//
//let a = DispatchQueue(label: "a")
//let b = DispatchQueue(label: "b",attributes: .concurrent, target: a)
//a.async{
//    for i in 0..<5{
//        print("\(i)")
//    }
//}
//a.async{
//    for i in 5..<10{
//        print("\(i)")
//    }
//}
//b.async{
//    for i in 10..<15{
//        print("\(i)")
//    }
//}
//b.async{
//    for i in 15..<20{
//        print("\(i)")
//    }
//}
//var value: Int = 20
//let queue = DispatchQueue(label: "com.queue.Serial",attributes: .concurrent)
//
//func doAsyncTaskInQueue() {
//        for i in 1...3 {
//            queue.sync  {
//            if Thread.isMainThread{
//                print("task running in main thread")
//            }else{
//                print("task running in other thread")
//            }
//            let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("\(i) finished downloading")
//        }
//    }
//}
//
//doAsyncTaskInQueue()
//queue.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//print("Last line in playground 🎉")
//
//var value: Int = 20
//let queue = DispatchQueue(label: "com.queue.Serial",attributes: .concurrent)
//let group = DispatchGroup()
//
//func doAsyncTaskInQueue() {
//    
//    for i in 1...3 {
//        group.enter()
//        queue.async  {
//            let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
//            let _ = try! Data(contentsOf: imageURL)
//            print("\(i) finished downloading")
//            group.leave()
//        }
//    }
//}
//
//doAsyncTaskInQueue()
////group.notify(queue: queue){
////    print("Last line in playground 🎉")
////}
//group.wait(timeout: .now()+1516)
//print("Last line in playground 🎉")



//let highPriorityWorkItem = DispatchWorkItem(qos: .userInitiated) {
//    print("High priority work executing...")
//    // Simulate some computation
//    for i in 1...5 {
//        print("Processing step \(i)")
//        Thread.sleep(forTimeInterval: 0.5)
//    }
//    print("High priority work completed")
//}
//
//DispatchQueue.global().async(execute: highPriorityWorkItem)

//
//
//class DataProcessor {
//    private var currentWorkItem: DispatchWorkItem?
//    
//    func startProcessing() {
//        // Cancel any existing work
//        currentWorkItem?.cancel()
//        
//        currentWorkItem = DispatchWorkItem { [weak self] in
//            guard let self = self else { return }
//            
//            // Check if cancelled before starting
//            if self.currentWorkItem?.isCancelled == true {
//                print("Work was cancelled before starting")
//                return
//            }
//            
//            print("Starting data processing...")
//            
//            // Simulate long-running task with cancellation checks
//            for i in 1...10 {
//                // Check for cancellation during execution
//                if self.currentWorkItem?.isCancelled == true {
//                    print("Work cancelled at step \(i)")
//                    return
//                }
//                
//                print("Processing data chunk \(i)")
//                Thread.sleep(forTimeInterval: 0.5)
//            }
//            
//            print("Data processing completed successfully")
//        }
//        
//        DispatchQueue.global(qos: .utility).async(execute: currentWorkItem!)
//    }
//    
//    func cancelProcessing() {
//        print("Cancelling current processing...")
//        currentWorkItem?.cancel()
//    }
//}
//
//// Usage example
//let processor = DataProcessor()
//processor.startProcessing()
//
//// Cancel after 3 seconds
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    processor.cancelProcessing()
//}
//let notifiableWorkItem = DispatchWorkItem {
//    print("Doing some background work...")
//    Thread.sleep(forTimeInterval: 5)
//    print("Background work finished")
//}
//
//// Set up notification for completion
//notifiableWorkItem.notify(queue: .main) {
//    print("Work item completed - updating UI on main thread")
//    // Update UI here
//}
//
//// Execute the work
//DispatchQueue.global().async(execute: notifiableWorkItem)

//enum userNames : String {
//    case john4476
//    case vp857987
//    case vpm565
//    case vpm537
//}
//
//
//    func checkIfAvailable (for name : String) -> Bool {
//        return userNames(rawValue: name) != nil
//    }
//
//print("User typed: \( checkIfAvailable(for: "vpm565"))")

//
//nonisolated(unsafe) var value: Int = 2
//
//
//
//let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)
//
//concurrentQueue.async {
//    for i in 0...3 {
//        value = i
//        print("\(value) ✴️")
//    }
//}
//
//concurrentQueue.async (flags: .barrier){
//    for j in 4...6 {
//        value = j
//        print("\(value) ✡️")
//        print(Thread.current)
//    }
//}
//
//concurrentQueue.async (flags: .barrier){
//    value = 9
//    print(value)
//}
//
//concurrentQueue.async(flags: .barrier) {
//    value = 14
//    print(value)
//}
let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 2)

func performAsyncTaskIntoConcurrentQueue() {
        for i in 1...6 {
            concurrentQueue.async {
                print("###### Image \(i) waiting for download ######")
                semaphore.wait()
                print("###### Downloading Image \(i) ######")
                let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
                let _ = try! Data(contentsOf: imageURL)
                print("###### Image \(i) Downloaded ######")
                semaphore.signal()
            }
        }
}


performAsyncTaskIntoConcurrentQueue()
