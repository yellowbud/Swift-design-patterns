
enum Color : String {
    case black = "black"
    case white = "white"
    case red = "red"
    case blue = "blue"
    case green = "green"
    case gray = "gray"
    case yellow = "yellow"
    case purple = "purple"
}

// 默认的主题风格
class Style {
    var backgroundColor = Color.black
    var textColor = Color.white
    
    init(){}
    
    func apply() {
        print("应用皮肤:背景颜色(\(self.backgroundColor.rawValue)), 文字颜色:(\(self.textColor.rawValue))")
    }
}

/*
 
 let baseStyle = Style ()
 baseStyle.apply()
 
 
 上面代码描述了一个简单的主题应用的逻辑。Color 枚举定义了颜色。style 类是一个主题
 类，其中定义了此主题的背景颜色是黑色、文字颜色是白色，并调用 apply方法进行主题的应用。
 上面的代码在apply方法中还做了简单的打印操作。
 假设我们需要添加一个背景色为白色、文字颜色为黑色且按钮颜色为紫色的主题。
 一种方式是直接对 Style类进行修改，使其符合我们的需求，但这明显违背了开闭原则；
 
 另一种方式是创建一个继承于 Style 的类，用来扩展新的功能，例如：
 
 
 
 */





class LightStyle : Style {
    var buttonColor = Color.purple
    
    override init() {
        super.init()
        self.backgroundColor = Color.white
        self.textColor = Color.black
    }
    
    override func apply() {
        print("应用皮肤:背景颜色(\(self.backgroundColor.rawValue)), 文字颜色:(\(self.textColor.rawValue)),按钮颜色:(\(self.buttonColor))")
    }
}

let lightStyle = LightStyle()
lightStyle.apply()



//以上面的代码可以看出，通过继承方式实现的开闭原则并不彻底。通过接口可以更好地实现开闭原则，改写代码如下：




protocol StyleInterface {
    var backgroundColor : Color { get }
    var textColor : Color { get }
    var buttonColor : Color { get }
    func apply() -> Void
}

class BaseStyle : StyleInterface {
    var backgroundColor: Color {
        get {
            return Color.white
        }
    }
    
    var textColor: Color {
        get {
            return Color.black
        }
    }
    
    var buttonColor: Color {
        get {
            return Color.red
        }
    }
    
    init() {}
    
    func apply() {
        print("应用皮肤:背景颜色(\(self.backgroundColor.rawValue)), 文字颜色:(\(self.textColor.rawValue)),按钮颜色:(\(self.buttonColor))")
    }
    
}

class DarkStyle : StyleInterface {
    var backgroundColor: Color {
        get {
            return Color.black
        }
    }
    
    var textColor: Color {
        get {
            return Color.white
        }
    }
    
    var buttonColor: Color {
        get {
            return Color.purple
        }
    }
    
    init() {}
    
    func apply() {
        print("应用皮肤:背景颜色(\(self.backgroundColor.rawValue)), 文字颜色:(\(self.textColor.rawValue)),按钮颜色:(\(self.buttonColor))")
    }
}

let baseStyle = BaseStyle()
let newStyle = DarkStyle()
baseStyle.apply()
newStyle.apply()

/*
 如上代码所示，StyleInterface 是一个协议，协议中定义了与主题相关的一些属性和应用主
 题的方法，后面当我们需要扩展多个主题时，只需要对此接口进行不同的实现即可，不会影响
 到其他已经存在的主题类。
 
 
 */
