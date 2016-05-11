//
//  HistoryViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/31.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "HistoryViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define isiPhone6 (375==[[UIScreen mainScreen] bounds].size.width)
#define isiPhone6Plus (414==[[UIScreen mainScreen] bounds].size.width)

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>{

    TopBar *topBar;
    UIButton *rightButton;
    NSMutableArray *dataArray;
    UITableView *tableView;
}

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:@"阅读历史"];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];

    rightButton = [[UIButton alloc] initWithFrame:(CGRect){SCREEN_WIDTH-72.5,0,68.5,53}];
    [topBar addSubview:rightButton];
    [rightButton setImage:[UIImage imageNamed:@"cancel_btn"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"cancel_btn_pressed"] forState:UIControlStateSelected];
    [rightButton setTitle:@"清空" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    rightButton.titleEdgeInsets = (UIEdgeInsets){0,-70,0,0};
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    dataArray = [HistorySQL HistoryList];
    
    for (int i=0; i<dataArray.count; i++) {
        self.model = [dataArray objectAtIndex:i];
    }
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (self.model.name.length==0) {
        [tableView removeFromSuperview];
    }
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
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
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

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headerView = [[UIView alloc] initWithFrame:(CGRect){0,0,self.view.width,27}];
    headerView.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1];
    
    UILabel *title = [[UILabel alloc] initWithFrame:(CGRect){15,0,50,27}];
    title.text = @"今天";
    title.font = [UIFont systemFontOfSize:14];
    title.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    [headerView addSubview:title];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 27;
}

- (void)rightButtonAction{

    [tableView removeFromSuperview];
    [HistorySQL deleteArticleModel:self.model];
    [tableView reloadData];
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
