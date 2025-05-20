class TFTDisplay {
    enum Rotation: UInt8 {
        case rotate0 = 0
        case rotate90 = 1
        case rotate180 = 2
        case rotate270 = 3
    }
    var display: TFT_eSPI
    var width: Int {
        get {
            return Int(display.width())
        }
    }
    var height: Int {
        get {
            return Int(display.height())
        }
    }
    var rotation: Rotation {
        get {
            return Rotation(rawValue: UInt8(display.getRotation())) ?? Rotation.rotate0
        }
        set {
            display.setRotation(newValue.rawValue)
        }
    }

    public init(width: Int16, height: Int16) {
        self.display = TFT_eSPI(width, height)
    }
    public convenience init(width: Int, height: Int) {
        self.init(width: Int16(width), height: Int16(height))
    }
    public convenience init() {
        self.init(width: Int16(TFT_WIDTH), height: Int16(TFT_HEIGHT))
    }
    public func begin() {
        display.`init`()
    }
    public func `init`() {
        begin()
    }

    public func drawPixel(_ x: Int, _ y: Int, _ color: UInt32) {
        display.drawPixel(Int32(x), Int32(y), color)
    }
    public func drawPixel(_ x: Int32, _ y: Int32, _ color: UInt32) {
        display.drawPixel(x, y, color)
    }
    public func drawFastVLine(_ x: Int, _ y: Int, _ h: Int, _ color: UInt32) {
        display.drawFastVLine(Int32(x), Int32(y), Int32(h), color)
    }
    public func drawFastVLine(_ x: Int32, _ y: Int32, _ h: Int32, _ color: UInt32) {
        display.drawFastVLine(x, y, h, color)
    }
    public func drawFastHLine(_ x: Int, _ y: Int, _ w: Int, _ color: UInt32) {
        display.drawFastHLine(Int32(x), Int32(y), Int32(w), color)
    }
    public func drawFastHLine(_ x: Int32, _ y: Int32, _ w: Int32, _ color: UInt32) {
        display.drawFastHLine(x, y, w, color)
    }
    public func fillRect(_ x: Int, _ y: Int, _ w: Int, _ h: Int, _ color: UInt32) {
        display.fillRect(Int32(x), Int32(y), Int32(w), Int32(h), color)
    }
    public func fillRect(_ x: Int32, _ y: Int32, _ w: Int32, _ h: Int32, _ color: UInt32) {
        display.fillRect(x, y, w, h, color)
    }
    public func fillScreen(_ color: UInt32) {
        display.fillScreen(color)
    }
}