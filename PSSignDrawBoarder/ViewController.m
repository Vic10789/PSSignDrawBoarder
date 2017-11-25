//
//  ViewController.m
//  PSSignDrawBoarder
//
//  Created by Vic on 2017/11/25.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "ViewController.h"
#import "SignDrawViewController.h"
#import "PSDataManager.h"

@interface ViewController ()
{
    UIImageView *showImageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *psLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2-100, 30, 200, 30)];
    psLabel.textAlignment = NSTextAlignmentCenter;
    psLabel.text = @"PSSignDrawBoarder";
    psLabel.textColor = [UIColor orangeColor];
    [self.view addSubview:psLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 60, 30);
    [button setTitle:@"签名" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, WIDTH-100, 200)];
    [self.view addSubview:showImageView];
}
- (void)buttonClick {
    SignDrawViewController *vc = [[SignDrawViewController alloc] init];
    vc.backImage = ^(UIImage *image, BOOL isSuccess) {
        showImageView.image = image;
        
        // 如果项目需求要将电子签名上传服务器，那就可以在这里处理图片并上传服务器
        
    };
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
