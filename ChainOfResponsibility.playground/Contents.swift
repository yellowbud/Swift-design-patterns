class Request {
    enum Level {
        case Low
        case Middle
        case High
    }
    
    var level:Level
    
    init(level:Level) {
        self.level = level
    }
}

protocol Handler {
    var nextHandler:Handler? { get }
    func handlerRquest(request:Request)
}

class Chain:Handler {
    var nextHandler: Handler? = LowHandler()
    func handlerRquest(request: Request) {
        nextHandler!.handlerRquest(request: request)
    }
}

class LowHandler:Handler {
    var nextHandler: Handler? = MiddleHandler()
    func handlerRquest(request:Request) {
        if request.level == .Low {
            print("LowHandler处理了请求")
        } else {
            if let next = nextHandler {
                next.handlerRquest(request: request)
            } else {
                print("无法处理的请求")
            }
        }
    }
}

class MiddleHandler:Handler {
    var nextHandler: Handler? = HighHandler()
    func handlerRquest(request:Request) {
        if request.level == .Middle {
            print("MiddleHandler处理了请求")
        } else {
            if let next = nextHandler {
                next.handlerRquest(request: request)
            } else {
                print("无法处理的请求")
            }
        }
    }
}

class HighHandler:Handler {
    var nextHandler: Handler?
    func handlerRquest(request:Request) {
        if request.level == .High {
            print("HighHandler处理了请求")
        } else {
            if let next = nextHandler {
                next.handlerRquest(request: request)
            } else {
                print("无法处理的请求")
            }
        }
    }
}

var request = Request(level: .Low)
Chain().handlerRquest(request: request)
request = Request(level: .Middle)
Chain().handlerRquest(request: request)
request = Request(level: .High)
Chain().handlerRquest(request: request)
