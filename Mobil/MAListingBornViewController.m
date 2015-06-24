//
//  MAListingBornViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 21/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MAListingBornViewController.h"
#import "UIImageView+WebCache.h"
#import "MALoginViewController.h"
#import "MAHomeViewController.h"
#import "MARegistrationViewController.h"
#import "RTSpinKitView.h"
@interface MAListingBornViewController ()
{
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
}

@end

@implementation MAListingBornViewController
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
    
    
    UIView *lftVwe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe.backgroundColor = [UIColor clearColor];
    
    

    
    UserName = [[UISearchBar alloc] initWithFrame:CGRectMake(380, 85, 767/2, 71/2)];
    UserName.delegate = self;
    [UserName setSearchFieldBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [UserName setPlaceholder:@"Leita"];
    [mainView addSubview:UserName];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
        pageTitle.text = [NSString BornF];
        [UserName setPlaceholder:[NSString SearchF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString BornD];
        [UserName setPlaceholder:[NSString SearchD]];
    }

    
    [NSTimer scheduledTimerWithTimeInterval:1200 target:self selector:@selector(updateNewDate) userInfo:nil repeats:YES];
    
}
-(void)updateNewDate{
    
    NSLog(@"updateNewDate");
    
   [self viewDidAppear:YES];
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    data_retrived = [[NSMutableArray alloc] init];
    copyArray = [[NSMutableArray alloc] init];
    searchResults = [[NSArray alloc] init];
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
    dispatch_async(queue, ^{
        // Do some computation here.
        
        // Update UI after computation.
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *urlString;
            
            urlString = [NSString stringWithFormat:@"%@born_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
            
            
            NSLog(@" %@",urlString);
            NSURL *requestURL = [NSURL URLWithString:urlString];
            NSError* error = nil;
            NSLog(@"%@", urlString);
            NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
            
            NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL options:kNilOptions error:&error];
            
            for(NSMutableDictionary *dict in result)
            {
                [data_retrived addObject:dict];
                
            }
            copyArray = [data_retrived mutableCopy];
            if([copyArray count] > 0){
                
                
                NSLog(@"==data..%@",copyArray);
                float thgt = [copyArray count]*140;
                
                if(thgt > 600){
                    
                    thgt = 600;
                }
                
                 [self removePulseLoader];
                FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,thgt ) style:UITableViewStylePlain];
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
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [copyArray count];
    
    
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
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, 128)];
    backView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:backView];
    
    
    UIImage *plcHol;
    
    if([[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"gender" ]]  isEqual: @"M"]){
        
        plcHol=[UIImage imageNamed:@"Placeolderm"];
        
    }else{
        
        plcHol=[UIImage imageNamed:@"Placeolderf"];
        
    }
    
    UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1,193/2, 125)];
    pic.tag = indexPath.row;
    [cell addSubview:pic];
    [pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ansa.fo/upload/children_photo/thumb/%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"photo" ]]]
        placeholderImage:plcHol options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    [backView addSubview:pic];
    
    
    
    
    
    UILabel *Name = [[UILabel alloc] initWithFrame:CGRectMake(140, 20-12, 200, 20)];
    Name.text = @"Navn";
    Name.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    Name.textColor = [UIColor lightGrayColor];
    Name.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:Name];
    
   NSUInteger characterCount = [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"name" ] length];
    
    NSLog(@"charcatercount====== %lu",(unsigned long)characterCount);
    
    
    UILabel *NameTxt = [[UILabel alloc] init];
    
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"name"] != [NSNull null]){
        
        NameTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"name" ];
        //
    }
    NameTxt.font =  [UIFont fontWithName:GLOBALTEXTFONT size:14];
    NameTxt.textColor = [UIColor blackColor];
    NameTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:NameTxt];
    
    if (characterCount > 26)
    {
        NameTxt.frame = CGRectMake(140, 20+23-14, 200, 40);
            NameTxt.numberOfLines=2;
    }
    else
    {
        NameTxt.frame = CGRectMake(140, 20+23-14, 200, 20);
    }
    
    UILabel *FDato = [[UILabel alloc] initWithFrame:CGRectMake(140, 64, 200, 20)];
    FDato.text = @"F.Dato";
    FDato.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    FDato.textColor = [UIColor lightGrayColor];
    FDato.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:FDato];
    
    
    UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 84, 230, 20)];
    FDatoTxt.backgroundColor = [UIColor clearColor];
    FDatoTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"date_of_birth" ];
    FDatoTxt.font =  [UIFont fontWithName:GLOBALTEXTFONT size:14];
    FDatoTxt.textColor = [UIColor blackColor];
    //FDatoTxt.numberOfLines = 2;
    FDatoTxt.lineBreakMode=NSLineBreakByWordWrapping;
    [backView addSubview:FDatoTxt];
    
    
    
    
    UIView *dev = [[UIView alloc] initWithFrame:CGRectMake(310+60, 13, 1, 164/2+20)];
    dev.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"div"]];
    [backView addSubview:dev];
    
    
    UILabel *parent = [[UILabel alloc] initWithFrame:CGRectMake(340+50, 20-12, 180, 20)];
    parent.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    parent.textColor = [UIColor lightGrayColor];
    parent.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:parent];
    
   NSUInteger characterCount1 = [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"parent_name" ] length];
    
    UILabel *parentTxt = [[UILabel alloc] init];
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"parent_name"] != [NSNull null]){
        
        parentTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"parent_name" ];
        
    }
    parentTxt.font =  [UIFont fontWithName:GLOBALTEXTFONT size:14];
    parentTxt.textColor = [UIColor blackColor];

    parentTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:parentTxt];

    if (characterCount1 > 26)
    {
        parentTxt.frame = CGRectMake(340+50, 20+23-14, 180, 40);
            parentTxt.numberOfLines = 2;
    }
    else
    {
        parentTxt.frame = CGRectMake(340+50, 20+23-14, 180, 20);
    }
    
    
    UILabel *Add = [[UILabel alloc] initWithFrame:CGRectMake(340+50, 64, 200, 20)];
    Add.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    Add.textColor = [UIColor lightGrayColor];
    Add.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:Add];
    
    
     NSUInteger characterCount2 = [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"address" ] length];
    
    UILabel *AddTxt = [[UILabel alloc] init];
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"address"] != [NSNull null]){
        
        AddTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"address" ];
        
        //
    }

    AddTxt.lineBreakMode = NSLineBreakByWordWrapping;
    AddTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:14];
    AddTxt.textColor = [UIColor blackColor];
    AddTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:AddTxt];
    
    if(characterCount2 > 26)
    {
        AddTxt.frame =CGRectMake(340+50, 84, 180, 40);
            AddTxt.numberOfLines = 2;
    }
    else
    {
         AddTxt.frame =CGRectMake(340+50, 84, 180, 20);
    }
    
    
    UIView *dev1 = [[UIView alloc] initWithFrame:CGRectMake(510+60, 13, 1, 164/2+20)];
    dev1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"div"]];
    [backView addSubview:dev1];
    
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(565+30, 8, 200, 20)];
    phone.font =[UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    phone.textColor = [UIColor lightGrayColor];
    phone.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:phone];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        parent.text = [NSString ParentChildF];
        Add.text = [NSString ParentAdressF];
            phone.text = [NSString TelephoneF];
    }
    else
    {
        parent.text = [NSString ParentChildD];
        Add.text = [NSString ParentAdressD];
            phone.text = [NSString TelephoneD];
    }
    
   
    UIView *phn = [[UIView alloc]initWithFrame:CGRectMake(565+30, 34, 25/2, 35/2)];
    phn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"phone"]];
    [backView addSubview:phn];
    
    NSString *str = [NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"parent_phone" ]];
    //NSString *newStr = [str substringWithRange:NSMakeRange(4, [str length]-4)];
    
    UILabel *phoneTxt = [[UILabel alloc] initWithFrame:CGRectMake(585+30, 34, 150, 35/2)];
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"parent_phone"] != [NSNull null]){
        
        phoneTxt.text = str;
        
    }
    phoneTxt.numberOfLines = 2;
    phoneTxt.lineBreakMode = NSLineBreakByWordWrapping;
    phoneTxt.font =  [UIFont fontWithName:GLOBALTEXTFONT size:16];
    phoneTxt.textColor = [UIColor blackColor];
    phoneTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:phoneTxt];
    
    
    if(![[[copyArray objectAtIndex:indexPath.row]objectForKey:@"other_info"]  isEqual: @""]){
    
    UIButton *OtherInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    OtherInfo.frame = CGRectMake(565+35, 34+30+20, 30, 32);
    OtherInfo.backgroundColor = [UIColor clearColor];
    OtherInfo.tag = indexPath.row;
 //   [OtherInfo setTitle:@"Upplýsingar um barni" forState:UIControlStateNormal];
   // [OtherInfo setTitle:@"Upplýsingar um barni" forState:UIControlStateSelected];
 //   [OtherInfo setTitle:@"Upplýsingar um barni" forState:UIControlStateHighlighted];
        [OtherInfo setBackgroundImage:[UIImage imageNamed:@"bornAlert"] forState:UIControlStateNormal];
         [OtherInfo setBackgroundImage:[UIImage imageNamed:@"bornAlert"] forState:UIControlStateNormal];
         [OtherInfo setBackgroundImage:[UIImage imageNamed:@"bornAlert"] forState:UIControlStateNormal];
    [OtherInfo setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
    [OtherInfo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [OtherInfo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    OtherInfo.titleLabel.font = [UIFont systemFontOfSize:15];
    [OtherInfo addTarget:self action:@selector(OtherInfo:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:OtherInfo];
    
    }
    
    if(![[[copyArray objectAtIndex:indexPath.row]objectForKey:@"cntct_prsn_2_name"]  isEqual: @""] || ![[[copyArray objectAtIndex:indexPath.row]objectForKey:@"cntct_prsn_2_phone"]  isEqual: @""] || ![[[copyArray objectAtIndex:indexPath.row]objectForKey:@"cntct_prsn_3_name"]  isEqual: @""] || ![[[copyArray objectAtIndex:indexPath.row]objectForKey:@"cntct_prsn_3_phone"]  isEqual: @""]){
        
        UIButton *persnInfo = [UIButton buttonWithType:UIButtonTypeCustom];
        persnInfo.frame = CGRectMake(565+85, 34+30+20, 32, 32);
        persnInfo.backgroundColor = [UIColor clearColor];
        persnInfo.tag = indexPath.row;
        //   [OtherInfo setTitle:@"Upplýsingar um barni" forState:UIControlStateNormal];
        // [OtherInfo setTitle:@"Upplýsingar um barni" forState:UIControlStateSelected];
        //   [OtherInfo setTitle:@"Upplýsingar um barni" forState:UIControlStateHighlighted];
        [persnInfo setBackgroundImage:[UIImage imageNamed:@"INFOalert"] forState:UIControlStateNormal];
        [persnInfo setBackgroundImage:[UIImage imageNamed:@"INFOalert"] forState:UIControlStateNormal];
        [persnInfo setBackgroundImage:[UIImage imageNamed:@"INFOalert"] forState:UIControlStateNormal];
        [persnInfo setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        [persnInfo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [persnInfo setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        persnInfo.titleLabel.font = [UIFont systemFontOfSize:15];
        [persnInfo addTarget:self action:@selector(OtherInfoPERSON:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:persnInfo];
        
    }
    
    
    
    return cell;
    
}
-(void)closevistr_close{
    
    [pickerBack1 removeFromSuperview];
    [okCls1 removeFromSuperview];
    [DeatilsView1 removeFromSuperview];

}
-(void)OtherInfoPERSON:(UIButton *)sender{
    
    pickerBack1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack1.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack1];
    [mainView bringSubviewToFront:pickerBack1];
    
//    okCls1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    okCls1.frame = CGRectMake(685, 120, 120/2, 120/2);
//    okCls1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
//    [okCls1 addTarget:self action:@selector(closevistr_close) forControlEvents:UIControlEventTouchUpInside];
//    okCls1.titleLabel.textColor = [UIColor blackColor];
//    [mainView addSubview:okCls1];
//    [mainView bringSubviewToFront:okCls1];
    

    
    
    DeatilsView1 = [[UIView alloc] initWithFrame:CGRectMake(90, 160, 610, 280)];
    DeatilsView1.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView1];
    [mainView bringSubviewToFront:DeatilsView1];
    
    okCls1 = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls1.frame = CGRectMake(685-5, 120+22, 64/2, 64/2);
    okCls1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross_neww"]];
    [okCls1 addTarget:self action:@selector(closevistr_close) forControlEvents:UIControlEventTouchUpInside];
    okCls1.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls1];
    [mainView bringSubviewToFront:okCls1];
    
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 600, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor blackColor];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentLeft;
    [DeatilsView1 addSubview:ttPOP];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
           ttPOP.text = @"Samband";
    }
    else
    {
            ttPOP.text = @"Kontakt";
    }
    ///
    
    
    UILabel *Text_suport = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 285, 30)];
    Text_suport.backgroundColor = [UIColor clearColor];
    Text_suport.textColor = [UIColor grayColor];
   // Text_suport.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"other_info"] ;
    Text_suport.text = @"Navn";
    Text_suport.font = [UIFont fontWithName:GLOBALTEXTFONT size:23];
    Text_suport.numberOfLines = 1;
    Text_suport.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suport.textAlignment = NSTextAlignmentLeft;
    [DeatilsView1 addSubview:Text_suport];

    
    
    UILabel *Text_suport2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 70, 300, 30)];
    Text_suport2.backgroundColor = [UIColor clearColor];
    Text_suport2.textColor = [UIColor grayColor];
    // Text_suport.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"other_info"] ;
    Text_suport2.font = [UIFont fontWithName:GLOBALTEXTFONT size:23];
    Text_suport2.numberOfLines = 1;
    Text_suport2.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suport2.textAlignment = NSTextAlignmentLeft;
    [DeatilsView1 addSubview:Text_suport2];
    
    
    UILabel *Text_suportVAL = [[UILabel alloc] initWithFrame:CGRectMake(10, 95+20, 285, 48)];
    Text_suportVAL.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    Text_suportVAL.textColor = [UIColor blackColor];
    if([[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_2_name"]  isEqual: @""] ){
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
        Text_suportVAL.text=[NSString NodataFoundF];
                Text_suport2.text = @"Telefonnummar";
        }
        else
        {
            Text_suportVAL.text=[NSString NodataFoundD];
                Text_suport2.text = [NSString TelephoneD];
        }
    }else{
    Text_suportVAL.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_2_name"] ;
    }
    Text_suportVAL.font = [UIFont fontWithName:GLOBALTEXTFONT size:23];
    Text_suportVAL.numberOfLines = 1;
    Text_suportVAL.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suportVAL.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:Text_suportVAL];


    
    
    UILabel *Text_suportVAL2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 95+20, 300, 48)];
    Text_suportVAL2.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    Text_suportVAL2.textColor = [UIColor blackColor];
    if([[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_2_phone"]  isEqual: @""] ){
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            Text_suportVAL2.text=[NSString NodataFoundF];
        }
        else
        {
            Text_suportVAL2.text=[NSString NodataFoundD];
        }
    }else{
    Text_suportVAL2.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_2_phone"] ;
    }
    Text_suportVAL2.font = [UIFont fontWithName:GLOBALTEXTFONT size:23];
    Text_suportVAL2.numberOfLines = 1;
    Text_suportVAL2.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suportVAL2.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:Text_suportVAL2];
    
    
    
    //contact Person second
    
    
    
//    UILabel *Text_suport3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 300, 50)];
//    Text_suport3.backgroundColor = [UIColor clearColor];
//    Text_suport3.textColor = [UIColor grayColor];
//    // Text_suport.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"other_info"] ;
//    Text_suport3.text = @"Contact person 3 Name:";
//    Text_suport3.font = [UIFont fontWithName:@"Roboto-Regular" size:23];
//    Text_suport3.numberOfLines = 1;
//    Text_suport3.lineBreakMode = NSLineBreakByWordWrapping;
//    Text_suport3.textAlignment = NSTextAlignmentLeft;
//    [DeatilsView1 addSubview:Text_suport3];
    
    
    UILabel *Text_suportVAL3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 150+20, 285, 50)];
    Text_suportVAL3.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    Text_suportVAL3.textColor = [UIColor blackColor];
    
    if([[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_3_name"]  isEqual: @""] ){
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            Text_suportVAL3.text=[NSString NodataFoundF];
        }
        else
        {
            Text_suportVAL3.text=[NSString NodataFoundD];
        }

    }else{
    Text_suportVAL3.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_3_name"];
    }
    //Text_suportVAL.text = @"Contact person 2 Name:";
    Text_suportVAL3.font = [UIFont fontWithName:GLOBALTEXTFONT size:23];
    Text_suportVAL3.numberOfLines = 1;
    Text_suportVAL3.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suportVAL3.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:Text_suportVAL3];
    
    
//    UILabel *Text_suport4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 50)];
//    Text_suport4.backgroundColor = [UIColor clearColor];
//    Text_suport4.textColor = [UIColor grayColor];
//    // Text_suport.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"other_info"] ;
//    Text_suport4.text = @"Contact person 3 Phone:";
//    Text_suport4.font = [UIFont fontWithName:@"Roboto-Regular" size:23];
//    Text_suport4.numberOfLines = 1;
//    Text_suport4.lineBreakMode = NSLineBreakByWordWrapping;
//    Text_suport4.textAlignment = NSTextAlignmentLeft;
//    [DeatilsView1 addSubview:Text_suport4];
    
    
    UILabel *Text_suportVAL4 = [[UILabel alloc] initWithFrame:CGRectMake(300, 150+20, 300, 50)];
    Text_suportVAL4.backgroundColor = [UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    Text_suportVAL4.textColor = [UIColor blackColor];
    
    if([[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_3_phone"]  isEqual: @""] ){
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            Text_suportVAL4.text=[NSString NodataFoundF];
        }
        else
        {
            Text_suportVAL4.text=[NSString NodataFoundD];
        }
    }else{
    Text_suportVAL4.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"cntct_prsn_3_phone"] ;
    }
    //Text_suportVAL.text = @"Contact person 2 Name:";
    Text_suportVAL4.font = [UIFont fontWithName:GLOBALTEXTFONT size:23];
    Text_suportVAL4.numberOfLines = 1;
    Text_suportVAL4.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suportVAL4.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:Text_suportVAL4];
    
}
-(void)OtherInfo:(UIButton *)sender{
    
    pickerBack1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack1.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack1];
    [mainView bringSubviewToFront:pickerBack1];

    
    
    DeatilsView1 = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 200)];
    DeatilsView1.backgroundColor = [UIColor whiteColor];
    DeatilsView1.layer.borderColor = (__bridge CGColorRef)([UIColor blackColor]);
    DeatilsView1.layer.borderWidth =3;
    DeatilsView1.layer.cornerRadius = 15;
    [mainView addSubview:DeatilsView1];
    [mainView bringSubviewToFront:DeatilsView1];
    
    
    okCls1 = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls1.frame = CGRectMake(635-15, 120+22, 64/2, 64/2);
    okCls1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross_neww"]];
    [okCls1 addTarget:self action:@selector(closevistr_close) forControlEvents:UIControlEventTouchUpInside];
    okCls1.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls1];
    [mainView bringSubviewToFront:okCls1];
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 35)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:ttPOP];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
         ttPOP.text = [NSString OTHERINFOCHILDF];
    }
    else
    {
        ttPOP.text = [NSString OTHERINFOCHILDD];
    }
    
   UILabel *Text_suport = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 450, 50)];
    Text_suport.backgroundColor = [UIColor clearColor];
    Text_suport.textColor = [UIColor grayColor];
    Text_suport.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"other_info"] ;
    Text_suport.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    Text_suport.numberOfLines = 10;
    Text_suport.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suport.textAlignment = NSTextAlignmentLeft;
    [DeatilsView1 addSubview:Text_suport];
    
    
    CGSize maximumLabelSize = CGSizeMake(256, FLT_MAX);
    
    CGSize expectedLabelSize = [[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag]objectForKey:@"appoinment" ]]
                                sizeWithFont:Text_suport.font constrainedToSize:maximumLabelSize lineBreakMode:Text_suport.lineBreakMode];
    
    CGRect newFrame = Text_suport.frame;
    newFrame.size.height = expectedLabelSize.height;
    Text_suport.frame = newFrame;
    
    
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
        
        
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@",searchText];
        
        searchResults = [data_retrived filteredArrayUsingPredicate:resultPredicate];
        
        copyArray=[[NSMutableArray alloc] initWithArray:searchResults];
        
        [FindUser reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        if ([copyArray count] ==0)
        {
            NSLog(@"count.0");
        }
        else
        {
            NSLog(@"count.>0");
        }
        
        
    }
    else {
        
        [copyArray removeAllObjects];
        
        copyArray = [data_retrived mutableCopy];;
        [FindUser reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    
    
}

-(void)backOut2{
    
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
    
    [self.navigationController popViewControllerAnimated:NO];
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
