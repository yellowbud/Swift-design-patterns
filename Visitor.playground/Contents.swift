protocol Visitor {
    func visit(ticket:Ticket)
}

class Ticket {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}

class Tourist: Visitor {
    func visit(ticket: Ticket) {
        print("游客购买了\(ticket.name)")
    }
}

class Guard: Visitor {
    func visit(ticket: Ticket) {
        print("检票员检查了\(ticket.name)")
    }
}

let ticket = Ticket(name: "公园门票")
let tourist = Tourist()
let gua = Guard()
tourist.visit(ticket: ticket)
gua.visit(ticket: ticket)
