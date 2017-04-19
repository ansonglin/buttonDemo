//
//  ViewController.m
//  buttonDemo
//
//  Created by asl on 2017/4/19.
//  Copyright © 2017年 Invisionhealth Digital Inc. All rights reserved.
//

#import "ViewController.h"

#define CurrentHeight ([UIScreen mainScreen].bounds.size.height)
#define CurrentWidth ([UIScreen mainScreen].bounds.size.width)
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *buttonTitleArray = @[@"墨镜小D",@"墨镜3",@"墨镜3Plus A",@"墨镜4",@"VR box",@"Moke",@"乐凡", @"千幻墨镜",@"墨镜3 Plus 纪念版", @"墨镜小D",@"墨镜3",@"墨镜3Plus A",@"墨镜4",@"VR box",@"Moke",@"乐凡", @"千幻墨镜", @"墨镜4",@"VR box",@"Moke",@"乐凡", @"千幻墨镜",@"墨镜3 Plus 纪念版", @"墨镜小D",@"墨镜3",@"墨镜3Plus A"];
    
    float button_X = 15;
    float button_Y = 100;
    for(int i = 0; i < buttonTitleArray.count; i++){
        // 宽度自适应
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGRect frame_W = [buttonTitleArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
        if (button_X + frame_W.size.width > CurrentWidth - 15) {
            button_X = 15;
            button_Y += 40; // 按钮的Y值为:按钮的Y值 + 按钮的高度 + 10
        }
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(button_X, button_Y, frame_W.size.width + 20, 30)];
        [button setTitle:buttonTitleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.layer.cornerRadius = 8;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 1;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        // CGRectGetMaxX:返回按钮右边缘的坐标
        button_X = CGRectGetMaxX(button.frame) + 10; //按钮的X值为:按钮的X值 + 按钮的宽度 + 10
    }
}
- (void)buttonClick:(UIButton *)sender
{
    sender.backgroundColor = [UIColor redColor];
    sender.backgroundColor = UIColorRGBA(49, 148, 183, 1);
    sender.titleLabel.textColor = UIColorRGBA(49, 148, 183, 1);
    NSLog(@"%@", sender.titleLabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
