#ifndef RAINDROP_H
#define RAINDROP_H

typedef struct {
    float x, y;          
    float speed;         
    int color[3];        
    int state;           
    float ripple_radius; 
    float max_radius;    
    int transparency;
    int size;
} Raindrop;

Raindrop initRaindrop();
void updateRaindrop(Raindrop* drop);  
void drawRaindrop(Raindrop* drop);
int getPossibility(int rainStatus);


#endif

