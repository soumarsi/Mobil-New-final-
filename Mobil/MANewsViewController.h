//
//  MANewsViewController.h
//  Mobil
//
//  Created by Soumarsi Kundu on 19/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MANewsViewController : UIViewController
{
    UIButton *SubmitButton;
    UIAlertView *DeleteAlert;
    UIView *backView;
}
@property(nonatomic,retain)NSString *pageid;

@end
