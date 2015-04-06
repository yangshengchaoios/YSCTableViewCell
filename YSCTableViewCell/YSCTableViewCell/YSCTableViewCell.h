//
//  YSCTableViewCell.h
//  YSCKit
//
//  Created by yangshengchao on 14/11/17.
//  Copyright (c) 2014年 yangshengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Addition.h"

#define kCellIdentifier         @"cell"
#define XIB_WIDTH               640.0f
#define SCREEN_WIDTH            ([UIScreen mainScreen].bounds.size.width) //屏幕的宽度(point)
#define SCREEN_HEIGHT           ([UIScreen mainScreen].bounds.size.height)//屏幕的高度(point)
#define RGB(r, g, b)                    [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f]
/**
 *  自动布局相关代码段简写
 *
 */
#define AUTOLAYOUT_SCALE                (SCREEN_WIDTH / XIB_WIDTH)          //缩放比例 (当前屏幕的真实宽度point / xib布局的宽度point)
#define AUTOLAYOUT_LENGTH(x)            ((x) * AUTOLAYOUT_SCALE)            //计算缩放后的大小point
#define AUTOLAYOUT_LENGTH_W(x,w)        ((x) * (SCREEN_WIDTH / (w)))        //计算任意布局的真实大小point
#define AUTOLAYOUT_SIZE_WH(w,h)         CGSizeMake(AUTOLAYOUT_LENGTH(w), AUTOLAYOUT_LENGTH(h))
#define AUTOLAYOUT_SIZE(size)           CGSizeMake(AUTOLAYOUT_LENGTH(size.width), AUTOLAYOUT_LENGTH(size.height))//计算自动布局后的size
#define AUTOLAYOUT_EDGEINSETS(t,l,b,r)  UIEdgeInsetsMake(AUTOLAYOUT_LENGTH(t), AUTOLAYOUT_LENGTH(l), AUTOLAYOUT_LENGTH(b), AUTOLAYOUT_LENGTH(r))
#define AUTOLAYOUT_CGRECT(x,y,w,h)      CGRectMake(AUTOLAYOUT_LENGTH(x),AUTOLAYOUT_LENGTH(y),AUTOLAYOUT_LENGTH(w),AUTOLAYOUT_LENGTH(h))
#define AUTOLAYOUT_FONT(f)              ([UIFont systemFontOfSize:((f) * AUTOLAYOUT_SCALE)])
#define SCREEN_WIDTH_SCALE              (SCREEN_WIDTH / AUTOLAYOUT_SCALE)
#define SCREEN_HEIGHT_SCALE             (SCREEN_HEIGHT / AUTOLAYOUT_SCALE)

typedef NS_ENUM(NSInteger, YSCTableViewCellStyle) {
    YSCTableViewCellStyleTitle              = 1 << 0,        //Default
    YSCTableViewCellStyleIcon               = 1 << 1,
    YSCTableViewCellStyleArrow              = 1 << 2,
    YSCTableViewCellStyleSwitch             = 1 << 3,
    YSCTableViewCellStyleSubtitleRight      = 1 << 4,
    YSCTableViewCellStyleSubtitleBottom     = 1 << 5,
};

typedef void (^StateChanged)(BOOL state);

@interface YSCTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *iconContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconContainerWidth;    //66
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

//subtitle在左边
@property (weak, nonatomic) IBOutlet UIView *subtitleLeftContainerView;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLeftTitleLabel;           //主标题
@property (weak, nonatomic) IBOutlet UILabel *subtitleLeftLabel;                //副标题

//subtitle在下边
@property (weak, nonatomic) IBOutlet UIView *subtitleBottomContainerView;
@property (weak, nonatomic) IBOutlet UILabel *subtitleBottomTitleLabel;         //主标题
@property (weak, nonatomic) IBOutlet UILabel *subtitleBottomLabel;              //副标题

//subtitle在右边
@property (weak, nonatomic) IBOutlet UILabel *subtitleRightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UISwitch *stateSwitch;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subtitleRightTrail;    //45

@property (assign, nonatomic) YSCTableViewCellStyle style;
@property (copy, nonatomic) StateChanged stateChanged;

@end
