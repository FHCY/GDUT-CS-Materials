#include "effects.h"
#include <graphics.h>
#include <stdlib.h>
#include "raindrop.h"
#include <windows.h> 

void drawLightning(int x1, int y1, int x2, int y2) {
    setcolor(WHITE);
    setlinestyle(SOLID_LINE, 0, 3);

    int numSegments = 10;  
    int x = x1, y = y1;

    for (int i = 0; i < numSegments; i++) {
   
        int dx = rand() % 20 - 10;  
        int dy = rand() % 20 - 10; 
        x = x + (x2 - x1) / numSegments + dx;
        y = y + (y2 - y1) / numSegments + dy;
        line(x1, y1, x, y);
        x1 = x;
        y1 = y;
    }
}

void displayLightning() {
        int screenWidth = getmaxx();
        int screenHeight = getmaxy();
        int x1 = rand() % screenWidth, y1 = 0;                   
        int x2 = x1 + (rand() % 40 - 20), y2 = rand() % (screenHeight / 2) + (screenHeight / 4);
        drawLightning(x1, y1, x2, y2);
}

void applyWindEffect(Raindrop* drop, float windSpeed) {
    drop->x += windSpeed;
}




