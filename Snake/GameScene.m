//
//  GameScene.m
//  Snake
//
//  Created by Shahne Rodgers on 26/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)createSceneContents{
    self.level = 1;
    self.count = 0;
    self.delay = SIZE - 20;
    self.direction = UP;
    self.head = [[Snake alloc]init];
    self.head.position = CGPointMake(40,40);
    [self.head addPhysics];
    
    //for (int i = 0; i < 5; i++)
        [self addChild:[self.head addPart:self.direction]];
    
    self.backgroundColor = [SKColor whiteColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    self.name = @"walls";
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.categoryBitMask = 1;
    
    self.physicsWorld.contactDelegate = self;
    
    [self addChild: [self newGoal]];
    [self addChild: self.head];
    
}

-(void)gameOver{
    //Save level
    NSString* level = [[NSString alloc]initWithFormat:@"%i", self.level];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game over!"
                                                    message:@"Please enter your name to save your score."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex {
    Scores* score = [[Scores alloc]init];
    NSString* level = [[NSString alloc]initWithFormat:@"%i", self.level];
    NSString *name = [alert textFieldAtIndex:0].text;
    if ([name length] > 0)
        [score addScore:level from:name];
    else
        [score addScore:level from:@"Anonymous"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Gameover" object:nil];

}

-(void)ateGoal{
    self.level++;
    [self.goal removeFromParent];
    [self addChild:[self.head addPart:self.direction]];
    [self addChild:[self newGoal]];
    self.delay -= 2;
}

- (void)didBeginContact:(SKPhysicsContact *)contact{
    
    SKNode *first = contact.bodyA.node;
    SKNode *second = contact.bodyB.node;
    
    if ([first.name isEqualToString:@"goal"] || [second.name isEqualToString:@"goal"])
        [self ateGoal];
    else if ([first.name isEqualToString:@"walls"] || [second.name isEqualToString:@"walls"])
        [self gameOver];
    else if (self.head == first || self.head == second){ //Only lose if they're not connected
        Snake *firstA = (Snake*)first;
        Snake *secondB = (Snake*)second;
        if (firstA.next != secondB && secondB.next != firstA)
            [self gameOver];
       
    }
}


/*-(void)didEndContact:(SKPhysicsContact *)contact{
    NSLog(@"Contact ended");
}*/


-(void)update:(NSTimeInterval)currentTime{
    self.count++;
    if (self.count > self.delay){
        self.head = [self.head move:self.direction];
        self.count = 0;
    }
    
}

-(SKNode *)newGoal{
    UIColor *blue = [UIColor blueColor];
    CGSize size = CGSizeMake(30, 30);
    int x = arc4random_uniform(CGRectGetMaxX(self.frame));
    int y = arc4random_uniform(CGRectGetMaxY(self.frame));
    
    self.goal = [[SKSpriteNode alloc]initWithColor:blue size:size];
    self.goal.position = CGPointMake(x,y);
    self.goal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    self.goal.physicsBody.affectedByGravity = NO;
    self.goal.physicsBody.categoryBitMask = 1;
        
    self.goal.name = @"goal";
    
    return self.goal;
}

- (void)didMoveToView: (SKView *) view
{
    if (!self.isLoaded)
    {
        [self createSceneContents];
        self.isLoaded = YES;
    }
}

- (void)viewWillLayoutSubviews{
    
}

@end
