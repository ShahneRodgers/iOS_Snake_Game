//
//  Scores.h
//  Snake
//
//  Created by Shahne Rodgers on 27/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scores : NSObject
    @property NSMutableDictionary* scores;

-(void)addScore:(NSString*) score from:(NSString*)name;
-(void)clear;

@end
