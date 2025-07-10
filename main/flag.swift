enum Flag: Int, Hashable {
    case rainbow, trans, enby, germany, baden, france, belgium
}

struct FlagContent {
	let colors: [Int32]
	let hasVerticalStripes: Bool
	//let humanName: String
}

let flagContents: [Flag: FlagContent] = [
	.rainbow: FlagContent(
		colors: [TFT_RED, TFT_ORANGE, TFT_YELLOW, TFT_GREEN, TFT_BLUE, TFT_PURPLE],
		hasVerticalStripes: false,
		// humanName: "Regenbogen"
	),
	.trans: FlagContent(
		colors: [TFT_SKYBLUE, TFT_PINK, TFT_WHITE, TFT_PINK, TFT_SKYBLUE],
		hasVerticalStripes: false,
		// humanName: "Trans"
	),
	.enby: FlagContent(
		colors: [TFT_YELLOW, TFT_WHITE, TFT_PURPLE, TFT_BLACK],
		hasVerticalStripes: false,
		// humanName: "Non-binary"
	),
	.germany: FlagContent(
		colors: [TFT_BLACK, TFT_RED, TFT_YELLOW],
		hasVerticalStripes: false,
		// humanName: "Deutschland"
	),
	.baden: FlagContent(
		colors: [TFT_YELLOW, TFT_RED, TFT_YELLOW],
		hasVerticalStripes: false,
		// humanName: "Baden"
	),
	.france: FlagContent(
		colors: [TFT_BLUE, TFT_WHITE, TFT_RED],
		hasVerticalStripes: true,
		// humanName: "Frankreich"
	),
	.belgium: FlagContent(
		colors: [TFT_BLACK, TFT_YELLOW, TFT_RED],
		hasVerticalStripes: true,
		// humanName: "Belgien"
	)
]

func wave(_ x: Int32, _ xmod: Double, _ sinmod: Double, _ loopcount: Int32) -> Int32 {
	return Int32(sin(Double(x+loopcount) * xmod) * sinmod)
}

func waveFlag(_ flagID: Flag, flagX: Int32, flagY: Int32, width: Int32, height: Int32, xmod: Double, sinmod: Double, loopcount: Int32) {
	let flag = flagContents[flagID]!
	let colors = flag.colors
	let stripeCount = Int32(colors.count)

	if flag.hasVerticalStripes {
		let stripeWidth = width / stripeCount
		for x: Int32 in flagX..<flagX + width {
			let color = UInt32(flag.colors[Int((x-stripeWidth/2) / stripeWidth)])
			let y = flagY + wave(x, xmod, sinmod, loopcount)
			tft.drawFastVLine(x, y, height, color)
			tft.drawPixel(x, y, UInt32(TFT_WHITE))
			tft.drawPixel(x, y + height, UInt32(TFT_WHITE))
		}
	} else {
		let stripeHeight = height / stripeCount
		for x: Int32 in flagX..<flagX + width {
			for i in 0..<stripeCount {
				let y = flagY + i * stripeHeight + wave(x, xmod, sinmod, loopcount)
				tft.drawFastVLine(x, y, stripeHeight, UInt32(colors[Int(i)]))
			}
			tft.drawPixel(x, flagY + wave(x, xmod, sinmod, loopcount), UInt32(TFT_WHITE))
			tft.drawPixel(x, flagY + height + wave(x, xmod, sinmod, loopcount), UInt32(TFT_WHITE))
		}
	}
	tft.drawFastVLine(flagX, flagY+wave(flagX, xmod, sinmod, loopcount), height, UInt32(TFT_WHITE))
	tft.drawFastVLine(flagX+width, flagY+wave(flagX+width, xmod, sinmod, loopcount), height, UInt32(TFT_WHITE))
}