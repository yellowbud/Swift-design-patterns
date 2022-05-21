protocol MementoProtocol {
    func allKeys() -> Array<String>
    func valueForKey(key:String) -> Any
    func setValue(value:Any, key:String)
}

class MementoManager {
    var dictionary = Dictionary<String, Dictionary<String, Any>>()
    
    func saveState(obj:MementoProtocol, key:String) {
        var dic = Dictionary<String, Any>()
        for k in obj.allKeys() {
            dic[k] = obj.valueForKey(key: k)
        }
        dictionary[key] = dic
    }
    
    func resetState(obj:MementoProtocol, key:String) {
        let dic = dictionary[key]
        if let dic = dic {
            for k in dic {
                obj.setValue(value: k.value, key: k.key)
            }
        }
    }
}

class Setting: MementoProtocol {
    var setting1 = false
    var setting2 = true
    var setting3 = true
    
    func allKeys() -> Array<String> {
        return ["setting1", "setting2", "setting3"]
    }
    
    func setValue(value: Any, key: String) {
        switch key {
            case  "setting1":
                self.setting1 = value as! Bool
            case  "setting2":
                self.setting2 = value as! Bool
            case  "setting3":
                self.setting3 = value as! Bool
            default:
                print("\(key)设置错误")
        }
    }
    
    func valueForKey(key: String) -> Any {
        switch key {
        case  "setting1":
            return self.setting1
        case  "setting2":
            return self.setting2
        case  "setting3":
            return self.setting3
        default:
            return ""
        }
    }
    
    func show() {
        print("setting1:\(self.setting1) setting2:\(self.setting2) setting3:\(self.setting3)")
    }
}

var setting = Setting()
let manager = MementoManager()
setting.show() // setting1:false setting2:true setting3:true
manager.saveState(obj: setting, key: "state1")
setting.setting1 = true
setting.show() // setting1:true setting2:true setting3:true
manager.saveState(obj: setting, key: "state2")
setting.setting3 = false
setting.show() // setting1:true setting2:true setting3:false
manager.resetState(obj: setting, key: "state1")
setting.show() // setting1:false setting2:true setting3:true
manager.resetState(obj: setting, key: "state2")
setting.show() // setting1:true setting2:true setting3:true

