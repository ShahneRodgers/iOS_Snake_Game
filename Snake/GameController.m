//
//  GameControllerViewController.m
//  Snake
//
//  Created by Shahne Rodgers on 26/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "GameController.h"

@interface GameController ()

@end

@implementation GameController

- (void)viewDidLoad {
    [super viewDidLoad];
    SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(endGame) name:@"Gameover" object:nil];
    
}
- (IBAction)changeDirection:(UIButton*)sender {
    NSString* title = sender.titleLabel.text;
    if ([title isEqualToString:@"Left"] && self.scene.direction != RIGHT)
        self.scene.direction = LEFT;
    else if ([title isEqualToString:@"Right"] && self.scene.direction != LEFT)
        self.scene.direction = RIGHT;
    else if ([title isEqualToString:@"Up"] && self.scene.direction != DOWN)
        self.scene.direction = UP;
    else if ([title isEqualToString:@"Down"] && self.scene.direction != UP)
        self.scene.direction = DOWN;
        
}

-(void)endGame{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)viewWillAppear:(BOOL)animated{
    self.scene = [[GameScene alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: self.scene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
