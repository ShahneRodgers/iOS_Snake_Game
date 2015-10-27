//
//  Scores.m
//  Snake
//
//  Created by Shahne Rodgers on 27/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "Scores.h"

@implementation Scores

-(id)init{
    self = [super init];
    [self loadData];
    return self;
}

-(void)saveData{
    [[NSUserDefaults standardUserDefaults]setObject:self.scores forKey:@"Scores"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadData{
    self.scores = [[NSMutableDictionary alloc] initWithCapacity:10];
    NSDictionary *saved = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"Scores"];
    if (saved)
        [self.scores addEntriesFromDictionary:saved];
}

-(void)addScore:(NSString*) score from:(NSString*)name{
    [self.scores setObject:name forKey:score];
    [self saveData];
}

-(void)clear{
    [self.scores removeAllObjects];
    [self saveData];
}

@end
