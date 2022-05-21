protocol Transport {
    func toDestination()
}

class Car:Transport {
    func toDestination() {
        print("乘坐小车到目的地")
    }
}

class Bus:Transport {
    func toDestination() {
        print("乘坐公交车到目的地")
    }
}

class Subway:Transport {
    func toDestination() {
        print("乘坐地铁到目的地")
    }
}

class Action {
    var destination:String
    var transport:Transport
    
    init(des:String, transport:Transport) {
        self.destination = des
        self.transport = transport
    }
    
    func go() {
        self.transport.toDestination()
    }
}

let action = Action(des: "上南路", transport: Bus())
action.go()

