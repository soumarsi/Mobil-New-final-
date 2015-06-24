//
//  MATourViewController.h
//  Dr.Margrethu
//
//  Created by Anirban Tah on 21/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MATourViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UITextInputDelegate, UIPickerViewDataSource, UIPickerViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    
    
    UIView *mainView;
    UIView *topView;
    NSUserDefaults * prefs;
    UIButton *leftmenuBt;
    
    NSMutableArray *data_retrived;
    UITableViewCell *cell;
    UITableView *FindUser;
    UIView *leftview;
    UITextField *fara;
    UIView *pickerBack;
    UIButton *fara3;
    NSString *countPpl;
    UITextField *pers2;
    int val;
    UILabel *counlblCnt;
    UITextField *pers;
    NSString *toTme;
    UIButton *checkbox_ALL;
    UIButton *checkbox;
    NSMutableArray *countIndx;
    NSMutableArray *allGVndata;
    UIView *uptablView;
    UIButton *okCls;
    NSMutableArray *nameList;
    UIView *DeatilsView;
    NSString *serverOutputnew;
    BOOL checkstatus;
    BOOL ststChk;
    NSMutableDictionary *result_new;
    NSMutableArray *selectedChlid;
    NSMutableDictionary *result2;
    NSMutableArray *gotour;
    NSMutableArray *nottour;
    NSMutableArray *smplAry;
     NSMutableArray *copyArray;
     UISearchBar *UserName;
    NSArray *searchResults;
    NSString *j;
    UIView *backViewcell;
    NSString *GOING_TIME;
    long sectiontag;
    
}
@property (nonatomic) NSString *pageId;
@property (strong, nonatomic) IBOutlet UIDatePicker *dPicker;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

@end
