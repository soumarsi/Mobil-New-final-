//
//  MASecondHomeViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MASecondHomeViewController.h"
#import "MAListngKominViewController.h"
#import "MALoginViewController.h"
#import "MAListingHomeViewController.h"
#import "MAListingBornViewController.h"
#import "MAListingBirthdayViewController.h"
#import "MATourViewController.h"
#import "MAHomeViewController.h"
#import "MANewsViewController.h"
#import "MANotesViewController.h"
#import "MAAlbumViewController.h"
#import "MARegistrationViewController.h"
#import "MAStatViewController.h"
#define kOFFSET_FOR_KEYBOARD 290;
@interface MASecondHomeViewController ()

@end

@implementation MASecondHomeViewController
@synthesize  pageId;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"===..%@",pageId);
    
    mainView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024,1536/2)];
    mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:mainView];
    
    
   countIndx = [[NSMutableArray alloc] init];
    all=YES;
    
    UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 125, 1024,54)];
    Title.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"title"]];
    Title.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    Title.textAlignment = NSTextAlignmentCenter;
    Title.font = [UIFont fontWithName:GLOBALTEXTFONT size:48];
    [mainView addSubview:Title];
        
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake(160, 50, 120.0f, 49/2)];
    [logout setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [logout setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [logout.titleLabel setFont:[UIFont fontWithName:@"Roboto-Light" size:15]];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateHighlighted];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateSelected];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:logout];
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(250, 50, 120.0f, 49/2)];
    [back setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [back setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [back.titleLabel setFont:[UIFont fontWithName:@"Roboto-Light" size:15]];
    [back setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [back setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [back setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [back setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateNormal];
    [back setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateHighlighted];
    [back setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateSelected];
    [back addTarget:self action:@selector(backOut) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:back];
    
    UIButton *Registration = [UIButton buttonWithType:UIButtonTypeCustom];
    [Registration setFrame:CGRectMake(770, 50, 120.0f, 49/2)];
    [Registration setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [Registration setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [Registration.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
    [Registration setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [Registration setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [Registration setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [Registration setImage:[UIImage imageNamed:@"registrationred"] forState:UIControlStateNormal];
    [Registration setImage:[UIImage imageNamed:@"registrationred"] forState:UIControlStateHighlighted];
    [Registration setImage:[UIImage imageNamed:@"registrationred"] forState:UIControlStateSelected];
    [Registration addTarget:self action:@selector(Registration) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:Registration];
    
    UIView *ScondHomeView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 210, 1024, self.view.frame.size.height-220)];
    [ScondHomeView setBackgroundColor:[UIColor clearColor]];
    [mainView addSubview:ScondHomeView];
    
    
    ScondHomeScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 1024, ScondHomeView.frame.size.height)];
    [ScondHomeScrollView setDelegate:self];
    [ScondHomeScrollView setBackgroundColor:[UIColor clearColor]];
    [ScondHomeScrollView setScrollEnabled:YES];
    [ScondHomeScrollView setShowsHorizontalScrollIndicator:NO];
    [ScondHomeScrollView setShowsVerticalScrollIndicator:NO];
    [ScondHomeScrollView setContentSize:CGSizeMake(1024, 1020)];
    [ScondHomeView addSubview:ScondHomeScrollView];
    
   
    
    UIView *pic = [[UIView alloc] initWithFrame:CGRectMake(210, 10,357/2, 357/2)];
    pic.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"komin"]];
    pic.tag =28;
    [ScondHomeScrollView addSubview:pic];
    

    UILabel *PcLblV = [[UILabel alloc] initWithFrame:CGRectMake(235, 410-210, 131, 40)];
    PcLblV.backgroundColor = [UIColor clearColor];
    PcLblV.layer.borderWidth = 2.0f;
    PcLblV.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV.layer.cornerRadius = 2.0f;
    [PcLblV setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV setTextAlignment:NSTextAlignmentCenter];
    PcLblV.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV];
    

    
    UITapGestureRecognizer *sgsttap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goKomin)];
    [sgsttap setDelegate:self];
    [sgsttap setNumberOfTapsRequired:1];
    [sgsttap setNumberOfTouchesRequired:1];
    [pic addGestureRecognizer:sgsttap];
    
    UITapGestureRecognizer *sgsttap_new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goKomin)];
    [sgsttap_new setDelegate:self];
    [sgsttap_new setNumberOfTapsRequired:1];
    [sgsttap_new setNumberOfTouchesRequired:1];
    [PcLblV addGestureRecognizer:sgsttap_new];
    
    
    
    
    
    UIView *pic2 = [[UIView alloc] initWithFrame:CGRectMake(440, 10,357/2, 357/2)];
    pic2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home"]];
    [ScondHomeScrollView addSubview:pic2];

    UILabel *PcLblV2 = [[UILabel alloc] initWithFrame:CGRectMake(465, 410-210, 131, 40)];
    PcLblV2.backgroundColor = [UIColor clearColor];
    PcLblV2.layer.borderWidth = 2.0f;
    PcLblV2.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV2.layer.cornerRadius = 2.0f;
    [PcLblV2 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV2 setTextAlignment:NSTextAlignmentCenter];
    PcLblV2.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV2];
    
    
    
    UITapGestureRecognizer *sgsttap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goHome)];
    [sgsttap2 setDelegate:self];
    [sgsttap2 setNumberOfTapsRequired:1];
    [sgsttap2 setNumberOfTouchesRequired:1];
    [pic2 addGestureRecognizer:sgsttap2];
    
    
    UITapGestureRecognizer *sgsttap2new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goHome)];
    [sgsttap2new setDelegate:self];
    [sgsttap2new setNumberOfTapsRequired:1];
    [sgsttap2new setNumberOfTouchesRequired:1];
    [PcLblV2 addGestureRecognizer:sgsttap2new];
    
    
    
    UIView *picnew = [[UIView alloc] initWithFrame:CGRectMake(285+290+90, 220-210,357/2, 357/2)];
    picnew.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"SendBtn"]];
    [ScondHomeScrollView addSubview:picnew];
    
    UILabel *PcLblV2picnew = [[UILabel alloc] initWithFrame:CGRectMake(285+290+115, 410-210, 131, 40)];
    PcLblV2picnew.backgroundColor = [UIColor clearColor];
    PcLblV2picnew.layer.borderWidth = 2.0f;
    PcLblV2picnew.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV2picnew.layer.cornerRadius = 2.0f;
    [PcLblV2picnew setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV2picnew setTextAlignment:NSTextAlignmentCenter];
    PcLblV2picnew.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV2picnew];
    
    UITapGestureRecognizer *sgsttap2_newww = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendSMS)];
    [sgsttap2_newww setDelegate:self];
    [sgsttap2_newww setNumberOfTapsRequired:1];
    [sgsttap2_newww setNumberOfTouchesRequired:1];
    [picnew addGestureRecognizer:sgsttap2_newww];
    
    

    
    

    UIView *pic3 = [[UIView alloc] initWithFrame:CGRectMake(210, 500-20-210,357/2, 357/2)];
    pic3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tur"]];
    [ScondHomeScrollView addSubview:pic3];

    
    UILabel *PcLblV3 = [[UILabel alloc] initWithFrame:CGRectMake(235, 670-210, 131, 40)];
    PcLblV3.backgroundColor = [UIColor clearColor];
    PcLblV3.layer.borderWidth = 2.0f;
    PcLblV3.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV3.layer.cornerRadius = 2.0f;
    [PcLblV3 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV3 setTextAlignment:NSTextAlignmentCenter];
    PcLblV3.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV3];


    UITapGestureRecognizer *sgsttap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotour)];
    [sgsttap3 setDelegate:self];
    [sgsttap3 setNumberOfTapsRequired:1];
    [sgsttap3 setNumberOfTouchesRequired:1];
    [pic3 addGestureRecognizer:sgsttap3];
    
    UITapGestureRecognizer *sgsttap3new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotour)];
    [sgsttap3new setDelegate:self];
    [sgsttap3new setNumberOfTapsRequired:1];
    [sgsttap3new setNumberOfTouchesRequired:1];
    [PcLblV3 addGestureRecognizer:sgsttap3new];
    
    
    UIView *pic4 = [[UIView alloc] initWithFrame:CGRectMake(440, 500-20-210,357/2, 357/2)];
    pic4.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"born"]];
    [ScondHomeScrollView addSubview:pic4];

    UILabel *PcLblV4 = [[UILabel alloc] initWithFrame:CGRectMake(465, 670-210, 131, 40)];
    PcLblV4.backgroundColor = [UIColor clearColor];
    PcLblV4.layer.borderWidth = 2.0f;
    PcLblV4.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV4.layer.cornerRadius = 2.0f;
    [PcLblV4 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV4 setTextAlignment:NSTextAlignmentCenter];
    PcLblV4.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV4];
    
    UITapGestureRecognizer *sgsttap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBorn)];
    [sgsttap4 setDelegate:self];
    [sgsttap4 setNumberOfTapsRequired:1];
    [sgsttap4 setNumberOfTouchesRequired:1];
    [pic4 addGestureRecognizer:sgsttap4];
    
    UITapGestureRecognizer *sgsttap4new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBorn)];
    [sgsttap4new setDelegate:self];
    [sgsttap4new setNumberOfTapsRequired:1];
    [sgsttap4new setNumberOfTouchesRequired:1];
    [PcLblV4 addGestureRecognizer:sgsttap4new];
    
    

    UIView *pic5 = [[UIView alloc] initWithFrame:CGRectMake(285+290+80, 500-20-210,357/2, 357/2)];
    pic5.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Fodingardager"]];
    [ScondHomeScrollView addSubview:pic5];

    
    UILabel *PcLblV5 = [[UILabel alloc] initWithFrame:CGRectMake(285+290+90, 670-210, 163, 40)];
    PcLblV5.backgroundColor = [UIColor clearColor];
    PcLblV5.layer.borderWidth = 2.0f;
    PcLblV5.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV5.layer.cornerRadius = 2.0f;
    [PcLblV5 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV5 setTextAlignment:NSTextAlignmentCenter];
    PcLblV5.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV5];

    
    UITapGestureRecognizer *sgsttap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBirthDay)];
    [sgsttap5 setDelegate:self];
    [sgsttap5 setNumberOfTapsRequired:1];
    [sgsttap5 setNumberOfTouchesRequired:1];
    [pic5 addGestureRecognizer:sgsttap5];
    
    UITapGestureRecognizer *sgsttap5new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBirthDay)];
    [sgsttap5new setDelegate:self];
    [sgsttap5new setNumberOfTapsRequired:1];
    [sgsttap5new setNumberOfTouchesRequired:1];
    [PcLblV5 addGestureRecognizer:sgsttap5new];
    
    //190
    
    
    UIView *pic6 = [[UIView alloc] initWithFrame:CGRectMake(210, 530,357/2, 359/2)];
    pic6.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"news"]];
    [ScondHomeScrollView addSubview:pic6];
    
    
    UILabel *PcLblV6 = [[UILabel alloc] initWithFrame:CGRectMake(235, 720, 131, 40)];
    PcLblV6.backgroundColor = [UIColor clearColor];
    PcLblV6.layer.borderWidth = 2.0f;
    PcLblV6.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV6.layer.cornerRadius = 2.0f;
    [PcLblV6 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV6 setTextAlignment:NSTextAlignmentCenter];
    PcLblV6.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV6];
    
    
    UITapGestureRecognizer *sgsttap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goNews)];
    [sgsttap6 setDelegate:self];
    [sgsttap6 setNumberOfTapsRequired:1];
    [sgsttap6 setNumberOfTouchesRequired:1];
    [pic6 addGestureRecognizer:sgsttap6];
    
    UITapGestureRecognizer *sgsttap6new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goNews)];
    [sgsttap6new setDelegate:self];
    [sgsttap6new setNumberOfTapsRequired:1];
    [sgsttap6new setNumberOfTouchesRequired:1];
    [PcLblV6 addGestureRecognizer:sgsttap6new];

    
    
    UIView *pic7 = [[UIView alloc] initWithFrame:CGRectMake(440, 530,357/2, 357/2)];
    pic7.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Note"]];
    [ScondHomeScrollView addSubview:pic7];
    
    UILabel *PcLblV7 = [[UILabel alloc] initWithFrame:CGRectMake(465, 720, 131, 40)];
    PcLblV7.backgroundColor = [UIColor clearColor];
    PcLblV7.layer.borderWidth = 2.0f;
    PcLblV7.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV7.layer.cornerRadius = 2.0f;
    [PcLblV7 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV7 setTextAlignment:NSTextAlignmentCenter];
    PcLblV7.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV7];
    
    UITapGestureRecognizer *sgsttap7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goNote)];
    [sgsttap7 setDelegate:self];
    [sgsttap7 setNumberOfTapsRequired:1];
    [sgsttap7 setNumberOfTouchesRequired:1];
    [pic7 addGestureRecognizer:sgsttap7];
    
    UITapGestureRecognizer *sgsttap7new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goNote)];
    [sgsttap7new setDelegate:self];
    [sgsttap7new setNumberOfTapsRequired:1];
    [sgsttap7new setNumberOfTouchesRequired:1];
    [PcLblV7 addGestureRecognizer:sgsttap7new];
    
    
    
    UIView *pic8 = [[UIView alloc] initWithFrame:CGRectMake(285+290+80, 530,357/2, 357/2)];
    pic8.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Gallery"]];
    [ScondHomeScrollView addSubview:pic8];
    
    
    UILabel *PcLblV8 = [[UILabel alloc] initWithFrame:CGRectMake(285+290+105, 720, 131, 40)];
    PcLblV8.backgroundColor = [UIColor clearColor];
    PcLblV8.layer.borderWidth = 2.0f;
    PcLblV8.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV8.layer.cornerRadius = 2.0f;
    [PcLblV8 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV8 setTextAlignment:NSTextAlignmentCenter];
    PcLblV8.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV8];
    
    
    UITapGestureRecognizer *sgsttap8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goGallery)];
    [sgsttap8 setDelegate:self];
    [sgsttap8 setNumberOfTapsRequired:1];
    [sgsttap8 setNumberOfTouchesRequired:1];
    [pic8 addGestureRecognizer:sgsttap8];
    
    UITapGestureRecognizer *sgsttap8new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goGallery)];
    [sgsttap8new setDelegate:self];
    [sgsttap8new setNumberOfTapsRequired:1];
    [sgsttap8new setNumberOfTouchesRequired:1];
    [PcLblV8 addGestureRecognizer:sgsttap8new];
    
    
    
    UIView *pic9 = [[UIView alloc] initWithFrame:CGRectMake(440, 785,357/2, 357/2)];
    pic9.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"statictics"]];
    [ScondHomeScrollView addSubview:pic9];
    
    UILabel *PcLblV9 = [[UILabel alloc] initWithFrame:CGRectMake(465, 975, 131, 40)];
    PcLblV9.backgroundColor = [UIColor clearColor];
    PcLblV9.layer.borderWidth = 2.0f;
    PcLblV9.layer.borderColor = [[UIColor colorWithRed:(79.0f / 255.0f) green:(79.0f / 255.0f) blue:(79.0f / 255.0f) alpha:0.7f]CGColor];
    PcLblV9.layer.cornerRadius = 2.0f;
    [PcLblV9 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [PcLblV9 setTextAlignment:NSTextAlignmentCenter];
    PcLblV9.textColor = [UIColor colorWithRed:(66.0f / 255.0f) green:(66.0f / 255.0f) blue:(66.0f / 255.0f) alpha:0.7f];
    [ScondHomeScrollView addSubview:PcLblV9];
    
    
    
    UITapGestureRecognizer *sgsttap9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gostat)];
    [sgsttap9 setDelegate:self];
    [sgsttap9 setNumberOfTapsRequired:1];
    [sgsttap9 setNumberOfTouchesRequired:1];
    [pic9 addGestureRecognizer:sgsttap9];
    
    
    UITapGestureRecognizer *sgsttap9new = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gostat)];
    [sgsttap9new setDelegate:self];
    [sgsttap9new setNumberOfTapsRequired:1];
    [sgsttap9new setNumberOfTouchesRequired:1];
    [PcLblV9 addGestureRecognizer:sgsttap9new];

    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
            [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
            [back setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
            [Registration setTitle:[NSString RegistrationF] forState:UIControlStateNormal];
            [PcLblV setText:[NSString KominF]];
        [PcLblV2 setText:[NSString HomeF]];
        [PcLblV2picnew setText:[NSString SmsInboxF]];
        [PcLblV3 setText:[NSString TourF]];
        [PcLblV4 setText:[NSString BornF]];
        [PcLblV5 setText:[NSString BirthdayF]];
        [PcLblV6 setText:[NSString NewsF]];
        [PcLblV7 setText:[NSString NotesF]];
        [PcLblV8 setText:[NSString GalleryF]];
        [PcLblV9 setText:[NSString statNameF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [back setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [Registration setTitle:[NSString RegistrationD] forState:UIControlStateNormal];
          [PcLblV setText:[NSString KominD]];
        [PcLblV2 setText:[NSString HomeD]];
        [PcLblV2picnew setText:[NSString SmsInboxD]];
        [PcLblV3 setText:[NSString TourD]];
        [PcLblV4 setText:[NSString BornD]];
        [PcLblV5 setText:[NSString BirthdayD]];
        [PcLblV6 setText:[NSString NewsD]];
        [PcLblV7 setText:[NSString NotesD]];
        [PcLblV8 setText:[NSString GalleryD]];
        [PcLblV9 setText:[NSString statNameD]];
    }
   // [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(updateNewDate) userInfo:nil repeats:YES];
    
}
-(void)updateNewDate{
    
    NSLog(@"updateNewDate");
    
    [self.view setNeedsDisplay];
    
}

-(void)sendSMS{

    forchild = [[NSMutableArray alloc] init];
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@all_childlist.php?room_id=%@&SubDomainId=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    NSLog(@"===== %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSError* error = nil;
    NSLog(@"%@", urlString);
    NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL //1
                                   
                                   options:kNilOptions
                                   error:&error];
    
    for(NSMutableDictionary *dict in result)
    {
        [forchild addObject:dict];
    }
    
    NSLog(@"arrayyyy....%@",forchild);
    
   pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    
    okCls = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls.frame = CGRectMake(790, 30, 120/2, 120/2);
    okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
    [okCls addTarget:self action:@selector(closevistr) forControlEvents:UIControlEventTouchUpInside];
    okCls.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls];
    
    
    DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(240, 160-80, 550, 350+40+200)];
    DeatilsView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView];
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 550, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.font = [UIFont fontWithName:@"Roboto-Regular" size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:ttPOP];

    
    checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox setFrame:CGRectMake(20, 70, 140.0f, 41/2)];
    [checkbox setImageEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 0)];
    [checkbox setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox.titleLabel setFont:[UIFont fontWithName:@"Roboto-Light" size:16]];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox.tag = 1;
    [checkbox setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox addTarget:self action:@selector(bto_action:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:checkbox];
    
    
    checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox2 setFrame:CGRectMake(175, 70, 140.0f, 41/2)];
    [checkbox2 setImageEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 0)];
    [checkbox2 setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox2.titleLabel setFont:[UIFont fontWithName:@"Roboto-Light" size:16]];
    [checkbox2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox2 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox2.tag = 2;
    [checkbox2 setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox2 setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox2 setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox2 addTarget:self action:@selector(bto_action_all:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:checkbox2];
    checkbox2.selected=YES;
    
    ttPOPScrl = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 320, 30)];
    ttPOPScrl.backgroundColor = [UIColor clearColor];
    ttPOPScrl.textColor = [UIColor grayColor];
    ttPOPScrl.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
    ttPOPScrl.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:ttPOPScrl];
    
    
    totalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 130, 320, 180)];
    totalScrollView.delegate=self;
    totalScrollView.backgroundColor=[UIColor clearColor];
    totalScrollView.showsHorizontalScrollIndicator = NO;
    totalScrollView.showsVerticalScrollIndicator = NO;
    totalScrollView.contentSize = CGSizeMake(320,400);
    [DeatilsView addSubview:totalScrollView];
    
    
    
    float y=0;
    for(int i=0;i<[forchild count];i++)
    {
    
        NSLog(@"====...%@",[[forchild objectAtIndex:i] objectForKey:@"name"]);
    
       UIButton *checkbox_new = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkbox_new setFrame:CGRectMake(10, 20+y, 41/2, 41/2)];
        checkbox_new.tag = [[[forchild objectAtIndex:i] objectForKey:@"id"] integerValue];
        [checkbox_new setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
        [checkbox_new setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
        [checkbox_new setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
        [checkbox_new setTitle:@"Vel børn" forState:UIControlStateNormal];
        [checkbox_new addTarget:self action:@selector(bto_actionloop:) forControlEvents:UIControlEventTouchUpInside];
        [totalScrollView addSubview:checkbox_new];
        
        
        UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(40, 20+y, 210, 30)];
        ttPOP.backgroundColor = [UIColor clearColor];
        ttPOP.textColor = [UIColor grayColor];
        ttPOP.text =[[forchild objectAtIndex:i] objectForKey:@"name"];
        ttPOP.font = [UIFont fontWithName:@"Roboto-Regular" size:20];
        ttPOP.textAlignment = NSTextAlignmentCenter;
        [totalScrollView addSubview:ttPOP];
        
        
        y=y+30;
        totalScrollView.contentSize = CGSizeMake(320,50+y);
    }
    
    
    UILabel *ttPOPScrl_new = [[UILabel alloc] initWithFrame:CGRectMake(10, 325, 320, 30)];
    ttPOPScrl_new.backgroundColor = [UIColor clearColor];
    ttPOPScrl_new.textColor = [UIColor grayColor];
    ttPOPScrl_new.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
    ttPOPScrl_new.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:ttPOPScrl_new];
    
    
    MsgArea = [[UITextView alloc]initWithFrame:CGRectMake(10,355,530,160)];
    MsgArea.font = [UIFont systemFontOfSize:17];

    [[MsgArea layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[MsgArea layer] setBorderWidth:1];
   // [[MsgArea layer] setCornerRadius:15];
    MsgArea.textColor = [UIColor grayColor];
    MsgArea.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2f];
    MsgArea.delegate = self;
    MsgArea.editable = YES;
    [DeatilsView addSubview:MsgArea];
    
    
    UIButton *svec = [UIButton buttonWithType:UIButtonTypeCustom];
    svec.frame = CGRectMake(440, 355+160+10,80,40);
    [svec setBackgroundColor:[UIColor grayColor]];
    [svec addTarget:self action:@selector(sendallsms) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:svec];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
            ttPOP.text = [NSString SmsInboxF];
            [checkbox setTitle:[NSString SelectAllChildF] forState:UIControlStateNormal];
            [checkbox2 setTitle:[NSString SelectChildF] forState:UIControlStateNormal];
            ttPOPScrl.text = [NSString SelectChildF];
            ttPOPScrl_new.text = [NSString MessageF];
        [svec setTitle:[NSString SendF] forState:UIControlStateNormal];
        [svec setTitle:[NSString SendF] forState:UIControlStateSelected];
        [svec setTitle:[NSString SendF] forState:UIControlStateHighlighted];
    }
    
    else
    {
        ttPOP.text = [NSString SmsInboxD];
        [checkbox setTitle:[NSString SelectAllChildD] forState:UIControlStateNormal];
        [checkbox2 setTitle:[NSString SelectChildD] forState:UIControlStateNormal];
        ttPOPScrl.text = [NSString SelectChildD];
        ttPOPScrl_new.text = [NSString MessageD];
        [svec setTitle:[NSString SendD] forState:UIControlStateNormal];
        [svec setTitle:[NSString SendD] forState:UIControlStateSelected];
        [svec setTitle:[NSString SendD] forState:UIControlStateHighlighted];
    }
    
}
-(void)sendallsms
{

    NSLog(@"allll...%i",all);
    
    if(all == YES){
    
    // all multilple selected
        
        
        NSError *error=nil;
        prefs= [NSUserDefaults standardUserDefaults];
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@send_sms.php?type=selected_child&child_id=%@&room_id=%@&message=%@&SubDomainId=%@",APPS_DOMAIN_URL,countPpl,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],MsgArea.text,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        
        NSLog(@"===%@",urlString1);
        
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        
        
    }else{
    
        NSError *error=nil;
        prefs= [NSUserDefaults standardUserDefaults];
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@send_sms.php?type=all_child&room_id=%@&message=%@&SubDomainId=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],MsgArea.text,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        
        NSLog(@"===%@",urlString1);
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
        NSLog(@"serveroutput--- %@",serverOutput);
        
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Message send successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];

    [self closevistr];

}

-(void)bto_actionloop:(UIButton *)sender{
    
    
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
        NSLog(@"-------------------------> IF gotElement");
        [countIndx addObject:[NSString stringWithFormat:@"%ld", (long)targetButton.tag]];
    } else {
        NSLog(@"-------------------------> ELSE gotElement");
        [countIndx removeObjectAtIndex:index];
    }
    
    
    
    NSString *cntPPL;
    countPpl=NULL;
    
    NSLog(@",,,,.....,,,,%@",countIndx);
    
    for(cntPPL in countIndx){
        
        if(countPpl.length == 0 ){
            countPpl=cntPPL;
            NSLog(@"-------------------------> IF");
        }else{
            NSLog(@"-------------------------> ELSE");
            countPpl = [NSString stringWithFormat:@"%@,%@",countPpl,cntPPL];
            
        }
        
    }

    NSLog(@"countPpl...%@",countPpl);

}

-(void)bto_action_all:(UIButton *)sender{
    
    UIButton *targetButton = (UIButton *)sender;
    
    if(![targetButton isSelected]){
        [targetButton setSelected:YES];
        checkbox.selected=NO;
        totalScrollView.hidden=NO;
        ttPOPScrl.hidden=NO;
        all=YES;
    }else{
        [targetButton setSelected:NO];
        totalScrollView.hidden=YES;
        ttPOPScrl.hidden=YES;
        all=NO;
    }
}
-(void)bto_action:(UIButton *)sender{
    
    UIButton *targetButton = (UIButton *)sender;
    
    if(![targetButton isSelected]){
        [targetButton setSelected:YES];
        checkbox2.selected=NO;
        totalScrollView.hidden=YES;
        ttPOPScrl.hidden=YES;
        all=NO;
    }else{
        [targetButton setSelected:NO];
        totalScrollView.hidden=NO;
        ttPOPScrl.hidden=NO;
        all=YES;
    }
    
    
}
-(void)keyboardWillShow {

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

        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3]; // if you want to slide up the view
        //NSLog(@"setViewMovedUp");
        CGRect rect = self.view.frame;
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        self.view.frame = rect;
        //self.view.frame = rect;
        
        [UIView commitAnimations];
    
}
-(void)closevistr{
    [countIndx removeAllObjects];
    [pickerBack removeFromSuperview];
    [DeatilsView removeFromSuperview];
    [okCls removeFromSuperview];
}
-(void)backOut{
    
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
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
-(void)goKomin{

    
    
    MAListngKominViewController *ViewModel = [[MAListngKominViewController alloc] init];
    ViewModel.pageId = pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}
-(void)goHome{

    MAListingHomeViewController *ViewModel = [[MAListingHomeViewController alloc] init];
    ViewModel.pageId = pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];

}
-(void)goBorn{

    MAListingBornViewController *ViewModel = [[MAListingBornViewController alloc] init];
    ViewModel.pageId = pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];

}
-(void)goBirthDay{

    MAListingBirthdayViewController *ViewModel = [[MAListingBirthdayViewController alloc] init];
    ViewModel.pageId = pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];

}
-(void)gotour{
    
    MATourViewController *ViewModel = [[MATourViewController alloc] init];
    ViewModel.pageId = pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}

-(void)goNews
{
    MANewsViewController *News = [[MANewsViewController alloc]init];
    [self.navigationController pushViewController:News animated:NO];
}
-(void)goNote
{
    MANotesViewController *News = [[MANotesViewController alloc]init];
    [self.navigationController pushViewController:News animated:NO];
}
-(void)goGallery
{
    MAAlbumViewController *News = [[MAAlbumViewController alloc]init];
    [self.navigationController pushViewController:News animated:NO];
}

-(void)Registration
{
    MARegistrationViewController *Registration = [[MARegistrationViewController alloc]init];
    [self.navigationController pushViewController:Registration animated:NO];
}
-(void)gostat
{
    MAStatViewController *vc = [[MAStatViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
