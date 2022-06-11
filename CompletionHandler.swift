  func sample ( completion : @escaping (String)-> String,  name : String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            print("Delayed By two")
            print(completion("Called after main func"))
        }
    }
    
   sample(completion: { (result : String) in
          return ("result is \(result)")
      }, name: "name")


// Task is to keep the background task wait for tw sec and after which is done immediately move to second print statement.

  func sample ( completion : @escaping (String)-> String,  name : String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            print("Delayed By two")
        }
     print(completion("Called after main func"))
    }

// This will print the statement first and after a delayprints second

//Closures are Non Escaping By default. 
/*
This means once the function is executed the closure is removed from the memory.

So in the abouve case if the @escaping keyword was not added after the type, as soon as the function is executed closure will not be there on the memory
and it will be out of scope

when we add escaping it will outlive the function

*/
