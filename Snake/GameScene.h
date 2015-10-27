//
//  GameScene.h
//  Snake
//
//  Created by Shahne Rodgers on 26/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Snake.h"
#import "Scores.h"



@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property BOOL isLoaded;
@property int level;
@property Snake* head;
@property SKSpriteNode* goal;
@property Direction direction;
@property int count;
@property int delay;

@end
