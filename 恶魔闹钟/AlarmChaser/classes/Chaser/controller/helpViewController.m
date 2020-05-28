//
//  helpViewController.m
//  AlarmChaser
//
//  Created by zhixian on 16/4/20.
//  Copyright © 2016年 tongari. All rights reserved.
//

#import "helpViewController.h"

@interface helpViewController ()

@end

@implementation helpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.separatorColor=[UIColor clearColor];

    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bake=[[UIView alloc]init];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, kAPPFRAMEWIDTH-20,100)];
    lab.font=[UIFont fontWithName:@"AxisStd-ExtraLight" size:16];
    lab.numberOfLines=0;
    lab.text=@[@"When the alarm clock you set reaches the specified time, the following notice will appear. For your sake, please slide as soon as possible and enter the program to cancel. Don't think there will be no sound after unlocking. This is just the beginning. If you don't cancel it as soon as possible, I will remind you every few minutes. Don't blame me. Good luck.",@"Every time the alarm clock rings, enter the program from the notice, or enter the program from the front desk, it will enter the following page ", @" when you finish the title, the alarm clock stops, I wish you a good mood every day, thank you for using."][section];
    [bake addSubview:lab];
    return bake;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kAPPFRAMEHEIGHT-60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    UIImageView *icon=[cell.contentView viewWithTag:100];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        icon=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kAPPFRAMEWIDTH-20, kAPPFRAMEHEIGHT-60)];
        icon.tag=100;
        [cell.contentView addSubview:icon];
        
        cell.backgroundColor=[UIColor clearColor];
    }
    
    icon.image=[UIImage imageNamed:@[@"help",@"help1",@"help2"][indexPath.section]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}










@end
