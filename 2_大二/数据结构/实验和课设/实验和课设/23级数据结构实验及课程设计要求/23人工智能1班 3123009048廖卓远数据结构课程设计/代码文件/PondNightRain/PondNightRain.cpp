#include <graphics.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include "raindrop.h"
#include "effects.h"
#include "pond.h"

#define MAX_RAINDROPS 100
#define RAIN_SWITCH_TIME 10

enum RainStatus { LIGHT_RAIN, HEAVY_RAIN, DEFAULT };
unsigned long lastSwitchTime = 0;
int currentRainStatus = DEFAULT;

int main() {
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");

    srand(time(NULL));
    Raindrop rain[MAX_RAINDROPS];
    int count = 0;
    float windSpeed = 0.5;
    while (!kbhit()) {
        
        cleardevice();
       
        drawPond();
        drawLotusLeaves();

        
        if (GetAsyncKeyState(VK_UP)) windSpeed += 0.1;
        else if (GetAsyncKeyState(VK_DOWN)) windSpeed -= 0.1;
        else if (GetAsyncKeyState('1') & 0x8000)  currentRainStatus = LIGHT_RAIN;
        else if (GetAsyncKeyState('2') & 0x8000)  currentRainStatus = HEAVY_RAIN;
        else if (GetAsyncKeyState('3') & 0x8000)  currentRainStatus = DEFAULT;

        
        
        drawText(windSpeed, currentRainStatus);

        
        int rainPossibility = getPossibility(currentRainStatus);

        
        if (rand() % 20 <= rainPossibility && count < MAX_RAINDROPS) {
            rain[count++] = initRaindrop();
        }

        
        int activeRaindrops = 0;
        for (int i = 0; i < count; i++) {
            applyWindEffect(&rain[i], windSpeed);
            updateRaindrop(&rain[i]);
            drawRaindrop(&rain[i]);

            if (rain[i].state != -1) {
                rain[activeRaindrops++] = rain[i]; 
            }
        }
        count = activeRaindrops; 


        
        if (rand() % 100 < 25) {
            displayLightning();
        }

        delay(50);
        
    }

    closegraph();
    return 0;
}
