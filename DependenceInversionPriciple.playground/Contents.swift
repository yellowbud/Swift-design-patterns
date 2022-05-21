protocol Store {
    func sell(count:Int)
}

class FoodStore : Store {
    func sell(count:Int) {
        print("食品商店售卖了\(count)份食品")
    }
}

class DepartmentStore : Store {
    func sell(count:Int) {
        print("百货商店售卖了\(count)份百货")
    }
}

class Customer {
    func shopping(store:Store, count:Int) {
        print("用户购物")
        store.sell(count: count)
    }
}

let customer = Customer()
customer.shopping(store: FoodStore(), count: 3)
customer.shopping(store: DepartmentStore(), count: 5)
