//2.4.2原型设计模式

import Foundation

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

class Computer {
    var screen:Screen
    var host:Host
    var number:String
    
    init(screen:Screen, host:Host) {
        self.screen = screen
        self.host = host
        self.number = UUID().uuidString
    }
    
    func copy() -> Computer{
        return Computer(screen: self.screen, host: self.host)
    }
    
    func printInfo() {
        print("电脑编号:\(self.number)")
    }
}

let resolution = Resolution(x: 1200, y: 840)
let screen = Screen(resolution: resolution)
let cpu = CPU(frequency: 2400)
let host = Host(ram: 1024, disk: 1024 * 100, cpu: cpu)
let computer = Computer(screen: screen, host: host)
computer.printInfo()
let computer2 = computer.copy()
computer2.printInfo()

/*
 通过使用原型设计模式，一旦第一个对象被创建出来，后面的对象创建都将变得非常容易。
 实际上，在应用中，我们还可以通过工厂模式将第一个对象的创建也封装起来，将对象的创建与使用完全隔离。
 
在原型设计模式中，作为模板的对象被称为原型，创建出来的对象拥有和模饭对象一致的属性和方法，因此在编程语言中会通过原型模式来实现类的结构和继承关系，javascript就是其中一种。
 
 
 
 */
