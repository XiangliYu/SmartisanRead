//
//  UEViewController.m
//  SmartisanRead
//
//  Created by Xiangli Yu on 16/4/2.
//  Copyright © 2012-2016 SmartisanFun LTD All rights reserved.
//

#import "UEViewController.h"

@interface UEViewController ()<ButtonDelegate,UIScrollViewDelegate>{

    TopBar *topBar;
    UIImageView *backView;
    UILabel *btLabel;
    ButtonView *myButton;
    UIScrollView *scrollView;
    UILabel *noteLabel;

}

@end

@implementation UEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"activity_content_bg"]]];
    
    topBar = [[TopBar alloc] initWithFrame:(CGRect){0,20,self.view.width,55}];
    [self.view addSubview:topBar];
    [topBar setReturnBt:@"返回" Title:@"用户体验改进计划"];
    [topBar returnBtTapped:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    backView = [[UIImageView alloc] initWithFrame:(CGRect){10,85,self.view.width-20,490}];
    UIImage *backImage = [UIImage imageNamed:@"login_edittext_single_bg"];
    backView.image = [backImage stretchableImageWithLeftCapWidth:17 topCapHeight:30];
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    
    [self contentView];
    
    UIView *cutLine = [[UIView alloc] initWithFrame:(CGRect){13,515,self.view.width-26,1.5}];
    cutLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview:cutLine];
    
    btLabel = [[UILabel alloc] initWithFrame:(CGRect){25,515,200,60}];
    [self.view addSubview:btLabel];
    btLabel.text = @"参与用户体验改进计划";
    btLabel.font = [UIFont systemFontOfSize:18];
    
    myButton = [[ButtonView alloc] initWithFrame:(CGRect){272,516.5,86.5,55.5}];
    myButton.layer.masksToBounds = YES;
    myButton.buttonDelegate = self;
    [self.view addSubview:myButton];
    
    noteLabel = [[UILabel alloc] initWithFrame:(CGRect){25,575,self.view.width-60,60}];
    [self.view addSubview:noteLabel];
    noteLabel.text = @"为了改善产品的用户体验，锤子阅读将会对各个功能的使用情况进行统计，但绝不涉及用户的个人隐私数据。";
    noteLabel.textColor = [UIColor colorWithWhite:0.45 alpha:1];
    noteLabel.font = [UIFont systemFontOfSize:14];
    noteLabel.numberOfLines = 3;
}

- (void)contentView{

    scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,5,self.view.width-20,425}];
    [backView addSubview:scrollView];
    scrollView.contentSize = (CGSize){self.view.width-20,2000};
    scrollView.delegate = self;
    
    UILabel *title = [[UILabel alloc] initWithFrame:(CGRect){110,40,150,20}];
    title.text = @"用户体验改进计划";
    title.font = [UIFont systemFontOfSize:17];
    [scrollView addSubview:title];
    
    UETextView *textOne = [[UETextView alloc] initWithText:@"1. 信息的收集和使用"];
    textOne.y = title.bottom+35;
    [scrollView addSubview:textOne];
    [textOne sizeToFit];
    
    UETextView *textOne1 = [[UETextView alloc] initWithText:@"（1）为了改进软件性能和外观、提升产品的使用体验以及指导研发的优先级等目的，锤子软件会收集与您相关的信息（包括但不限于设备信息、日志信息、位置信息、联系人信息、本地储存、路由数据包、信息发送人和接收数据（非信息本身），以及其他类似的特征记录）。"];
    textOne1.y = textOne.bottom+15;
    [scrollView addSubview:textOne1];
    [textOne1 sizeToFit];
    
    UETextView *textOne2 = [[UETextView alloc] initWithText:@"（2）锤子软件的用户体验改进计划是基于对使用数据的统计，来诊断系统问题，优化产品体验的计划。我们会使用 Talking Data 等工具统计您在使用锤子软件产品过程中产生的数据信息。我们在用户体验改进计划中不会收录或上传任何涉及您个人身份信息的内容。前述统计内容包括但不限于：应用启动数，页面访问数，重点按钮点击数，设置项的配置属性等。随着锤子软件产品的后续版本升级，我们统计的范围会有所改变，您下载/安装/使用后续版本锤子软件产品的行为将被视为您对届时相关改变的同意。"];
    textOne2.y = textOne1.bottom+13;
    [scrollView addSubview:textOne2];
    [textOne2 sizeToFit];
    
    UETextView *textOne3 = [[UETextView alloc] initWithText:@"（3）锤子软件可能会将您通过自己的帐户提交的信息与锤子软件的其他服务或第三方的信息相结合，以便为您提供更好的体验并提高锤子软件的服务质量。"];
    textOne3.y = textOne2.bottom+13;
    [scrollView addSubview:textOne3];
    [textOne3 sizeToFit];
    
    UETextView *textOne4 = [[UETextView alloc] initWithText:@"（4）锤子软件的产品和服务中可能含有第三方产品和/或服务的链接或信息。如果您将个人信息填写在其他平台上或通过第三方程序提交/发布，则该方可能会获知您的信息。该第三方应用程序可能有其相应的规定，请仔细查看，并在提供个人信息前请仔细考虑清楚。本用户体验改进计划不适用于第三方向您收集信息的行为，锤子软件无法控制第三方的行为，因此也不会对第三方收集、使用您信息的行为承担责任。"];
    textOne4.y = textOne3.bottom+13;
    [scrollView addSubview:textOne4];
    [textOne4 sizeToFit];
    
    UETextView *textOne5 = [[UETextView alloc] initWithText:@"（5）锤子软件将严格遵守有关法律法规和本用户体验改进计划所载明的内容收集、使用您的信息。除非持有锤子软件出具的正式授权文件，否则锤子软件的具体工作人员不会直接向您索要个人信息。如遇此类情况，您可以直接与锤子软件联系。"];
    textOne5.y = textOne4.bottom+13;
    [scrollView addSubview:textOne5];
    [textOne5 sizeToFit];
    
    UETextView *textOne6 = [[UETextView alloc] initWithText:@"（6）加入和退出用户体验改进计划，在“设置”中将“用户体验改进计划”开关置为打开的状态，表示用户已同意加入用户体验改进计划，同意锤子软件对信息的收集和使用。将“用户体验改进计划”开关置为关闭的状态，表示用户已退出用户体验改进计划，锤子软件将停止信息的收集和使用。"];
    textOne6.y = textOne5.bottom+13;
    [scrollView addSubview:textOne6];
    [textOne6 sizeToFit];

    UETextView *textTwo = [[UETextView alloc] initWithText:@"2. 信息的披露"];
    textTwo.y = textOne6.bottom+15;
    [scrollView addSubview:textTwo];
    [textTwo sizeToFit];
    
    UETextView *textTwo1 = [[UETextView alloc] initWithText:@"（1）除非法律法规规定、政府部门要求或本用户体验改进计划载明的例外情况，锤子软件会妥善保存您的信息，不予泄露。"];
    textTwo1.y = textTwo.bottom+13;
    [scrollView addSubview:textTwo1];
    [textTwo1 sizeToFit];
    
    UETextView *textTwo2 = [[UETextView alloc] initWithText:@"（2）您于此授权，在以下情形中，锤子软件可以向第三方披露您的信息而无需再行获得您的同意："];
    textTwo2.y = textTwo1.bottom+13;
    [scrollView addSubview:textTwo2];
    [textTwo2 sizeToFit];
    
    UETextView *textTwo2a = [[UETextView alloc] initWithText:@"    （a）如果锤子软件披露这些信息是用来识别、联系或向可能对锤子软件及其权利或财产、网站用户或者其他任何人及其权利和财产造成损害之行为提起诉讼之必要；"];
    textTwo2a.y = textTwo2.bottom+13;
    [scrollView addSubview:textTwo2a];
    [textTwo2a sizeToFit];
    
    UETextView *textTwo2b = [[UETextView alloc] initWithText:@"    （b）锤子软件将个人信息提供给锤子软件的关联方或其他有合作关系的企业或个人，以便其代表/协助锤子软件处理这些信息。锤子软件要求上述各方同意按照锤子软件的规定、本用户体验改进计划以及有关法律法规之规定来处理这些信息。"];
    textTwo2b.y = textTwo2a.bottom+13;
    [scrollView addSubview:textTwo2b];
    [textTwo2b sizeToFit];
    
    UETextView *textThree = [[UETextView alloc] initWithText:@"3. 信息安全"];
    textThree.y = textTwo2b.bottom+15;
    [scrollView addSubview:textThree];
    [textThree sizeToFit];
    
    UETextView *textThree1 = [[UETextView alloc] initWithText:@"（1）锤子软件将尽合理的努力保障您的信息安全，但是您应当知晓锤子软件不能完全避免与个人信息安全相关的风险（特别是发生锤子软件无法控制的情况时，如不可抗力或第三方原因），因此，锤子软件对隐私信息的维护或保密无法做出任何确定性的保证或承诺。如果锤子软件知悉其所获取并储存的数据安全受到危害或由于外部行为（包括但不限于外部安全攻击）使用户的非公开信息被披露给不相关第三方，尽管本政策中有其他免责规定，锤子软件仍将采取其认为适当的合理措施（包括但不限于内部调查、上报并通知执法机构、以及配合执法机构工作等）。同时，锤子软件也会在其认为适当的情况下采取合法合理措施通知相关用户，告知其被披露的信息以及锤子软件对该信息的知悉程度。"];
    textThree1.y = textThree.bottom+13;
    [scrollView addSubview:textThree1];
    [textThree1 sizeToFit];
    
    UETextView *textThree2 = [[UETextView alloc] initWithText:@"（2）您应当注意保护您的个人信息安全。例如，不要泄露您的个人密码等。"];
    textThree2.y = textThree1.bottom+13;
    [scrollView addSubview:textThree2];
    [textThree2 sizeToFit];
    
    UETextView *textThree3 = [[UETextView alloc] initWithText:@"（3）锤子软件会采取必要手段，努力防止内部工作人员越权获取/利用/泄露您的信息。"];
    textThree3.y = textThree2.bottom+13;
    [scrollView addSubview:textThree3];
    [textThree3 sizeToFit];
    
    UETextView *textFour = [[UETextView alloc] initWithText:@"4. 对未成年人信息的收集和使用"];
    textFour.y = textThree3.bottom+15;
    [scrollView addSubview:textFour];
    [textFour sizeToFit];
    
    UETextView *textFour1 = [[UETextView alloc] initWithText:@"（1）锤子软件要求未成年人在其法定监护人的许可和指导下使用锤子软件的产品或服务。"];
    textFour1.y = textFour.bottom+13;
    [scrollView addSubview:textFour1];
    [textFour1 sizeToFit];
    
    UETextView *textFour2 = [[UETextView alloc] initWithText:@"（2）如果您是未成年人，您需要确保在提供个人信息前，已经获得了您法定监护人的同意。"];
    textFour2.y = textFour1.bottom+13;
    [scrollView addSubview:textFour2];
    [textFour2 sizeToFit];

    UETextView *textFive = [[UETextView alloc] initWithText:@"5. 本用户体验改进计划的修订"];
    textFive.y = textFour2.bottom+15;
    [scrollView addSubview:textFive];
    [textFive sizeToFit];
    
    UETextView *textFive1 = [[UETextView alloc] initWithText:@"虽然计划说明了锤子软件在保护方面所遵循的标准，但这些标准可能会发生变化。如有更新，锤子软件会在发布修订版本时以锤子软件认为适当的方式通知您变动内容和生效日期。"];
    textFive1.y = textFive.bottom+13;
    [scrollView addSubview:textFive1];
    [textFive1 sizeToFit];
    
    scrollView.contentSize = (CGSize){self.view.width-20,textFive1.bottom+100};
}

- (void)selectedLeftBt{
    
    NSLog(@"selectedLeftBt");
}

- (void)selectedRightBt{

     NSLog(@"selectedRightBt");
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
