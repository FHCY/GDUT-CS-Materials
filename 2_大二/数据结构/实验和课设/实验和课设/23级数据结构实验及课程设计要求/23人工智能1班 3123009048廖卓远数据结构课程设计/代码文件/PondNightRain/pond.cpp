#include "pond.h"
#include <stdlib.h>
#include <math.h>
#include <graphics.h>
#include <stdio.h>

#define LOTUS_COUNT 5 
typedef struct {
    int x, y, radiusX, radiusY;
} LotusLeaf;

LotusLeaf lotusLeaves[LOTUS_COUNT] = {
    {300, 400, 60, 40},
    {500, 350, 50, 35},
    {400, 450, 70, 50},
    {600, 400, 60, 40},
    {200, 450, 50, 35}
};

void drawPond() {
    int pondWidth = getmaxx();  
    int pondHeight = getmaxy() / 3;  

    setfillstyle(SOLID_FILL, LIGHTBLUE);  
    fillellipse(pondWidth / 2, getmaxy() - pondHeight / 2, pondWidth / 2, pondHeight / 2); 

    setcolor(WHITE); 
    ellipse(pondWidth / 2, getmaxy() - pondHeight / 2, 0, 360, pondWidth / 2, pondHeight / 2);  
}


void drawLotusLeaves() {
    for (int i = 0; i < LOTUS_COUNT; i++) {
        setfillstyle(SOLID_FILL, GREEN);
        fillellipse(lotusLeaves[i].x, lotusLeaves[i].y, lotusLeaves[i].radiusX, lotusLeaves[i].radiusY);
    }
}

int isOnLotusLeaf(int x, int y) {
    for (int i = 0; i < LOTUS_COUNT; i++) {
        int dx = x - lotusLeaves[i].x;
        int dy = y - lotusLeaves[i].y;
        if (sqrt(dx * dx + dy * dy) < lotusLeaves[i].radiusX) {
            return 1; 
        }
    }
    return 0;  
}


void splashOnLotus(int x, int y) {
    for (int i = 0; i < 5; i++) {
        int splashX = x + rand() % 20 - 10;  
        int splashY = y + rand() % 20 - 10;  
        int splashSize = rand() % 3 + 1;     

        setfillstyle(SOLID_FILL, WHITE); 
        fillellipse(splashX, splashY, splashSize, splashSize);  
    }
    // PlaySound(TEXT("splash.wav"), NULL, SND_ASYNC);  
}


void rippleOnPond(int x, int y) {
    setcolor(LIGHTCYAN);
    for (int i = 1; i <= 5; i++) { 
        circle(x, y, i * 15);  
        delay(50);  
    }
   //  PlaySound(TEXT("ripple.wav"), NULL, SND_ASYNC);
}

void drawText(float windSpeed, int  currentRainStatus) {
    setcolor(WHITE);  
    char windText[20];
    sprintf(windText, "Wind Speed: %.2f", windSpeed);
    outtextxy(10, 10, windText);

    char rainText[50];
    sprintf(rainText, "Current Rain Status: %d", currentRainStatus);
    outtextxy(10, 30, rainText);
}
