protocol WallProtocl {
    func printInfo()
}

class Wall: WallProtocl {
    func printInfo() {
        print("墙面")
    }
}

class StickerDecorator: WallProtocl {
    var wall:Wall
    
    init(wall:Wall) {
        self.wall = wall
    }
    
    func printInfo() {
        print("贴纸装饰")
        self.wall.printInfo()
    }
}

let wall = Wall()
wall.printInfo()
let stickerWall = StickerDecorator(wall: wall)
stickerWall.printInfo()
