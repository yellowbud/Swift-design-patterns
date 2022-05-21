class Goods {
    let name:String
    let price:Double

    init(name:String, price:Double) {
        self.name = name
        self.price = price
    }
}

class PublicWallet {
    var balance:Double
    
    static let shared = PublicWallet(balance: 100)
    
    private init(balance:Double) {
        self.balance = balance
    }
    
    func withdrawn(quantity:Double) {
        if balance >= quantity {
            balance -= quantity
            print("从钱包取出现金:\(quantity),余额:\(balance)")
        } else {
            print("余额不足,余额:\(balance)")
        }
    }
    
    func deposit(quantity:Double) {
        balance += quantity
        print("存入成功,余额:\(balance)")
    }
}


class Customer {
    var name:String
    var wallet:PublicWallet
    
    init(name:String, wallet:PublicWallet) {
        self.name = name
        self.wallet = wallet
    }
    
    func buy(goods:Goods) {
        self.wallet.withdrawn(quantity: goods.price)
    }
}

let jaki = Customer(name: "Jaki", wallet: PublicWallet.shared)
let lucy = Customer(name: "Lucy", wallet: PublicWallet.shared)
jaki.buy(goods: Goods(name: "玩具", price: 30))
lucy.buy(goods: Goods(name: "书籍", price: 90))
lucy.wallet.deposit(quantity: 200)
lucy.buy(goods: Goods(name: "书籍", price: 90))
jaki.buy(goods: Goods(name: "大玩具", price: 100))
