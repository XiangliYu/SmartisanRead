//
//  RecommendViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/21.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{

    TopBar *topBar;
    UITableView *tableView;
    NSMutableArray *dataArray;
    
    int offset;
}

@end

@implementation RecommendViewController

- (void)viewWillAppear:(BOOL)animated{

    NSLog(@"str:%@",self.title);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    
    NSString *title = self.titles;
    [topBar setReturnBt:@"返回" Title:title];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];

    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [SMAPI recommend_id:false offset:offset recommendDataSource:^(NSMutableArray *homeSource) {
        
        dataArray = homeSource;
        offset = (int)dataArray.count/20;
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
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
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
