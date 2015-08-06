//
//  MATourViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 21/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MATourViewController.h"
#import "MALoginViewController.h"
#import "UIImageView+WebCache.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "RTSpinKitView.h"
#import "MARegistrationViewController.h"
#define kOFFSET_FOR_KEYBOARD 290;

@interface MATourViewController ()
{
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
}
@property (readonly) NSUInteger numberOfHours;
@property (readonly) NSUInteger numberOfMinutes;
@property NSNumber *hour;
@property NSNumber *minute;
@end

@implementation MATourViewController
UILabel *label; UIDatePicker *datePicker;

@synthesize pageId,dPicker;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)changeDateInLabel:(id)sender{
    
    //Use NSDateFormatter to write out the date in a friendly format
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init]; df.dateStyle = NSDateFormatterMediumStyle;
    
    label.text = [NSString stringWithFormat:@"%@", [df stringFromDate:datePicker.date]];
    
 
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"viewdidload");
    
    _numberOfHours = 24;
    _numberOfMinutes = 60;
    checkstatus = NO;
    ststChk = NO;
	val=0;
    mainView =[[UIView alloc]initWithFrame:CGRectMake(226, 0, 798,1536/2)];
    mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgkomin.png"]];
    [self.view addSubview:mainView];
    
    j = @"0";
    
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
    [logout setTitle:@"Útrita" forState:UIControlStateNormal];
    //[logout setBackgroundColor:[UIColor redColor]];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:logout];
    
    UIButton *logout1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 95, 200, 50)];
    [logout1 setBackgroundColor:[UIColor clearColor]];
    [logout1 addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:logout1];
    
    leftmenuBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftmenuBt setFrame:CGRectMake(40, 170, 120.0f, 49/2)];
    [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [leftmenuBt.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateNormal];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateHighlighted];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateSelected];
    [leftmenuBt setTitle:@"Stovur" forState:UIControlStateNormal];
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
    [heim setTitle:@"Heim" forState:UIControlStateNormal];
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
    //[leftview addSubview:registration];
    
    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    UIView *lftVwe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe.backgroundColor = [UIColor clearColor];
    
    
    UIView *UsBackView = [[UIView alloc] initWithFrame:CGRectMake(380, 85,767/2, 71/2)];
    UsBackView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"search"]];
    [mainView addSubview:UsBackView];
    
    UserName = [[UISearchBar alloc] initWithFrame:CGRectMake(380, 85, 767/2, 71/2)];
    UserName.delegate = self;
    [UserName setSearchFieldBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [mainView addSubview:UserName];
    
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
        pageTitle.text = [NSString TourF];
        [UserName setPlaceholder:[NSString SearchF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString TourD];
        [UserName setPlaceholder:[NSString SearchD]];
    }

    [NSTimer scheduledTimerWithTimeInterval:1200 target:self selector:@selector(updateNewDate) userInfo:nil repeats:YES];
    
}
-(void)updateNewDate{
    
    NSLog(@"updateNewDate");
    
   [self viewDidAppear:YES];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBarnew {
    
    searchBarnew.showsCancelButton = NO;
    
    [searchBarnew resignFirstResponder];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    
    
    NSLog(@"Text change - %@",searchText);
    
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *st = [searchText stringByTrimmingCharactersInSet:whitespace];
    //Remove all objects first.
    [copyArray removeAllObjects];
    NSLog(@"length of text: %lu",(unsigned long)st.length);
    if([st length] != 0) {
        
        
        NSArray* results;
        NSMutableArray* filteredResults= [NSMutableArray new]; // This will store the filtered items
        // Here you should have already initialised it
        for( NSDictionary* dict in data_retrived)
        {
            NSMutableDictionary* mutableDict=[dict mutableCopy];
            NSArray* docs= dict[@"children"];
            NSPredicate* predicate= [NSPredicate predicateWithFormat: @"name CONTAINS[cd] %@",searchText];
            docs= [docs filteredArrayUsingPredicate: predicate];
            [mutableDict setObject: docs forKey: @"children"];
            [filteredResults addObject: mutableDict];
        }
        
        
//
//        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"ANY children.name CONTAINS[c] %@", searchText,searchText];;
//        
    //    searchResults = [data_retrived filteredArrayUsingPredicate:filteredResults];
        
        copyArray=[[NSMutableArray alloc] initWithArray:filteredResults];
        
        NSLog(@"copy..array..%@",filteredResults);
        
        if ([copyArray count] ==0)
        {
            
            NSLog(@"count.0");
            copyArray = [data_retrived mutableCopy];
        }

        
        NSRange range = NSMakeRange(0, [copyArray count]);
        NSIndexSet *section = [NSIndexSet indexSetWithIndexesInRange:range];
        [FindUser reloadSections:section withRowAnimation:UITableViewRowAnimationNone];
       // [FindUser reloadData];
//        [FindUser reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
      
        
        
    }
    else {
        
        [copyArray removeAllObjects];
        
        copyArray = [data_retrived mutableCopy];;
        [FindUser reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
 }

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    countIndx = [[NSMutableArray alloc] init];
    nameList= [[NSMutableArray alloc] init];
    data_retrived = [[NSMutableArray alloc] init];
    allGVndata = [[NSMutableArray alloc] init];
    copyArray = [[NSMutableArray alloc] init];
    searchResults = [[NSArray alloc] init];
    
    result_new = [[NSMutableDictionary alloc] init];
    gotour = [[NSMutableArray alloc] init];
    nottour = [[NSMutableArray alloc] init];
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
    dispatch_async(queue, ^{
        // Do some computation here.
        
        // Update UI after computation.
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
    NSString *urlStringff;
    prefs= [NSUserDefaults standardUserDefaults];
          
    urlStringff = [NSString stringWithFormat:@"%@latesttur_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
            NSLog(@"urlsrnn....%@",urlStringff);
    NSURL *requestURLhh = [NSURL URLWithString:urlStringff];
    NSError* error = nil;

    NSData *signeddataURLhh =  [NSData dataWithContentsOfURL:requestURLhh options:NSDataReadingUncached error:&error];
    
    result_new = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURLhh //1
                                   
                                   options:kNilOptions
                                   error:&error];
    
    for(NSMutableDictionary *dict in result_new)
    {
        [data_retrived addObject:dict];
        
    }
            
    copyArray = [data_retrived mutableCopy];
            
            


            
    if([[[copyArray objectAtIndex:0] objectForKey:@"children"] count] > 0){
        

        float thgt = [copyArray count]*120;
        
        if(thgt > 360){
            
            thgt = 360;
        }
        [self removePulseLoader];
        FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,340 ) style:UITableViewStylePlain];
        FindUser.delegate=self;
        FindUser.dataSource=self;
        FindUser.backgroundColor = [UIColor clearColor];
        FindUser.tag=2;
        FindUser.separatorColor = [UIColor clearColor];
        [FindUser setShowsHorizontalScrollIndicator:NO];
        [FindUser setShowsVerticalScrollIndicator:NO];
        [FindUser setIndicatorStyle:UIScrollViewIndicatorStyleDefault];
        [mainView addSubview:FindUser];
        [FindUser reloadData];
        
        

        
    }else{
        
        [self removePulseLoader];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(30, 160, 798-60, 108)];
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
        });
    });
    UIView *bacKGWview = [[UIView alloc] initWithFrame:CGRectMake(30,160+365, 798-60,59/2 )];
    bacKGWview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tourSmallBg"]];
    [mainView addSubview:bacKGWview];
    
    
    checkbox_ALL = [[UIButton alloc] initWithFrame:CGRectMake(290,3 ,44/2,41/2)];
    checkbox_ALL.backgroundColor=[UIColor clearColor];
    [checkbox_ALL setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox_ALL setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox_ALL setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    checkbox_ALL.adjustsImageWhenHighlighted=YES;
    checkbox_ALL.tag = 1000;
    checkbox_ALL.userInteractionEnabled=NO;
  //  [checkbox_ALL addTarget:self action:@selector(bto_actionAll:) forControlEvents:UIControlEventTouchUpInside];
    [bacKGWview addSubview:checkbox_ALL];
    
    counlblCnt = [[UILabel alloc] initWithFrame:CGRectMake(315, 5, 20, 16)];
    counlblCnt.text = @"";
    counlblCnt.backgroundColor = [UIColor clearColor];
    counlblCnt.font = [UIFont fontWithName:GLOBALTEXTFONT size:15];
    counlblCnt.textAlignment = NSTextAlignmentLeft;
    counlblCnt.textColor = [UIColor lightGrayColor];
    [bacKGWview addSubview:counlblCnt];
    
    
    
    UILabel *counlbl = [[UILabel alloc] initWithFrame:CGRectMake(330, 5, 150, 16)];
    counlbl.backgroundColor = [UIColor clearColor];
    counlbl.font = [UIFont fontWithName:GLOBALTEXTFONT size:15];
    counlbl.textAlignment = NSTextAlignmentLeft;
    counlbl.textColor = [UIColor lightGrayColor];
    [bacKGWview addSubview:counlbl];
    
    
    UIView *shdowView = [[UIView alloc] initWithFrame:CGRectMake(30,160+370+30, 1412/2,25/2 )];
    shdowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shadow"]];
    [mainView addSubview:shdowView];
    
    
    
    // text filed section
    
    
    
    UIView *lftVwe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 38)];
    lftVwe.backgroundColor = [UIColor clearColor];
    
   fara = [[UITextField alloc] initWithFrame:CGRectMake(30, 160+370+55, 685/2, 79/2)];
    fara.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"inputTour"]];
    fara.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    fara.font = [UIFont systemFontOfSize:15.0f];
    fara.text=@"";
    fara.textColor = [UIColor whiteColor];
    //[fara setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [fara setValue:[UIFont systemFontOfSize:15]  forKeyPath:@"_placeholderLabel.font"];
    fara.delegate=self;
    fara.leftView = lftVwe;
    fara.leftViewMode = UITextFieldViewModeAlways;
    [mainView addSubview:fara];
    
    UIView *lftVwe2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe2.backgroundColor = [UIColor clearColor];
    
    pers = [[UITextField alloc] initWithFrame:CGRectMake(30+395, 160+370+55, 685/2, 79/2)];
    pers.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"inputTour"]];
    pers.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    pers.font = [UIFont systemFontOfSize:15.0f];
    pers.text=@"";
    pers.textColor = [UIColor whiteColor];
    [pers setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [pers setValue:[UIFont systemFontOfSize:15]  forKeyPath:@"_placeholderLabel.font"];
    pers.delegate=self;
    pers.leftView = lftVwe2;
    pers.leftViewMode = UITextFieldViewModeAlways;
    [mainView addSubview:pers];
    
    
    UIView *lftVwe4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe4.backgroundColor = [UIColor clearColor];
    
    fara3 = [[UIButton alloc] initWithFrame:CGRectMake(30, 160+370+55+45, 685/2, 79/2)];
    fara3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"inputTour"]];
    fara3.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    fara3.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [fara3 addTarget:self action:@selector(openPicker) forControlEvents:UIControlEventTouchUpInside];

    
    fara3.titleLabel.textColor = [UIColor whiteColor];

    [mainView addSubview:fara3];
    
    UIView *lftVwe5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe5.backgroundColor = [UIColor clearColor];
    
    pers2 = [[UITextField alloc] initWithFrame:CGRectMake(30+395, 160+370+100, 685/2, 79/2)];
    pers2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"inputTour"]];
    pers2.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    pers2.font = [UIFont systemFontOfSize:15.0f];

    pers2.text=@"";
    pers2.textColor = [UIColor whiteColor];
    [pers2 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [pers2 setValue:[UIFont systemFontOfSize:15]  forKeyPath:@"_placeholderLabel.font"];
    pers2.delegate=self;
    pers2.leftView = lftVwe5;
    pers2.leftViewMode = UITextFieldViewModeAlways;
    [mainView addSubview:pers2];
    
    
    
    UILabel *Submit = [[UILabel alloc]initWithFrame:CGRectMake(30, 160+370+145, 146/2, 57/2)];
    [Submit setBackgroundColor:[UIColor whiteColor]];
    [Submit setTextColor:[UIColor blackColor]];
    [Submit setTextAlignment:NSTextAlignmentCenter];
    [Submit setFont:[UIFont systemFontOfSize:15]];
    [mainView addSubview:Submit];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(submit)];
    [Submit addGestureRecognizer:tap];
    Submit.userInteractionEnabled = YES;

    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
            counlbl.text = @" børn eru við";
            fara.placeholder = @"Hvar fara vit";
            pers.placeholder = @"Hvør er ábyrgdar persónur";
        [fara3 setTitle:@"Hvat klokkan vænta vit at verða aftur" forState:UIControlStateNormal];
        [fara3 setTitle:@"Hvat klokkan vænta vit at verða aftur" forState:UIControlStateHighlighted];
        [fara3 setTitle:@"Hvat klokkan vænta vit at verða aftur" forState:UIControlStateSelected];
            pers2.placeholder = @"Telefonnummar hjá ábyrgdar persóni";
       Submit.text = @"Byrja túr";
        UIColor *color = [UIColor whiteColor];
        fara.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Hvar fara vit" attributes:@{NSForegroundColorAttributeName: color}];
        pers.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Hvør er ábyrgdar persónur" attributes:@{NSForegroundColorAttributeName: color}];
        pers2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Telefonnummar hjá ábyrgdar persóni" attributes:@{NSForegroundColorAttributeName: color}];
        
    }
    else
    {
        counlbl.text = @" Børn er med";
        fara.placeholder = @"Hvor tager vi hen";
        pers.placeholder = @"Ansvarshavende navn";
        [fara3 setTitle:@"Forvener at være tilbage klokken" forState:UIControlStateNormal];
        [fara3 setTitle:@"Forvener at være tilbage klokken" forState:UIControlStateHighlighted];
        [fara3 setTitle:@"Forvener at være tilbage klokken" forState:UIControlStateSelected];
        pers2.placeholder = @"Ansvarshavende telefon";
       Submit.text = @"Start tur";
        UIColor *color = [UIColor whiteColor];
        fara.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Hvor tager vi hen" attributes:@{NSForegroundColorAttributeName: color}];
        pers.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Ansvarshavende navn" attributes:@{NSForegroundColorAttributeName: color}];
        pers2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Ansvarshavende telefon" attributes:@{NSForegroundColorAttributeName: color}];
    }
    
    
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
-(void)bto_actionAll:(UIButton *)sender{
    



    
    for (UIView *view in FindUser.subviews) {
        for (UITableView *cell in view.subviews) {
            
//            if([view.subviews isKindOfClass:NSClassFromString(@"UIImageView")])
//            {
   
          //  }
            
        }
    }

}
-(void)broyt:(UIButton *)sender{

    NSLog(@"copyarray==== %@",copyArray);
    checkstatus = YES;
     [countIndx removeAllObjects];
//    for(UIView *v in backViewcell.subviews)
//    {
//        if ([v isKindOfClass:[UIButton class]])
//        {
//            UIButton *somebtn = (UIButton *)v;
//            
//            NSLog(@"vbhhd %@",somebtn);
//            somebtn.userInteractionEnabled = YES;
//            somebtn.titleLabel.text = @"unselect";
//        }
//    }
    sectiontag = sender.tag;
    NSLog(@"tag---- %ld",(long)sender.tag);
    counlblCnt.text = @"";
    
    checkbox_ALL.selected = NO;
    
    [FindUser reloadData];
    
    pers.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"adult_name"];
    fara.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"outwalk_location"];
    pers2.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"phone_no"];
    
    [fara3 setTitle:[[copyArray objectAtIndex:sender.tag] objectForKey:@"backing_time"] forState:UIControlStateNormal];
    [fara3 setTitle:[[copyArray objectAtIndex:sender.tag] objectForKey:@"backing_time"] forState:UIControlStateHighlighted];
    [fara3 setTitle:[[copyArray objectAtIndex:sender.tag] objectForKey:@"backing_time"] forState:UIControlStateSelected];
    
    NSLog(@"jj-- %@", countIndx);
    
    
    GOING_TIME = [NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag] objectForKey:@"going_time"]];
    
     // countPpl = [[[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] objectAtIndex:0]objectForKey:@"id"];
}
-(void)enda:(UIButton *)sender{


    NSError *error=nil;
    prefs= [NSUserDefaults standardUserDefaults];
    NSString *urlString1 = [NSString stringWithFormat:@"%@release_childern.php?room_id=%@&time=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[copyArray objectAtIndex:sender.tag] objectForKey:@"going_time"]];
    

    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    MATourViewController *ViewModel = [[MATourViewController alloc] init];
    ViewModel.pageId=pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];

}

-(void)submit{
NSLog(@"submit--eee");
    
    NSString *cntPPL;
    countPpl=NULL;
    for(cntPPL in countIndx){
        
        if(countPpl.length == 0 ){
            countPpl=cntPPL;
        }else{
            
            countPpl = [NSString stringWithFormat:@"%@,%@",countPpl,cntPPL];
            
        }
    }
    
//    if(checkbox_ALL.selected==NO){
//    
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Vel børn" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        
//        [alert show];
//        
//    }else
    
    if ([counlblCnt.text isEqualToString:@"0"])
    {
        
    }
    else
    {
        if(fara.text.length == 0){
        
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
            {
                fara.placeholder = @"Skal fyllat út";
            }
            else
            {
        fara.placeholder = [NSString TextCheckD];
            }
    
    }else if(pers.text.length == 0){
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
        pers.placeholder = @"Skal fyllat út";
        }
        else
        {
            pers.placeholder = [NSString TextCheckD];
        }
        
    }
    else if(fara3.titleLabel.text.length == 0){
        
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            pers.placeholder = @"Skal fyllat út";
        }
        else
        {
            pers.placeholder = [NSString TextCheckD];
        }
        
        
    }
        else if(pers2.text.length == 0){
        
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
            {
                pers2.placeholder = @"Skal fyllat út";
            }
            else
            {
                pers2.placeholder = [NSString TextCheckD];
            }
        
        
    }
    else{
        NSLog(@"submit--  %@------ %@---- %@---- %@",fara3.titleLabel.text,pers.text,fara.text,pers2.text);
        
        [allGVndata addObject:pers.text];
        [allGVndata addObject:fara.text];
        [allGVndata addObject:fara3.titleLabel.text];
        [allGVndata addObject:pers2.text];
        
        
        NSLog(@"countPplcountPpl..%@",countPpl);
        
        
    NSError *error=nil;
        prefs= [NSUserDefaults standardUserDefaults];
   
    NSString *urlString1 = [NSString stringWithFormat:@"%@outwalk.php?userid=%@&out_room_id=%@&walk_name=%@&check_option=%@&walk_location=%@&out_walk_time=%@&phone_no=%@&out_walk=%@",APPS_DOMAIN_URL,[prefs objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],pers.text,countPpl,fara.text,fara3.titleLabel.text,pers2.text,GOING_TIME];

        NSLog(@"===%@",urlString1);
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        
//        NSString *urlStringnew = [NSString stringWithFormat:@"http://mobil.vega.fo.linux56.unoeuro-server.com/iosapp/children_list.php?child_id=%@",countPpl];
//
//        
//        NSURL *requestURLnew = [NSURL URLWithString:urlStringnew];
//        NSString* urlTextEscapednew = [urlStringnew stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSData *signeddataURLnew = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscapednew]options:NSDataReadingUncached error:&error];
//       serverOutputnew = [[NSString alloc] initWithData:signeddataURLnew encoding: NSASCIIStringEncoding];
//        
//
//
//        
//        fara.text = @"";
//        pers.text = @"";
//        pers2.text = @"";
//        [fara3 setTitle:@"Hvat klokkan vænta vit at verða aftur" forState:UIControlStateNormal];
//        [fara3 setTitle:@"Hvat klokkan vænta vit at verða aftur" forState:UIControlStateHighlighted];
//        [fara3 setTitle:@"Hvat klokkan vænta vit at verða aftur" forState:UIControlStateSelected];
//        uptablView.hidden = NO;
        MATourViewController *ViewModel = [[MATourViewController alloc] init];
        ViewModel.pageId = pageId;
        [self.navigationController pushViewController:ViewModel animated:NO];
    }
    }
}
-(void)closevistr{

    [pickerBack removeFromSuperview];
    [DeatilsView removeFromSuperview];
    [okCls removeFromSuperview];
}
-(void)vistr:(UIButton *)sender{

    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];

    okCls = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls.frame = CGRectMake(635, 120, 120/2, 120/2);
    okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
    [okCls addTarget:self action:@selector(closevistr) forControlEvents:UIControlEventTouchUpInside];
    okCls.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls];
  
    
    
    
    DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 350+40)];
    DeatilsView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView];
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:ttPOP];
    
    
    UILabel *Outwlkdt = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 225, 30)];
    Outwlkdt.backgroundColor = [UIColor clearColor];
    Outwlkdt.textColor = [UIColor grayColor];
    Outwlkdt.text = @"Dato:";
    Outwlkdt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    Outwlkdt.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:Outwlkdt];
    
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    [components month]; //gives you month
    [components day]; //gives you day
    [components year];
    
    
    UILabel *Outwlkdtxt = [[UILabel alloc] initWithFrame:CGRectMake(245, 58, 225, 30)];
    Outwlkdtxt.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    Outwlkdtxt.textColor = [UIColor grayColor];

        Outwlkdtxt.text = [NSString stringWithFormat:@"%ld / %ld / %ld",(long)[components month],(long)[components day],(long)[components year]];

    Outwlkdtxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    Outwlkdtxt.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:Outwlkdtxt];
    
    
    UILabel *OutwlkLoc = [[UILabel alloc] initWithFrame:CGRectMake(20, 90, 225, 30)];
    OutwlkLoc.backgroundColor = [UIColor clearColor];
    OutwlkLoc.textColor = [UIColor grayColor];
    OutwlkLoc.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    OutwlkLoc.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:OutwlkLoc];
    
    
    UILabel *OutwlkLoctxt = [[UILabel alloc] initWithFrame:CGRectMake(245, 92, 225, 30)];
    OutwlkLoctxt.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    OutwlkLoctxt.textColor = [UIColor grayColor];
    OutwlkLoctxt.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"outwalk_location"];
    OutwlkLoctxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    OutwlkLoctxt.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:OutwlkLoctxt];
    
    
    UILabel *expctTm = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 225, 60)];
    expctTm.backgroundColor = [UIColor clearColor];
    expctTm.textColor = [UIColor grayColor];
    expctTm.numberOfLines=2;
    expctTm.lineBreakMode = NSLineBreakByWordWrapping;
    expctTm.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    expctTm.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:expctTm];
    
    UILabel *expctTmtxt = [[UILabel alloc] initWithFrame:CGRectMake(245, 120+15, 225, 30)];
    expctTmtxt.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    expctTmtxt.textColor = [UIColor grayColor];
    expctTmtxt.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"backing_time"];
    expctTmtxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    expctTmtxt.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:expctTmtxt];
    
    
    UILabel *phoneno = [[UILabel alloc] initWithFrame:CGRectMake(20, 150+30, 225, 60)];
    phoneno.backgroundColor = [UIColor clearColor];
    phoneno.textColor = [UIColor grayColor];
    phoneno.numberOfLines=2;
    phoneno.lineBreakMode = NSLineBreakByWordWrapping;
    phoneno.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    phoneno.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:phoneno];
    
    UILabel *phonenotxt = [[UILabel alloc] initWithFrame:CGRectMake(245, 150+45, 225, 30)];
    phonenotxt.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    phonenotxt.textColor = [UIColor grayColor];
      phonenotxt.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"phone_no"];
    
    phonenotxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    phonenotxt.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:phonenotxt];
    
    
    
    
    UILabel *adult = [[UILabel alloc] initWithFrame:CGRectMake(20, 180+60, 225, 30)];
    adult.backgroundColor = [UIColor clearColor];
    adult.textColor = [UIColor grayColor];
    adult.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    adult.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:adult];
    
    UILabel *adulttxt = [[UILabel alloc] initWithFrame:CGRectMake(245, 180+60, 225, 30)];
    adulttxt.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    adulttxt.textColor = [UIColor grayColor];
    adulttxt.text = [[copyArray objectAtIndex:sender.tag] objectForKey:@"adult_name"];
    adulttxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    adulttxt.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:adulttxt];
    
    
    UILabel *chld = [[UILabel alloc] initWithFrame:CGRectMake(20, 210+45, 225, 100)];
    chld.backgroundColor = [UIColor clearColor];
    chld.textColor = [UIColor grayColor];
    chld.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    chld.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:chld];
    
    
    smplAry = [[NSMutableArray alloc] init];
    [smplAry addObject:[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"]];
    NSString *chldname;
    
    NSLog(@"smplAry====%lu",(unsigned long)[[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] count]);
    
    if([[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] count] == 1){
        chldname = [[[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] objectAtIndex:0] objectForKey:@"name"];
    }else{
    
        for (int i=0; i<[[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] count]; i++) {
            if(chldname.length > 0){
            chldname = [NSString stringWithFormat:@"%@,%@",chldname,[[[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] objectAtIndex:i] objectForKey:@"name"]];
            }else{
            chldname = [[[[copyArray objectAtIndex:sender.tag] objectForKey:@"children"] objectAtIndex:i] objectForKey:@"name"];
            }
            
            
        }
    
    }
    
    
    
    UILabel *chldtxt = [[UILabel alloc] initWithFrame:CGRectMake(245, 210+45, 225, 100)];
    chldtxt.backgroundColor = [UIColor clearColor];
    chldtxt.textColor = [UIColor grayColor];

    chldtxt.text = chldname;
//    }else{
//    chldtxt.text = serverOutputnew;
//    }
    
    chldtxt.numberOfLines = 3;
    chldtxt.lineBreakMode = NSLineBreakByWordWrapping;
    ;    chldtxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    chldtxt.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:chldtxt];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
           ttPOP.text = @"Túr";
            OutwlkLoc.text = @"Stað:";
            expctTm.text = @"Nær vænta vit at verða aftur:";
            phoneno.text = @"Ábyrgdarpersónur Telefonnummar:";
            adult.text = @"Ábyrgdarpersónur Navn:";
            chld.text = @"Barn Navn:";
    }
    else
    {
            ttPOP.text = @"Tur";
        OutwlkLoc.text = @"Sted:";
        expctTm.text = @"Hvornår forventer vi at være tilbage:";
        phoneno.text = @"Ansvarshavende telefon:";
        adult.text = @"Ansvarshavende Navn:";
        chld.text = @"Barn Navn:";
    }
    
}


-(void)openPicker{

    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];
    [fara resignFirstResponder];
    [pers resignFirstResponder];
    [pers2 resignFirstResponder];
    
    
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];

    
    
    
    
    // Initialization code
    
    dPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(30,  160+325, 685/2, 190)];
    dPicker.backgroundColor = [UIColor colorWithRed:(255.0f / 255.0f) green:(255.0f / 255.0f) blue:(255.0f / 255.0f) alpha:0.7f];
    dPicker.datePickerMode = UIDatePickerModeTime;
    dPicker.hidden = NO;
    
   dPicker.date = [NSDate date];
//    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"NL"];
  //  [dPicker setLocale:locale];
    
    [dPicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];
    
    [pickerBack addSubview:dPicker];
    
     
    UIButton *Submit_new = [UIButton buttonWithType:UIButtonTypeCustom];
    Submit_new.frame = CGRectMake(316, 160+330, 50, 57/2);
    Submit_new.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    [Submit_new addTarget:self action:@selector(closepicker) forControlEvents:UIControlEventTouchUpInside];
    [Submit_new setTitle:@"Ok" forState:UIControlStateNormal];
    [Submit_new setTitle:@"Ok" forState:UIControlStateSelected];
    [Submit_new setTitle:@"Ok" forState:UIControlStateHighlighted];
    [Submit_new setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //Submit_new.titleLabel.textColor = [UIColor grayColor];
    [pickerBack addSubview:Submit_new];
    [pickerBack bringSubviewToFront:Submit_new];

}
-(void)closepicker{
    
   
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    //[outputFormatter setDateFormat:@"h:mm a"];
    [outputFormatter setDateFormat:@"HH:mm"];

    
    
    
    [fara3 setTitle:[outputFormatter stringFromDate:dPicker.date] forState:UIControlStateNormal];
    [fara3 setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateHighlighted];
    [fara3 setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateSelected];
    toTme = [outputFormatter stringFromDate:dPicker.date];
    
    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];

}

-(void)keyboardWillShow {
    if ([UserName isFirstResponder]) {
        // ...............
    }else{
    // Animate the current view out of the way
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    //NSLog(@"setViewMovedUp");
    CGRect rect = self.view.frame;
    rect.origin.y -= kOFFSET_FOR_KEYBOARD;
    self.view.frame = rect;
    //self.view.frame = rect;
    
    [UIView commitAnimations];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    


    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
        
 
}
- (void)viewWillDisappear:(BOOL)animated {
    
    
    
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}
-(void)keyboardWillHide {
    if ([UserName isFirstResponder]) {
        // ...............
    }else{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    //NSLog(@"setViewMovedUp");
    CGRect rect = self.view.frame;
    rect.origin.y += kOFFSET_FOR_KEYBOARD;
    self.view.frame = rect;
    //self.view.frame = rect;
    
    [UIView commitAnimations];
    }
}

     -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [copyArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rt;
//    if(section == 0){
        rt=[[[copyArray objectAtIndex:section] objectForKey:@"children"] count];
//    }else{
//        rt=[nottour count];
//    }
    return rt;
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *uptablViewHdr = [[UIView alloc] initWithFrame:CGRectMake(300, 0, 360, 40)];
    uptablViewHdr.backgroundColor = [UIColor clearColor];
 
    if([[[copyArray objectAtIndex:section] objectForKey:@"status"]  isEqual: @"N"]){

    UIButton *visTr = [UIButton buttonWithType:UIButtonTypeCustom];
    visTr.frame = CGRectMake(120+280,0,120,40);
    visTr.backgroundColor = [UIColor clearColor];
    visTr.titleLabel.textColor = [UIColor whiteColor];
    visTr.titleLabel.font = [UIFont systemFontOfSize:17];
        visTr.tag=section;
        [visTr addTarget:self action:@selector(vistr:) forControlEvents:UIControlEventTouchUpInside];
    [uptablViewHdr addSubview:visTr];
    
    UIButton *broyt = [UIButton buttonWithType:UIButtonTypeCustom];
    broyt.frame = CGRectMake(240+280,0,120,40);
    broyt.backgroundColor = [UIColor clearColor];
    broyt.titleLabel.textColor = [UIColor whiteColor];
    broyt.titleLabel.font = [UIFont systemFontOfSize:17];
        broyt.tag=section;
        [broyt addTarget:self action:@selector(broyt:) forControlEvents:UIControlEventTouchUpInside];
    [uptablViewHdr addSubview:broyt];
    
    
    UIButton *enda = [UIButton buttonWithType:UIButtonTypeCustom];
    enda.frame = CGRectMake(360+280,0,120,40);
    enda.backgroundColor = [UIColor clearColor];
    enda.titleLabel.textColor = [UIColor whiteColor];
    enda.titleLabel.font = [UIFont systemFontOfSize:17];
        enda.tag=section;
        [enda addTarget:self action:@selector(enda:) forControlEvents:UIControlEventTouchUpInside];
    [uptablViewHdr addSubview:enda];
    
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            [visTr setTitle:@"Vís túr" forState:UIControlStateNormal];
            [visTr setTitle:@"Vís túr" forState:UIControlStateSelected];
            [visTr setTitle:@"Vís túr" forState:UIControlStateHighlighted];
            
            [broyt setTitle:@"Broyt" forState:UIControlStateNormal];
            [broyt setTitle:@"Broyt" forState:UIControlStateSelected];
            [broyt setTitle:@"Broyt" forState:UIControlStateHighlighted];
            
            [enda setTitle:@"Enda túr" forState:UIControlStateNormal];
            [enda setTitle:@"Enda túr" forState:UIControlStateSelected];
            [enda setTitle:@"Enda túr" forState:UIControlStateHighlighted];
        }
        else
        {
            [visTr setTitle:@"Vis tur" forState:UIControlStateNormal];
            [visTr setTitle:@"Vis tur" forState:UIControlStateSelected];
            [visTr setTitle:@"Vis tur" forState:UIControlStateHighlighted];
            
            [broyt setTitle:[NSString EditD] forState:UIControlStateNormal];
            [broyt setTitle:[NSString EditD] forState:UIControlStateSelected];
            [broyt setTitle:[NSString EditD] forState:UIControlStateHighlighted];
            
            [enda setTitle:@"Slut tur" forState:UIControlStateNormal];
            [enda setTitle:@"Slut tur" forState:UIControlStateSelected];
            [enda setTitle:@"Slut tur" forState:UIControlStateHighlighted];
        }
        
//    if(ststChk == YES){
//        
//    }else{
//        uptablViewHdr.hidden=YES;
//    }
    }
    
    return uptablViewHdr;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    int rty;
    if([[[copyArray objectAtIndex:section] objectForKey:@"status"]  isEqual: @"N"]){
        rty = 40;
    }else{
        rty=0;
    }
    return rty;
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
    
    backViewcell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, 108)];
    backViewcell.backgroundColor = [UIColor whiteColor];
    [cell addSubview:backViewcell];
    
    UIImage *plcHol;
    
    if([[NSString stringWithFormat:@"%@",[[[[copyArray objectAtIndex:indexPath.section]objectForKey:@"children" ] objectAtIndex:indexPath.row]objectForKey:@"gender"]]  isEqual: @"M"]){
        
        plcHol=[UIImage imageNamed:@"Placeolderm"];
        
    }else{
        
        plcHol=[UIImage imageNamed:@"Placeolderf"];
        
    }
 
    
        UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1,193/2, 105)];
        pic.tag = indexPath.row;

        [cell addSubview:pic];
    
        [pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ansa.fo/upload/children_photo/thumb/%@",[[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"photo"]]]
            placeholderImage:plcHol options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
        [backViewcell addSubview:pic];
        
        
        
        checkbox = [[UIButton alloc] initWithFrame:CGRectMake(140,8 ,44/2,41/2)];
        checkbox.backgroundColor=[UIColor clearColor];
    
    [checkbox setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
        if(![[[copyArray objectAtIndex:indexPath.section] objectForKey:@"status"]  isEqual: @"N"] || [[[copyArray objectAtIndex:indexPath.section] objectForKey:@"status"]  isEqual: @"W"]){

            
            if (countIndx.count == 0)
            {
                checkbox.selected = NO;
            }
            else
            {

                
            if ([countIndx containsObject:[[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"id"]])
            {
                checkbox.selected = YES;
            }
            else
            {
            checkbox.selected = NO;
        
            }
            }
        }
        else
        {
            ststChk=YES;
            if ([j isEqualToString:@"0"])
            {
                 j = [NSString stringWithFormat:@"%@",[[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"id"]];
            }
            else
            {

            j = [NSString stringWithFormat:@"%@,%@",j,[[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"id"]];
            }

            checkbox.selected = YES;
            if (checkstatus == YES)
            {
                NSLog(@"indexpath   %ldsection----- %ld",(long)indexPath.section,sectiontag);
                
                if (indexPath.section == sectiontag)
                {
                    [countIndx addObject:[NSString stringWithFormat:@"%@",[[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"id"]]];
                    checkbox.userInteractionEnabled = YES;
                }
                else if (indexPath.section != sectiontag)
                {
                    checkbox.userInteractionEnabled = NO;
                }
                
                //checkstatus = NO;
            }
            else
            {
           checkbox.userInteractionEnabled = NO;
            }
        }
        checkbox.adjustsImageWhenHighlighted=YES;
        checkbox.tag = [[[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"id"] integerValue] ;
        [checkbox addTarget:self action:@selector(bto_action:) forControlEvents:UIControlEventTouchUpInside];
        [backViewcell addSubview:checkbox];
        
    
        UILabel *Name = [[UILabel alloc] initWithFrame:CGRectMake(170, 8, 200, 20)];
        Name.text = @"Navn";
        Name.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
        Name.textColor = [UIColor lightGrayColor];
        Name.textAlignment = NSTextAlignmentLeft;
        [backViewcell addSubview:Name];
    
        
        
        UILabel *NameTxt = [[UILabel alloc] initWithFrame:CGRectMake(170, 20+8, 200, 20)];
        
        if([[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"name"] != [NSNull null]){
            
            NameTxt.text = [[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"name"];
            
        }
        NameTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:16];
        NameTxt.textColor = [UIColor blackColor];
        NameTxt.textAlignment = NSTextAlignmentLeft;
        [backViewcell addSubview:NameTxt];
        
        
        UILabel *FDato = [[UILabel alloc] initWithFrame:CGRectMake(170, 68-14, 200, 20)];
        FDato.text = @"F.Dato";
        FDato.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
        FDato.textColor = [UIColor lightGrayColor];
        FDato.textAlignment = NSTextAlignmentLeft;
        [backViewcell addSubview:FDato];
    
        
        UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(170, 92-16,350, 20)];
        FDatoTxt.text = [[[[copyArray objectAtIndex:indexPath.section] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"date_of_birth"];
        FDatoTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:16];
        FDatoTxt.textColor = [UIColor blackColor];
        FDatoTxt.textAlignment = NSTextAlignmentLeft;
        [backViewcell addSubview:FDatoTxt];
    
    
//        UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12.5,193/2, 157/2)];
//        pic.tag = indexPath.row;
//        [cell addSubview:pic];
//        [pic setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobil.vega.fo.linux56.unoeuro-server.com/upload/children_photo/thumb/%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"photo" ]]]
//            placeholderImage:[UIImage imageNamed:@"no-image-icon.jpg"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
//        [backView addSubview:pic];
//        
//        
//        
//        UIButton *checkbox = [[UIButton alloc] initWithFrame:CGRectMake(140,8 ,44/2,41/2)];
//        checkbox.backgroundColor=[UIColor clearColor];
//        
//        if([[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"release_status"]  isEqual: @"Y"] || [[data_retrived objectAtIndex:indexPath.row]objectForKey:@"release_status"] == [NSNull null]){
//            
//            [checkbox setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
//            [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
//            [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
//            
//        }else if([[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"release_status"]  isEqual: @"N"]){
//            ststChk=YES;
//            [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateNormal];
//            [checkbox setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateSelected];
//            [checkbox setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateHighlighted];
//            checkbox.userInteractionEnabled = NO;
//        }
//        checkbox.adjustsImageWhenHighlighted=YES;
//        checkbox.tag = [[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"id" ] integerValue];
//        [checkbox addTarget:self action:@selector(bto_action:) forControlEvents:UIControlEventTouchUpInside];
//        [backView addSubview:checkbox];
//        
//        
//        
//        UILabel *Name = [[UILabel alloc] initWithFrame:CGRectMake(170, 8, 200, 20)];
//        Name.text = @"Navn";
//        Name.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
//        Name.textColor = [UIColor blackColor];
//        Name.textAlignment = NSTextAlignmentLeft;
//        [backView addSubview:Name];
//        
//        
//        
//        UILabel *NameTxt = [[UILabel alloc] initWithFrame:CGRectMake(170, 20+8, 200, 20)];
//        
//        if([[data_retrived objectAtIndex:indexPath.row]objectForKey:@"name"] != [NSNull null]){
//            
//            NameTxt.text = [[data_retrived objectAtIndex:indexPath.row]objectForKey:@"name" ];
//            
//        }
//        NameTxt.font = [UIFont fontWithName:@"Roboto-Light" size:15];;
//        NameTxt.textColor = [UIColor lightGrayColor];
//        NameTxt.textAlignment = NSTextAlignmentLeft;
//        [backView addSubview:NameTxt];
//        
//        
//        UILabel *FDato = [[UILabel alloc] initWithFrame:CGRectMake(170, 68-14, 200, 20)];
//        FDato.text = @"F.Dato";
//        FDato.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
//        FDato.textColor = [UIColor blackColor];
//        FDato.textAlignment = NSTextAlignmentLeft;
//        [backView addSubview:FDato];
//        
//        
//        UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(170, 92-16,350, 16)];
//        FDatoTxt.text = [[data_retrived objectAtIndex:indexPath.row]objectForKey:@"date_of_birth" ];
//        FDatoTxt.font = [UIFont fontWithName:@"Roboto-Light" size:15];;
//        FDatoTxt.textColor = [UIColor lightGrayColor];
//        FDatoTxt.textAlignment = NSTextAlignmentLeft;
//        [backView addSubview:FDatoTxt];
    
    

    
   
    
    
    
    

    
    
//    UILabel *chkLbl = [[UILabel alloc] initWithFrame:CGRectMake(630, 22, 100, 20)];
//    chkLbl.text = @"Heim";
//    chkLbl.font = [UIFont fontWithName:@"Roboto-Light" size:16];;
//    chkLbl.textColor = [UIColor blackColor];
//    chkLbl.textAlignment = NSTextAlignmentLeft;
//    [backView addSubview:chkLbl];
    
   // counlblCnt.text = [NSString stringWithFormat:@"%d",j];
    
    return cell;
    
}
-(void)bto_action:(UIButton *)sender
{
    
    UIButton *targetButton = (UIButton *)sender;
    
    if(targetButton.selected == NO)
    {
        NSLog(@"entry");
        
        [targetButton setSelected:YES];
        
        
        
        countPpl = [NSString stringWithFormat:@"%@,%@",j,[NSString stringWithFormat:@"%ld", (long)targetButton.tag]];
        
    }
    else
    {
        NSLog(@"entrynot");
        [targetButton setSelected:NO];
        
        
    }

    
    int index;
    BOOL gotElement = NO;
    
    NSLog(@"countindex===== %@", countIndx);
    
    for (NSString *selectedElement in countIndx) {
        if([selectedElement isEqualToString:[NSString stringWithFormat:@"%ld", (long)targetButton.tag]]) {
            index = [countIndx indexOfObject:[NSString stringWithFormat:@"%ld", (long)targetButton.tag]];
            gotElement = YES;
        }
    }
    
    if (!gotElement) {

        [countIndx addObject:[NSString stringWithFormat:@"%ld", (long)targetButton.tag]];
        
        NSLog(@"countindex--- %@", countIndx);
        
    } else {
      
        [countIndx removeObjectAtIndex:index];
    }


    
//    NSString *cntPPL;
//    countPpl=NULL;
//    for(cntPPL in countIndx){
//        
//        if(countPpl.length == 0 ){
//            countPpl=cntPPL;
//        }else{
//        
//            countPpl = [NSString stringWithFormat:@"%@,%@",countPpl,cntPPL];
//        
//        }
//    }
    
    NSLog(@"---- %@",countPpl);
    counlblCnt.text = [NSString stringWithFormat:@"%lu",(unsigned long)[countIndx count]];
    
    if([countIndx count] > 0){
        checkbox_ALL.selected=YES;
    
    }else{
        checkbox_ALL.selected=NO;
    }

}

//pickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return UINT16_MAX;
}
//- (void) resetTimePickerToMiddle:(NSUInteger)hour minutes:(NSUInteger)minutes
//{
//    [dPicker selectRow:((UINT16_MAX)/(2 * self.numberOfHours) * self.numberOfHours) + hour inComponent:0 animated:NO];
//    [dPicker selectRow:((UINT16_MAX)/(2 * self.numberOfMinutes) * self.numberOfMinutes) + minutes inComponent:1 animated:NO];
//}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;

}
#pragma mark - UIPickerViewDelegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSUInteger displayNumber = 0;
    if (component == 0)
    {
        displayNumber = row % self.numberOfHours;
    }
    else
    {
        displayNumber = row % self.numberOfMinutes;
    }
    
    return [NSString stringWithFormat:@"%lu", (unsigned long)displayNumber];
}


-(void)backOut2{
    
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
    
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    ViewModel.pageId=pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}
-(void)logout{
    
    MALoginViewController *ViewModel = [[MALoginViewController alloc] init];
    [[NSUserDefaults standardUserDefaults]setObject:@"no" forKey:@"rememberlogin"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    prefs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [prefs dictionaryRepresentation];
    for (id key in dict) {
        
        [prefs removeObjectForKey:key];
    }
    [self.navigationController pushViewController:ViewModel animated:NO];
}
-(void)Registration
{
    MARegistrationViewController *Registration = [[MARegistrationViewController alloc]init];
    [self.navigationController pushViewController:Registration animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
