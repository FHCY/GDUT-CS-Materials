#ifndef POND_H
#define POND_H

#include <graphics.h>


void drawPond();
void drawLotusLeaves();
void drawText(float windSpeed, int  currentRainStatus);


int isOnLotusLeaf(int x, int y);
void splashOnLotus(int x, int y);
void rippleOnPond(int x, int y);

#endif