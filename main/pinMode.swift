struct PinMode: OptionSet {
    let rawValue: UInt8

    static let input = PinMode(rawValue: 0x01)
    fileprivate static let outputOnly = PinMode(rawValue: 0x02)
    static let pullup = PinMode(rawValue: 0x04)
    static let pulldown = PinMode(rawValue: 0x08)
    static let openDrain = PinMode(rawValue: 0x10)
    
    static let output: PinMode = [.outputOnly, .input]
    static let inputPullup: PinMode = [.input, .pullup]
    static let inputPulldown: PinMode = [.input, .pulldown]
    static let outputOpenDrain: PinMode = [.output, .openDrain]

    static let analog = PinMode(rawValue: 0xC0)
}

func pinMode(pin: UInt8, mode: PinMode) {
    pinMode(pin, mode.rawValue)
}