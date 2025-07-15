/*
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
*/
var loopcount = Int32(0)
var currentTone = 0

var currentToneStart = UInt(0)
var lastFlagUpdate = UInt(0)

let speakerPin: UInt8 = 1

func setup() {
    print("setup() called...")
    //tft.`init`()
    pinMode(pin: speakerPin, mode: .output)
    delay(200)
    print("setup() completed.")
}

func loop() {
    if millis() - currentToneStart > tones[currentTone].duration.rawValue  {
        noTone(speakerPin)
        if !tones.indices.contains(currentTone+1) {
            currentTone = 0
        } else {
            currentTone += 1
        }
        currentToneStart = millis()
        print("Starting \(tones[currentTone].duration.rawValue)ms tone \(tones[currentTone].freq)Hz")
        tone(speakerPin, tones[currentTone].freq.rawValue)
    }
    if millis() - lastFlagUpdate > 200 {
        lastFlagUpdate = millis()
        //tft.fillScreen(UInt32(TFT_BLACK))
        //waveFlag(.enby, flagX: FLAG_X, flagY: FLAG_Y, width: FLAG_W, height: FLAG_H, xmod: 0.1, sinmod: 3, loopcount: loopcount)
        loopcount += 5
    }
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
