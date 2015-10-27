//
//  ViewController.m
//  Snake
//
//  Created by Shahne Rodgers on 26/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startGame:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GameController *controller = [storyboard instantiateViewControllerWithIdentifier:@"GameView"];
    [self switchTo:(UIViewController *)controller];
}

-(void)switchTo:(UIViewController*)controller{
    [controller setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)viewScores:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ScoresController *controller = [storyboard instantiateViewControllerWithIdentifier:@"ScoresView"];
    [self switchTo:(UIViewController *)controller];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
