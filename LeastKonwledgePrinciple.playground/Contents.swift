class Boss {
    var name:String
    var secretary:Secretary!
    
    init(name:String) {
        self.name = name
        self.secretary = Secretary(boss: self)
    }
    
    func dailyWork() {
       secretary.startWork()
    }
}


class Secretary {
    let boss:Boss
    
    init(boss:Boss) {
        self.boss = boss
    }
    
    func startWork() {
        self.businessExchange()
        self.managementCompany()
        self.meeting()
    }
    
    func businessExchange() {
        Customer().businessExchange(boss: boss)
    }
    func managementCompany() {
        Manager().managementCompany(boss: boss)
    }
    func meeting() {
        SocialAffair().meeting(boss: boss)
    }
}


class Customer {
    func businessExchange(boss:Boss) {
        print("\(boss.name)与客户进行业务交流")
    }
}

class Manager {
    func managementCompany(boss:Boss) {
        print("\(boss.name)进行公司管理")
    }
}

class SocialAffair {
    func meeting(boss:Boss) {
        print("\(boss.name)参加分享大会")
    }
}

let boss = Boss(name: "Jaki")
boss.dailyWork()
