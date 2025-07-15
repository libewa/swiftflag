var currentTone = 0
var isFirstLoop = true

var currentToneStart = UInt(0)

let speakerPin: UInt8 = 1

func setup() {
    print("setup() called...")
    pinMode(pin: speakerPin, mode: .output)
    delay(100)
    noTone(speakerPin)
    print("setup() completed.")
}

func loop() {
    if millis() - currentToneStart > tones[currentTone].duration.rawValue {
        noTone(speakerPin)
        if !tones.indices.contains(currentTone+1) || isFirstLoop {
            isFirstLoop = false
            currentTone = 0
        } else {
            currentTone += 1
        }
        currentToneStart = millis()
        print("Starting \(tones[currentTone].duration.rawValue)ms tone \(tones[currentTone].freq)Hz")
        tone(speakerPin, tones[currentTone].freq.rawValue)
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
