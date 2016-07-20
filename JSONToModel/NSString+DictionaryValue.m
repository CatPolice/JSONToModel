//
//  NSString+DictionaryValue.m
//  JSONToModel
//
//  Created by runlin on 16/7/19.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "NSString+DictionaryValue.h"

@implementation NSString (DictionaryValue)


-(NSDictionary *)dictionaryValue{
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
