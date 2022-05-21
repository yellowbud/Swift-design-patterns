class School: Iterator,IteratorProtocol {
    typealias ObjectType = String
    var cursor: Int = 0
    
    func next() -> String? {
        if teachers.count > self.cursor {
            
            let teacher = teachers[self.cursor]
            self.cursor += 1
            return teacher
        } else {
            return nil
        }
    }
    
    func reset() {
        self.cursor = 0
    }
    
    private var teachers = Array<String>()
    
    func addTeacher(name:String) {
        teachers.append(name)
    }
}

protocol Iterator {
    associatedtype ObjectType
    
    var cursor:Int { get }
    func next() -> ObjectType?
    func reset()
}

let school = School()
school.addTeacher(name: "Jaki")
school.addTeacher(name: "Lucy")
school.addTeacher(name: "Mery")

while let t = school.next() {
    print(t)
}
print("遍历完成")

