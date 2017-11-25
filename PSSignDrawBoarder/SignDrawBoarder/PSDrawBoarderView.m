//
//  PSDrawBoarderView.m
//  PSSignDrawBoarder
//
//  Created by Vic on 2017/11/25.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import "PSDrawBoarderView.h"
#import "PSSignBoardView.h"
#import "PSDataManager.h"

@interface PSDrawBoarderView ()
{
    PSSignBoardView *myDrawer;
}

@end

@implementation PSDrawBoarderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *toolView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
        [self addSubview:toolView];
        
        NSArray *array = @[@"清          除", @"保存并返回"];
        for (NSInteger i = 0; i <array.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*WIDTH/2, 0, WIDTH/2, 50);
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100+i;
            if (i == 0) {
                button.layer.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1].CGColor;
                [button setTitleColor:[UIColor colorWithRed:240/255.0 green:70/255.0 blue:60/255.0 alpha:1] forState:UIControlStateNormal];
            } else {
                button.layer.backgroundColor = [UIColor colorWithRed:240/255.0 green:70/255.0 blue:60/255.0 alpha:1].CGColor;
                [button setTitleColor:[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1] forState:UIControlStateNormal];
            }
            [toolView addSubview:button];
        }
        myDrawer = [[PSSignBoardView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(toolView.frame)+10, WIDTH-20, HEIGHT-70)];
        myDrawer.userInteractionEnabled = YES;
        myDrawer.multipleTouchEnabled = YES;
        myDrawer.lineWidth = self.lineWidth;
        myDrawer.layer.backgroundColor = [UIColor clearColor].CGColor;
        [self addSubview:myDrawer];
    }
    return self;
}
- (void)buttonClick:(UIButton *)button {
    if (button.tag == 100) {
        [myDrawer clearScreen];
    } else if (button.tag == 101) {
        [self saveAndBackImage];
    }
}
// 按需求添加或修改此方法 （某些需求是要将电子签名上传自己服务器，就要用此方法了）
- (void)saveAndBackImage {
    if (![PSDataManager sharedManager].strokeArray.count) return; UIGraphicsBeginImageContextWithOptions(myDrawer.bounds.size, NO, 1);
    [myDrawer.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.saveImage(viewImage);
}

@end
