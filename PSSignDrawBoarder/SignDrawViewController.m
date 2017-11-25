//
//  SignDrawViewController.m
//  PSSignDrawBoarder
//
//  Created by Vic on 2017/11/25.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "SignDrawViewController.h"
#import "PSDrawBoarderView.h"
#import "PSDataManager.h"

@interface SignDrawViewController ()

@property (nonatomic,strong) PSDrawBoarderView *drawBoarderView;
@end

@implementation SignDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.drawBoarderView = [[PSDrawBoarderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [self.view addSubview:self.drawBoarderView];
    
    __weak __typeof(self) weakself = self;
    self.drawBoarderView.saveImage = ^(UIImage *image) {
        weakself.backImage(image, YES);
        [weakself backClick];
    };
}
- (void)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
