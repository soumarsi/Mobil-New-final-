//
//  MAListngKominViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAListngKominViewController : UIViewController<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UITextViewDelegate,UIScrollViewDelegate,NSURLSessionDelegate>{


    UIView *mainView,*pickerBack1,*DeatilsView1;
    UIView *topView;
    NSUserDefaults * prefs;
    UIButton *leftmenuBt,*okCls1;
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
    UIButton *slettabutton,*slettanote,*startTime,*endTime,*strtTm,*endtTm;
    NSString *globalString,*startdateString,*enddateString;
    UIView *freeBlackView,*freeScrollBackView;;
    UIScrollView *freeScrollView;
    NSMutableArray *freeListArray;
    int count,divide;
    
    //-//
    
    UIButton *defaultbutton;
    UIButton *frombutton;
    UIButton *toButton;
}
@property (nonatomic) NSString *pageId;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UIView *datePickerBackView;
@property (nonatomic, strong) UIButton *childPickerDoneButton;
@property (nonatomic, strong) UIButton *childPickerCancelButton;
@property (strong, nonatomic) UIDatePicker *date_picker;
@property (strong, nonatomic) UIButton *frombutton;
@property (strong, nonatomic) UIButton *toButton;
@end
