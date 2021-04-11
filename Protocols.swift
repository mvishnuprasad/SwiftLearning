protocol Cars{
 var color:String{get set}
 func isAWD() -> Bool
}

class BMW : Cars{
var color:String=""

func isAWD() -> Bool {
return true
}
}

class Audi : Cars{
var color:String=""
func isAWD () -> Bool{
return false
}
}

let A=Audi()
let B=BMW()
A.color="Red"
B.color="Blue"








