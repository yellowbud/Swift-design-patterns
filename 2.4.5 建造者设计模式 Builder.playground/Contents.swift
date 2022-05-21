
//2.4.5 建造者设计模式

/*
 建造者设计模式是 5 种创建型设计模式中的最后一种。对于复杂对象的创建，使用建造者模式会使代码聚合性更强，逻辑更加清晰。建造者模式通常与工厂方法模式配合进行使用，工厂方法模式着重于对象的创建，建造者模式着重于创建复杂对象过程中组成对象的每一部分的创建和最终组装。
 
 建造者模式的核心在于将复杂对象拆解成多个简单对象，通过一步步构建简单对象最终组合成复杂对象。建造者模式也是合成复用原则的一种应用，在工厂方法设计模式一节中，计算机对象的构建体现出部分建造者模式的思想，生活中这样的例子还有很多，例如许多饭店都有推出套餐服务。套餐可能包括饮料、主食、甜点等，这每一部分对象都可以独立地进行创建，之后组合成完整的套餐。示例代码如下：
 
 
 
 */
enum Drink {
    case Cola
    case Juice
}

enum Staple {
    case Hamburger
    case ChickenRoll
}

enum Dessert {
    case EggTart
    case IceCreanm
}

class FoodPackage {
    var drink:Drink?
    var staple:Staple?
    var dessert:Dessert?
}

class BuilderA {
    var foodPackage:FoodPackage
    
    init(foodPackage:FoodPackage) {
        self.foodPackage = foodPackage
    }
    
    func addDrink() {
        self.foodPackage.drink = .Cola
    }
    
    func addStaple() {
        self.foodPackage.staple = .Hamburger
    }
    
    func addDessert() {
        self.foodPackage.dessert = .EggTart
    }
    
    func startBuild() -> FoodPackage {
        self.addDrink()
        self.addStaple()
        self.addDessert()
        return self.foodPackage
    }
}

class BuilderB {
    var foodPackage:FoodPackage
    
    init(foodPackage:FoodPackage) {
        self.foodPackage = foodPackage
    }
    
    func addDrink() {
        self.foodPackage.drink = .Juice
    }
    
    func addStaple() {
        self.foodPackage.staple = .ChickenRoll
    }
    
    func addDessert() {
        self.foodPackage.dessert = .IceCreanm
    }
    
    func startBuild() -> FoodPackage {
        self.addDrink()
        self.addStaple()
        self.addDessert()
        return self.foodPackage
    }
}

enum PackageType {
    case A
    case B
}

func FoodPackageFactory(type:PackageType) -> FoodPackage {
    switch type {
    case .A:
        return BuilderA(foodPackage: FoodPackage()).startBuild()
    case .B:
        return BuilderB(foodPackage: FoodPackage()).startBuild()
    }
}

let food1 = FoodPackageFactory(type: .A)
let food2 = FoodPackageFactory(type: .B)


/*
 
 如上代码所示，一个完整的套餐对象由饮料对象、主食对象和甜点对象组成，
 FoodPackageFactory 是一个简化版的工厂方法，其中根据用户选择的套餐类型来创建不同的套餐对象，具体套餐对象的组成则是由 BuilderA 与 BuilderB 类来完成的。BuilderA 与 BuilderB
 类是建造者模式中的核心类，充当了建造者的角色。上面的代码依然有很多可以优化的地方，
 例如我们可以根据依赖倒置原则将建造者类的行为抽象为一个接口，这样当我们新增或修改一种套餐时，对已有代码的结构不会造成影响。
 
 */
