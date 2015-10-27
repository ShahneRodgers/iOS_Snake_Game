//
//  Snake.h
//  Snake
//
//  Created by Shahne Rodgers on 26/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#define SIZE 30

typedef enum {
    LEFT = -SIZE,
    RIGHT = SIZE,
    UP = 1,
    DOWN = -1,
} Direction;

@interface Snake : SKSpriteNode
    @property Snake* next;
    @property Snake* tail;

-(Snake *)move:(Direction)direction;
-(SKSpriteNode *)addPart:(Direction)direction;
-(void)addPhysics;

@end
