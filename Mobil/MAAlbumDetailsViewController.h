//
//  MAAlbumDetailsViewController.h
//  Mobil
//
//  Created by Soumarsi Kundu on 24/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UzysGridView.h"
@class UzysGridView;
@class UzysGridViewCell;
@protocol UzysGridViewCellDelegate<NSObject>
-(void) gridViewCell:(UzysGridViewCell *)cell touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
@interface MAAlbumDetailsViewController : UIViewController<UzysGridViewDelegate,UzysGridViewDataSource>

{
    UIAlertView *DeleteAlert;
        UzysGridView *_gridView;
    UIImageView *ImageView;
}
@property(nonatomic,retain)NSMutableArray *Imagedetailsarray;
@property(nonatomic,retain)NSString *Albumname;
@property (nonatomic, assign) IBOutlet id<UzysGridViewCellDelegate> delegate;
@end
