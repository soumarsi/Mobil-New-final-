//
//  MAListingHomeViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 20/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAListingHomeViewController : UIViewController<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate,UISearchDisplayDelegate,UITextViewDelegate>{
    
    
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
    UIButton *slettanote;
    UIButton *slettabutton;
    UIView *pickerBack;
    UIButton *okCls;
    UIView *DeatilsView;
    UITextView *CoemtText;
    UITextView *CoemtText_new;
    UITextView *CoemtText2;
    UILabel *CmntLBL;
    
    UIView *pickerBack1;
    UIButton *okCls1;
    UIView *DeatilsView1;

    UIButton *startTime;
    UIButton *endTime;
    NSString *toTme;
    NSString *toTmeEnd;
    UIButton *Broyt;
    UILabel *Text_suport;
    BOOL start;
    BOOL secndBtn;
     UILabel *totlCountMem;
    UIButton *strtTm;
    UIButton *endtTm;
}
@property (nonatomic) NSString *pageId;
@property (strong, nonatomic) IBOutlet UIDatePicker *dPicker;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;


@end
