import Foundation

struct Place {
    var x:Int
    var y:Int
}

enum Color {
    case White
    case Black
}

class ChessPieceFlyweight {
   
    var color:Color
    var radius:Double
    init(color:Color, radius:Double) {
        self.color = color
        self.radius = radius
    }
}

class ChessPieceFlyweightFactory {
    static let white = ChessPieceFlyweight(color: .White, radius: 5)
    static let black = ChessPieceFlyweight(color: .Black, radius: 5)
    
    static func getWhite() -> ChessPieceFlyweight {
        return white
    }
    
    static func getBlack() -> ChessPieceFlyweight {
        return black
    }
}

class ChessPiece {
    var weight:ChessPieceFlyweight
    var place:Place
    
    init(place:Place, color:Color) {
        if color == .White {
            self.weight = ChessPieceFlyweightFactory.getWhite()
        } else {
            self.weight = ChessPieceFlyweightFactory.getBlack()
        }
        self.place = place
    }
}

for i in 0 ..< 10 {
    let chessPiece = ChessPiece(place: Place(x: i, y: i), color: i % 2 == 0 ? .White : .Black)
    print("ChessPiece", Unmanaged.passRetained(chessPiece).toOpaque())
    print("Widget", Unmanaged.passRetained(chessPiece.weight).toOpaque())
}


