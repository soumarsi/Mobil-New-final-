//
//  MAAlbumViewController.m
//  Mobil
//
//  Created by Soumarsi Kundu on 19/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import "MAAlbumViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "MARegistrationViewController.h"
#import "RTSpinKitView.h"
#import "UIImageView+WebCache.h"
#import "MAAlbumDetailsViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "Model.h"
@interface MAAlbumViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPopoverControllerDelegate>
{
    UIView *mainView,*leftview;
    UIButton *leftmenuBt;
    UILabel *totlCountMem,*AddNewLabel;
    UITableViewCell *cell;
    UITableView * FindUser;
    UIView *Blackview,*WhiteView;
    UITextView *CoemtText;
    NSString *check;
    NSMutableArray *data_retrived;
    NSOperationQueue *downloadQueue;
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
    UIPopoverController *popover;
    Mymodel *obj1;

}
@property (nonatomic, strong) ALAssetsLibrary *specialLibrary;
@end

@implementation MAAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [registration addTarget:self action:@selector(Registration) forControlEvents:UIControlEventTouchUpInside];
   // [leftview addSubview:registration];
    
    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    totlCountMem = [[UILabel alloc] initWithFrame:CGRectMake(290, 80, 300, 44)];
    totlCountMem.backgroundColor = [UIColor clearColor];
    totlCountMem.textColor = [UIColor whiteColor];
    totlCountMem.text = @"";
    totlCountMem.font = [UIFont fontWithName:GLOBALTEXTFONT size:25];
    totlCountMem.textAlignment = NSTextAlignmentLeft;
    totlCountMem.hidden=YES;
    [mainView addSubview:totlCountMem];
    
    
    UIButton *AddAlbumButton = [[UIButton alloc]initWithFrame:CGRectMake(630.0f, 100.0f, 115.0f, 30)];
    [AddAlbumButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [AddAlbumButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AddAlbumButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:13];
    AddAlbumButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddAlbumButton addTarget:self action:@selector(AddAlbumButton:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:AddAlbumButton];
    
    
    Blackview = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [Blackview setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:Blackview];
    [Blackview setHidden:YES];
    
    WhiteView = [[UIView alloc]init];
    [WhiteView setBackgroundColor:[UIColor whiteColor]];
    WhiteView.layer.cornerRadius = 3.0f;
    [self.view addSubview:WhiteView];
    [WhiteView setHidden:YES];
    
    AddNewLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 15.0f, 240.0f, 35.0f)];
    [AddNewLabel setBackgroundColor:[UIColor clearColor]];
    [AddNewLabel setTextAlignment:NSTextAlignmentLeft];
    [AddNewLabel setTextColor:[UIColor blackColor]];
    [AddNewLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:25]];
    [WhiteView addSubview:AddNewLabel];
    
    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(35.0f, 65.0f, 420.0f, 1.5f)];
    [lineview setBackgroundColor:[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]];
    [WhiteView addSubview:lineview];
    
    UIButton *CrossButton = [[UIButton alloc]initWithFrame:CGRectMake(460.0f, 7.5f, 28, 28)];
    [CrossButton setBackgroundImage:[UIImage imageNamed:@"NewsCross"] forState:UIControlStateNormal];
    [CrossButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:CrossButton];

    UILabel *AlbumName = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 75.0f, 150.0f, 30.0f)];
    [AlbumName setBackgroundColor:[UIColor clearColor]];
    [AlbumName setTextAlignment:NSTextAlignmentLeft];
    [AlbumName setTextColor:[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]];
    [AlbumName setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [WhiteView addSubview:AlbumName];
    
    AlbumTextField = [[UITextField alloc]initWithFrame:CGRectMake(35.0f, 110.0f, 420.0f, 40.0f)];
    [AlbumTextField setBackgroundColor:[UIColor clearColor]];
    [AlbumTextField setTextAlignment:NSTextAlignmentLeft];
    AlbumTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AlbumTextField setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
    [AlbumTextField setTextColor:[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 5)];
    [AlbumTextField setLeftView:leftView];
    [AlbumTextField setLeftViewMode:UITextFieldViewModeAlways];
    [AlbumTextField setDelegate:self];
    [AlbumTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [WhiteView addSubview:AlbumTextField];
    AlbumTextField.layer.borderWidth = 1.5f;
    AlbumTextField.layer.borderColor = [[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]CGColor];
    AlbumTextField.layer.cornerRadius = 3.0f;
    

    UILabel *AlbumDescription = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 160.0f, 200.0f, 30.0f)];
    [AlbumDescription setBackgroundColor:[UIColor clearColor]];
    [AlbumDescription setTextAlignment:NSTextAlignmentLeft];
    [AlbumDescription setTextColor:[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]];
    [AlbumDescription setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [WhiteView addSubview:AlbumDescription];

    CoemtText = [[UITextView alloc]initWithFrame:CGRectMake(35,210,420,153)];
    CoemtText.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    CoemtText.backgroundColor = [UIColor clearColor];
    CoemtText.textColor = [UIColor grayColor];
    CoemtText.scrollEnabled = YES;
    CoemtText.pagingEnabled = YES;
    CoemtText.editable = YES;
    CoemtText.delegate = self;
    CoemtText.layer.borderWidth = 1.5f;
    CoemtText.layer.borderColor = [[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1] CGColor];
    CoemtText.textAlignment = NSTextAlignmentLeft;
    CoemtText.layer.cornerRadius = 3.0f;
    [CoemtText setAutocorrectionType:UITextAutocorrectionTypeNo];
    [WhiteView addSubview:CoemtText];
    
    UILabel *ImagesLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 372.0f, 200.0f, 30.0f)];
    [ImagesLabel setBackgroundColor:[UIColor clearColor]];
    [ImagesLabel setTextAlignment:NSTextAlignmentLeft];
    [ImagesLabel setTextColor:[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]];
    [ImagesLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [WhiteView addSubview:ImagesLabel];
    
    
    UIButton *Choosenfile = [[UIButton alloc]initWithFrame:CGRectMake(35, 410, 125, 32)];
    [Choosenfile setBackgroundImage:[UIImage imageNamed:@"choosenfile"] forState:UIControlStateNormal];
    [Choosenfile setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Choosenfile.titleLabel.textAlignment = NSTextAlignmentCenter;
    Choosenfile.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:18];
    [Choosenfile addTarget:self action:@selector(getimage) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:Choosenfile];
    
    
    ImageLabelName = [[UILabel alloc]initWithFrame:CGRectMake(170, 410, 170, 32)];
    [ImageLabelName setTextAlignment:NSTextAlignmentLeft];
    [ImageLabelName setTextColor:[UIColor colorWithRed:(179.0f/255.0f) green:(179.0f/255.0f) blue:(179.0f/255.0f) alpha:1]];
    [ImageLabelName setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16]];
    [WhiteView addSubview:ImageLabelName];
    
    UIButton *CloseButton = [[UIButton alloc]initWithFrame:CGRectMake(277.0f, 460.0f, 84.0f, 32)];
    [CloseButton setBackgroundColor:[UIColor colorWithRed:(97.0f/255.0f) green:(97.0f/255.0f) blue:(97.0f/255.0f) alpha:1.0f]];
    [CloseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CloseButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    CloseButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [CloseButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:CloseButton];
    
    SubmitButton = [[UIButton alloc]initWithFrame:CGRectMake(370.0f, 460.0f, 84.0f, 32)];
    [SubmitButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [SubmitButton setTitle:@"Ok" forState:UIControlStateNormal];
    [SubmitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SubmitButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    SubmitButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [SubmitButton addTarget:self action:@selector(SubmitButton:) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:SubmitButton];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
        pageTitle.text = [NSString GalleryF];
            [AddAlbumButton setTitle:[NSString AddAlbumF] forState:UIControlStateNormal];
            [AlbumName setText:[NSString stringWithFormat:@"%@:",[NSString NameF]]];
            [AlbumDescription setText:[NSString stringWithFormat:@"%@:",[NSString MessageF]]];
            [ImagesLabel setText:[NSString stringWithFormat:@"%@:",[NSString ImagesF]]];
            [Choosenfile setTitle:[NSString ChooseImagesF] forState:UIControlStateNormal];
            [CloseButton setTitle:[NSString CancelF] forState:UIControlStateNormal];
            [ImageLabelName setText:[NSString ImageLabelNameF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString GalleryD];
        [AddAlbumButton setTitle:[NSString AddAlbumD] forState:UIControlStateNormal];
        [AlbumName setText:[NSString stringWithFormat:@"%@:",[NSString NameD]]];
        [AlbumDescription setText:[NSString stringWithFormat:@"%@:",[NSString MessageD]]];
        [ImagesLabel setText:[NSString stringWithFormat:@"%@:",[NSString ImagesD]]];
        [Choosenfile setTitle:[NSString ChooseImagesD] forState:UIControlStateNormal];
        [CloseButton setTitle:[NSString CancelD] forState:UIControlStateNormal];
        [ImageLabelName setText:[NSString ImageLabelNameD]];
    }

    
    
    progress_value=0.07f;
}
- (void)_timerFired:(NSTimer *)timer
{

        progress_value=progress_value+0.07f;
    
    if (disp_value>90)
    {
         progress_title.text=@"Uploading...100%";
        [self Progress_close];
    }
    else
    {
        disp_value=progress_value*100;
        
        progress_title.text=[NSString stringWithFormat:@"Uploading...%d%%",disp_value];

    }
    
       upload_bar.progress=progress_value;

}

-(void)Progress_close
{

  

    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.0f;
        WhiteView.alpha = 0.0f;
        WhiteView.frame = CGRectMake(360, -50, 500, 520) ;

        
    } completion:^(BOOL finished) {
        
        [Blackview setHidden:YES];
        [WhiteView setHidden:YES];
        
        [progress_title removeFromSuperview];
        [upload_bar removeFromSuperview];
         upload_bar.progress=0.07f;
        progress_value=0.0f;
        disp_value=0;
        [progress_time invalidate];
        
    }];

    [self updatedata];
    
    

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
        
        urlString = [NSString stringWithFormat:@"%@fetch_album.php?admin_id=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
        NSLog(@" %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSError* error = nil;
        NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
        
        for(NSDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        
        totlCountMem.hidden=NO;
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            if([data_retrived count] > 0){
                
                [FindUser removeFromSuperview];
                [backView removeFromSuperview];
                
                [self removePulseLoader];
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
                [FindUser removeFromSuperview];
                [backView removeFromSuperview];
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

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ceil((float)[data_retrived count] / 3);;
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
    
    NSUInteger firstPhotoInCell = indexPath.row * 3;
    
    NSUInteger lastPhotoInCell  = firstPhotoInCell + 3;
    
    if ([data_retrived count] <= firstPhotoInCell) {
        
        return nil;
        
    }
    
    NSUInteger currentPhotoIndex = 0;
    
    
    
    
    NSUInteger lastPhotoIndex = MIN(lastPhotoInCell,[data_retrived count]);
    
    for ( ; firstPhotoInCell + currentPhotoIndex < lastPhotoIndex ; currentPhotoIndex++) {
        
        float padLeft = (14 * (currentPhotoIndex + 1)) + (currentPhotoIndex * 227);
        Imagearray  = [[NSMutableArray alloc]init];
        
        Imagearray =[[data_retrived objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"images"];
        
        for (int k = 0; k< Imagearray.count; k++)
        {
            if ([[NSString stringWithFormat:@"%@",[[Imagearray objectAtIndex:k]objectForKey:@"asCover"]] isEqualToString:@"1"])
            {
                UIImageView *AlbumImage = [[UIImageView alloc]initWithFrame:CGRectMake(padLeft,5.0f, 227.0f, 216)];
                [AlbumImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@image_crop_thumb.php?img_path=http://ansa.fo/upload/albums/normal/%@&width=227&height=216",APPS_DOMAIN_URL,[[Imagearray objectAtIndex:k]objectForKey:@"image"]]] placeholderImage:[UIImage imageNamed:@"demoimage"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
                AlbumImage.tag = firstPhotoInCell+currentPhotoIndex;
                AlbumImage.clipsToBounds = YES;
                [cell addSubview:AlbumImage];
                
                UIView *ShadowView = [[UIView alloc]initWithFrame:CGRectMake(padLeft,45, 227.0f, 216)];
                [ShadowView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Shadowimage"]]];
                ShadowView.tag = firstPhotoInCell+currentPhotoIndex;
                [cell addSubview:ShadowView];
                
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
                [AlbumImage addGestureRecognizer:tap];
                tap.view.tag = firstPhotoInCell+currentPhotoIndex;
                [AlbumImage setUserInteractionEnabled:YES];
                
                UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
                [ShadowView addGestureRecognizer:tap2];
                tap.view.tag = firstPhotoInCell+currentPhotoIndex;
                [ShadowView setUserInteractionEnabled:YES];

            }
            else
            {
                UIImageView *AlbumImage = [[UIImageView alloc]initWithFrame:CGRectMake(padLeft,5.0f, 227.0f, 216)];
                [AlbumImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@image_crop_thumb.php?img_path=http://ansa.fo/upload/albums/normal/%@&width=227&height=216",APPS_DOMAIN_URL,[[Imagearray objectAtIndex:0]objectForKey:@"image" ]]] placeholderImage:[UIImage imageNamed:@"demoimage"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
                AlbumImage.tag = firstPhotoInCell+currentPhotoIndex;
                AlbumImage.clipsToBounds = YES;
                [cell addSubview:AlbumImage];
                
                UIView *ShadowView = [[UIView alloc]initWithFrame:CGRectMake(padLeft,45, 227.0f, 216)];
                [ShadowView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Shadowimage"]]];
                ShadowView.tag = firstPhotoInCell+currentPhotoIndex;
                [cell addSubview:ShadowView];
                
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
                [AlbumImage addGestureRecognizer:tap];
                tap.view.tag = firstPhotoInCell+currentPhotoIndex;
                [AlbumImage setUserInteractionEnabled:YES];
                
                UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
                [ShadowView addGestureRecognizer:tap2];
                tap.view.tag = firstPhotoInCell+currentPhotoIndex;
                [ShadowView setUserInteractionEnabled:YES];
            }
        }
        
        
        
        UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(padLeft, 216, 227, 45)];
        [NameLabel setBackgroundColor:[UIColor whiteColor]];
        [NameLabel setText:[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"album_name"]]];
        [NameLabel setTextAlignment:NSTextAlignmentCenter];
        [NameLabel setTextColor:[UIColor colorWithRed:(71.0f/255.0f) green:(71.0f/255.0f) blue:(71.0f/255.0f) alpha:1.0f]];
        [NameLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:20]];
        [cell addSubview:NameLabel];
        
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [NameLabel addGestureRecognizer:tap1];
        tap1.view.tag = firstPhotoInCell+currentPhotoIndex;
        [NameLabel setUserInteractionEnabled:YES];
        
        UIImageView *EditIcon = [[UIImageView alloc]initWithFrame:CGRectMake(padLeft+55, 165, 20, 23)];
        [EditIcon setImage:[UIImage imageNamed:@"AlbumEditicon"]];
        [cell addSubview:EditIcon];
        
        
        UIImageView *DetailsIcon = [[UIImageView alloc]initWithFrame:CGRectMake(padLeft+105, 165, 20, 23)];
        [DetailsIcon setImage:[UIImage imageNamed:@"albumdetails"]];
        [cell addSubview:DetailsIcon];
        
        UIImageView *DeleteIcon = [[UIImageView alloc]initWithFrame:CGRectMake(padLeft+155, 165, 20, 23)];
        [DeleteIcon setImage:[UIImage imageNamed:@"AlbumDeleteicon"]];
        [cell addSubview:DeleteIcon];
        
        UIButton *EditButton = [[UIButton alloc]initWithFrame:CGRectMake(padLeft+41.5f, 155, 45, 45)];
        [EditButton setBackgroundImage:[UIImage imageNamed:@"backgroundroundimage"] forState:UIControlStateNormal];
        [EditButton addTarget:self action:@selector(EditbuttonImage:) forControlEvents:UIControlEventTouchUpInside];
        EditButton.tag = firstPhotoInCell+currentPhotoIndex;
        [cell addSubview:EditButton];
        
        UIButton *DetailsButton = [[UIButton alloc]initWithFrame:CGRectMake(padLeft+91.5f, 155, 45, 45)];
        [DetailsButton setBackgroundImage:[UIImage imageNamed:@"backgroundroundimage"] forState:UIControlStateNormal];
        [DetailsButton addTarget:self action:@selector(DetailsbuttonImage:) forControlEvents:UIControlEventTouchUpInside];
        DetailsButton.tag = firstPhotoInCell+currentPhotoIndex;
        [cell addSubview:DetailsButton];
    
        UIButton *DeleteButton = [[UIButton alloc]initWithFrame:CGRectMake(padLeft+142, 155, 45, 45)];
        [DeleteButton setBackgroundImage:[UIImage imageNamed:@"backgroundroundimage"] forState:UIControlStateNormal];
        [DeleteButton addTarget:self action:@selector(DeletebuttonImage:) forControlEvents:UIControlEventTouchUpInside];
        DeleteButton.tag = firstPhotoInCell+currentPhotoIndex;
        [cell addSubview:DeleteButton];
        
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

-(void)AddAlbumButton:(UIButton *)sender
{
    check = @"add";
    
    [Blackview setHidden:NO];
    [WhiteView setHidden:NO];
    CoemtText.text = @"";
    AlbumTextField.text = @"";;
    Blackview.alpha = 0.0f;
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
          [AddNewLabel setText:[NSString AddAlbumF]];
    }
    else
    {
        [AddNewLabel setText:[NSString AddAlbumD]];
    }
  
    WhiteView.alpha = 0.0f;
    WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.8f;
        WhiteView.alpha = 1.0f;
        WhiteView.frame = CGRectMake(360, 110, 500, 520) ;
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)EditbuttonImage:(UIButton *)sender
{
    check = @"edit";
    
    [Blackview setHidden:NO];
    [WhiteView setHidden:NO];
    CoemtText.text = [NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"addDesc"]];
    AlbumTextField.text = [NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"album_name"]];
    SubmitButton.tag = sender.tag;
    Blackview.alpha = 0.0f;
    
    WhiteView.alpha = 0.0f;
    WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.8f;
        WhiteView.alpha = 1.0f;
        WhiteView.frame = CGRectMake(360, 110, 500, 520) ;
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            [AddNewLabel setText:[NSString EditAlbumF]];
        }
        else
        {
            [AddNewLabel setText:[NSString EditAlbumD]];
        }
        
    } completion:^(BOOL finished) {
        
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    CoemtText.textColor = [UIColor grayColor];
    return YES;
    
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    if ([CoemtText.text isEqualToString:@""]) {
        
        
    }
    else{
    }
    return YES;
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"]) {
        
        [CoemtText resignFirstResponder];
        
        return NO;
        
    }
     return YES;
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.6 animations:^{
        
        WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
        
    } completion:^(BOOL finished) {
        
        
    }];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.6 animations:^{
        
        WhiteView.frame = CGRectMake(360, 110, 500, 520) ;
        
    } completion:^(BOOL finished) {
        
        
    }];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.6 animations:^{
        
        WhiteView.frame = CGRectMake(360, 110, 500, 520) ;
        
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.6 animations:^{
        
        WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
        
    } completion:^(BOOL finished) {
        
        
    }];
}

-(void)Cross
{
    [CoemtText resignFirstResponder];
    [AlbumTextField resignFirstResponder];
    
    Blackview.alpha = 0.8f;
    WhiteView.alpha = 1.0f;
    WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.0f;
        WhiteView.alpha = 0.0f;
        WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
        
    } completion:^(BOOL finished) {
        
        [Blackview setHidden:YES];
        [WhiteView setHidden:YES];
    }];
}

-(void)SubmitButton:(UIButton *)sender
{
    [CoemtText resignFirstResponder];
    [AlbumTextField resignFirstResponder];
    
    //--//
    
    
    upload_bar=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    upload_bar.frame=CGRectMake(36,450,414,40);
    upload_bar.progress=0.07f;
    upload_bar.tintColor=[UIColor colorWithRed:(102.0f/255.0f) green:(211.0f/255.0f) blue:(250.0f/255.0f) alpha:1];
    upload_bar.backgroundColor=[UIColor clearColor];
    upload_bar.hidden=YES;
    [WhiteView addSubview:upload_bar];
    
    
    progress_title = [[UILabel alloc] initWithFrame:CGRectMake(36,450, 300,25)];
    progress_title.backgroundColor = [UIColor clearColor];
    progress_title.textColor = [UIColor lightGrayColor];
    progress_title.font = [UIFont fontWithName:GLOBALTEXTFONT size:14];
    progress_title.textAlignment = NSTextAlignmentLeft;
    progress_title.text=[NSString stringWithFormat:@"Uploading...0%%"];
    progress_title.hidden=YES;
    [WhiteView addSubview:progress_title];


    
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
    
    if ([check isEqualToString:@"add"])
    {
        if ([AlbumTextField.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva Stovna navn" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else if ([CoemtText.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva Stovna Tekstur" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else if ([ImageLabelName.text isEqualToString:@"Eingin mynd"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva vel myndir" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            
//            UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(245, 460, 30, 30)];
//            progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//            [WhiteView addSubview: progress];
//            [progress startAnimating];
            
            upload_bar.hidden=NO;
            progress_title.hidden=NO;
            
            
           downloadQueue = [[NSOperationQueue alloc]init];
           [downloadQueue addOperationWithBlock:^{
            
                
                NSError *error;
                
                NSData *adddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@add_album.php?adminid=%@&userid=%@&album_name=%@&room_id=%@&description=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[AlbumTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[CoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]options:NSDataReadingUncached error:&error];
                
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:adddata options:kNilOptions error:&error];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
                    

        for (int j = 0; j<images.count; j++)
        {
            int l;
            if (j == 0)
            {
                 l = 1;
            }
            else
            {
                l = 0;
            }
            UIImage *MainImage = [images objectAtIndex:j];
            
            NSURLResponse *ResponsE = nil;
            NSError *ErroR;
            
            NSString *ImageURLString = [NSString stringWithFormat:@"%@add_albumimage.php?id=%@&adminid=%@&order=%d&asCover=%d",APPS_DOMAIN_URL,[dict objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],j+1,l];
            
            
            NSData *imageData = UIImageJPEGRepresentation(MainImage, 1.0);
            NSURL* requestURL = [NSURL URLWithString:ImageURLString];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
            [request setHTTPShouldHandleCookies:NO];
            [request setURL:requestURL];
            [request setTimeoutInterval:30];
            [request setHTTPMethod:@"POST"];
            
            NSString *boundary = [NSString stringWithFormat:@"%0.9u",arc4random()];
            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
            [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
            NSMutableData *body = [NSMutableData data];
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"albumimage\"; filename=\"Albummage_%d.jpg\"\r\n",j+1] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Type: image/png\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [body appendData:[NSData dataWithData:imageData]];
            
            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [request setHTTPBody:body];
            
            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&ResponsE error:&ErroR];
            
            if (!ErroR)
            {
                
                NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
                
                NSLog(@"retustr--> %@", returnString);
                
            }
        }
                    //[progress stopAnimating];
                    [CoemtText resignFirstResponder];
                    [AlbumTextField resignFirstResponder];
                    
                    Blackview.alpha = 0.8f;
                    WhiteView.alpha = 1.0f;
                    WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
//                    [UIView animateWithDuration:0.8 animations:^{
//                        Blackview.alpha = 0.0f;
//                        WhiteView.alpha = 0.0f;
//                        WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
//                        
//                    } completion:^(BOOL finished) {
                    
                        
                    progress_time = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerFired:)
                                                                   userInfo:nil repeats:YES];
                    progress_title.hidden=NO;
                    upload_bar.hidden=NO;
                        
                        
//                        
//                        [Blackview setHidden:YES];
//                        [WhiteView setHidden:YES];
                   // }];
                   // [self updatedata];
        }];
    }];
    }
}
    else
    {
        if ([AlbumTextField.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva Stovna navn" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else if ([CoemtText.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Skriva Stovna Tekstur" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
//            UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(245, 460, 30, 30)];
//            progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//            [WhiteView addSubview: progress];
//            [progress startAnimating];
            
             progress_title.hidden=NO;
            
            
            downloadQueue = [[NSOperationQueue alloc]init];
            [downloadQueue addOperationWithBlock:^{
                NSError *error;
                NSData *adddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@update_album.php?album_name=%@&description=%@&id=%@",APPS_DOMAIN_URL,[AlbumTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[CoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]]]]options:NSDataReadingUncached error:&error];
                
                 NSString *string = [[NSString alloc] initWithData:adddata encoding:NSUTF8StringEncoding] ;
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    if ([string isEqualToString:@"success"])
                    {
                    
                        if (images.count == 0)
                        {
                           // [progress stopAnimating];
                            [CoemtText resignFirstResponder];
                            [AlbumTextField resignFirstResponder];
                            
                            Blackview.alpha = 0.8f;
                            WhiteView.alpha = 1.0f;
                            WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
//                            [UIView animateWithDuration:0.8 animations:^{
//                                Blackview.alpha = 0.0f;
//                                WhiteView.alpha = 0.0f;
//                                WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
//                                
//                            } completion:^(BOOL finished) {
//                                
//                                [Blackview setHidden:YES];
//                                [WhiteView setHidden:YES];
//                            }];
                            
                progress_time = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerFired:)
                                                                           userInfo:nil repeats:YES];
                        progress_title.hidden=NO;
                            upload_bar.hidden=NO;
                            
                           // [self updatedata];
                        }
                   else
                   {
                    
                    for (int j = 0; j<images.count; j++)
                    {
                        
                        NSLog(@"image------> :%@",images);
                        
                        NSLog(@"dataarray---> %@", data_retrived);
                        
                        NSLog(@"dataobject------> %@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"images"]);
                        
                        NSMutableArray *array = [[NSMutableArray alloc]init];
                        array = [[data_retrived objectAtIndex:sender.tag]objectForKey:@"images"];
                        long l = array.count;
            
                        UIImage *MainImage = [images objectAtIndex:j];
                        
                        NSURLResponse *ResponsE = nil;
                        NSError *ErroR;
                        
                        NSString *ImageURLString = [NSString stringWithFormat:@"%@add_albumimage.php?id=%@&adminid=%@&order=%ld&asCover=0",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]],[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],l+j+1];
                        
                        NSLog(@"mainimage-----%@",ImageURLString);
                        
                        NSData *imageData = UIImageJPEGRepresentation(MainImage, 1.0);
                        NSURL* requestURL = [NSURL URLWithString:ImageURLString];
                        
                        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
                        [request setHTTPShouldHandleCookies:NO];
                        [request setURL:requestURL];
                        [request setTimeoutInterval:30];
                        [request setHTTPMethod:@"POST"];
                        
                        NSString *boundary = [NSString stringWithFormat:@"%0.9u",arc4random()];
                        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
                        [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
                        NSMutableData *body = [NSMutableData data];
                        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"albumimage\"; filename=\"Albummage_%ld.jpg\"\r\n",l+j+1] dataUsingEncoding:NSUTF8StringEncoding]];
                        [body appendData:[[NSString stringWithFormat:@"Content-Type: image/png\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                        [body appendData:[NSData dataWithData:imageData]];
                        
                        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                        
                        [request setHTTPBody:body];
                        
                        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&ResponsE error:&ErroR];
                        
                        if (!ErroR)
                        {
                            
                            NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
                            
                            NSLog(@"retustr--> %@", returnString);
                            
                        }
                    }
                       //[progress stopAnimating];
                       [CoemtText resignFirstResponder];
                       [AlbumTextField resignFirstResponder];
                       
                       Blackview.alpha = 0.8f;
                       WhiteView.alpha = 1.0f;
                       WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
//                       [UIView animateWithDuration:0.8 animations:^{
//                           Blackview.alpha = 0.0f;
//                           WhiteView.alpha = 0.0f;
//                           WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
//                           
//                       } completion:^(BOOL finished) {
//                           
//                           [Blackview setHidden:YES];
//                           [WhiteView setHidden:YES];
//                       }];
                       
            progress_time = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerFired:)
                                                                      userInfo:nil repeats:YES];
                       progress_title.hidden=NO;
                       upload_bar.hidden=NO;
                       
                     //  [self updatedata];
                         }
                    }
                }];
            }];
        }

    }
    }
    else
    {
        if ([check isEqualToString:@"add"])
        {
            if ([AlbumTextField.text isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste navn" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else if ([CoemtText.text isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste tekst" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else if ([ImageLabelName.text isEqualToString:@"Intet billede"])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Vælg billeder" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else
            {
                
//                UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(245, 460, 30, 30)];
//                progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//                [WhiteView addSubview: progress];
//                [progress startAnimating];
                
                 progress_title.hidden=NO;
                
                
                downloadQueue = [[NSOperationQueue alloc]init];
                [downloadQueue addOperationWithBlock:^{
                    
                    NSError *error;
                    
                    NSData *adddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@add_album.php?adminid=%@&userid=%@&album_name=%@&room_id=%@&description=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[AlbumTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[CoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]options:NSDataReadingUncached error:&error];
                    
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:adddata options:kNilOptions error:&error];
                    
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        
                        
                        
                        for (int j = 0; j<images.count; j++)
                        {
                            int l;
                            if (j == 0)
                            {
                                l = 1;
                            }
                            else
                            {
                                l = 0;
                            }
                            UIImage *MainImage = [images objectAtIndex:j];
                            
                            NSURLResponse *ResponsE = nil;
                            NSError *ErroR;
                            
                            NSString *ImageURLString = [NSString stringWithFormat:@"%@add_albumimage.php?id=%@&adminid=%@&order=%d&asCover=%d",APPS_DOMAIN_URL,[dict objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],j+1,l];
                            
                            
                            NSData *imageData = UIImageJPEGRepresentation(MainImage, 1.0);
                            NSURL* requestURL = [NSURL URLWithString:ImageURLString];
                            
                            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
                            [request setHTTPShouldHandleCookies:NO];
                            [request setURL:requestURL];
                            [request setTimeoutInterval:30];
                            [request setHTTPMethod:@"POST"];
                            
                            NSString *boundary = [NSString stringWithFormat:@"%0.9u",arc4random()];
                            NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
                            [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
                            NSMutableData *body = [NSMutableData data];
                            [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"albumimage\"; filename=\"Albummage_%d.jpg\"\r\n",j+1] dataUsingEncoding:NSUTF8StringEncoding]];
                            [body appendData:[[NSString stringWithFormat:@"Content-Type: image/png\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                            
                            [body appendData:[NSData dataWithData:imageData]];
                            
                            [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                            
                            [request setHTTPBody:body];
                            
                            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&ResponsE error:&ErroR];
                            
                            if (!ErroR)
                            {
                                
                                NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
                                
                                NSLog(@"retustr--> %@", returnString);
                                
                            }
                        }
                       // [progress stopAnimating];
                        [CoemtText resignFirstResponder];
                        [AlbumTextField resignFirstResponder];
                        
                        Blackview.alpha = 0.8f;
                        WhiteView.alpha = 1.0f;
                        WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
//                        [UIView animateWithDuration:0.8 animations:^{
//                            Blackview.alpha = 0.0f;
//                            WhiteView.alpha = 0.0f;
//                            WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
//                            
//                        } completion:^(BOOL finished) {
//                            
//                            [Blackview setHidden:YES];
//                            [WhiteView setHidden:YES];
//                        }];
                        
                        progress_time = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerFired:)
                                                                       userInfo:nil repeats:YES];
                        progress_title.hidden=NO;
                        upload_bar.hidden=NO;
                        
                        
                      //  [self updatedata];
                    }];
                }];
            }
        }
        else
        {
            if ([AlbumTextField.text isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste navn" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else if ([CoemtText.text isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Mangler at indtaste tekst" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alert show];
            }
            else
            {
//                UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(245, 460, 30, 30)];
//                progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//                [WhiteView addSubview: progress];
//                [progress startAnimating];
                
                 progress_title.hidden=NO;
                
                
                downloadQueue = [[NSOperationQueue alloc]init];
                [downloadQueue addOperationWithBlock:^{
                    NSError *error;
                    NSData *adddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@update_album.php?album_name=%@&description=%@&id=%@",APPS_DOMAIN_URL,[AlbumTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[CoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]]]]options:NSDataReadingUncached error:&error];
                    
                    NSString *string = [[NSString alloc] initWithData:adddata encoding:NSUTF8StringEncoding] ;
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        
                        if ([string isEqualToString:@"success"])
                        {
                            
                            if (images.count == 0)
                            {
                               // [progress stopAnimating];
                                [CoemtText resignFirstResponder];
                                [AlbumTextField resignFirstResponder];
                                
                                Blackview.alpha = 0.8f;
                                WhiteView.alpha = 1.0f;
                                WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
                                [UIView animateWithDuration:0.8 animations:^{
                                    Blackview.alpha = 0.0f;
                                    WhiteView.alpha = 0.0f;
                                    WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
                                    
                                } completion:^(BOOL finished) {
                                    
                                    [Blackview setHidden:YES];
                                    [WhiteView setHidden:YES];
                                }];
                                
                              //  [self updatedata];
                            }
                            else
                            {
                                
                                for (int j = 0; j<images.count; j++)
                                {
                                    
                                    NSLog(@"image------> :%@",images);
                                    
                                    NSLog(@"dataarray---> %@", data_retrived);
                                    
                                    NSLog(@"dataobject------> %@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"images"]);
                                    
                                    NSMutableArray *array = [[NSMutableArray alloc]init];
                                    array = [[data_retrived objectAtIndex:sender.tag]objectForKey:@"images"];
                                    long l = array.count;
                                    
                                    UIImage *MainImage = [images objectAtIndex:j];
                                    
                                    NSURLResponse *ResponsE = nil;
                                    NSError *ErroR;
                                    
                                    NSString *ImageURLString = [NSString stringWithFormat:@"%@add_albumimage.php?id=%@&adminid=%@&order=%ld&asCover=0",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]],[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],l+j+1];
                                    
                                    NSLog(@"mainimage-----%@",ImageURLString);
                                    
                                    NSData *imageData = UIImageJPEGRepresentation(MainImage, 1.0);
                                    NSURL* requestURL = [NSURL URLWithString:ImageURLString];
                                    
                                    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                                    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
                                    [request setHTTPShouldHandleCookies:NO];
                                    [request setURL:requestURL];
                                    [request setTimeoutInterval:30];
                                    [request setHTTPMethod:@"POST"];
                                    
                                    NSString *boundary = [NSString stringWithFormat:@"%0.9u",arc4random()];
                                    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
                                    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
                                    NSMutableData *body = [NSMutableData data];
                                    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                                    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"albumimage\"; filename=\"Albummage_%ld.jpg\"\r\n",l+j+1] dataUsingEncoding:NSUTF8StringEncoding]];
                                    [body appendData:[[NSString stringWithFormat:@"Content-Type: image/png\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                                    
                                    [body appendData:[NSData dataWithData:imageData]];
                                    
                                    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                                    
                                    [request setHTTPBody:body];
                                    
                                    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&ResponsE error:&ErroR];
                                    
                                    if (!ErroR)
                                    {
                                        
                                        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
                                        
                                        NSLog(@"retustr--> %@", returnString);
                                        
                                    }
                                }
                                //[progress stopAnimating];
                                [CoemtText resignFirstResponder];
                                [AlbumTextField resignFirstResponder];
                                
                                Blackview.alpha = 0.8f;
                                WhiteView.alpha = 1.0f;
                                WhiteView.frame = CGRectMake(360, 50, 500, 520) ;
//                                [UIView animateWithDuration:0.8 animations:^{
//                                    Blackview.alpha = 0.0f;
//                                    WhiteView.alpha = 0.0f;
//                                    WhiteView.frame = CGRectMake(360, -50, 500, 520) ;
//                                    
//                                } completion:^(BOOL finished) {
//                                    
//                                    [Blackview setHidden:YES];
//                                    [WhiteView setHidden:YES];
//                                }];
                                
                                progress_time = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(_timerFired:)
                                                                               userInfo:nil repeats:YES];
                                progress_title.hidden=NO;
                                upload_bar.hidden=NO;
                                
//                                [self updatedata];
                            }
                        }
                    }];
                }];
            }
            
        }

    }
    


}

-(void)updatedata
{
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
        
        urlString = [NSString stringWithFormat:@"%@fetch_album.php?admin_id=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
        NSLog(@"edit %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSError* error = nil;
        NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
        
        for(NSDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        
        totlCountMem.hidden=NO;
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            if([data_retrived count] > 0){
                
                [FindUser removeFromSuperview];
                [backView removeFromSuperview];
                
                [self removePulseLoader];
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
                
                [FindUser removeFromSuperview];
                [backView removeFromSuperview];
                
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

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView == DeleteAlert) {
  
    
    if(buttonIndex == 0)//OK button pressed
    {
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            
            NSError *error;
            
            NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@delete_album.php?admin_id=%@&table_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:alertView.tag]objectForKey:@"id"]]]]options:NSDataReadingUncached error:&error];
            
            NSString *string = [[NSString alloc] initWithData:DeleteData encoding:NSUTF8StringEncoding] ;
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if ([string isEqualToString:@"success"])
                {
                    
                    [data_retrived removeAllObjects];
                    
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
                        
                        urlString = [NSString stringWithFormat:@"%@fetch_album.php?admin_id=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
                        NSLog(@" %@",urlString);
                        NSURL *requestURL = [NSURL URLWithString:urlString];
                        NSError* error = nil;
                        NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
                        
                        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
                        
                        for(NSDictionary *dict in result)
                        {
                            [data_retrived addObject:dict];
                            
                        }
                        
                        totlCountMem.hidden=NO;
                        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
                        
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            
                            if([data_retrived count] > 0){
                                
                                [self removePulseLoader];
                                
                                [FindUser removeFromSuperview];
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
                                
                                
                            }else{
                                [self removePulseLoader];
                                [FindUser removeFromSuperview];
                                
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
                        }];
                        
                    }];
                    
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

-(void)DeletebuttonImage:(UIButton *)sender
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
-(void)Registration
{
    MARegistrationViewController *Registration = [[MARegistrationViewController alloc]init];
    [self.navigationController pushViewController:Registration animated:NO];
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



//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    MAAlbumDetailsViewController *Album = [[MAAlbumDetailsViewController alloc]init];
//    [Album setImagedetailsarray:[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"images"]];
//    
//    NSMutableArray *array = [[NSMutableArray alloc]init];
//    array = [[data_retrived objectAtIndex:indexPath.row]objectForKey:@"images"];
//    obj1 = [Mymodel getInstance];
//    
//    obj1.ImageArray = array;
//    [[NSUserDefaults standardUserDefaults]setObject:[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"album_name"] forKey:@"Albumname"];
//    [[NSUserDefaults standardUserDefaults]setObject:[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"id"] forKey:@"Albumid"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
//    [Album setAlbumname:[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"album_name"]];
//    [self.navigationController pushViewController:Album animated:NO];
//}
-(void)tap:(UITapGestureRecognizer *)sender
{
    MAAlbumDetailsViewController *Album = [[MAAlbumDetailsViewController alloc]init];
    [Album setImagedetailsarray:[[data_retrived objectAtIndex:sender.view.tag]objectForKey:@"images"]];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    array = [[data_retrived objectAtIndex:sender.view.tag]objectForKey:@"images"];
    obj1 = [Mymodel getInstance];
    
    obj1.ImageArray = array;
    [[NSUserDefaults standardUserDefaults]setObject:[[data_retrived objectAtIndex:sender.view.tag]objectForKey:@"album_name"] forKey:@"Albumname"];
    [[NSUserDefaults standardUserDefaults]setObject:[[data_retrived objectAtIndex:sender.view.tag]objectForKey:@"id"] forKey:@"Albumid"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [Album setAlbumname:[[data_retrived objectAtIndex:sender.view.tag]objectForKey:@"album_name"]];
    [self.navigationController pushViewController:Album animated:NO];
}
-(void)DetailsbuttonImage:(UIButton *)sender
{
    MAAlbumDetailsViewController *Album = [[MAAlbumDetailsViewController alloc]init];
    [Album setImagedetailsarray:[[data_retrived objectAtIndex:sender.tag]objectForKey:@"images"]];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    array = [[data_retrived objectAtIndex:sender.tag]objectForKey:@"images"];
    obj1 = [Mymodel getInstance];
    
    obj1.ImageArray = array;
    [[NSUserDefaults standardUserDefaults]setObject:[[data_retrived objectAtIndex:sender.tag]objectForKey:@"album_name"] forKey:@"Albumname"];
    [[NSUserDefaults standardUserDefaults]setObject:[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"] forKey:@"Albumid"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [Album setAlbumname:[[data_retrived objectAtIndex:sender.tag]objectForKey:@"album_name"]];
    [self.navigationController pushViewController:Album animated:NO];
}

-(void)getimage
{
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    elcPicker.maximumImagesCount = 100; //Set the maximum number of images to select to 100
    elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
    elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
    elcPicker.onOrder = YES; //For multiple image selection, display and return order of selected images
    elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie]; //Supports image and movie types
    elcPicker.imagePickerDelegate = self;
    [self presentViewController:elcPicker animated:YES completion:nil];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    images = [NSMutableArray arrayWithCapacity:[info count]];
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                [images addObject:image];
                
                NSLog(@"images----> %@", images);
                
            } else {
                NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }
    }
    
    if (images.count == 0)
    {
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            ImageLabelName.text = @"Eingin mynd";
        }
        else
        {
        ImageLabelName.text = @"Intet billede";
        }
    }
    else
    {
    ImageLabelName.text = [NSString stringWithFormat:@"%lu File", (unsigned long)images.count];
    }
    
    timer_set=images.count*4;
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
