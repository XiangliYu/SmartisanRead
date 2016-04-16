//
//  HomeModel.m
//  SmartisanRead
//
//  Created by Oran Wu on 16/3/17.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

+ (NSMutableArray*)ModelArray{

    HomeModel *model1 = [[HomeModel alloc] init];
    model1.headIcon = @"娃娃的头像";
    model1.name = @"纽约时报中文网";
    model1.date = @"2016-3-16";
    model1.title = @"“晒娃”前先问问孩子怎么想";
    model1.content = @"研究显示，青少年对父母如何在网络上分享关于自己的信息感到“特别担忧“。什么能发而什么不能发，他们希望父母能够预先征询自己的意见。家里人上网需要遵循什么规矩吗”";
    model1.images = @[@"", @""];
    
    HomeModel *model2 = [[HomeModel alloc] init];
    model2.headIcon = @"u=978411607,2147282457&fm=23&gp=0";
    model2.name = @"华尔街见闻";
    model2.date = @"2015-12-20";
    model2.title = @"为什么不能放慢速度放送管制－在台湾思考国内经济政策";
    model2.content = @"本文作者为海通证券首席经济学家李迅雷，原文载于微信公众号“lixunlei”，授权华尔街见闻发表。上周拜访QFI客户，在台湾马不停蹄的路演一周。";
    model2.images = @[@"", @"", @""];

    HomeModel *model3 = [[HomeModel alloc] init];
    model3.headIcon = @"u=1458421279,3485179427&fm=23&gp=0";
    model3.name = @"好奇心日报";
    model3.date = @"2015-11-19";
    model3.title = @"韩国娱乐这么火，会重蹈台湾娱乐被吞噬的命运吗";
    model3.content = @"韩剧《太阳的后裔》在爱奇艺上刚刚播出了六集，在其担任男主角的宋仲基就成了中国人新一任的”国民老公“。微博上，宋仲基的话题阅读量已经达到25.9亿";
    model3.images = @[@"", @""];

    HomeModel *model4 = [[HomeModel alloc] init];
    model4.headIcon = @"u=2179297346,4122928821&fm=23&gp=0";
    model4.name = @"TOPYS";
    model4.date = @"2015-10-09";
    model4.title = @"我害怕我的工作";
    model4.content = @"连续好几天，我都在折磨我的大脑，事情却毫无进展。我试图从不同的角度去击破他，但似乎都是死路。思维的碎片像野蜂一样的飞舞，混乱不堪。我期待大脑可以像电脑一样有个开关";
    model4.images = @[@"", @""];

    HomeModel *model5 = [[HomeModel alloc] init];
    model5.headIcon = @"u=2632871113,639221532&fm=23&gp=0";
    model5.name = @"纽约时报中文网";
    model5.date = @"2015-10-1";
    model5.title = @"“喜剧乒乓”，一位北京女孩与美国大叔的奇缘";
    model5.content = @"吴越八年前来到纽约，为实现他的“乒乓美国梦”。在他的学生、粉丝、喜剧演员弗雷德兰德的帮助下，他成了美国公民，还将出征今年的巴西奥运会。今年26岁的吴越生在中国";
    model5.images = @[@"", @""];

    HomeModel *model6 = [[HomeModel alloc] init];
    model6.headIcon = @"u=2769901330,4132322556&fm=23&gp=0";
    model6.name = @"FT中文网";
    model6.date = @"2015-8-22";
    model6.title = @"别想靠一封邮件留住人才";
    model6.content = @"自从我开始对内部激励备忘录感兴趣以来，这是头一次一份这样的备忘录不是因为被认为槽点太多、而是因为被认为写的很好而在网上走红。他是高盛驻固定收益主管";
    model6.images = @[@"", @""];

    return (NSMutableArray*)@[model1, model2, model3, model4, model5, model6];
    
}


@end
