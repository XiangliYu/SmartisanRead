//
//  ArticleViewController.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/21.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()<UITableViewDataSource,UITableViewDelegate>{

    TopBar *topBar;
    NSArray *dataArray;
    UITableView *tableView;

    NSMutableArray *indexIdArray;
    NSArray *articleArray;
    int offset;
    int _id;
}

@end

@implementation ArticleViewController

- (void)viewDidAppear:(BOOL)animated{

    NSLog(@"article:%@",self.model);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = self.model.name;
    NSLog(@"str:%@",str);

    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:str];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,75,self.view.width,self.view.height-75}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    
     _id = [self.model._id intValue];
    [SMAPI page_id:_id offset:offset cellPageDataSource:^(NSMutableArray *homeSource) {

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
    [cell setModel:[self.dataArray objectAtIndex:self.index]];
    [cell changeBtImage:^{
        [cell changeBtState:[self.dataArray objectAtIndex:self.index]];
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

    return articleArray.count;
}

- (HomeCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    HomeCell *cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setPerson:YES];
    [cell setModel:[articleArray objectAtIndex:indexPath.row]];
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
