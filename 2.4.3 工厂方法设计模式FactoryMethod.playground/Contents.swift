
//2.4.3 工厂方法设计模式

/*
 在原型设计模式一书中，使用原型对象可以快速复制出相同的对象。优化了重复创建大量对象的过程。工厂方法设计模式注重于将对象的创建过程封闭起来，通过定义抽象的工厂接
 口和商品接口来隐藏负责对象创建的具体类。
 
 在使用工厂方法模式设计的软件系统中，对象的使用者不需要知道具体的类就可以获取到需要使用的对象，系统中增加新的工厂实现类时对之前的代码也不会产生任何影响。图2-8所示为工厂方法设计模式中的 UML 类图结构关系。
 
 */


/*
 
 以上一节编写过的计算机对象设计代码为例，计算机可能会因为配置不同而分为低档、中档和高档3类。使用工厂方法模式对计算机对象的创建进行改写，具体如下
 
 */

import Foundation

enum ComputerLevel {
    case Low
    case Middle
    case High
}

protocol ComputerFactoryProtocol {
    func getComputer(level:ComputerLevel) -> ComputerProtocl
}

protocol ComputerProtocl {
    var screen:Screen {get}
    var host:Host {get}
    var number:String {get}
    func printInfo()
}

struct Resolution {
    var x:Int
    var y:Int
}

struct CPU {
    var frequency:Int
}

class Screen {
    var resolution:Resolution
    
    init(resolution:Resolution) {
        self.resolution = resolution
    }
}

class Host {
    var ram:Int
    var disk:Int
    var cpu:CPU
    init(ram:Int, disk:Int, cpu:CPU) {
        self.ram = ram
        self.disk = disk
        self.cpu = cpu
    }
}

class Computer: ComputerProtocl {
    var screen:Screen
    var host:Host
    var number:String
    init(screen:Screen, host:Host) {
        self.screen = screen
        self.host = host
        self.number = UUID().uuidString
    }
    func printInfo() {
        print("电脑编号:\(self.number),内存\(self.host.ram),硬盘\(self.host.disk),CPU性能\(self.host.cpu.frequency),分辨率\(self.screen.resolution.x)*\(self.screen.resolution.y)")
    }
}


class ComputerFactory: ComputerFactoryProtocol {
    func getComputer(level: ComputerLevel) -> ComputerProtocl {
        switch level {
        case .Low:
            return Computer(screen: Screen(resolution: Resolution(x:1200, y: 840)), host: Host(ram: 1024 * 2, disk: 1024*200, cpu: CPU(frequency: 2400)))
        case .Middle:
            return Computer(screen: Screen(resolution: Resolution(x:1600, y: 1240)), host: Host(ram: 1024 * 4, disk: 1024*500, cpu: CPU(frequency: 3600)))
        case .High:
            return Computer(screen: Screen(resolution: Resolution(x:2400, y: 1640)), host: Host(ram: 1024 * 16, disk: 1024*1000, cpu: CPU(frequency: 4800)))
        }
    }
}

let computer1 = ComputerFactory().getComputer(level: .Low)
let computer2 = ComputerFactory().getComputer(level: .High)

computer1.printInfo()
computer2.printInfo()


/*
 使用工厂方法模式改写后的代码，计算机对象的生成将变得非常容易，使用者只需要明确想要哪一个等级的计算机，工厂类就会自动创建出对应的计算机对象。
 
 实际上，如果新增加了一种创建方式完全不同的计算机，我们只需要新建一个遵守 ComputerProtocol 的计算机类，之后在ComputerFactory 类中统一处理这类计算机对象的创建即可，对计算机对象的使用者米
 说过程完全是隐藏的。
 
 
 */
