// 2.3.4 接口隔离原则

/*
 
 接口隔离原则要求编程人员将庞大臃肿的接口定义拆分成更小和更具体的接口。接口只
暴露类需要实现的方法。和单一职责原则类似，接口隔离原则主要要求接口在定义时职责要单
 ，其“隔离”主要是指对接口依赖的隔离。
 
 
 使用接口隔离原则设计的程序接口有如下几点优势：
 
 将庞大的接口拆分成细粒度更小的接口，灵活性和扩展性更好，也更易于在类实现时遵守单一职责原则
 接口隔离提高了系统的内聚性，降低了系统的耦合性。
 有利于代码的复用性，减少冗余代码。
 
 以我们之前所举例过的用户页面的展示为例，首先编写如下代码：
 
 */

protocol UserInterfaceProtocol {
    var bannerData:String { get }
    var listData:String { get }
    
    func show()
}

class UserInterface : UserInterfaceProtocol {
    var bannerData:String {
        get {
            return "横竖数据加载完成"
        }
    }
    var listData:String {
        get {
            return "列表数据加载完成"
        }
    }
    func show() {
        print("展现界面：\(self.bannerData),\(self.listData)")
    }
}
let ui = UserInterface()
ui.show()

//上面的代码明显违反了单一职责原则，做简单的修改，将数据提供与页面展示逻辑分开,具体如下：

protocol UserInterfaceProtocol {
    var bannerData:String { get }
    var listData:String { get }
    
    func show()
}

class DataLoader:UserInterfaceProtocol {
    func show() {
        //无意义的方法卖现
    }
    
    var bannerData:String {
        get {
            return "横竖数据加载完成"
        }
    }
    var listData:String {
        get {
            return "列表数据加载完成"
        }
    }
}

class UserInterface:UserInterfaceProtocol {
    //无意义的属性
    var bannnerData:String {
        get {
            return ""
        }
    }
    var listData :String {
        get {
            return ""
        }
    }
    func  show() {
        let dataLoader = DataLoader()
        print("展现界面：\(dataLoader.bannerData),\(dataLoader.listData)")
    }
}
let ui = UserInterface()
ui.show()

/*
 
 从改写后的代码可以看出，虽然使用单一职责原则将数据的加载与页面的展示进行拆分，
 但是接口并没有隔离，在 DataLoader 类与 UserInterface 类中都必须实现其不需要使用的接口。
 因此，我们需要使用接口隔离原则对 UserInterfaceProtocol 的定义也进行拆分，具体如下：
 
 
 */




protocol DataLoaderProtocol {
    var bannerData:String { get }
    var listData:String { get }
}

protocol UserInterfaceProtocol {
    func show()
}

class DataLoader : DataLoaderProtocol {
    var bannerData:String {
        get {
            return "横竖数据加载完成"
        }
    }
    var listData:String {
        get {
            return "列表数据加载完成"
        }
    }
}

class UserInterface : UserInterfaceProtocol {
    func show() {
        let dataLoader = DataLoader()
        print("展现界面：\(dataLoader.bannerData),\(dataLoader.listData)")
    }
}
let ui = UserInterface()
ui.show()
