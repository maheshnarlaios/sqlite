//
//  DetailsController.m
//  SQLite
//
//  Created by apple on 14/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DetailsController.h"

@interface DetailsController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *detailsTable;

@end

@implementation DetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark:- TableViewDataSource/Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _detailsArry.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_detailsTable dequeueReusableCellWithIdentifier:@"details"];
    UILabel *regNoLabel = [cell viewWithTag:10];
    UILabel *nameLabel = [cell viewWithTag:11];
    UILabel *departmentLabel = [cell viewWithTag:12];
    UILabel *yearLabel = [cell viewWithTag:13];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 159.0f;
}


@end
