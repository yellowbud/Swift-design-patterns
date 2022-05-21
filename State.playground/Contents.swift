class SwitchButton {
    let context = StateContext(currentState: OpenState())
    func change() {
        self.context.change()
    }
}

class StateContext {
    var currentState:State
    
    init(currentState:State) {
        self.currentState = currentState
    }
    
    func change() {
        self.currentState.stateChange(context: self)
    }
}

protocol State {
    func info()
    func stateChange(context:StateContext)
}

struct OpenState: State {
    func info() {
        print("开启")
    }
    
    func stateChange(context:StateContext) {
        context.currentState = CloseState()
    }
}

struct CloseState: State {
    func info() {
        print("关闭")
    }
    
    func stateChange(context:StateContext) {
        context.currentState = OpenState()
    }
}

let button = SwitchButton()
button.context.currentState.info()
button.change()
button.context.currentState.info()
