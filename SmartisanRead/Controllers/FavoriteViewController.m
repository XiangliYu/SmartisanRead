//
//  FavoriteViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/31.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "FavoriteViewController.h"

@interface FavoriteViewController ()<UITableViewDelegate,UITableViewDataSource>{

    TopBar *topBar;
    NSMutableArray *dataArray;
    UITableView *tableView;
}

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:@"我的收藏"];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    dataArray = [ArticleSQL ArticleList];
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataArray.count;
}

- (FavoriteCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"FavoriteCell";
    FavoriteCell *cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[FavoriteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setModel:[dataArray objectAtIndex:indexPath.row]];
    [cell cellTapped:^(IndexModel *myModel){
       
        ContentViewController *contentVC = [[ContentViewController alloc] init];
        contentVC.model = myModel;
        [self presentViewController:contentVC animated:YES completion:nil];

    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [FavoriteCell CellHeight];
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
