//
//  MALoginViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MALoginViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate>{

    UIView *mainView;
    
    UITextField *UserName;
    UITextField *Password;

    NSUserDefaults * prefs;
    UIButton *checkbox;
    BOOL checkBoxSelected;
    
    UIView *boxView;
}

@end
