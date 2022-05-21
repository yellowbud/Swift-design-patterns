class ClientOne {
}

class ClientTwo {
}

class ServerOne {
    func handleClientOne() {
        print("服务1处理了客户端1的请求")
    }
    func handleClientTwo() {
        print("服务1处理了客户端2的请求")
    }
}

class ServerTwo {
    func handleClientOne() {
        print("服务2处理了客户端1的请求")
    }
    func handleClientTwo() {
        print("服务2处理了客户端2的请求")
    }
}

class Mediator {
    static func handler(client:AnyObject, server:AnyObject) {
        if client is ClientOne {
            if server is ServerOne {
                 ServerOne().handleClientOne()
            } else {
                 ServerTwo().handleClientOne()
            }
        } else {
            if server is ServerOne {
                 ServerOne().handleClientTwo()
            } else {
                 ServerTwo().handleClientTwo()
            }
        }
    }
}

let client1 = ClientOne()
let client2 = ClientTwo()
let server1 = ServerOne()
let server2 = ServerTwo()
Mediator.handler(client: client1, server: server1)
Mediator.handler(client: client1, server: server2)
Mediator.handler(client: client2, server: server1)
Mediator.handler(client: client2, server: server2)
