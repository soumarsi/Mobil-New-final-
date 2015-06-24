//
//  MAListingBirthdayViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 21/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MAListingBirthdayViewController.h"
#import "MALoginViewController.h"
#import "UIImageView+WebCache.h"
#import "MAHomeViewController.h"
#import "MARegistrationViewController.h"
#import "RTSpinKitView.h"
@interface MAListingBirthdayViewController ()
{
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
}

@end

@implementation MAListingBirthdayViewController
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
    [registration setFrame:CGRectMake(35, 210, 120.0f, 49/2)];
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

    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 350, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:36];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    UIView *lftVwe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe.backgroundColor = [UIColor clearColor];
    
    

    
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
        pageTitle.text = [NSString BirthdayF];
        [UserName setPlaceholder:[NSString SearchF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString BirthdayD];
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    
    data_retrived = [[NSMutableArray alloc] init];
    copyArray = [[NSMutableArray alloc] init];
    searchResults = [[NSArray alloc] init];
    [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
    dispatch_async(queue, ^{
        // Do some computation here.
        
        // Update UI after computation.
        dispatch_async(dispatch_get_main_queue(), ^{
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@birthday_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];

    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSError* error = nil;
    NSLog(@"%@", urlString);
    NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL //1
                                   
                                   options:kNilOptions
                                   error:&error];
    
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
            copyArray = [data_retrived mutableCopy];
            
    if([copyArray count] > 0){
        
        
        
        float thgt = [copyArray count]*120;
        
        if(thgt > 600){
            
            thgt = 600;
        }
         [self removePulseLoader];
        NSLog(@"==thgtthgtthgt..%f",thgt);
        FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,thgt ) style:UITableViewStylePlain];
        FindUser.delegate=self;
        FindUser.dataSource=self;
        FindUser.backgroundColor = [UIColor clearColor];
        FindUser.tag=2;
        //[FindUser setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        FindUser.separatorColor = [UIColor clearColor];
        [FindUser setShowsHorizontalScrollIndicator:NO];
        [FindUser setShowsVerticalScrollIndicator:NO];
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
    return 120;
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
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, 108)];
    backView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:backView];
    
    UIImage *plcHol;
    
    if([[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"gender" ]]  isEqual: @"M"]){
        
        plcHol=[UIImage imageNamed:@"Placeolderm"];
        
    }else{
        
        plcHol=[UIImage imageNamed:@"Placeolderf"];
        
    }
    
    UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1,193/2, 105)];
    pic.tag = indexPath.row;
    [cell addSubview:pic];
    [pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ansa.fo/upload/children_photo/thumb/%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"photo" ]]]
        placeholderImage:plcHol options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    [backView addSubview:pic];
    
    
    
    
    
    UILabel *Name = [[UILabel alloc] initWithFrame:CGRectMake(140, 20-12, 200, 20)];
    Name.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    Name.textColor = [UIColor lightGrayColor];
    Name.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:Name];
    
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
            Name.text = [NSString NameF];
    }
    else
    {
        Name.text = [NSString NameD];
    }
    
    UILabel *NameTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 20+23-14, 260, 20)];
    
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"name"] != [NSNull null]){
        
        NameTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"name" ];
        
    }
    NameTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:16];
    NameTxt.textColor = [UIColor blackColor];
    NameTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:NameTxt];
    
    
    UILabel *FDato = [[UILabel alloc] initWithFrame:CGRectMake(140, 68-14, 200, 20)];
    FDato.text = @"F.Dato";
    FDato.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    FDato.textColor = [UIColor lightGrayColor];
    FDato.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:FDato];
    
   
    UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 92-16, 350, 20)];
    FDatoTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"date_of_birth" ];
    FDatoTxt.font =  [UIFont fontWithName:GLOBALTEXTFONT size:16];
    FDatoTxt.textColor = [UIColor blackColor];
    FDatoTxt.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:FDatoTxt];
    
    
    
    
    
    
    return cell;
    
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
