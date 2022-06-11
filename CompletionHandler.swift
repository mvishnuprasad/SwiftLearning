  func sample ( completion : @escaping (String)-> String,  name : String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            print("Delayed By two")
            print(completion("Called after main func"))
        }
    }
    
   sample(completion: { (result : String) in
          return ("result is \(result)")
      }, name: "name")
