class SickPerson {
    
    var doctorProxy:DoctorProxy!
    
    init() {
        self.doctorProxy = DoctorProxy(sickPersion: self)
    }
    
    func describeCondition() -> String {
        print("病人描述病情")
        return "症状描述"
    }
}

class DoctorProxy {
    var sickPersion:SickPerson
    
    init(sickPersion:SickPerson) {
        self.sickPersion = sickPersion
    }
    
    func seeDoctor() {
        // 预约医生
        let doctor = reservation()
        // 病人描述病情
        let sick = self.sickPersion.describeCondition()
        // 医生问诊
        doctor.treatment(sick: sick)
        
    }
    
    func reservation() -> Doctor {
        print("预约医生完成")
        return Doctor()
    }
}

class Doctor {
    func treatment(sick:String) {
        print("根据\(sick)问诊结果进行开药治疗")
    }
}

let sickPerson = SickPerson()
let doctorPorxy = DoctorProxy(sickPersion: sickPerson)
doctorPorxy.seeDoctor()
