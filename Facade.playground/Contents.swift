class User {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}

class Goods {
    static func getGoods(user:User) {
        print("顾客\(user.name)选择商品")
    }
}

class Cashier {
    static func pay(user:User) {
        print("顾客\(user.name)进行了付款")
    }
}

class Package {
    static func packing(user:User) {
        print("顾客\(user.name)的商品进行了包装")
    }
}

class Store {
    static func sellGoods(user:User) {
        Goods.getGoods(user: user)
        Cashier.pay(user: user)
        Package.packing(user: user)
    }
}

let user = User(name: "jaki")
Store.sellGoods(user: user)
