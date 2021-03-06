//
//  MAStatViewController.h
//  Mobil
//
//  Created by Soumarsi Kundu on 27/07/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAStatViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString *DataString;
    NSString *globalString,*startdateString,*enddateString,*childid;
    
    NSMutableArray *dataarray;
    UIView *backView;
    UILabel *sick;
    NSString *free_number;
    NSString *sick_Days;
    NSString *absent_dates;
    NSString *Free_Days;
    UILabel *notArrived;
    NSMutableArray *sickArray;
    UILabel *notArrivedText;
    UILabel *sickText;
    UILabel *Free;
    NSMutableArray *freearray;
    UILabel *freeText;
}


@property (nonatomic, strong) UIButton *checkBox;
@property (nonatomic, strong) UILabel *freeLabel;
@property (nonatomic, strong) UIButton *startDate;
@property (nonatomic, strong) UIButton *endDate;
@property (nonatomic, strong) UIButton *allChild;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UIView *datePickerBackView;
@property (nonatomic, strong) UIPickerView *childPicker;
@property (nonatomic, strong) UIButton *childPickerDoneButton;
@property (nonatomic, strong) UIButton *childPickerCancelButton;
@property (nonatomic, strong) NSMutableArray *childArray;
@property (strong, nonatomic) UIDatePicker *date_picker;
@property (strong,readwrite) NSMutableArray *globalArray;
@end
