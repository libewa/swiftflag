enum ToneDuration: Int {
    case short = 200
    case medium = 400
    case long = 800
}

enum Tone: UInt32 {
    case pause = 0

    case Db4 = 277
    case Eb4 = 311
    case F4 = 349
    case Gb4 = 370
    case Ab4 = 415
    case Bb4 = 466
    case C5 = 523
    case Db5 = 554
    case Eb5 = 622
    case F5 = 698
    case Gb5 = 740
    case Ab5 = 830
    case Bb5 = 932
    case C6 = 1047
    case Db6 = 1109
}


// First section of "Determination" (official piano transcript) by Toby Fox
let tones: [(freq: Tone, duration: ToneDuration)] = [
    (.Gb5, .short),
    (.F5,  .short),
    (.Eb5, .short),
    (.Db5, .short),
    (.Eb5, .short),
    (.Bb4, .short),
    (.C5,  .medium),
    (.Ab4, .medium),
    (.Eb5, .short),
    (.F5,  .short),
    (.Gb5, .medium),
    (.Ab5, .medium),
    (.Db6, .medium),
    (.Bb5, .long),

    (.Gb5, .short),
    (.F5,  .short),
    (.Eb5, .short),
    (.Db5, .short),
    (.Eb5, .short),
    (.Bb4, .short),
    (.C5,  .medium),
    (.Ab4, .medium),
    (.Eb4, .short),
    (.F4,  .short),
    (.Gb4, .medium),
    (.F4,  .medium),
    (.Db4, .medium),
    (.Eb4, .long)
]