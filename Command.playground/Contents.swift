class Teacher {
    var name:String
    var subject:String
    
    init(name:String, subject:String) {
        self.name = name
        self.subject = subject
    }
    
    func printInfo() {
        print("\(self.name),\(self.subject)")
    }
}

class Command {
    enum `Type` {
        case add
        case delete
    }
    
    var name:String
    var subject:String?
    var type:Type
    
    init(name:String, type:Type, subject:String?) {
        self.name = name
        self.type = type
        self.subject = subject
    }
}

class School {
    var teachers = Array<Teacher>()
    
    func runCommand(command:Command) {
        
        if command.type == .add {
            self.addTeacher(name: command.name, subject: command.subject!)
        }
        
        if command.type == .delete {
            self.deleteTeacher(name: command.name)
        }
        
    }
    
    func addTeacher(name:String, subject:String) {
        let teacher = Teacher(name: name, subject: subject)
        teachers.append(teacher)
    }
    
    func deleteTeacher(name:String) {
        var index:Int? = nil
        for i in 0 ..< teachers.count {
            if teachers[i].name == name {
                index = i
            }
        }
        if let index = index {
            teachers.remove(at: index)
        }
    }
    
    func showTeachers() {
        for t in teachers {
            t.printInfo()
        }
    }
}

let school = School()
let command = Command(name: "Jaki", type: .add, subject: "Swift")
let command2 = Command(name: "Lucy", type: .add, subject: "Java")
school.runCommand(command: command)
school.runCommand(command: command2)
school.showTeachers()
let command3 = Command(name: "Jaki", type: .delete, subject: nil)
school.runCommand(command: command3)
school.showTeachers()
