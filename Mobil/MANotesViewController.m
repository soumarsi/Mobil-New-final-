//
//  MANotesViewController.m
//  Mobil
//
//  Created by Soumarsi Kundu on 19/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import "MANotesViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "RTSpinKitView.h"
#import "MARegistrationViewController.h"
@interface MANotesViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    UIView *mainView,*leftview;
    UIButton *leftmenuBt;
    UILabel *totlCountMem;
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
    NSMutableArray *data_retrived;
    NSOperationQueue *downloadQueue;
    UITableView *FindUser,*ChildTable;
    UITableViewCell *cell;
    UIView *Blackview,*WhiteView,*SelectChildView,*NotesView;
    UILabel *AddNewLabel;
    NSString *check;
    UIView *EditBlackView,*EditWhiteView;
    UILabel *EditAddnewLabel;
    UITextView *EditCoemtText,*CoemtText;
    NSMutableArray *countIndx;
}

@end

@implementation MANotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Addnotes = NO;
    
    countIndx = [[NSMutableArray alloc] init];
    mainView =[[UIView alloc]initWithFrame:CGRectMake(226, 0, 798,1536/2)];
    mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgkomin.png"]];
    [self.view addSubview:mainView];
    
    
    leftview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 226, 1536/2)];
    leftview.backgroundColor = [[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1.0f]colorWithAlphaComponent:0.9f];
    [self.view addSubview:leftview];
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake(40,110, 120.0f, 49/2)];
    [logout setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [logout setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [logout.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [logout setImage:[UIImage imageNamed:@"logoutk"] forState:UIControlStateNormal];
    [logout setImage:[UIImage imageNamed:@"logoutk"] forState:UIControlStateHighlighted];
    [logout setImage:[UIImage imageNamed:@"logoutk"] forState:UIControlStateSelected];
    //[logout setBackgroundColor:[UIColor redColor]];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:logout];
    
    UIButton *logout1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 95, 200, 50)];
    [logout1 setBackgroundColor:[UIColor clearColor]];
    [logout1 addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:logout1];
    
    leftmenuBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftmenuBt setFrame:CGRectMake(40, 170, 120.0f, 49/2)];
    [leftmenuBt.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateNormal];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateHighlighted];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateSelected];
    //[leftmenuBt setBackgroundColor:[UIColor yellowColor]];
    [leftmenuBt addTarget:self action:@selector(backOut2) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:leftmenuBt];
    
    UIButton *leftbutton1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 155, 200, 50)];
    [leftbutton1 setBackgroundColor:[UIColor clearColor]];
    [leftbutton1 addTarget:self action:@selector(backOut2) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:leftbutton1];
    
    UIButton *heim  = [UIButton buttonWithType:UIButtonTypeCustom];
    [heim setFrame:CGRectMake(35, 230, 120.0f, 49/2)];
    [heim setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [heim setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [heim.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [heim setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [heim setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [heim setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [heim setImage:[UIImage imageNamed:@"homeK"] forState:UIControlStateNormal];
    [heim setImage:[UIImage imageNamed:@"homeK"] forState:UIControlStateHighlighted];
    [heim setImage:[UIImage imageNamed:@"homeK"] forState:UIControlStateSelected];
    //  [heim setBackgroundColor:[UIColor blueColor]];
    [heim addTarget:self action:@selector(backOut) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:heim];
    
    
    UIButton *heim1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 215, 200, 50)];
    [heim1 setBackgroundColor:[UIColor clearColor]];
    [heim1 addTarget:self action:@selector(backOut) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:heim1];
    UIButton *registration  = [UIButton buttonWithType:UIButtonTypeCustom];
    [registration setFrame:CGRectMake(66, 210, 120.0f, 49/2)];
    [registration setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [registration setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [registration.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [registration setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [registration setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [registration setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [registration setImage:[UIImage imageNamed:@"registrationblue"] forState:UIControlStateNormal];
    [registration setImage:[UIImage imageNamed:@"registrationblue"] forState:UIControlStateHighlighted];
    [registration setImage:[UIImage imageNamed:@"registrationblue"] forState:UIControlStateSelected];
    [registration setTitle:@"Registration" forState:UIControlStateNormal];
    [registration addTarget:self action:@selector(Registration) forControlEvents:UIControlEventTouchUpInside];
   // [leftview addSubview:registration];
    
    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    totlCountMem = [[UILabel alloc] initWithFrame:CGRectMake(180, 80, 300, 44)];
    totlCountMem.backgroundColor = [UIColor clearColor];
    totlCountMem.textColor = [UIColor whiteColor];
    totlCountMem.text = @"";
    totlCountMem.font = [UIFont fontWithName:GLOBALTEXTFONT size:25];
    totlCountMem.textAlignment = NSTextAlignmentLeft;
    totlCountMem.hidden=YES;
    [mainView addSubview:totlCountMem];
    
    
    AddNotesButton = [[UIButton alloc]initWithFrame:CGRectMake(630.0f+226.0F, 100.0f, 115.0f, 30)];
    [AddNotesButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [AddNotesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AddNotesButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    AddNotesButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddNotesButton addTarget:self action:@selector(AddnotesButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:AddNotesButton];
    
    
    /////Edit Notes///////
    
    
    
    EditBlackView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [EditBlackView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:EditBlackView];
    [EditBlackView setHidden:YES];
    
    EditWhiteView = [[UIView alloc]init];
    [EditWhiteView setBackgroundColor:[UIColor whiteColor]];
    EditWhiteView.layer.cornerRadius = 3.0f;
    [self.view addSubview:EditWhiteView];
    [EditWhiteView setHidden:YES];
    
    
    EditAddnewLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 15.0f, 200.0f, 35.0f)];
    [EditAddnewLabel setBackgroundColor:[UIColor clearColor]];
    [EditAddnewLabel setTextAlignment:NSTextAlignmentLeft];
    [EditAddnewLabel setTextColor:[UIColor blackColor]];
    [EditAddnewLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:25]];
    [EditWhiteView addSubview:EditAddnewLabel];
    
    UIView *Editlineview = [[UIView alloc]initWithFrame:CGRectMake(35.0f, 65.0f, 420.0f, 1.0f)];
    [Editlineview setBackgroundColor:[UIColor lightGrayColor]];
    [EditWhiteView addSubview:Editlineview];
    
    UILabel *EditNewsLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 70.0f, 150.0f, 35.0f)];
    [EditNewsLabel setBackgroundColor:[UIColor clearColor]];
    [EditNewsLabel setTextAlignment:NSTextAlignmentLeft];
    [EditNewsLabel setTextColor:[UIColor lightGrayColor]];
    [EditNewsLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:17]];
    [EditWhiteView addSubview:EditNewsLabel];
    
    
    EditCoemtText = [[UITextView alloc]initWithFrame:CGRectMake(35,113,420,153)];
    EditCoemtText.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    EditCoemtText.backgroundColor = [UIColor clearColor];
    EditCoemtText.textColor = [UIColor grayColor];
    EditCoemtText.scrollEnabled = YES;
    EditCoemtText.pagingEnabled = YES;
    EditCoemtText.editable = YES;
    EditCoemtText.delegate = self;
    EditCoemtText.tag = 1;
    EditCoemtText.layer.borderWidth = 1.0f;
    EditCoemtText.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    EditCoemtText.textAlignment = NSTextAlignmentLeft;
    EditCoemtText.layer.cornerRadius = 3.0f;
    [EditCoemtText setAutocorrectionType:UITextAutocorrectionTypeNo];
    [EditWhiteView addSubview:EditCoemtText];
    
    UIButton *EditCrossButton = [[UIButton alloc]initWithFrame:CGRectMake(460.0f, 7.5f, 28, 28)];
    [EditCrossButton setBackgroundImage:[UIImage imageNamed:@"NewsCross"] forState:UIControlStateNormal];
    [EditCrossButton addTarget:self action:@selector(EditCross) forControlEvents:UIControlEventTouchUpInside];
    [EditWhiteView addSubview:EditCrossButton];
    
    
    UIButton *EditCloseButton = [[UIButton alloc]initWithFrame:CGRectMake(277.0f, 280.0f, 84.0f, 32)];
    [EditCloseButton setBackgroundColor:[UIColor colorWithRed:(97.0f/255.0f) green:(97.0f/255.0f) blue:(97.0f/255.0f) alpha:1.0f]];
    [EditCloseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    EditCloseButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    EditCloseButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [EditCloseButton addTarget:self action:@selector(EditCross) forControlEvents:UIControlEventTouchUpInside];
    [EditWhiteView addSubview:EditCloseButton];
    
    EditSubmitButton = [[UIButton alloc]initWithFrame:CGRectMake(370.0f, 280.0f, 84.0f, 32)];
    [EditSubmitButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [EditSubmitButton setTitle:@"Ok" forState:UIControlStateNormal];
    [EditSubmitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    EditSubmitButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    EditSubmitButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [EditSubmitButton addTarget:self action:@selector(EditSubmitButton:) forControlEvents:UIControlEventTouchUpInside];
    [EditWhiteView addSubview:EditSubmitButton];
    
    //////---------------------------///////////
    
    
    
    
    /////Add Notes///////

    Blackview = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [Blackview setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:Blackview];
    [Blackview setHidden:YES];
    
    WhiteView = [[UIView alloc]init];
    [WhiteView setBackgroundColor:[UIColor whiteColor]];
    WhiteView.layer.cornerRadius = 3.0f;
    [self.view addSubview:WhiteView];
    [WhiteView setHidden:YES];
    
    
    AddNewLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 15.0f, 150.0f, 35.0f)];
    [AddNewLabel setBackgroundColor:[UIColor clearColor]];
    [AddNewLabel setTextAlignment:NSTextAlignmentLeft];
    [AddNewLabel setTextColor:[UIColor blackColor]];
    [AddNewLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:25]];
    [WhiteView addSubview:AddNewLabel];
    
    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(35.0f, 65.0f, 420.0f, 1.0f)];
    [lineview setBackgroundColor:[UIColor lightGrayColor]];
    [WhiteView addSubview:lineview];
    
    UIButton *CrossButton = [[UIButton alloc]initWithFrame:CGRectMake(460.0f, 7.5f, 28, 28)];
    [CrossButton setBackgroundImage:[UIImage imageNamed:@"NewsCross"] forState:UIControlStateNormal];
    [CrossButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:CrossButton];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        childarray = [[NSMutableArray alloc]initWithObjects:[NSString SelectChildF],[NSString SelectAllChildF], nil];
    }
    
    else
    {
        childarray = [[NSMutableArray alloc]initWithObjects:[NSString SelectChildD],[NSString SelectAllChildD], nil];
    }
    SelectChid_Button = [[UIButton alloc]initWithFrame:CGRectMake(36, 80, 15, 15)];
    [SelectChid_Button setBackgroundImage:[UIImage imageNamed:@"radiobutton"] forState:UIControlStateNormal];
    [SelectChid_Button setBackgroundImage:[UIImage imageNamed:@"radiobuttonselected"] forState:UIControlStateHighlighted];
    [SelectChid_Button setBackgroundImage:[UIImage imageNamed:@"radiobuttonselected"] forState:UIControlStateSelected];
    SelectChid_Button.tag = 1;
    [SelectChid_Button addTarget:self action:@selector(SelectChild:) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:SelectChid_Button];
    
    SelectChildAll_Button = [[UIButton alloc]initWithFrame:CGRectMake(146, 80, 15, 15)];
    [SelectChildAll_Button setBackgroundImage:[UIImage imageNamed:@"radiobutton"] forState:UIControlStateNormal];
    [SelectChildAll_Button setBackgroundImage:[UIImage imageNamed:@"radiobuttonselected"] forState:UIControlStateHighlighted];
    [SelectChildAll_Button setBackgroundImage:[UIImage imageNamed:@"radiobuttonselected"] forState:UIControlStateSelected];
    [SelectChildAll_Button addTarget:self action:@selector(SelectallChild:) forControlEvents:UIControlEventTouchUpInside];
    SelectChid_Button.tag = 2;
    [WhiteView addSubview:SelectChildAll_Button];
    int l = 57;
    for (int k = 0; k< 2; k++)
    {
        UILabel *SlectChild_label = [[UILabel alloc]initWithFrame:CGRectMake(l, 73.0f, 150.0f, 30.0f)];
        [SlectChild_label setBackgroundColor:[UIColor clearColor]];
        [SlectChild_label setTextAlignment:NSTextAlignmentLeft];
        [SlectChild_label setTextColor:[UIColor lightGrayColor]];
        [SlectChild_label setText:[NSString stringWithFormat:@"%@",[childarray objectAtIndex:k]]];
        [SlectChild_label setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:14]];
        [WhiteView addSubview:SlectChild_label];

        l = l+ 110;
    }
    
    SelectChildView = [[UIView alloc]initWithFrame:CGRectMake(0, 115, 500, 180)];
    [SelectChildView setBackgroundColor:[UIColor clearColor]];
    [WhiteView addSubview:SelectChildView];
    
    
    UILabel *SlectChildren_label = [[UILabel alloc]initWithFrame:CGRectMake(35, 0.0f, 150.0f, 30.0f)];
    [SlectChildren_label setBackgroundColor:[UIColor clearColor]];
    [SlectChildren_label setTextAlignment:NSTextAlignmentLeft];
    [SlectChildren_label setTextColor:[UIColor lightGrayColor]];
    [SlectChildren_label setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:18]];
    [SelectChildView addSubview:SlectChildren_label];
    
    ChildTable=[[UITableView alloc]initWithFrame:CGRectMake(30,40, 200,110) style:UITableViewStylePlain];
    ChildTable.delegate=self;
    ChildTable.dataSource=self;
    ChildTable.backgroundColor = [UIColor clearColor];
    ChildTable.tag=1;
    [ChildTable setShowsHorizontalScrollIndicator:NO];
    [ChildTable setShowsVerticalScrollIndicator:NO];
    ChildTable.separatorColor = [UIColor clearColor];
    [SelectChildView addSubview:ChildTable];
    
    
    UIView *lineview1 = [[UIView alloc]initWithFrame:CGRectMake(35.0f,179.0f, 420.0f, 1.0f)];
    [lineview1 setBackgroundColor:[UIColor lightGrayColor]];
    [SelectChildView addSubview:lineview1];
    
    NotesView = [[UIView alloc]initWithFrame:CGRectMake(0, 295, 500, 305)];
    [NotesView setBackgroundColor:[UIColor clearColor]];
    [WhiteView addSubview:NotesView];
    
    UILabel *NewsLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 8.0f, 150.0f, 35.0f)];
    [NewsLabel setBackgroundColor:[UIColor clearColor]];
    [NewsLabel setTextAlignment:NSTextAlignmentLeft];
    [NewsLabel setTextColor:[UIColor lightGrayColor]];
    [NewsLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:17]];
    [NotesView addSubview:NewsLabel];
    
    CoemtText = [[UITextView alloc]initWithFrame:CGRectMake(35,52,420,153)];
    CoemtText.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    CoemtText.backgroundColor = [UIColor clearColor];
    CoemtText.textColor = [UIColor grayColor];
    CoemtText.scrollEnabled = YES;
    CoemtText.pagingEnabled = YES;
    CoemtText.editable = YES;
    CoemtText.delegate = self;
    CoemtText.tag = 2;
    CoemtText.layer.borderWidth = 1.0f;
    CoemtText.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    CoemtText.textAlignment = NSTextAlignmentLeft;
    CoemtText.layer.cornerRadius = 3.0f;
    [CoemtText setAutocorrectionType:UITextAutocorrectionTypeNo];
    [NotesView addSubview:CoemtText];
    
    UIButton *CloseButton = [[UIButton alloc]initWithFrame:CGRectMake(277.0f, 220.0f, 84.0f, 32)];
    [CloseButton setBackgroundColor:[UIColor colorWithRed:(97.0f/255.0f) green:(97.0f/255.0f) blue:(97.0f/255.0f) alpha:1.0f]];
    [CloseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CloseButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    CloseButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [CloseButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [NotesView addSubview:CloseButton];
    
    SubmitButton = [[UIButton alloc]initWithFrame:CGRectMake(370.0f, 220.0f, 84.0f, 32)];
    [SubmitButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [SubmitButton setTitle:@"Ok" forState:UIControlStateNormal];
    [SubmitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SubmitButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    SubmitButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [SubmitButton addTarget:self action:@selector(SubmitButton:) forControlEvents:UIControlEventTouchUpInside];
    [NotesView addSubview:SubmitButton];
    
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
        pageTitle.text = [NSString NotesF];
        [AddNotesButton setTitle:[NSString AddNotesF] forState:UIControlStateNormal];
        [EditAddnewLabel setText:[NSString EditNotesF]];
        [EditNewsLabel setText:[NSString stringWithFormat:@"%@:",[NSString NotesF]]];
        [EditCloseButton setTitle:[NSString CancelF] forState:UIControlStateNormal];
        [SlectChildren_label setText:[NSString SelectChildF]];
        [NewsLabel setText:[NSString stringWithFormat:@"%@:",[NSString NotesF]]];
        [CloseButton setTitle:[NSString CancelF] forState:UIControlStateNormal];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString NotesD];
        [AddNotesButton setTitle:[NSString AddNotesD] forState:UIControlStateNormal];
        [EditAddnewLabel setText:[NSString EditNotesD]];
        [EditNewsLabel setText:[NSString stringWithFormat:@"%@:",[NSString NotesD]]];
        [EditCloseButton setTitle:[NSString CancelD] forState:UIControlStateNormal];
        [SlectChildren_label setText:[NSString SelectChildD]];
        [NewsLabel setText:[NSString stringWithFormat:@"%@:",[NSString NotesD]]];
        [CloseButton setTitle:[NSString CancelD] forState:UIControlStateNormal];

        
    }
    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    data_retrived = [[NSMutableArray alloc] init];
    [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    
    downloadQueue = [[NSOperationQueue alloc]init];
    [downloadQueue addOperationWithBlock:^{
        
        NSString *urlString;
        
        urlString = [NSString stringWithFormat:@"%@note_list.php?adminid=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
        NSLog(@" %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSError* error = nil;
        NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
        
        for(NSDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        NSLog(@"==data..%@",data_retrived);
        
        totlCountMem.hidden=NO;
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            if([data_retrived count] > 0){
                [self removePulseLoader];
                
                [backView removeFromSuperview];
                FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,600 ) style:UITableViewStylePlain];
                FindUser.delegate=self;
                FindUser.dataSource=self;
                FindUser.backgroundColor = [UIColor clearColor];
                FindUser.tag=2;
                [FindUser setShowsHorizontalScrollIndicator:NO];
                [FindUser setShowsVerticalScrollIndicator:NO];
                //[FindUser setSeparatorStyle:UITableViewCellSeparatorStyleNone];
                FindUser.separatorColor = [UIColor clearColor];
                
                [mainView addSubview:FindUser];
                [FindUser reloadData];
                downloadQueue = nil;
                
            }else{
                [self removePulseLoader];
                
                backView = [[UIView alloc] initWithFrame:CGRectMake(30, 160, 798-60, 108)];
                backView.backgroundColor = [UIColor whiteColor];
                [mainView addSubview:backView];
                
                
                UILabel *nodata = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 798-10, 108)];
                nodata.backgroundColor = [UIColor clearColor];
                nodata.textColor =[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
                nodata.font = [UIFont fontWithName:GLOBALTEXTFONT size:32];
                nodata.textAlignment = NSTextAlignmentLeft;
                [backView addSubview:nodata];
                downloadQueue = nil;
                if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
                {
                    nodata.text = [NSString NodataFoundF];
                }
                else
                {
                    nodata.text = [NSString NodataFoundD];
                }
            }
        }];
        
    }];
    Arrive_LIst = [[NSMutableArray alloc]init];
    
    NSString *urlString = [NSString stringWithFormat:@"%@all_childlist.php?room_id=%@&SubDomainId=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    NSLog(@"url----> %@", urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSError* error = nil;
    NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    Arrive_LIst = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        return 30;
    }
    else
    {
    UIFont *font1 = [UIFont fontWithName:GLOBALTEXTFONT size:16];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: font1 forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"notes"] attributes: arialDict];
    
    CGRect rect;
    
    rect =[aAttrString1 boundingRectWithSize:CGSizeMake(715, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    return rect.size.height + 120;
    }
    return  false;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView.tag == 1)
    {
        return [Arrive_LIst count];
    }
    else
    {
    return [data_retrived count];
    }
    return false;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //108
    
    if (tableView.tag == 1)
    {
        CheckButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 7, 15, 15)];
        [CheckButton setBackgroundImage:[UIImage imageNamed:@"CheckBoximage"] forState:UIControlStateNormal];
        CheckButton.tag = [[[Arrive_LIst objectAtIndex:indexPath.row]objectForKey:@"id"] integerValue];
        [CheckButton setBackgroundImage:[UIImage imageNamed:@"CheckBoximageselected"] forState:UIControlStateHighlighted];
        [CheckButton setBackgroundImage:[UIImage imageNamed:@"CheckBoximageselected"] forState:UIControlStateSelected];
        [CheckButton addTarget:self action:@selector(CheckButton:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:CheckButton];
        
        UILabel *Posted_on = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 250, 30)];
        [Posted_on setBackgroundColor:[UIColor clearColor]];
        [Posted_on setText:[NSString stringWithFormat:@"%@",[[Arrive_LIst objectAtIndex:indexPath.row]objectForKey:@"name"]]];
        [Posted_on setTextAlignment:NSTextAlignmentLeft];
        [Posted_on setTextColor:[UIColor colorWithRed:(71.0f/255.0f) green:(71.0f/255.0f) blue:(71.0f/255.0f) alpha:1.0f]];
        [Posted_on setFont:[UIFont fontWithName:GLOBALTEXTFONT size:18]];
        [cell addSubview:Posted_on];
        
    }
    else
    {
    UIFont *font1 = [UIFont fontWithName:GLOBALTEXTFONT size:16];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: font1 forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"notes"] attributes: arialDict];
    CGRect rect;
    rect =[aAttrString1 boundingRectWithSize:CGSizeMake(715, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    UIView *backViewCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 715, rect.size.height+86)];
    backViewCell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Newscellimage"]];
    [cell addSubview:backViewCell];
    
    UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20.0f, 5.0f, 600, 35)];
    [NameLabel setBackgroundColor:[UIColor clearColor]];
    [NameLabel setTextAlignment:NSTextAlignmentLeft];
    [NameLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [NameLabel setText:[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"Cname"]]];
    [NameLabel setTextColor:[UIColor colorWithRed:(71.0f/255.0f) green:(71.0f/255.0f) blue:(71.0f/255.0f) alpha:1.0f]];
    NameLabel.clipsToBounds = YES;
    [cell addSubview:NameLabel];
    
    UILabel *descLabl = [[UILabel alloc]init];
    [descLabl setBackgroundColor:[UIColor clearColor]];
    descLabl.numberOfLines = 0;
    [descLabl setTextAlignment:NSTextAlignmentLeft];
    [descLabl setTextColor:[UIColor colorWithRed:(135.0f/255.0f) green:(135.0f/255.0f) blue:(135.0f/255.0f) alpha:1.0f]];
    descLabl.clipsToBounds = YES;
    [cell addSubview:descLabl];
    
    [backViewCell addSubview:descLabl];
    descLabl.attributedText = aAttrString1;
    
    UILabel *Posted_on = [[UILabel alloc]init];
    [Posted_on setBackgroundColor:[UIColor clearColor]];
    [Posted_on setText:[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"posted_on"]]];
    [Posted_on setTextAlignment:NSTextAlignmentLeft];
    [Posted_on setTextColor:[UIColor colorWithRed:(60.0f/255.0f) green:(154.0f/255.0f) blue:(189.0f/255.0f) alpha:1.0f]];
    [Posted_on setFont:[UIFont fontWithName:GLOBALTEXTFONT size:18]];
    [backViewCell addSubview:Posted_on];
    
    
    UIImageView *EditImage = [[UIImageView alloc]initWithFrame:CGRectMake(655, 16.5f, 30, 30)];
    [EditImage setImage:[UIImage imageNamed:@"newsEditbutton"]];
    [cell addSubview:EditImage];
    
    UIButton *EditButton = [[UIButton alloc]initWithFrame:CGRectMake(640.0f, 0, 75, 48)];
    [EditButton setBackgroundColor:[UIColor clearColor]];
    EditButton.tag = indexPath.row;
    [EditButton addTarget:self action:@selector(EditButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:EditButton];
    
    UIImageView *DeleteImage = [[UIImageView alloc]initWithFrame:CGRectMake(655, 56.5f, 30, 30)];
    [DeleteImage setImage:[UIImage imageNamed:@"NewsDeletebutton"]];
    [cell addSubview:DeleteImage];
    
    UIButton *DeleteButton = [[UIButton alloc]initWithFrame:CGRectMake(640.0f, 56.5f, 75, 46)];
    [DeleteButton setBackgroundColor:[UIColor clearColor]];
    DeleteButton.tag = indexPath.row;
    [DeleteButton addTarget:self action:@selector(DeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:DeleteButton];
    
    descLabl.frame = CGRectMake(20, 40, 600, rect.size.height+40);
    Posted_on.frame = CGRectMake(475, 5, 600, 35);
    }
    return cell;
}

-(void)backOut2{
    downloadQueue = nil;
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
    downloadQueue = nil;
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    //    ViewModel.pageId=pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}
-(void)logout{
    downloadQueue = nil;
    MALoginViewController *ViewModel = [[MALoginViewController alloc] init];
    [[NSUserDefaults standardUserDefaults]setObject:@"no" forKey:@"rememberlogin"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [prefs dictionaryRepresentation];
    for (id key in dict) {
        
        [prefs removeObjectForKey:key];
    }
    [self.navigationController pushViewController:ViewModel animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)callPulseLoaderView:(CGRect)frame view:(UIView *)parentView {
    
    pulseLoaderView = [[UIView alloc] init];
    pulseLoaderView.frame = frame;
    pulseLoaderView.backgroundColor = [UIColor clearColor];
    pulseLoaderView.userInteractionEnabled = NO;
    [parentView addSubview:pulseLoaderView];
}

-(void)removePulseLoader {
    
    PulseSpinner.hidden = YES;
    [PulseSpinner removeFromSuperview];
    [spinnview removeFromSuperview];
    pulseLoaderView = nil;
    pulseLoaderView.hidden = YES;
    [pulseLoaderView removeFromSuperview];
}
-(void)insertSpinnerOfStyle:(RTSpinKitViewStyle)style backgroundColor:(UIColor*)backgroundColor label:(NSString *)labelString
{
    spinnview = [[UIView alloc]init];
    [spinnview setFrame:CGRectMake(00, 100, 750, 650)];
    // [spinnview setBackgroundColor:[UIColor redColor]];
    [mainView addSubview:spinnview];
    
    CGRect screenBounds = [spinnview bounds];
    CGFloat screenWidth = CGRectGetWidth(screenBounds);
    
    PulseSpinner = [[RTSpinKitView alloc] initWithStyle:style color:[UIColor whiteColor]];
    PulseSpinner.center = CGPointMake(CGRectGetMidX(screenBounds), CGRectGetMidY(screenBounds));
    [PulseSpinner startAnimating];
    
    UIView *panel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];
    panel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Profilebg"]];
    [panel addSubview:PulseSpinner];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50.0, screenWidth, 30.0)];
    //    label.text = [NSString stringWithFormat:@"Loading, Please Wait..."];
    label.font = [UIFont systemFontOfSize:20.0];
    label.numberOfLines = 3;
    label.textColor = [UIColor whiteColor];
    
    if ([label respondsToSelector:@selector(tintColor)]) {
        label.textAlignment = NSTextAlignmentCenter;
    } else {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        label.textAlignment = UITextAlignmentCenter;
#pragma GCC diagnostic pop
        label.backgroundColor = [UIColor clearColor];
    }
    
    [panel addSubview:label];
    
    [spinnview addSubview:panel];
    
    //    self.numberOfSpinners += 1;
}

-(void)AddnotesButton:(UIButton *)sender
{

   check  =@"add";
    SelectChid_Button.selected = YES;
        [Blackview setHidden:NO];
        [WhiteView setHidden:NO];
        //CoemtText.text = @"";
        Blackview.alpha = 0.0f;

        WhiteView.alpha = 0.0f;
        WhiteView.frame = CGRectMake(360, -50, 500, 600) ;
        [UIView animateWithDuration:0.8 animations:^{
            Blackview.alpha = 0.8f;
            WhiteView.alpha = 1.0f;
            WhiteView.frame = CGRectMake(360, 110, 500, 600) ;
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
            {
                        [AddNewLabel setText:[NSString AddNotesF]];
            }
            else
            {
                     [AddNewLabel setText:[NSString AddNotesD]];
            }
            
        } completion:^(BOOL finished) {
            
        }];
        
 
}

-(void)Cross
{
    [CoemtText resignFirstResponder];
    
    Blackview.alpha = 0.8f;
    WhiteView.alpha = 1.0f;
    if (chk == YES)
    {
        WhiteView.frame = CGRectMake(360, 110, 500, 420) ;
        NotesView.frame = CGRectMake(0, 115, 500, 305);
        SelectChildView.frame = CGRectMake(0, 115, 500, 0);
    }
    else
    {
    WhiteView.frame = CGRectMake(360, 110, 500, 600) ;
    }
    [UIView animateWithDuration:0.8 animations:^{
        WhiteView.alpha = 0.0f;
        WhiteView.alpha = 0.0f;
        if (chk == YES)
        {
            WhiteView.frame = CGRectMake(360, -50, 500, 420) ;
            NotesView.frame = CGRectMake(0, 115, 500, 305);
            SelectChildView.frame = CGRectMake(0, 115, 500, 0);
        }
        else
        {
        WhiteView.frame = CGRectMake(360, -50, 500, 600) ;
        }
        
    } completion:^(BOOL finished) {
        
        [Blackview setHidden:YES];
        [WhiteView setHidden:YES];
    }];
}

-(void)EditButton:(UIButton *)sender
{
    [EditBlackView setHidden:NO];
    [EditWhiteView setHidden:NO];
    EditBlackView.alpha = 0.0f;
    EditSubmitButton.tag = sender.tag;
    EditCoemtText.text = [NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"notes"]];
    EditWhiteView.alpha = 0.0f;
    EditWhiteView.frame = CGRectMake(360, -50, 500, 354) ;
    [UIView animateWithDuration:0.8 animations:^{
        EditBlackView.alpha = 0.8f;
        EditWhiteView.alpha = 1.0f;
        EditWhiteView.frame = CGRectMake(360, 160, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)DeleteButton:(UIButton *)sender
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        DeleteAlert = [[UIAlertView alloc]initWithTitle:[NSString DeleteConfirmationF] message:@"" delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nei", nil];
        DeleteAlert.tag = sender.tag;
        [DeleteAlert show];
    }
    else
    {
        DeleteAlert = [[UIAlertView alloc]initWithTitle:[NSString DeleteConfirmationD] message:@"" delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nej", nil];
        DeleteAlert.tag = sender.tag;
        [DeleteAlert show];
    }


    
  }
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView == DeleteAlert)
    {
 
    
    if(buttonIndex == 0)//OK button pressed
    {
        NSLog(@"data array-------> %@", data_retrived);
        
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            
            NSError *error;
            
            NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@deletenote.php?tableId=%@&adminid=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:alertView.tag]objectForKey:@"id"]],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:alertView.tag]objectForKey:@"admin_id"]]]]options:NSDataReadingUncached error:&error];
            

            
            NSString *string = [[NSString alloc] initWithData:DeleteData encoding:NSUTF8StringEncoding] ;
            
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if ([string isEqualToString:@"success"])
                {
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
                    
                    [FindUser beginUpdates];
                    
                    [FindUser deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                    
                    [data_retrived removeObjectAtIndex:alertView.tag];
                    
                    [FindUser endUpdates];
                    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(targetMethod:) userInfo:nil repeats:NO];
                }
                
                
            }];
            
        }];

    }
        else if(buttonIndex == 1)//Annul button pressed.
        {
            //do something
        }
    }
}
-(void)targetMethod:(NSTimer *) timer{
        
        timer =nil;
        [FindUser reloadData];
        
        [FindUser reloadRowsAtIndexPaths:0 withRowAnimation:UITableViewRowAnimationNone];
        
        totlCountMem.hidden=NO;
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
            
            if ([data_retrived count] == 0)
            {
                
                backView = [[UIView alloc] initWithFrame:CGRectMake(30, 160, 798-60, 108)];
                backView.backgroundColor = [UIColor whiteColor];
                [mainView addSubview:backView];
                
                
                UILabel *nodata = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 798-10, 108)];
                nodata.backgroundColor = [UIColor clearColor];
                nodata.textColor =[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
                nodata.font = [UIFont fontWithName:GLOBALTEXTFONT size:32];
                nodata.textAlignment = NSTextAlignmentLeft;
                [backView addSubview:nodata];
                
                if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
                {
                    nodata.text = [NSString NodataFoundF];
                }
                else
                {
                    nodata.text = [NSString NodataFoundD];
                }

                
    }
}

//textview delegate method===================

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if (textView.tag == 2)
    {
        CoemtText.textColor = [UIColor grayColor];
    }
    else
    {
    EditCoemtText.textColor = [UIColor grayColor];
    }
    return YES;
    
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    if (textView.tag == 2)
    {
        if ([CoemtText.text isEqualToString:@""]) {
            
            
        }
        else{
            
        }
    }
    else
    {
    if ([EditCoemtText.text isEqualToString:@""]) {
        
        
    }
    else{
        
    }
    }
    return YES;
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    
    if (textView.tag == 2)
    {
        if([text isEqualToString:@"\n"]) {
            
            [CoemtText resignFirstResponder];
            
            return NO;
            
        }
    }
    else
    {
    if([text isEqualToString:@"\n"]) {
        
        [EditCoemtText resignFirstResponder];
        
        return NO;
        
    }
    }
     return YES;
    
}
-(void)EditCross
{
    [EditCoemtText resignFirstResponder];
    
    EditBlackView.alpha = 0.8f;
    EditWhiteView.alpha = 1.0f;
    EditWhiteView.frame = CGRectMake(360, 160, 500, 354) ;
    [UIView animateWithDuration:0.8 animations:^{
        EditBlackView.alpha = 0.0f;
        EditWhiteView.alpha = 0.0f;
        EditWhiteView.frame = CGRectMake(360, -50, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
        [EditBlackView setHidden:YES];
        [EditWhiteView setHidden:YES];
    }];
}

-(void)EditSubmitButton:(UIButton *)sender
{
    if ([EditCoemtText.text isEqualToString:@""])
    {
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva stovna" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        }
        else
        {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    }
    else
    {

            downloadQueue = [[NSOperationQueue alloc]init];
            [downloadQueue addOperationWithBlock:^{
                
                NSError *error;
                
                NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@update_note.php?adminid=%@&notes=%@&tableId=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"admin_id"]],[EditCoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]]]]options:NSDataReadingUncached error:&error];

                
                NSString *string = [[NSString alloc] initWithData:DeleteData encoding:NSUTF8StringEncoding] ;
                
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    if ([string isEqualToString:@"success"])
                    {
                        EditBlackView.alpha = 0.8f;
                        EditWhiteView.alpha = 1.0f;
                        EditWhiteView.frame = CGRectMake(360, 160, 500, 354) ;
                        [UIView animateWithDuration:0.8 animations:^{
                            EditBlackView.alpha = 0.0f;
                            EditWhiteView.alpha = 0.0f;
                            EditWhiteView.frame = CGRectMake(360, -50, 500, 354) ;
                            
                        } completion:^(BOOL finished) {
                            
                            [EditBlackView setHidden:YES];
                            [EditWhiteView setHidden:YES];
                        }];
                        [self updatedata];
                    }
                    
                    
            }];
                
        }];
    }
}
-(void)updatedata
{
    
    [Blackview setHidden:YES];
    [WhiteView setHidden:YES];
    Blackview.alpha = 0.8f;
    WhiteView.alpha = 1.0f;
    if (chk == YES)
    {
        WhiteView.frame = CGRectMake(360, 110, 500, 420) ;
        NotesView.frame = CGRectMake(0, 115, 500, 305);
        SelectChildView.frame = CGRectMake(0, 115, 500, 0);
    }
    else
    {
        WhiteView.frame = CGRectMake(360, 110, 500, 600) ;
    }
    [UIView animateWithDuration:0.8 animations:^{
        WhiteView.alpha = 0.0f;
        WhiteView.alpha = 0.0f;
        if (chk == YES)
        {
            WhiteView.frame = CGRectMake(360, -50, 500, 420) ;
            NotesView.frame = CGRectMake(0, 115, 500, 305);
            SelectChildView.frame = CGRectMake(0, 115, 500, 0);
        }
        else
        {
            WhiteView.frame = CGRectMake(360, -50, 500, 600) ;
        }
        
    } completion:^(BOOL finished) {
        
        [Blackview setHidden:YES];
        [WhiteView setHidden:YES];
    }];

    
    [EditCoemtText resignFirstResponder];
    
    [data_retrived removeAllObjects];
    
    downloadQueue = [[NSOperationQueue alloc]init];
    [downloadQueue addOperationWithBlock:^{
        
        NSString *urlString;
        
        urlString = [NSString stringWithFormat:@"%@note_list.php?adminid=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
        NSLog(@" %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSError* error = nil;
        NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
        
        for(NSDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        NSLog(@"==data..%@",data_retrived);
        
        [FindUser removeFromSuperview];
        
        totlCountMem.hidden=NO;
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            if([data_retrived count] > 0){
                //[self removePulseLoader];
                
                [backView removeFromSuperview];
                
                FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,600 ) style:UITableViewStylePlain];
                FindUser.delegate=self;
                FindUser.dataSource=self;
                FindUser.backgroundColor = [UIColor clearColor];
                FindUser.tag=2;
                [FindUser setShowsHorizontalScrollIndicator:NO];
                [FindUser setShowsVerticalScrollIndicator:NO];
                //[FindUser setSeparatorStyle:UITableViewCellSeparatorStyleNone];
                FindUser.separatorColor = [UIColor clearColor];
                
                [mainView addSubview:FindUser];
                [FindUser reloadData];
                

                //downloadQueue = nil;
                
            }else{
                //[self removePulseLoader];
                
                backView = [[UIView alloc] initWithFrame:CGRectMake(30, 160, 798-60, 108)];
                backView.backgroundColor = [UIColor whiteColor];
                [mainView addSubview:backView];
                
                
                UILabel *nodata = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 798-10, 108)];
                nodata.backgroundColor = [UIColor clearColor];
                nodata.textColor =[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
                nodata.font = [UIFont fontWithName:GLOBALTEXTFONT size:32];
                nodata.textAlignment = NSTextAlignmentLeft;
                [backView addSubview:nodata];
                
                if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
                {
                    nodata.text = [NSString NodataFoundF];
                }
                else
                {
                    nodata.text = [NSString NodataFoundD];
                }

                //downloadQueue = nil;
            }
        }];
        
    }];
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView.tag ==2)
    {
        [UIView animateWithDuration:0.6 animations:^{
            
            if (Addnotes == YES)
            {
                
            }
            else
            {
            WhiteView.frame = CGRectMake(360, -95, 500, 600) ;
            }
            
        } completion:^(BOOL finished) {
            
            
        }];

    }
    else
    {
    [UIView animateWithDuration:0.6 animations:^{
        
        EditWhiteView.frame = CGRectMake(360, 100, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
        
    }];
    }
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.tag ==2)
    {
        [UIView animateWithDuration:0.6 animations:^{
            
            if (Addnotes == YES)
            {
                
            }
            else
            {
            WhiteView.frame = CGRectMake(360, 110, 500, 600) ;
            }
            
        } completion:^(BOOL finished) {
            
            
        }];
    }
    else
    {
    
    [UIView animateWithDuration:0.6 animations:^{
        
        EditWhiteView.frame = CGRectMake(360, 160, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
        
    }];
    }
}
-(void)SelectChild:(UIButton *)sender
{
    Addnotes = NO;
    chk = NO;
    SelectChid_Button.selected = YES;
    SelectChildAll_Button.selected = NO;
    SelectChildView.hidden = YES;
    [UIView animateWithDuration:0.6 animations:^{
        
        SelectChildView.frame = CGRectMake(0, 115, 500, 180);
        WhiteView.frame = CGRectMake(360, 110, 500, 600) ;
        NotesView.frame = CGRectMake(0, 295, 500, 305);
        
    } completion:^(BOOL finished) {
        
        SelectChildView.hidden = NO;
    }];
}
-(void)SelectallChild:(UIButton *)sender
{
    
    Addnotes = YES;
    chk = YES;
    SelectChid_Button.selected = NO;
    SelectChildAll_Button.selected = YES;
    SelectChildView.hidden = YES;
    
    [UIView animateWithDuration:0.6 animations:^{
        
        SelectChildView.frame = CGRectMake(0, 115, 500, 0);
        WhiteView.frame = CGRectMake(360, 110, 500, 420) ;
        NotesView.frame = CGRectMake(0, 115, 500, 305);
        
    } completion:^(BOOL finished) {
        
        
    }];
}

-(void)CheckButton:(UIButton *)sender
{

    NSLog(@"sender.tag...%ld",(long)sender.tag);
    
    UIButton *targetButton = (UIButton *)sender;
    
    if(![targetButton isSelected])
        [targetButton setSelected:YES];
    else
        [targetButton setSelected:NO];
    
    long index;
    BOOL gotElement = NO;
    for (NSString *selectedElement in countIndx) {
        if([selectedElement isEqualToString:[NSString stringWithFormat:@"%ld", (long)targetButton.tag]]) {
            index = [countIndx indexOfObject:[NSString stringWithFormat:@"%ld",(long)targetButton.tag]];
            gotElement = YES;
        }
    }
    
    if (!gotElement) {

        [countIndx addObject:[NSString stringWithFormat:@"%ld", (long)targetButton.tag]];
    } else {

        [countIndx removeObjectAtIndex:index];
    }
    
    
    
    NSString *cntPPL;
    countPpl=NULL;
    
    NSLog(@",,,,.....,,,,%@",countIndx);
    
    for(cntPPL in countIndx){
        
        if(countPpl.length == 0 ){
            countPpl=cntPPL;

        }
        else
        {
            countPpl = [NSString stringWithFormat:@"%@,%@",countPpl,cntPPL];
            
        }
        
    }
    
    NSLog(@"countPpl...%@",countPpl);
}

-(void)SubmitButton:(UIButton *)sender
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
    
    if (Addnotes == NO)
    {
        if ([countPpl isKindOfClass:[NSNull class]] || countPpl == (id)[NSNull null] || countPpl.length == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva vel børn" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];        }
        else if ([CoemtText.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva stovna" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else
        {

        
        NSError *error=nil;
        NSString *urlString1 = [NSString stringWithFormat:@"%@add_note.php?type=selected_child&child_id=%@&adminid=%@&user_id=%@&room_id=%@&notes=%@",APPS_DOMAIN_URL,countPpl,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],CoemtText.text];
        
        NSLog(@"===%@",urlString1);

        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];

        if ([serverOutput isEqualToString:@"success"])
        {
            [self updatedata];
        }
        }
    }
    else
    {
        if ([CoemtText.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva stovna" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
//        [Blackview removeFromSuperview];
//        [WhiteView removeFromSuperview];
        NSError *error=nil;
        NSString *urlString1 = [NSString stringWithFormat:@"%@add_note.php?type=all_child&adminid=%@&user_id=%@&room_id=%@&notes=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],CoemtText.text];
        NSLog(@"===%@",urlString1);
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        if ([serverOutput isEqualToString:@"success"])
        {
            [self updatedata];
        }
        }
    }
    }
    else
    {
        if (Addnotes == NO)
        {
            if ([countPpl isKindOfClass:[NSNull class]] || countPpl == (id)[NSNull null] || countPpl.length == 0)
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];        }
            else if ([CoemtText.text isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else
            {
                
                
                NSError *error=nil;
                NSString *urlString1 = [NSString stringWithFormat:@"%@add_note.php?type=selected_child&child_id=%@&adminid=%@&user_id=%@&room_id=%@&notes=%@",APPS_DOMAIN_URL,countPpl,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],CoemtText.text];
                
                NSLog(@"===%@",urlString1);
                
                NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
                NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
                
                if ([serverOutput isEqualToString:@"success"])
                {
                    [self updatedata];
                }
            }
        }
        else
        {
            if ([CoemtText.text isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else
            {
                //        [Blackview removeFromSuperview];
                //        [WhiteView removeFromSuperview];
                NSError *error=nil;
                NSString *urlString1 = [NSString stringWithFormat:@"%@add_note.php?type=all_child&adminid=%@&user_id=%@&room_id=%@&notes=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],CoemtText.text];
                NSLog(@"===%@",urlString1);
                NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
                NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
                if ([serverOutput isEqualToString:@"success"])
                {
                    [self updatedata];
                }
            }
        }

    }
    

}
-(void)Registration
{
    MARegistrationViewController *Registration = [[MARegistrationViewController alloc]init];
    [self.navigationController pushViewController:Registration animated:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
