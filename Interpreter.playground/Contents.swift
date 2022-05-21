import Foundation
class Interpreter {
    static func handler(string:String) {
        let proto = string.components(separatedBy: "://")
        if let pro = proto.first {
            print("路由协议为\(pro)")
            if proto.count > 1 {
                let path = proto.last!.split(separator: "?", maxSplits: 2, omittingEmptySubsequences: true)
                if let pa = path.first {
                    print("路由路径为\(pa)")
                    if path.count > 1 {
                        print("参数列表为\(path.last!)")
                    }
                }
            }
        }
    }
}

let string = "http://www.xxx.com?key=value"
Interpreter.handler(string: string)
