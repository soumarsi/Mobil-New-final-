//
//  MAListngKominViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAListngKominViewController : UIViewController<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UITextViewDelegate>{


    UIView *mainView;
    UIView *topView;
    NSUserDefaults * prefs;
    UIButton *leftmenuBt;
    UILabel *CmntLBL;
    NSMutableArray *data_retrived;
    UITableViewCell *cell;
    UITableView *FindUser,*ChildDate;
    UIView *leftview;
    UISearchBar *UserName;
    NSArray *searchResults;
    NSMutableArray *copyArray;
    NSString *serchUser;
    UIButton *Broyt;
    UIView *pickerBack;
    UIButton *okCls;
    UIView *DeatilsView;
    UITextView *CoemtText;
    UITextView *CoemtText2;
    UILabel *totlCountMem;
    NSMutableArray *finaldata,*finaldata2;
    NSMutableArray *ChildDateList;
    UIButton *comment;
    UIButton *broytbutton;
    UIButton *slettabutton,*slettanote;
}
@property (nonatomic) NSString *pageId;
@end