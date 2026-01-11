#include "raindrop.h"
#include "pond.h"
#include <stdlib.h>
#include <graphics.h>
enum RainStatus { LIGHT_RAIN, HEAVY_RAIN, DEFAULT };


Raindrop initRaindrop() {
    Raindrop drop;
    drop.x = rand() % 800;
    drop.y = 0;
    drop.speed = 6.0 + (rand() % 10) / 4.;
    drop.color[0] = rand() % 256;
    drop.color[1] = rand() % 256;
    drop.color[2] = rand() % 256;
    drop.state = 0;
    drop.ripple_radius = 0;
    drop.max_radius = 50.0;
    drop.transparency = rand() % 256;
    drop.size = 10 + rand() % 10;
    return drop;
}

void updateRaindrop(Raindrop* drop) {
    if (drop->state == 0) {
        drop->y += drop->speed;  
        drop->speed += 0.05;  

        if (drop->transparency < 255) {
            drop->transparency += 5;
        }

        if (drop->y >= 400) {  
            if (isOnLotusLeaf(drop->x, drop->y)) { 
                splashOnLotus(drop->x, drop->y); 
            }
            else {
                rippleOnPond(drop->x, drop->y);  
            }
            drop->state = -1;  
        }
    }
    else if (drop->state == 1) {
        drop->ripple_radius += 1.0; 
        if (drop->ripple_radius >= drop->max_radius) {
            drop->state = -1; 
        }
    }
}

void drawRaindrop(Raindrop* drop) {
    if (drop->state == 0) {
        setcolor((drop->transparency << 24) | (drop->color[0] << 16) | (drop->color[1] << 8) | drop->color[2]);
        line(drop->x, drop->y, drop->x, drop->y + drop->size);
    }
    else if (drop->state == 1) {
        setcolor((drop->color[0] << 16) | (drop->color[1] << 8) | drop->color[2]);
        circle(drop->x, drop->y, drop->ripple_radius);
    }
}

int getPossibility(int rainStatus) {
    if (rainStatus == LIGHT_RAIN) {
        return rand() % 1 + 4;
    }
    else if (rainStatus == HEAVY_RAIN) {
        return 12 - rand() % 2;
    }
    else return rand() % 6 + 4;
}
