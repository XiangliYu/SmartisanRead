//
//  ViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/17.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "ViewController.h"
#define Height 80

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{

    TopBar *topBar;
    UITableView *tableView;
    NSMutableArray *homeArray;
    NSMutableArray *newArray;
    RefreshHeader *refreshHeader;
    RefreshFooter  *refreshFooter;
    
    CGPoint offset;
    int index;

    BOOL _decelerate;
    int x;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,-5,self.view.width,self.view.height+5}];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
        
    [SMAPI offset:x indexDataSource:^(NSMutableArray *homeSource,NSMutableArray *indexId) {
        homeArray = homeSource;
        x = (int)homeArray.count/20;
        [tableView reloadData];
    }];
    
    [SMAPI offset:x+1 indexDataSource:^(NSMutableArray *homeSource,NSMutableArray *indexId) {
        newArray = homeSource;
        x = (int)homeArray.count/20;
        [tableView reloadData];
    }];
     
    UIView *top20 = [[UIView alloc] initWithFrame:(CGRect){0,0,self.view.width,20}];
    [self.view addSubview:top20];
    top20.backgroundColor = [UIColor whiteColor];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setTitle:@"锤子阅读"];
    [topBar setLeftbtTitle:@"设置"];
    [topBar setRightbtTitle:@"订阅"];
    [topBar leftButtonTapped:^{
        [self turnLeftPage];
    }];
    [topBar rightButtonTapped:^{
        [self turnRightPage];
    }];

    refreshFooter = [[RefreshFooter alloc] initWithFrame:(CGRect){0, self.view.height, self.view.width, Height}];
    [self.view addSubview:refreshFooter];
}

- (void)turnLeftPage{

    SetUpViewController *setVC = [[SetUpViewController alloc] init];
    UINavigationController *SetNav = [[UINavigationController alloc] initWithRootViewController:setVC];
    [self presentViewController:SetNav animated:YES completion:nil];
}

- (void)turnRightPage{
    
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    
    UINavigationController *orderNV = [[UINavigationController alloc] initWithRootViewController:orderVC];
    [self presentViewController:orderNV animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)ScrollView{
    
    offset = tableView.contentOffset;
    float height = tableView.contentSize.height-tableView.height;

    if (offset.y<0) {
        
        CGRect refreshFrame = refreshHeader.frame;
        refreshFrame.origin.y = (-Height + (-offset.y));
        
        if (offset.y<-80) {
            [refreshHeader setTitle:@"松开即可刷新..."];
        }else if (offset.y==-80){
            [refreshHeader setTitle:@"正在刷新列表..."];
        }else{
            [refreshHeader setTitle:@"下拉即可刷新..."];
        }
        
        [refreshHeader setFrame:refreshFrame];
        
        refreshHeader.progress = (-offset.y)/Height;
        
    }else if (offset.y>height){
        
            float offsetY = offset.y-height;
            if(offsetY>0){
                CGRect frame = refreshFooter.frame;
                frame.origin.y = (self.view.bounds.size.height - offsetY);
                [refreshFooter setFrame:frame];
                
                if (offsetY<80) {
                    [refreshFooter setTitle:@"上拉加载更多..."];
                }else if (offsetY>=80&offsetY<=82){
                    [refreshFooter setTitle:@"正在加载更多..."];
                }else{
                    [refreshFooter setTitle:@"松开加载更多..."];
                }
                
                refreshFooter.progress = offsetY/Height;
            }
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)ScrollView willDecelerate:(BOOL)decelerate{
        
        offset = ScrollView.contentOffset;
        if (offset.y<0) {
            ScrollView.contentInset = UIEdgeInsetsMake(Height, 0, 0, 0);
            
            if (refreshHeader.progress>=1) {
                [refreshHeader setAnimation];
            }else{
                ScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            }
            
            [refreshHeader animationDidStop:^{
                
                ScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                tableView.tableHeaderView.hidden = YES;
                
                homeArray = newArray;
                [tableView reloadData];
            }];
            
        }else if (offset.y>tableView.contentSize.height-tableView.height){
            
            refreshFooter.hidden = NO;
            
            tableView.contentInset = UIEdgeInsetsMake(0, 0, Height, 0);
            
            NSLog(@"progress:%f",refreshFooter.progress);
           
            if (refreshFooter.progress>=0.9) {
                
                [refreshFooter setAnimation];
            }else{
    
                tableView.contentInset = UIEdgeInsetsMake(0, 0, -Height, 0);
                refreshFooter.y = self.view.height;
            }
        
            [refreshFooter animationDidStop:^{
                
                refreshFooter.y = self.view.height;
                
                for (int i=0; i<newArray.count; i++) {
                    
                    [homeArray addObject:[newArray objectAtIndex:i]];
                }
                [tableView reloadData];
                refreshFooter.progress=0.1;
                refreshFooter.hidden = YES;
                
                tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                refreshFooter.y = self.view.height;
                
            }];
        }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [homeArray count];
}

- (HomeCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    HomeCell *cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setPerson:NO];
    [cell setModel:[homeArray objectAtIndex:indexPath.row]];
    [cell cellTapped:^(IndexModel *model){
        
        ContentViewController *contentVC = [[ContentViewController alloc] init];
        contentVC.model = model;
        [self presentViewController:contentVC animated:YES completion:nil];
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexModel *model = [homeArray objectAtIndex:indexPath.row];
    
    return [HomeCell cellHeight:model];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    refreshHeader = [[RefreshHeader alloc] initWithFrame:(CGRect){0, 0, self.view.width, Height}];
    
    return refreshHeader;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return Height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
