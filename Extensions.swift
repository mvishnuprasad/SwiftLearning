class Print{
    func np(name:String){
print (name)
}
}
let s=Print()
s.np(name:"Vishnu")
extension Print{
    func ph(_ num:Int)  {
        print(num)
    }
}
s.ph(276866)