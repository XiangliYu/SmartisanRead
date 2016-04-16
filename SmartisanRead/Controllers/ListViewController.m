//
//  ListViewController.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/31.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>{

    TopBar *topBar;
    NSMutableArray *dataArray;
    UITableView *tableView;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:@"订阅列表"];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    dataArray = [CellSQL orderList];
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    [cell cellTapped:^(CellModel*model){
        
        ArticleViewController *articleVC = [[ArticleViewController alloc] init];
        articleVC.model = model;
        articleVC.dataArray = dataArray;
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
