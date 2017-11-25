//
//  SignDrawViewController.h
//  PSSignDrawBoarder
//
//  Created by Vic on 2017/11/25.
//  Copyright © 2017年 Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignDrawViewController : UIViewController

@property (nonatomic, copy) void(^backImage)(UIImage *image, BOOL isSuccess);

@end
