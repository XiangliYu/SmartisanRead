//
//  SMAPI.m
//  AFNDemo
//
//  Created by Oran Wu on 16/4/9.
//  Copyright © 2016年 MO. All rights reserved.
//

#import "SMAPI.h"

@implementation SMAPI

+ (void)offset:(int)offset indexDataSource:(HomeIndexAPIBlock)block{
    
    NSString *str = [NSString stringWithFormat:@"http://reader.smartisan.com/index.php?r=line/show&offset=%d&page_size=20",offset];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Json:%@",html);
        
        NSError *error;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
        
        NSLog(@"jsonObject:%@", jsonObject);
        
        NSString *code = [jsonObject objectForKey:@"code"];
        NSLog(@"code:%@",code);
        
        NSDictionary *dataDic = [jsonObject objectForKey:@"data"];
        NSLog(@"data:%@",dataDic);
        
        NSString *count = [dataDic objectForKey:@"count"];
        NSLog(@"count:%@",count);
        
        NSMutableArray *indexArray = [NSMutableArray array];
        NSMutableArray *indexId = [NSMutableArray array];
        
        NSMutableArray *listArray = [dataDic objectForKey:@"list"];
        for (int i=0; i<listArray.count; i++) {
            
            NSDictionary *listDic = [listArray objectAtIndex:i];
            NSLog(@"listDic:%@",listDic);
            
            IndexModel *model = [[IndexModel alloc] initWithIndexDic:listDic];
            
           // [indexId addObject:model.];
            [indexArray addObject:model];
        }
        if(block) block(indexArray,indexId);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error:%@",error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

+ (void)orderDataSource:(orderAPIBlock)block{

    NSString *str = [NSString stringWithFormat:@"http://reader.smartisan.com/index.php?r=myCenter/show"];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Json:%@",html);
        
        NSError *error;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
        NSLog(@"jsonObject:%@",jsonObject);
        
        NSString *code = [jsonObject objectForKey:@"code"];
        NSLog(@"code:%@",code);
        
        NSDictionary *dataDic = [jsonObject objectForKey:@"data"];
        NSLog(@"data:%@",dataDic);
        
        NSMutableArray *headerArray = [NSMutableArray array];
        
        NSMutableArray *banner = [dataDic objectForKey:@"banner"];
        for (int i=0; i<banner.count; i++) {
            
            NSDictionary *bannerDic = [banner objectAtIndex:i];
            NSLog(@"bannerDic:%@",bannerDic);
            
            HeaderModel *picModel = [[HeaderModel alloc] initWithHeaderDic:bannerDic];
            [headerArray addObject:picModel];
        }
        
        NSMutableArray *cellArray = [NSMutableArray array];
        
        NSMutableArray *siteArray = [dataDic objectForKey:@"site"];
        for (int i=0; i<siteArray.count; i++) {
            
            NSDictionary *siteDic = [siteArray objectAtIndex:i];
            NSLog(@"siteDic:%@",siteDic);
            
            CellModel *model = [[CellModel alloc] initWithCellDic:siteDic];
            [cellArray addObject:model];
        }
        
        NSMutableArray *sectionArray = [NSMutableArray array];
        
        NSMutableArray *cateArray = [dataDic objectForKey:@"cate"];
        for (int i=0; i<cateArray.count; i++) {
            
            NSDictionary *cateDic = [cateArray objectAtIndex:i];
            NSLog(@"cateDic:%@",cateDic);
            
            TypeModel *model = [[TypeModel alloc] initWithTypeDic:cateDic];
            [sectionArray addObject:model];
        }
        
        if (block) block(headerArray,cellArray,sectionArray);
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error:%@",error);
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operation];
}

+ (void)type_id:(int)_id offset:(int)offset typeDataSource:(IndexAPIBlock)block{

    NSString *str = [NSString stringWithFormat:@"http://reader.smartisan.com/index.php?r=site/search&cate_id=%d&offset=%d&page_size=20",_id,offset];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Json:%@",html);
        
        NSError *error;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
        NSLog(@"jsonObject:%@",jsonObject);
        
        NSString *code = [jsonObject objectForKey:@"code"];
        NSLog(@"code:%@",code);
        
        NSDictionary *dataDic = [jsonObject objectForKey:@"data"];
        NSLog(@"data:%@",dataDic);
        
        NSMutableArray *typeArray = [NSMutableArray array];
        
        NSArray *listArray = [dataDic objectForKey:@"list"];
        for (int i=0; i<listArray.count; i++) {
            
            NSDictionary *listDic = [listArray objectAtIndex:i];
            NSLog(@"listDic:%@",listDic);
            
            CellModel *model = [[CellModel alloc] initWithCellDic:listDic];
            [typeArray addObject:model];
        }
        
        if (block) block(typeArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error:%@",error);
    }];

    [[NSOperationQueue mainQueue] addOperation:operation];
    
}

+ (void)site_id:(int)_id topCellDataSource:(IndexAPIBlock)block{

    NSString *str = [NSString stringWithFormat:@"http://reader.smartisan.com/index.php?r=site/GetInfoById&site_id=%d",_id];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Json:%@",html);
        
        NSError *error;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
        
        NSLog(@"jsonObject:%@",jsonObject);
        
        NSString *code = [jsonObject objectForKey:@"code"];
        NSLog(@"code:%@",code);
        
        NSDictionary *dataDic = [jsonObject objectForKey:@"data"];
        NSLog(@"data:%@",dataDic);
        
        NSMutableArray *topArray = [NSMutableArray array];
        
        CellModel *model = [[CellModel alloc] initWithCellDic:dataDic];
        [topArray addObject:model];
        
        if (block) block(topArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error:%@",error);
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operation];

}

+ (void)page_id:(int)_id offset:(int)offset cellPageDataSource:(IndexAPIBlock)block{
    
    NSString *str = [NSString stringWithFormat:@"http://reader.smartisan.com/index.php?r=article/getList&site_id=%d&offset=%d&page_size=20",_id,offset];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Json:%@",html);
        
        NSError *error;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
        
        NSLog(@"jsonObject:%@",jsonObject);
        
        NSString *code = [jsonObject objectForKey:@"code"];
        NSLog(@"code:%@",code);
        
        NSDictionary *dataDic = [jsonObject objectForKey:@"data"];
        NSLog(@"data:%@",dataDic);
        
        NSString *count = [dataDic objectForKey:@"count"];
        NSLog(@"count:%@",count);
        
        NSMutableArray *pageArray = [NSMutableArray array];
        
        NSMutableArray *listArray = [dataDic objectForKey:@"list"];
        for (int i=0; i<listArray.count; i++) {
            
            NSDictionary *listDic = [listArray objectAtIndex:i];
            NSLog(@"listDic:%@",listDic);
            
            IndexModel *model = [[IndexModel alloc] initWithIndexDic:listDic];
            [pageArray addObject:model];
            
}
        
        if (block) block(pageArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error:%@",error);
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end
