var tft = TFTDisplay()

let FLAG_X: Int32 = 10
let FLAG_Y: Int32 = 10
let FLAG_W: Int32 = 70
let FLAG_H: Int32 = 50
var loopcount = Int32(0)

func setup() {
    print("Hello, World!")
    tft.rotation = .rotate0
    tft.begin()
}

func loop() {
    tft.fillScreen(UInt32(TFT_BLACK))
    waveFlag(.enby, on: tft, flagX: FLAG_X, flagY: FLAG_Y, width: FLAG_W, height: FLAG_H, xmod: 0.1, sinmod: 3, loopcount: loopcount)
	delay(100)
	loopcount += 5
}

@_cdecl("app_main")
func main() {
    setup()
    while true {
        loop()
    }
}