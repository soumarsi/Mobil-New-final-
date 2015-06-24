//
//  MAListingBirthdayViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 21/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAListingBirthdayViewController : UIViewController<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    
    
    UIView *mainView;
    UIView *topView;
    NSUserDefaults * prefs;
    UIButton *leftmenuBt;
    
    NSMutableArray *data_retrived;
    UITableViewCell *cell;
    UITableView *FindUser;
    UIView *leftview;
    
    UISearchBar *UserName;
    NSArray *searchResults;
    NSMutableArray *copyArray;
    NSString *serchUser;
}
@property (nonatomic) NSString *pageId;


@end
