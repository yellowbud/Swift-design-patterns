
//2.3.3 单一职责原则

/*其核心是一个类只应该承担一项责任，在实际设计中，可以以是否只
有一个引起类变化的原因作为准则，如果不止一个原因会引起类的变化，则需要对类重新进行拆分。
 
 如果一个类或对象承担了太多的责任，则其中一个责任的变化可以带来对其他责任的影响，且不利于代码的复用性，容易造成代码的冗余和浪费。遵守单一职责原则设计的程序有以下几个特点：
 
 降低类的复杂度，一个类只负责单一的职责，逻辑清晰，提高内聚，降低耦合。
 提高代码的可读性，提高代码的可复用性。
 增强代码的可维护性与可扩展性。
 类的变更是必然的，功能的增加必然会产生类的变更，单一职责可以使变更带来的影响最小。
 
 下面，我们以用户界面管理类的设计来演示单一职责原则的应用。

*/

class UserInterface {
    var data:String?
    
    func loadData() {
        self.data = "数据加载完成"
    }
    
    func show() {
        self.loadData()
        print("展现界面:\(self.data!)")
    }
}
let ui = userInterface()
ui.show()

/*
 
如上，UserInterface类模拟了用户界面，其中提供了show方法来进行页面的展示，但是用户页面都是需要通过数据来展示的，因此这个类中还封装了一个名为loadData的方法来加载数据。
 这样设计，UserInterface类就承担了两个职责，分别为加载数据与展示界面，违反了单一职责原则。
 假如，后面我们需要对数据加载的逻辑进行修改，则必然会影响到界面展示的逻辑，代码如下：

 */

class UserInterface {
    var bannerData:String?
    var listData:String?
    
    func loadBannerData() {
        self.bannerData = "横竖数据加载完成"
    }
    
    func loadListData() {
        self.listData = "列表数据加载完成"
    }
    
    func show() {
        self.loadBannerData()
        self.loadListData()
        print("展现界面：\(self.bannerData!),\(self.listData!)")
    }
}

let ui = userInterface()
ui.show()




/*
 
 根据单一职责原则的定义，我们可以对 UserInterface 类进行重构，对职责进行拆分，使 UserInterface 类只负责界面的展示，数据的加载交给另外的类负责，示例代码如下：
 

 */

class DataLoader {
    var bannerData:String?
    var listData:String?
    
    func loadBannerData() {
        self.bannerData = "横竖数据加载完成"
    }
    
    func loadListData() {
        self.listData = "列表数据加载完成"
    }
    
    func getData() -> String {
        self.loadBannerData()
        self.loadListData()
        return "\(self.bannerData!),\(self.listData!)"
    }
}

class UserInterface {
    func show() {
        print("展现界面：\(DataLoader().getData())")
    }
}

let ui = UserInterface()
ui.show()

/*
 重构后的代码遵守了单一职责原则，将数据的加载与界面的展示进行拆分，之后无论是修改数据的加载逻辑还是页面的展示逻辑，他们之间都不会产生影响。
 
 
 */
