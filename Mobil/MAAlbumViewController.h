//
//  MAAlbumViewController.h
//  Mobil
//
//  Created by Soumarsi Kundu on 19/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCImagePickerHeader.h"

@interface MAAlbumViewController : UIViewController<ELCImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIButton *ChoosenFile;
    UILabel *ImageLabelName;
    UITextField *AlbumTextField;
    NSMutableArray *Imagearray;
    NSMutableArray *images;
    UIView *backView;
    UIButton *SubmitButton;
    UIAlertView *DeleteAlert;
    
    UIProgressView *upload_bar;
    
    NSTimer *progress_time;
    
    float progress_value,timer_set;
       int x;
    UILabel *progress_title;
    int time; 
    int disp_value;
}

@end
