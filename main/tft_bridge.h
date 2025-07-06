#pragma once
#include "TFT_eSPI.h"

void fillScreen(TFT_eSPI tft, unsigned int color);
void drawPixel(TFT_eSPI tft, int x, int y, unsigned int color);
void drawFastVLine(TFT_eSPI tft, int x, int y, int h, unsigned int color);