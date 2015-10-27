//
//  ScoresController.m
//  Snake
//
//  Created by Shahne Rodgers on 27/10/15.
//  Copyright (c) 2015 Shahne Rodgers. All rights reserved.
//

#import "ScoresController.h"

@interface ScoresController ()

@end

@implementation ScoresController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Scores *scores = [[Scores alloc]init];
    self.dict = scores.scores;
    self.array = self.dict.allKeys;
    UITableView* tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    
    self.view = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count]+2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    NSUInteger index = [indexPath indexAtPosition:1];
    if (index < [self.array count]){
        NSString *key = (NSString*)[self.array objectAtIndex:index];
        NSString *object = [self.dict objectForKey:key];
        cell.textLabel.text = [[NSString alloc]initWithFormat:@"%@: %@", object, key];
    } else if (index == [self.array count]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        //set the position of the button
        button.frame = CGRectMake(cell.frame.origin.x + 100, cell.frame.origin.y + 20, 100, 30);
        [button setTitle:@"Back" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(returnToMain:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor= [UIColor clearColor];
        [cell.contentView addSubview:button];
    } else {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        //set the position of the button
        button.frame = CGRectMake(cell.frame.origin.x + 100, cell.frame.origin.y + 20, 100, 30);
        [button setTitle:@"Clear scores" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clearScores:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor= [UIColor clearColor];
        [cell.contentView addSubview:button];
    }
    return cell;
}


- (IBAction)returnToMain:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)clearScores:(id)sender {
    Scores *scores = [[Scores alloc]init];
    [scores clear];
    [self returnToMain:nil];

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
