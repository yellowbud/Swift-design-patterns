class Notification {
    var name:String
    var data:String
    var object:AnyObject?
    
    init(name:String, data:String) {
        self.name = name
        self.data = data
    }
    
    func info() -> String{
        return "\(self.name),\(self.data),\(String(describing: self.object))"
    }
}

class NotificationCenter {
    static let shared = NotificationCenter()
    
    private init() {
        
    }
    
    var observers = Dictionary<String, Array<AnyObject>>()
    var callbacks = Dictionary<String, Array<(_ notification:Notification)->Void>>()
    
    func addObserver(object:AnyObject, callback:@escaping (_ notification:Notification)->Void, name:String) {
        if var array = observers[name] {
            array.append(object)
        } else {
            var array = Array<AnyObject>()
            array.append(object)
            observers[name] = array
        }
        
        if var array = callbacks[name] {
            array.append(callback)
        } else {
            var array = Array<(_ notification:Notification)->Void>()
            array.append(callback)
            callbacks[name] = array
        }
    }
    
    func removeObserver(name:String) {
        self.observers.removeValue(forKey: name)
        self.callbacks.removeValue(forKey: name)
    }
    
    func postNotification(notification:Notification) {
        if let obs = observers[notification.name], let callback = callbacks[notification.name] {
            for i in 0 ..< obs.count {
                notification.object = obs[i]
                callback[i](notification)
            }
        }
    }
}
let notificatioName = "Switch"
let notification = Notification(name: notificatioName, data: "触发按钮")
NotificationCenter.shared.addObserver(object: "监听者对象" as AnyObject, callback: { (notification) in
    print(notification.info())
}, name: notificatioName)

NotificationCenter.shared.postNotification(notification: notification)
NotificationCenter.shared.removeObserver(name: notificatioName)
NotificationCenter.shared.postNotification(notification: notification)

