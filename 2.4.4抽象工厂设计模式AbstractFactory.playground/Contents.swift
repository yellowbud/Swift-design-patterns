//2.4.4抽象工厂设计模式

/*
 
 抽象工厂设计模式是工厂方法设计模式的一种。工厂方法通用于同一-个工厂生产一系列相关产品的场景下，其可以隐藏产品生产的具体细节。很多时候，我们需要的产品需要由不同的工厂生产，就如同生活中一个大的的电器工厂下面可能有多个分厂，这些分厂分别负责不同电器的生产一样。在面向对象的软件设计中，我们也会遇到这样的场景，抽象工厂模式就非常适用于这样的场景。
 
 抽象工厂设计模式的核心是为各种类型的对象提供一组统一的创建接口，使用者无须关心这些对象具体是哪个工厂类创建出来的。我们以生产计算机和电视对象的设计为例，为了简化代码，这里将计算机类与电视类进行了精简“
 
 
 
 
 */

protocol GoodsProtocol {
    var name:String {get}
    func printInfo()
}

protocol FactoryProtocl {
    func getComputer() -> GoodsProtocol
    func getTV() -> GoodsProtocol
}

class Computer: GoodsProtocol {
    var name: String {
        get {
            return "计算机"
        }
    }
    
    func printInfo() {
        print("我是一台\(self.name),工作游戏全能手")
    }
}

class TV: GoodsProtocol {
    var name: String {
        get {
            return "电视机"
        }
    }
    
    func printInfo() {
        print("我是一台\(self.name),海量频道任你选")
    }
}

class ComputerFactory {
    func produce() -> Computer {
        return Computer()
    }
}

class TVFactory {
    func produce() -> TV {
        return TV()
    }
}

class Factory:FactoryProtocl {
    func getComputer() -> GoodsProtocol {
        return ComputerFactory().produce()
    }
    
    func getTV() -> GoodsProtocol {
        return TVFactory().produce()
    }
}

let good1 = Factory().getComputer()
let good2 = Factory().getTV()
good1.printInfo()
good2.printInfo()

/*
 如上代码所示，goods1 对象实际上是由 ComputerFactory 工厂类构建出来的， goods2 对象实际上是由 TVFactory 工厂类构建出来的，对于对象的使用者来说，无须关心这些细节，抽象的工厂将对象的创建与使用进行了完全的分离。
 
 
 */
