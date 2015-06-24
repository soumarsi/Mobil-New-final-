//
//  MANotesViewController.h
//  Mobil
//
//  Created by Soumarsi Kundu on 19/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MANotesViewController : UIViewController
{
    UIButton *SelectChid_Button,*SelectChildAll_Button;
    UIButton *CheckButton;
    BOOL chk;
    NSString *countPpl;
    NSMutableArray *Arrive_LIst;
    BOOL Addnotes;
    UIView *backView;
    UIButton *AddNotesButton;
    UIButton *SubmitButton;
    UIAlertView *DeleteAlert;
    UIButton *EditSubmitButton;
    NSMutableArray *childarray;
}

@end
