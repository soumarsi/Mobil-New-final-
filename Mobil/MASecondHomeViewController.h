//
//  MASecondHomeViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASecondHomeViewController : UIViewController<UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate,UIScrollViewAccessibilityDelegate,UIScrollViewDelegate>{

    UIView *mainView;
    UIView *topView;
    NSUserDefaults * prefs;
    UIButton *leftmenuBt;
    UIScrollView *totalScrollView;
    UIView *pickerBack;
    UIButton *okCls;
    UIView *DeatilsView;
    UIButton *checkbox;
    UIButton *checkbox2;
    UITextView *MsgArea ;
    NSMutableArray *forchild;
    UILabel *ttPOPScrl;
    NSMutableArray *countIndx;
     NSString *countPpl;
    BOOL all;
    UIScrollView *ScondHomeScrollView;
}
@property (nonatomic) NSString *pageId;
@property(nonatomic,retain)NSString *WorkTitle;
@end
