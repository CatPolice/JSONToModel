//
//  HomeViewController.m
//  JSONToModel
//
//  Created by runlin on 16/7/19.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "HomeViewController.h"
#import "NSString+DictionaryValue.h"

#define DEFINE_NSSTRING_HEAD @"@property (nonatomic , copy) NSString *"

@interface HomeViewController ()

{
    __unsafe_unretained IBOutlet NSTextView *_inputTextView;
    __unsafe_unretained IBOutlet NSTextView *_outputTextView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}



- (void)viewWillAppear{
    [super viewWillAppear];
}

- (IBAction)changeButtonAction:(id)sender {
    
    NSDictionary *dic = [_inputTextView.string dictionaryValue];
    
    if (!dic) {
        [self showErrorMessage:@"json解析失败"];
        return;
    }
    
    NSArray *arrKeys = [dic allKeys];
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    
    for (NSString *str in arrKeys) {
        NSString *temp = [NSString stringWithFormat:@"%@%@%@",DEFINE_NSSTRING_HEAD,str,@";"];
        [models addObject:temp];
    }
    
    
    NSMutableString * result = [[NSMutableString alloc] init];
    for (NSObject *obj in models)
    {
        [result appendString:[obj description]];
        [result appendString:@"\n"];
    }
    
    _outputTextView.string = result;
}

- (void)showErrorMessage:(NSString *)message{
    NSAlert *alert = [[NSAlert alloc]init];           // 创建一个alert
    [alert setMessageText:@"警告!"];           // 设置信息标题
    [alert setInformativeText:message];    // 设置信息内容
    [alert addButtonWithTitle:@"确定"];                // 添加第一个按钮以及按钮上显示的文字
//    [alert addButtonWithTitle:@"Good!"];              // 添加第二个按钮以及按钮上显示的文字
//    [alert addButtonWithTitle:@"NO!"];                // 添加第三个按钮以及按钮上显示的文字
    [alert runModal];       // 弹出Alert，
}


@end
