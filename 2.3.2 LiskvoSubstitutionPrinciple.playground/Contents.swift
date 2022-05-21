import Foundation

/*
 里式替换原则
 
 
 继承必须保证超类所拥有的性质在子类中依然成立。遵守里式替换原则，在进行类的继承时，要保证子类不对父类的属性或者方法进行重写，而只是扩展父类的功能。
 
 其实里氏替换原则是对开闭原则更严格的补充，除了有开闭原则带来的优势外，也保证了继承中重写父类方法造成的可复用性变差与稳定性变差的问题。
 
 里式替换原则在实际编程中主要应用在类的组织结构上，对于继承的设计，子类不可以重写父类的方法，只能为父类添加方法。
 如果在设计时，发现子类不得不重写父类的方法，则表明类的组织结构有问题，需要重新设计类的继承关系。
 
 例如，组织鸟类与鸵鸟类，很容易写出下面：
 
 */

class Bird {
    var name:String
    init(name:String) {
        self.name = name
    }
    func fly() {
        print("\(self.name)开始飞行")
    }
}

let bird = Bird(name:"鸟")
bird.fly()

class Ostrich:Bird {
    override func fly(){
        print("抱歉！不能飞行")
    }
    
    func run(){
        print("\(self.name)急速奔跑")
    }
}

let ostrich = Ostrich(name:"鸵鸟")
ostrich.run()

/*
 如上代码所示，Bird 类作为鸟类的基类，其中定义了一个通用的构造方法和一个鸟类飞行的方法，在设计鸵鸟类时，我们让其继承自鸟类，并且扩展了一个奔跑的方法。
 
 因为鸵鸟虽然在很多方面都有鸟的特征，但是其不能飞行，因此我们需要重写鸟类中的fly方法来修正其飞行的行为。这样做虽然实现了需求，但是违反了里式替换原则。在这种情况下，我们需要对类的继承关系进行重构，最便捷的方式是将抽象的部分再进行一层抽离。示例如下：

 */



class Animal {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}

class Bird : Animal {
    
    func fly() {
        print("\(self.name)开始飞行")
    }
}

let bird = Bird(name: "鸟")
bird.fly()

class Ostrich : Animal {
    func run() {
         print("\(self.name)极速奔跑")
    }
}

let ostrich = Ostrich(name: "鸵鸟")
ostrich.run()

/*
 如上代码所示，将通用的名称属性和构造方法抽离到了 Animal 类中，让 Bird 类与 Ostrich
 类都继承于 Animal 类，Bird 类对Animal 类扩展了fly方法，Ostrich 类对 Animal 类扩展了run
 方法，这样就遵守了里式替换原则，对原 Animal 类没有任何修改。
 
 */
