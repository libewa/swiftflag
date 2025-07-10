var tft = TFT_eSPI()

extension TFT_eSPI {
    init() {
        self.init(Int16(TFT_WIDTH), Int16(TFT_HEIGHT))
    }
}

let FLAG_X: Int32 = 10
let FLAG_Y: Int32 = 10
let FLAG_W: Int32 = 70
let FLAG_H: Int32 = 50
var loopcount = Int32(0)

func setup() {
    print("setup() called...")
    tft.`init`()
    pinMode(1, UInt8(2))
    print("setup() completed.")
}

func loop() {
    print("Loop begin - loopcount: \(loopcount)")
    tft.fillScreen(UInt32(TFT_BLACK))
    digitalWrite(1, UInt8(HIGH))
    //waveFlag(.enby, flagX: FLAG_X, flagY: FLAG_Y, width: FLAG_W, height: FLAG_H, xmod: 0.1, sinmod: 3, loopcount: loopcount)
	delay(100)
    digitalWrite(1, UInt8(LOW))
    delay(100)
	loopcount += 5
    print("Loop end - loopcount: \(loopcount)")
}

@_cdecl("app_main")
func main() {
    print("Starting Arduino...")
    initArduino()
    print("Arduino initialized.")
    setup()
    repeat {
        loop()
    } while true
}
