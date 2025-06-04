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

var value: Int = 20
let queue = DispatchQueue(label: "com.queue.Serial",attributes: .concurrent)
let group = DispatchGroup()

func doAsyncTaskInQueue() {
    
    for i in 1...3 {
        group.enter()
        queue.async  {
            let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
            let _ = try! Data(contentsOf: imageURL)
            print("\(i) finished downloading")
            group.leave()
        }
    }
}

doAsyncTaskInQueue()
//group.notify(queue: queue){
//    print("Last line in playground 🎉")
//}
group.wait(timeout: .now()+1516)
print("Last line in playground 🎉")
