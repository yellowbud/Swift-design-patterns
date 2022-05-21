enum Color {
    case white
    case black
}

enum TransportType {
    case car
    case bus
}

protocol TransportProtocol {
    var color:Color { get }
    var type:TransportType { get }
    
    func printInfo()
}

extension TransportProtocol {
    func printInfo() {
        print("\(self.color),\(self.type)")
    }
}

class Transport: TransportProtocol {
    var color:Color
    var type:TransportType
    
    init(color:Color, type:TransportType) {
        self.color = color
        self.type = type
    }
}

let car = Transport(color: .white, type: .car)
car.printInfo()



