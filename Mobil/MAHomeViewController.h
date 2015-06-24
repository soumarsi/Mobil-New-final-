//
//  MAHomeViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAHomeViewController : UIViewController<UIGestureRecognizerDelegate>{

    UIView *mainView;
    UIView *topView;
    NSUserDefaults * prefs;
    UIButton *leftmenuBt;
    
    UIView *demoView;
    UIActivityIndicatorView  *spinner;
    UILabel *LoadngLbl;
}

@end
