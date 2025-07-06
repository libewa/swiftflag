#include "tft_bridge.h"

void fillScreen(TFT_eSPI tft, unsigned int color) {
    tft.fillScreen(color);
}

void drawPixel(TFT_eSPI tft, int x, int y, unsigned int color) {
    tft.drawPixel(x, y, color);
}

void drawFastVLine(TFT_eSPI tft, int x, int y, int h, unsigned int color) {
    tft.drawFastVLine(x, y, h, color);
}