
//
//  SubscriptionViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/3/20.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "OrderViewController.h"

#define Height 80

@interface OrderViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{

    TopBar *topBar;
    UIScrollView *scrollView;
    UIView *orderView;
    UIButton *fieldButton;
    UIScrollView *imageView;
    ScrollPageView * scrollImages;
    UIPageControl *pageCtrl;
    NSArray *imageArray;
    NSTimer *timer;
    int lastPage;
    int currentPage;
    NSArray *dataArray;
    UITableView *tableView;
    
    RefreshHeader *refreshView;
    NSMutableArray *picArray;
    NSMutableArray *headerArray;
    NSMutableArray *cellArray;
    NSMutableArray *sectionArray;
    
    int index;
    CGPoint offset;
  
    int _id;
    int x;
}

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setTitle:@"订阅中心"];
    [topBar setLeftbtTitle:@"返回"];
    [topBar leftButtonTapped:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [self textFieldView];

    headerArray = [NSMutableArray array];
    cellArray = [NSMutableArray array];
    sectionArray = [NSMutableArray array];
    
   [SMAPI orderDataSource:^(NSMutableArray *headerSource, NSMutableArray *cellSource, NSMutableArray *typeSource) {
       cellArray = cellSource;
       sectionArray = typeSource;
       picArray = headerSource;

       [tableView reloadData];
       [self imageView];
       [self cellView];
       [self typeCell];

   }];
    
    scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,125,self.view.width,self.view.height-125}];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.contentSize = (CGSize){self.view.width,860};
}

- (void)textFieldView{
    
    fieldButton = [[UIButton alloc] initWithFrame:(CGRect){0,75,self.view.width,50}];
    [self.view addSubview:fieldButton];
    UIImage *normalImage = [UIImage imageNamed:@"account_choose_country_search_edit_bg_normal"];
    UIImage *selectedImage = [UIImage imageNamed:@"account_choose_country_search_edit_bg_disable"];
    [fieldButton setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:40 topCapHeight:25]forState:UIControlStateNormal];
    [fieldButton setBackgroundImage:[selectedImage stretchableImageWithLeftCapWidth:40 topCapHeight:25] forState:UIControlStateSelected];
}

- (void)imageView{
    
    float width = self.view.width;
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:(CGRect){0,0,width,164}];
    [scrollView addSubview:background];
    UIImage *backImage = [UIImage imageNamed:@"cellBack"];
    background.image = [backImage stretchableImageWithLeftCapWidth:10 topCapHeight:30];
    background.userInteractionEnabled = YES;
    
    imageView = [[UIScrollView alloc] initWithFrame:(CGRect){0,0,width,135}];
    imageView.delegate = self;
    imageView.pagingEnabled = YES;
    imageView.contentSize = CGSizeMake(width*5, 135);
    imageView.showsHorizontalScrollIndicator = NO;
    imageView.showsVerticalScrollIndicator = NO;
    [background addSubview:imageView];
    
    [self timeOn];
    
    pageCtrl = [[UIPageControl alloc] initWithFrame:(CGRect){0,145,width,10}];
    [background addSubview:pageCtrl];
    pageCtrl.numberOfPages = 5;
    pageCtrl.currentPageIndicatorTintColor = [UIColor grayColor];
    pageCtrl.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    [pageCtrl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventTouchUpInside];
    
    float imageWidth = width-12;
    float imageHeight = 130;
    
    imageArray = @[@"彭博商业周刊", @"果壳网", @"大象公会", @"FT中文网", @"36氪"];
    for (int i=0; i<picArray.count; i++) {
        
        HeaderModel *headerModel = [[HeaderModel alloc] init];
        headerModel = [picArray objectAtIndex:i];
        
        scrollImages = [[ScrollPageView alloc] initWithFrame:(CGRect){6+width*i,4,imageWidth,imageHeight} setImage:headerModel.pic];
        scrollImages.userInteractionEnabled = YES;
        [imageView addSubview:scrollImages];
        [scrollImages imageButtonTapped:^{
            
            ImagesViewController *imagesVC = [[ImagesViewController alloc] init];
            imagesVC.model = headerModel;
            imagesVC.index = i;
            [self.navigationController pushViewController:imagesVC animated:YES];
        }];
    }
}

- (void)cellView{
    
    SectionCell *sectionCell = [[SectionCell alloc] initWithFrame:(CGRect){0,164,self.view.width,36}];
    sectionCell.userInteractionEnabled = YES;
    [scrollView addSubview:sectionCell];
    NSString *str = @"编辑推荐站点";
    [sectionCell setSectionTitle:str More:@"更多" Button:@"usercenter_arrow_normal"];
    [sectionCell moreTapped:^{

        RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
        recommendVC.titles = str;
        [self.navigationController pushViewController:recommendVC animated:YES];
        
    }];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:(CGRect){0,200,self.view.width,248}];
    [scrollView addSubview:background];
    background.userInteractionEnabled = YES;
    UIImage *backImage = [UIImage imageNamed:@"cellBack"];
    background.image = [backImage stretchableImageWithLeftCapWidth:10 topCapHeight:30];
    
    tableView = [[UITableView alloc] initWithFrame:(CGRect){0,0,self.view.width,248}];
    [background addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    SectionCell *sortCell = [[SectionCell alloc] initWithFrame:(CGRect){0,247,self.view.width,37}];
    [background addSubview:sortCell];
    [sortCell setSectionTitle:@"站点分类" More:nil Button:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return cellArray.count;
}

- (Cell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    Cell *cell = [TableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setModel:[cellArray objectAtIndex:indexPath.row]];
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [cell cellTapped:^(CellModel*model){
        
        ArticleViewController *articleVC = [[ArticleViewController alloc] init];
        articleVC.model = model;
        articleVC.dataArray = cellArray;
        articleVC.index = (int)indexPath.row;
        [self.navigationController pushViewController:articleVC animated:YES];
        
    }];
    [cell changeBtImage:^{
        [cell changeBtState:[cellArray objectAtIndex:indexPath.row]];
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

- (void)typeCell{

    UIImageView *background = [[UIImageView alloc] initWithFrame:(CGRect){0,484,self.view.width,375}];
    [scrollView addSubview:background];
    background.userInteractionEnabled = YES;
    UIImage *backImage = [UIImage imageNamed:@"cellBack"];
    background.image = [backImage stretchableImageWithLeftCapWidth:10 topCapHeight:30];
    
    for (int i=0; i<sectionArray.count; i++) {
        
        TypeModel *typeModel = [[TypeModel alloc] init];
        typeModel = [sectionArray objectAtIndex:i];
        
        NSString *images = typeModel.headIcon;
        NSString *str = typeModel.name;
        
        float width = self.view.width/2;
        float height = 62;
        int left = i%2;
        int top = i/2;
        
        TypeCell *typeCell = [[TypeCell alloc] initWithFrame:(CGRect){width*left,height*top,width,height}];
        [background addSubview:typeCell];
        [typeCell setTypeImage:images Title:str Model:typeModel];
        [typeCell typeCellTapped:^(TypeModel *model){
            
            TypeViewController *typeVC = [[TypeViewController alloc] init];
            typeVC.model = model;
            typeVC.index = i;
            [self.navigationController pushViewController:typeVC animated:YES];

        }];
    }
}

- (void)changeImage{
    
    currentPage = lastPage+1;
    [imageView setContentOffset:(CGPoint){currentPage*self.view.width,0} animated:YES];
    lastPage =currentPage;
    if (lastPage>3) {
        lastPage =-1;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)ScrollView{
   
    int page = imageView.contentOffset.x/imageView.frame.size.width;
    pageCtrl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self timeOff];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)ScrollView willDecelerate:(BOOL)decelerate{
    
    [self timeOn];
}

- (void)timeOn{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:3
                                             target:self
                                           selector:@selector(changeImage)
                                           userInfo:nil
                                            repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)timeOff{
    
    [timer invalidate];
    timer = nil;
}

- (void)pageAction:(UIPageControl*)page{
    
    int pageNum =(int)pageCtrl.currentPage;
    CGSize size = imageView.frame.size;
    [imageView setContentOffset:(CGPoint){(pageNum+1)*size.width,0} animated:YES];
    [timer invalidate];
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
