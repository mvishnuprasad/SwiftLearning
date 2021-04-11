//A blueprint of Car as a protocol
protocol Cars{
 var color:String{get set}
 func isAWD() -> Bool
}
// New class that confirms with protocols with same properties as that of protocol
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








