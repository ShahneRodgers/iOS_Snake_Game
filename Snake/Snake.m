//
//  Snake.m
//  Snake
//
//  Created by Shahne Rodgers on 26/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "Snake.h"



@implementation Snake

-(id)init{
    
    
    UIColor *colour = [UIColor greenColor];
    CGSize size = CGSizeMake(SIZE, SIZE);
    
    self = [super initWithColor:colour size:size];
    
    self.name = @"snake";
    
    
    self.next = self;
    self.tail = self;
    
    return self;
}

-(void)addPhysics{
    CGSize size = self.size;
    size.height -= 10;
    size.width -= 10;
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = 1;
    self.physicsBody.collisionBitMask = 1;
    self.physicsBody.allowsRotation = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.contactTestBitMask = 1;
}

-(SKSpriteNode *)addPart:(Direction)direction{
    //Create the new part
    Snake *part = [[Snake alloc]init];
    
    //Place it where the tail is, after moving the tail to prevent collisions
    int x = self.tail.position.x;
    int y = self.tail.position.y;
    
    //Move the tail to in front of the head
    [self move:direction];
    
    part.position = CGPointMake(x,y);
    
    //Set the node's next to be the current tail
    part.next = self.tail;
    //Set the node as the new tail
    self.tail = part;
    
    [part addPhysics];
    return part;
}

-(Snake*)move:(Direction)direction{
    self.name = @"Snake";
    self.physicsBody.dynamic = NO;
    //self.physicsBody.contactTestBitMask = 0;
    self.next = self.tail;
    SKSpriteNode *tailNode = self.tail;
    
    //Move the tail node to the front
    if (direction == LEFT || direction == RIGHT){
        tailNode.position = CGPointMake(self.position.x+direction, self.position.y);
    } else
        tailNode.position = CGPointMake(self.position.x, self.position.y+(direction*SIZE));
    //Set the tail to be the new tail
    self.tail.tail = self.tail.next;
    //Set the head to be the old tail
    self.next.name = @"Head";
    //self.next..physicsBody.contactTestBitMask = 1;
    self.next.physicsBody.dynamic = YES;
    return self.next;
}

@end
