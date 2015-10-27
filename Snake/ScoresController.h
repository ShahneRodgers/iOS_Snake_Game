//
//  ScoresController.h
//  Snake
//
//  Created by Shahne Rodgers on 27/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "ViewController.h"
#import "Scores.h"

@interface ScoresController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableDictionary *dict;
@property NSArray *array;

@end
