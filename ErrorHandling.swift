
let playerDataPath="/example/data/a.txt"


enum DataError : Error{
case EmptyPath
case InvalidPath
}
func loadData(path:String) throws->Bool?{
guard path.contains("/") else{
throw DataError.InvalidPath
}

guard !path.isEmpty else{
    throw DataError.EmptyPath
}
return true
}

do {
    try loadData(path:playerDataPath)
}
catch is DataError {
print("Invalid/EmptyPath Detected")
}
catch {
print("Unknown Error Detected")
}

if let dataLoaded =  try? loadData(path:playerDataPath){
print("Success")
}


