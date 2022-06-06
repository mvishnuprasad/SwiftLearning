func calculate (n1: Int, n2: Int, Operation : (Int,Int)->Int)->Int{
 return n1 + n2 
}
func add(n1:Int, n2:Int)->Int{
return n1+n2
}
func multiply(n1:Int, n2:Int)->Int{
return n1*n2
}
calculate(n1:2,n2:3, add)
calculate(n1:2,n2:3, multiply)

// We can use closures to cut down the above operations
//Closures are functions without names
func add (n1:Int, n2:Int)->Int {
return n1+n2
}
// This can be converted to a closure by removing name func and replacing opening bracket with in 
{ (n1:Int, n2:Int)->Int in
  return n1+n2
}

eg: 
func calculateUsingClosure (n1: Int, n2: Int, Operation : (Int, Int) -> Int)-> Int {
  return Operation(n1,n2)
}
calculateUsingClosure (n1: Int, n2: Int, Operation :{ (n1:Int, n2:Int)->Int in
  return n1+n2
})
//Since swift can infer types this can be further reduced to

calculateUsingClosure (n1: Int, n2: Int, Operation :{ (n1, n2) in
  return n1+n2
})
//Compiler can also infer the return 
calculateUsingClosure (n1: Int, n2: Int, Operation :{ (n1, n2) in n1+n2 })
//which can be further reduced using first parameter & second parameter keyword ($0 and $1)
calculateUsingClosure (n1: Int, n2: Int, Operation :{ $0+$1 })
//Accrding to trailing closure if last parameter is a closure we can remove the name of the parameter and enclose .
calculateUsingClosure (n1: Int, n2: Int ) { $0+$1 }
//or
calculateUsingClosure (n1: Int, n2: Int){ (n1:Int, n2:Int)->Int in
  return n1+n2
}

let array = [1,2,3,4,5,6]
func add (n: Int)->Int{
    return n+1
}


print(array.map(add))
print(array.map({ (n: Int)->Int in
    return n+1
}))
print(array.map({ (n)  in
     n+1
}))
print(array.map{$0+1})


