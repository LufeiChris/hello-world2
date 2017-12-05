//
//  ViewController.m
//  test
//
//  Created by a123 on 17/4/6.
//  Copyright © 2017年 LUFEICHENG. All rights reserved.
//

#import "ViewController.h"
#import "CommonFunc.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextView];
}

- (void)setupTextView
{
    // 富文本技术：
    // 1.图文混排
    // 2.随意修改文字样式
    //    self.textView.text = @"哈哈4365746875";
    //    self.textView.textColor = [UIColor blueColor];
    
//    // 设置“哈哈”为蓝色
//    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 2)];
//    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 2)];
//    [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
//    
//    // 设置“456”为红色
//    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6, 2)];
//    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:24] range:NSMakeRange(6, 2)];
//    [string addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(6, 2)];
    
    [self.gggg setBackgroundImage:[UIImage imageNamed:@"小白菜"] forState:UIControlStateNormal];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@""];
    // 创建图片图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"pyweixin"];
    attach.bounds = CGRectMake(0, 0, 15, 15);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    
    
    [string appendAttributedString:attachString];
    
    [string appendAttributedString:[[NSAttributedString alloc] initWithString:@" 云天团个人微信号yuntiantuan0371（点击复制）有任何问题欢迎随时联系，朋友圈常常会有福利哦~"]];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(10, 15)];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-Bold" size:14.f] range:NSMakeRange(10, 15)];
    self.textVView.attributedText = string;
    
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector()];
    
    /**
     iOS 6之前：CoreText,纯C语言,极其蛋疼
     iOS 6开始：NSAttributedString,简单易用
     iOS 7开始：TextKit,功能强大,简单易用
     */
    
    NSString * key = @"key";
    
    NSString * keyStr = [self enCode:@"lufeichengNO1" Key:key];
    NSLog(@"keyStr=%@",keyStr);
    
    
    NSString * deStr = [self deCode:keyStr Key:key];
    NSLog(@"deStr:%@",deStr);
    
}

- (NSString *)enCode:(NSString *)str Key:(NSString *)key
{
    NSMutableArray * strArr = [NSMutableArray new];
    
    str = [CommonFunc base64EncodeString:str];
    
    for (int i = 0; i < str.length; i ++) {
        
        unichar c = [str characterAtIndex:i];
        [strArr addObject:[NSString stringWithFormat:@"%c",c]];
        
    }
    
    
    NSMutableArray * keyArr = [NSMutableArray new];
    for (int i = 0; i < key.length; i ++) {
        
        
        unichar c = [key characterAtIndex:i];
        [keyArr addObject:[NSString stringWithFormat:@"%c",c]];
        
        
    }
    
    
    NSInteger h;
    NSMutableString * comStr = [NSMutableString new];
    do {
        
        [comStr appendString:[strArr objectAtIndex:h]];
        [comStr appendString:[keyArr objectAtIndex:h]];
        h ++;
        
    } while (h < key.length );
    
    [comStr stringByReplacingOccurrencesOfString:@"=" withString:@"O0O0O"];
    [comStr stringByReplacingOccurrencesOfString:@"+" withString:@"o000o"];
    [comStr stringByReplacingOccurrencesOfString:@"/" withString:@"oo00o"];
    
    return comStr;
    
    
}

// DeCode
- (NSString *)deCode:(NSString *)str Key:(NSString *)key
{
    
    
    str = [str stringByReplacingOccurrencesOfString:@"oo00o" withString:@"/"];
    str = [str stringByReplacingOccurrencesOfString:@"o000o" withString:@"+"];
    str = [str stringByReplacingOccurrencesOfString:@"O0O0O" withString:@"="];
    
    
    NSMutableArray * strArr = [NSMutableArray new];
    NSMutableString * hstr = [NSMutableString new];
    
    NSLog(@"str.length:%lu",(unsigned long)str.length);
    
    
    
    for (int i = 0; i < str.length; i ++) {
        
        unichar c = [str characterAtIndex:i];
        [strArr addObject:[NSString stringWithFormat:@"%c",c]];
        
        
    }
    
    for (int i = 0; i < key.length; i ++) {
        
        
        [strArr replaceObjectAtIndex:(2 * i + 1) withObject:@""];
        
        
    }
    for (int i = 0; i < strArr.count; i ++) {
        
        
        [hstr appendString:[NSString stringWithFormat:@"%@",[strArr objectAtIndex:i]]];
        
        
    }
    
    NSLog(@"hstr:%@",hstr);
    
    
    
    return [CommonFunc base64DecodeString:hstr];
    
}



@end
