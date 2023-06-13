
protocol AdvancedLifeSupport1 {
    func performCPR()
}

//class / Person that does / knows the Job Eg: URLSession that fetches the data
class EmergencyCallHandler1 {
    var delegate : AdvancedLifeSupport1?
    func assessSituation(){
        print("Tell me what happened")
    }
    func medicalEmergency(){
        delegate?.performCPR()
        //delegate is set as paramedic1 so it will call the performCPR in paramedic
    }
}


// Worker  (in another example) that ask the Protocol that I can Do the Job Eg: Viewcontroller that updates or makes changes to view

struct paraMedic1 : AdvancedLifeSupport1{
    init(handler: EmergencyCallHandler1){
        handler.delegate = self
    }
    func performCPR() {
        print("Paramedic performs CPR")
    }
}

struct paraMedic2 : AdvancedLifeSupport1{
 
    func performCPR() {
        print("Paramedic two performs CPR")
    }
}

let emilio1 = EmergencyCallHandler1()
 let pete1 = paraMedic1(handler: emilio1)
let pete2 = paraMedic1(handler: emilio1)
emilio1.assessSituation()
emilio1.medicalEmergency()


// Here initially the new instance of EmergencyCallhandler is created
// Step two : New instance of Paramedic1 is created at this time the handler is value is passed as  emilio
//At this time inside the paramedic1 a new instance of EmergencyCallHandler is created and its value is set to self, ie paramedic1
//This is equialent to saying the  delegate?.performCPR() inside medicalEmergency() is actually calling paramedic1. performCPR
// Here Emergencycallhandler is the main entity thats looking to do the job and paramedic1 is the Worker
//that tells he gan do the job by setting    handler.delegate = self

