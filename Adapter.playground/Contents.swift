
class User {
    var name:String
    var age:Int
    var region:String
    
    init(name:String, age:Int, region:String) {
        self.name = name
        self.age = age
        self.region = region
    }
}

class UserV2 {
    var nickName:String
    var age:Int
    var address:String
    
    init(nickName:String, age:Int, address:String) {
        self.nickName = nickName
        self.age = age
        self.address = address
    }
    
    func printInfo() {
        print("\(self.nickName),\(self.age),\(self.address)")
    }
}


class UserAdapter {
    func toUserV2(user:User) -> UserV2 {
        return UserV2(nickName: user.name, age: user.age, address: user.region)
    }
}

let userV1 = User(name: "Jaki", age: 27, region: "上海")
let userV2 = UserAdapter().toUserV2(user: userV1)
userV2.printInfo()


