//
//  ImagesViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/31.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "ImagesViewController.h"

@interface ImagesViewController ()<UITableViewDataSource,UITableViewDelegate>{

    TopBar *topBar;
    NSMutableArray *dataArray;
    UITableView *tableView;
    NSMutableArray *articleArray;
    int offset;
    int page_id;
}

@end

@implementation ImagesViewController

- (void)viewWillAppear:(BOOL)animated{

    NSLog(@"model:%@",self.model);
}

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
    tableView.backgroundColor = [UIColor clearColor];
    
    [SMAPI orderDataSource:^(NSMutableArray *headerSource, NSMutableArray *cellSource, NSMutableArray *typeSource) {
        dataArray = headerSource;
        [tableView reloadData];
    }];
    
    page_id = [self.model._id intValue];
    [SMAPI page_id:page_id offset:offset cellPageDataSource:^(NSMutableArray *homeSource) {
        
        offset = (int)articleArray.count/20;
        articleArray = homeSource;
        NSLog(@"homeSource:%@",homeSource);
        
        [tableView reloadData];
    }];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    float height = 62;
    
    Cell *cell = [[Cell alloc] initWithFrame:(CGRect){0,75,self.view.width,height}];
    cell.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
    [cell setModel:[dataArray objectAtIndex:self.index]];
    [cell changeBtImage:^{
        [cell changeBtState:[dataArray objectAtIndex:self.index]];
    }];
    [cell alertTapped:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"未登录" message:@"你未登录锤子阅读，不能订阅站点，登录重试" preferredStyle:UIAlertControllerStyleAlert];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [articleArray count];
}

- (HomeCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"HomeCell";
    HomeCell *cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setPerson:YES];
    [cell setModel:[articleArray objectAtIndex:indexPath.row]];
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [cell cellTapped:^(IndexModel *model){
        
        ContentViewController *contentVC = [[ContentViewController alloc] init];
        contentVC.model = model;
        [self presentViewController:contentVC animated:YES completion:nil];
    }];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexModel *model = [articleArray objectAtIndex:indexPath.row];
    return [HomeCell cellHeight:model];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 62;
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
