class Management {
    func clockIn() {
        print("上班打卡")
    }
    func working() {
        print("开始工作")
    }
    func clockOut() {
        print("下班打开")
    }
    
    func start() {
        clockIn()
        working()
        clockOut()
    }
}

class Engineer: Management {
    override func working() {
        print("开始进行软件设计")
    }
}

let engineer = Engineer()
engineer.start()

let management = Management()
management.start()
