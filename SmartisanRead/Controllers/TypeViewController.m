//
//  TypeViewController.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/23.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "TypeViewController.h"

@interface TypeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    TopBar *topBar;
    UITableView *tableView;
    NSMutableArray *dataArray;
    
    int typeId;
    int offset;
}

@end

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    NSString *title = self.model.name;
    [topBar setReturnBt:@"返回" Title:title];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    typeId = [self.model._id intValue];
    [SMAPI type_id:typeId offset:offset typeDataSource:^(NSMutableArray *homeSource) {
        offset = (int)dataArray.count/20;
        dataArray = homeSource;
        [tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataArray.count;
}

- (Cell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    Cell *cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setModel:[dataArray objectAtIndex:indexPath.row]];
    [cell setSmallImage:@"redimage"];
    [cell cellTapped:^(CellModel*model){
        
        ArticleViewController *articleVC = [[ArticleViewController alloc] init];
        articleVC.dataArray = dataArray;
        articleVC.model = model;
        articleVC.index = (int)indexPath.row;
        [self.navigationController pushViewController:articleVC animated:YES];
    }];
    [cell changeBtImage:^{
        [cell changeBtState:[dataArray objectAtIndex:indexPath.row]];
    }];
    [cell alertTapped:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"未登录" message:@"你未登录锤子阅读，不能订阅站点，登录后重试" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            LoginViewController *loginVC = [[LoginViewController alloc] init];
            [self presentViewController:loginVC animated:YES completion:nil];
            
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [Cell CellHeight];
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
