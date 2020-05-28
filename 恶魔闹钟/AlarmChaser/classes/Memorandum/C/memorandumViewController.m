//
//  memorandumViewController.m
//  AlarmChaser
//
//  Created by zhixian on 16/4/14.
//  Copyright © 2016年 tongari. All rights reserved.
//

#import "memorandumViewController.h"


@interface memorandumViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy)   NSArray               *            dataList;
@property (nonatomic, strong) UITableView           *            tableView;
@end

@implementation memorandumViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:0 animated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"";
    self.navigationItem.backBarButtonItem = barButton;

    self.title=@"About";
    self.dataList=@[@"",@"App Name",@"Version"];
    [self tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
            return 3;
      
  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"userCenterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"11"];
    }
    cell.textLabel.text=self.dataList[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
 if (indexPath.row==1) {
     cell.detailTextLabel.text=@"Crazy Alarm";
 }
    if (indexPath.row==2) {
        cell.detailTextLabel.text=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    }
//    UIView  *  lineView=[[UIView alloc]initWithFrame:CGRectMake(20, cell.height-0.5, self.view.bounds.size.width-40, 0.5)];
//    lineView.backgroundColor=[UIColor lightGrayColor];
//    [cell addSubview:lineView];
    
    if (indexPath.row==0) {
        UIImageView    *    image=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-80)/2, 80, 80, 80)];
           image.layer.cornerRadius=5.0;
           image.clipsToBounds=YES;
           image.image=[UIImage imageNamed:@"123.png"];
           [cell addSubview:image];
    }
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
      return   200;
    }else
    if (indexPath.row==1) {
        return 50;
    }else
    if (indexPath.row==2) {
        return 50;
    }else{
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
   
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
         
  
}


#pragma mark - lazy

- (UITableView *)tableView{
    
    if (!_tableView) {
       
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor=[UIColor whiteColor];
        tableView.separatorColor = [UIColor clearColor];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}




@end
