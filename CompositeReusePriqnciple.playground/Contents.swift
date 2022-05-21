class Teacher {
    var name:String
    var subject:Subject
    init(name:String, subject:String) {
        self.name = name
        self.subject = Subject(name: subject)
    }
    
    func teach() {
        print("\(self.name)开始讲\(self.subject.name)课")
    }
}

class Subject {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}

let jaki = Teacher(name: "Jaki", subject: "Math")
let lucy = Teacher(name: "Lucy", subject: "Nature")

jaki.teach()
lucy.teach()

//class MathTeacher: Teacher {
//    override func teach() {
//        print("\(self.name)开始讲数学课")
//    }
//}
//
//class NatureTeacher: Teacher {
//    override func teach() {
//        print("\(self.name)开始讲自然课")
//    }
//}

//let jaki = MathTeacher(name: "Jaki")
//let lucy = NatureTeacher(name: "Lucy")
//
//jaki.teach()
//lucy.teach()

