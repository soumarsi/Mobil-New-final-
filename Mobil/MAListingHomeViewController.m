//
//  MAListingHomeViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 20/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MAListingHomeViewController.h"
#import "UIImageView+WebCache.h"
#import "MALoginViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MARegistrationViewController.h"
#import "RTSpinKitView.h"
@interface MAListingHomeViewController ()
{
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
    NSOperationQueue *downloadQueue;
}
@property (readonly) NSUInteger numberOfHours;
@property (readonly) NSUInteger numberOfMinutes;
@property NSNumber *hour;
@property NSNumber *minute;
@end

@implementation MAListingHomeViewController
@synthesize  pageId,dPicker;
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
    [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
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
    //[leftview addSubview:registration];
    
    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    totlCountMem = [[UILabel alloc] initWithFrame:CGRectMake(160, 80, 300, 44)];
    totlCountMem.backgroundColor = [UIColor clearColor];
    totlCountMem.textColor = [UIColor whiteColor];
    totlCountMem.text = @"";
    totlCountMem.font = [UIFont fontWithName:GLOBALTEXTFONT size:25];
    totlCountMem.textAlignment = NSTextAlignmentLeft;
    totlCountMem.hidden=YES;
    [mainView addSubview:totlCountMem];
    
    
    
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
        pageTitle.text = [NSString HomeF];
        [UserName setPlaceholder:[NSString SearchF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString HomeD];
        [UserName setPlaceholder:[NSString SearchD]];
    }

    
    //[NSTimer scheduledTimerWithTimeInterval:1200 target:self selector:@selector(updateNewDate) userInfo:nil repeats:YES];
    
}
-(void)updateNewDate{
    
    NSLog(@"updateNewDate");
    
   [self viewDidAppear:YES];
    
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
    
    downloadQueue = [[NSOperationQueue alloc]init];
    [downloadQueue addOperationWithBlock:^{
        
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
       
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
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
    copyArray = [data_retrived mutableCopy];
    if([copyArray count] > 0){
    
        totlCountMem.hidden=NO;
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
        

    NSLog(@"==data..%@",data_retrived);
    float thgt = [copyArray count]*150;
   
    if(thgt > 600){
        
        thgt = 600;
    }
    [self removePulseLoader];
        
        [FindUser removeFromSuperview];
        
    FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,thgt ) style:UITableViewStylePlain];
    FindUser.delegate=self;
    FindUser.dataSource=self;
    FindUser.backgroundColor = [UIColor clearColor];
    FindUser.tag=2;
    //[FindUser setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    FindUser.separatorColor = [UIColor clearColor];
    
    [mainView addSubview:FindUser];
    [FindUser reloadData];
        
    }else{
    [self removePulseLoader];
        
        [FindUser removeFromSuperview];
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
     }];
    }];
        
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
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
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, 138)];
    backView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:backView];
    
    
    UIImage *plcHol;
    
    if([[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"gender" ]]  isEqual: @"M"]){
        
        plcHol=[UIImage imageNamed:@"Placeolderm"];
        
    }else{
        
        plcHol=[UIImage imageNamed:@"Placeolderf"];
        
    }
    
    UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1,193/2+18, 135)];
    pic.tag = indexPath.row;

    [cell addSubview:pic];
    [pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ansa.fo/upload/children_photo/thumb/%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"photo" ]]]
        placeholderImage:plcHol options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    [backView addSubview:pic];
    
    
    
    
    
    UILabel *Name = [[UILabel alloc] initWithFrame:CGRectMake(140, 20-8, 200, 20)];
    Name.text = @"Navn";
    Name.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    Name.textColor = [UIColor lightGrayColor];
    Name.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:Name];
    
  
    
    UILabel *NameTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 20+23-8, 260, 20)];
    
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"name"] != [NSNull null]){
        
        NameTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"name" ];
        
    }
    NameTxt.font =   [UIFont fontWithName:GLOBALTEXTFONT size:18];
    NameTxt.textColor = [UIColor blackColor];
    NameTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:NameTxt];
    
    
    UILabel *FDato = [[UILabel alloc] initWithFrame:CGRectMake(140, 68-8, 200, 20)];
    FDato.text = @"F.Dato";
    FDato.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    FDato.textColor = [UIColor lightGrayColor];
    FDato.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:FDato];
    
    
    UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 92-8, 350, 20)];
    FDatoTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"date_of_birth" ];
    FDatoTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:18];
    FDatoTxt.textColor = [UIColor blackColor];
    FDatoTxt.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:FDatoTxt];
    
    
 if( [NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appoinment"]].length == 0 || [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appoinment"]  isEqual: @"(null)"] ){
     
     UIButton *comment = [UIButton buttonWithType:UIButtonTypeCustom];
     comment.frame = CGRectMake(93, 97, 200, 80/2);
     comment.backgroundColor = [UIColor clearColor];
     [comment setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
     comment.tag=indexPath.row;
     [comment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
     [comment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     comment.titleLabel.font = [UIFont systemFontOfSize:17];
     [comment addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
     [cell addSubview:comment];
     
     if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"lang"] isEqualToString:@"fo"])
     {
         [comment setTitle:[NSString CommentF] forState:UIControlStateNormal];
         [comment setTitle:[NSString CommentF] forState:UIControlStateSelected];
         [comment setTitle:[NSString CommentF] forState:UIControlStateHighlighted];
     }
     
     else
     {
         [comment setTitle:[NSString CommentD] forState:UIControlStateNormal];
         [comment setTitle:[NSString CommentD] forState:UIControlStateSelected];
         [comment setTitle:[NSString CommentD] forState:UIControlStateHighlighted];
         
     }
     
 }
   
    

        
        UIButton *comment2 = [UIButton buttonWithType:UIButtonTypeCustom];
        comment2.frame = CGRectMake(300, 97, 200, 80/2);
        comment2.backgroundColor = [UIColor clearColor];
 if([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"note"]  isEqual: @""] || [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"note"]  isEqual: @"<null>"] || [[copyArray objectAtIndex:indexPath.row]objectForKey:@"note"] == (id)[NSNull null] ){
     
     if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
     {
         [comment2 setTitle:[NSString Comment2F] forState:UIControlStateNormal];
         [comment2 setTitle:[NSString Comment2F] forState:UIControlStateSelected];
         [comment2 setTitle:[NSString Comment2F] forState:UIControlStateHighlighted];
     }
     else
     {
         [comment2 setTitle:[NSString Comment2D] forState:UIControlStateNormal];
         [comment2 setTitle:[NSString Comment2D] forState:UIControlStateSelected];
         [comment2 setTitle:[NSString Comment2D] forState:UIControlStateHighlighted];
     }
 }else{
     if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
     {
         [comment2 setTitle:[NSString Comment2SelectedF] forState:UIControlStateNormal];
         [comment2 setTitle:[NSString Comment2SelectedF] forState:UIControlStateSelected];
         [comment2 setTitle:[NSString Comment2SelectedF] forState:UIControlStateHighlighted];
     }
     else
     {
         [comment2 setTitle:[NSString Comment2SelectedD] forState:UIControlStateNormal];
         [comment2 setTitle:[NSString Comment2SelectedD] forState:UIControlStateSelected];
         [comment2 setTitle:[NSString Comment2SelectedD] forState:UIControlStateHighlighted];
     }
    
}
        [comment2 setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        comment2.tag=indexPath.row;
        [comment2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [comment2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        comment2.titleLabel.font = [UIFont systemFontOfSize:17];
        [comment2 addTarget:self action:@selector(comment2:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:comment2];
        

    
    
    
    
    
    
//    UIButton *checkbox = [[UIButton alloc] initWithFrame:CGRectMake(600,20 ,44/2,41/2)];
//    checkbox.backgroundColor=[UIColor clearColor];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
//    checkbox.adjustsImageWhenHighlighted=YES;
//    checkbox.tag = indexPath.row;
//    [checkbox addTarget:self action:@selector(bto_action:) forControlEvents:UIControlEventTouchUpInside];
//    [backView addSubview:checkbox];
//    
//    
//    UILabel *chkLbl = [[UILabel alloc] initWithFrame:CGRectMake(630, 22, 100, 20)];
//    chkLbl.text = @"Heim";
//    chkLbl.font = [UIFont fontWithName:@"Roboto-Light" size:16];;
//    chkLbl.textColor = [UIColor blackColor];
//    chkLbl.textAlignment = NSTextAlignmentLeft;
//    [backView addSubview:chkLbl];
//    
    if( [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"release_status" ]  isEqual: @"N"]){
        
        UILabel *chkLbl = [[UILabel alloc] initWithFrame:CGRectMake(625, 40, 60, 41/2)];
            chkLbl.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:18];;
            chkLbl.textColor = [UIColor redColor];
            chkLbl.textAlignment = NSTextAlignmentLeft;
            [backView addSubview:chkLbl];
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            chkLbl.text = [NSString TourF];
        }
        else
        {
             chkLbl.text = [NSString TourD];
        }
    
    }else{
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox setFrame:CGRectMake(600, 40-20, 100.0f, 41/2)];
    [checkbox setImageEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 0)];
    [checkbox setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox.tag = indexPath.row;
    [checkbox setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox addTarget:self action:@selector(bto_action:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:checkbox];
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
         
                [checkbox setTitle:[NSString HomeF] forState:UIControlStateNormal];
        }
        else
        {
                [checkbox setTitle:[NSString HomeD] forState:UIControlStateNormal];
        }
    
    }
    
    NSLog(@"///.....%lu",(unsigned long)[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appoinment"]].length);
    
    if( [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appoinment"]  isEqual: @"(null)"] || [NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appoinment"]].length == 0){
        
        
    }else{
    
        UIButton *comment_exist = [UIButton buttonWithType:UIButtonTypeCustom];
        comment_exist.frame = CGRectMake(93, 97, 200, 80/2);
        comment_exist.backgroundColor = [UIColor clearColor];
        [comment_exist setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        comment_exist.tag=indexPath.row;
        [comment_exist setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [comment_exist setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        comment_exist.titleLabel.font = [UIFont systemFontOfSize:17];
        [comment_exist addTarget:self action:@selector(comment_seeVal:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:comment_exist];
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            [comment_exist setTitle:[NSString CommentSelectedF] forState:UIControlStateNormal];
            [comment_exist setTitle:[NSString CommentSelectedF] forState:UIControlStateSelected];
            [comment_exist setTitle:[NSString CommentSelectedF] forState:UIControlStateHighlighted];
        }
        else
        {
            [comment_exist setTitle:[NSString CommentSelectedD] forState:UIControlStateNormal];
            [comment_exist setTitle:[NSString CommentSelectedD] forState:UIControlStateSelected];
            [comment_exist setTitle:[NSString CommentSelectedD] forState:UIControlStateHighlighted];
        }
    }
    
    //if([pageId  isEqual: @"28"]){
    
    if ([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"sleep_status"] isEqualToString:@"S"])
    {

    
    UIButton *sovi = [UIButton buttonWithType:UIButtonTypeCustom];
    sovi.frame = CGRectMake(580, 52, 100, 80/2);
    sovi.backgroundColor = [UIColor clearColor];
    [sovi setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
    sovi.tag=indexPath.row;
    [sovi setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [sovi setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    sovi.titleLabel.font = [UIFont systemFontOfSize:17];
    [sovi addTarget:self action:@selector(comment_openTime:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:sovi];
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            [sovi setTitle:[NSString SoviF] forState:UIControlStateNormal];
            [sovi setTitle:[NSString SoviF] forState:UIControlStateSelected];
            [sovi setTitle:[NSString SoviF] forState:UIControlStateHighlighted];
        }
        else
        {
            [sovi setTitle:[NSString SoviD] forState:UIControlStateNormal];
            [sovi setTitle:[NSString SoviD] forState:UIControlStateSelected];
            [sovi setTitle:[NSString SoviD] forState:UIControlStateHighlighted];
        }
    }
    
    
    if( [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"sleep_time_stop"]  isEqual: @"00:00:00"] && ![[[copyArray objectAtIndex:indexPath.row]objectForKey:@"sleep_time_start"]  isEqual: @"00:00:00"] ){
        
        NSLog(@"under sleep");
    
        UILabel *spl = [[UILabel alloc] initWithFrame:CGRectMake(610, 115, 120, 41/2)];
        spl.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:14];;
        spl.textColor = [UIColor redColor];
        spl.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:spl];
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
                    spl.text = @"Svevur nú";
        }
        else
        {
                    spl.text = @"Sover nu";
        }
        
    }

    return cell;
    
}
-(void)comment_seeVal:(UIButton *)sender{


    pickerBack1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack1.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack1];
    [mainView bringSubviewToFront:pickerBack1];
    
    okCls1 = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls1.frame = CGRectMake(635, 120, 120/2, 120/2);
    okCls1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
    [okCls1 addTarget:self action:@selector(closevistr_close) forControlEvents:UIControlEventTouchUpInside];
    okCls1.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls1];
    [mainView bringSubviewToFront:okCls1];
    
    
    DeatilsView1 = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
    DeatilsView1.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView1];
    [mainView bringSubviewToFront:DeatilsView1];
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:ttPOP];
    
    
    
    Broyt = [UIButton buttonWithType:UIButtonTypeCustom];
    Broyt.frame = CGRectMake(340,10, 80, 80/2);
    Broyt.backgroundColor = [UIColor clearColor];
    Broyt.tag = sender.tag;

    [Broyt setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
    [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Broyt.titleLabel.font = [UIFont systemFontOfSize:15];
    [Broyt addTarget:self action:@selector(Broyt:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView1 addSubview:Broyt];
    
    slettabutton = [UIButton buttonWithType:UIButtonTypeCustom];
    slettabutton.frame = CGRectMake(410,10, 80, 80/2);
    slettabutton.backgroundColor = [UIColor clearColor];
    slettabutton.tag = sender.tag;
    [slettabutton setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
    [slettabutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [slettabutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    slettabutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [slettabutton addTarget:self action:@selector(Sellteappo:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView1 addSubview:slettabutton];
    
    Text_suport = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 450, 50)];
    Text_suport.backgroundColor = [UIColor clearColor];
    Text_suport.textColor = [UIColor grayColor];
    Text_suport.text =[[copyArray objectAtIndex:sender.tag]objectForKey:@"appoinment" ] ;
    Text_suport.font = [UIFont fontWithName:GLOBALTEXTFONT size:20];
    Text_suport.numberOfLines = 10;
    Text_suport.lineBreakMode = NSLineBreakByWordWrapping;
    Text_suport.textAlignment = NSTextAlignmentLeft;
    [DeatilsView1 addSubview:Text_suport];

    
    CGSize maximumLabelSize = CGSizeMake(256, FLT_MAX);
    
    CGSize expectedLabelSize = [[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag]objectForKey:@"appoinment" ]] sizeWithFont:Text_suport.font constrainedToSize:maximumLabelSize lineBreakMode:Text_suport.lineBreakMode];
    
    CGRect newFrame = Text_suport.frame;
    newFrame.size.height = expectedLabelSize.height;
    Text_suport.frame = newFrame;
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [Broyt setTitle:[NSString EditF] forState:UIControlStateNormal];
        [Broyt setTitle:[NSString EditF] forState:UIControlStateSelected];
        [Broyt setTitle:[NSString EditF] forState:UIControlStateHighlighted];
        
        [slettabutton setTitle:[NSString DeleteF] forState:UIControlStateNormal];
        [slettabutton setTitle:[NSString DeleteF] forState:UIControlStateSelected];
        [slettabutton setTitle:[NSString DeleteF] forState:UIControlStateHighlighted];
        
            ttPOP.text = @"Avtala";
    }
    else
    {
        [Broyt setTitle:[NSString EditD] forState:UIControlStateNormal];
        [Broyt setTitle:[NSString EditD] forState:UIControlStateSelected];
        [Broyt setTitle:[NSString EditD] forState:UIControlStateHighlighted];
        
        [slettabutton setTitle:[NSString DeleteD] forState:UIControlStateNormal];
        [slettabutton setTitle:[NSString DeleteD] forState:UIControlStateSelected];
        [slettabutton setTitle:[NSString DeleteD] forState:UIControlStateHighlighted];
        
            ttPOP.text = @"Aftale";
    }
    
}
-(void)Sellteappo:(UIButton *)sender
{
    DeatilsView1.hidden = YES;
    okCls1.hidden = YES;
    pickerBack1.hidden =YES;
    NSError *error=nil;
    
    NSString *urlString1 = [NSString stringWithFormat:@"%@delete_appo.php?id=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
    
    NSLog(@"urlString1%@",urlString1);
    
    //        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    NSLog(@"serveroutput=---- %@",serverOutput);
    
    if ([serverOutput isEqualToString:@"success"])
    {
        [self viewDidAppear:YES];
    }
}
-(void)closevistr_close{
    
    DeatilsView1.hidden = YES;
    okCls1.hidden = YES;
    pickerBack1.hidden =YES;
}
-(void)Broyt:(UIButton *)sender{
    
    Text_suport.hidden=YES;
    
    CoemtText_new = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
    CoemtText_new.font = [UIFont systemFontOfSize:16.0f];
    CoemtText_new.backgroundColor = [UIColor clearColor];
    CoemtText_new.textColor = [UIColor grayColor];
    CoemtText_new.scrollEnabled = YES;
    CoemtText_new.pagingEnabled = YES;
    CoemtText_new.editable = YES;
    CoemtText_new.delegate = self;
    CoemtText_new.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"appoinment" ];
    CoemtText_new.layer.borderWidth = 1.0f;
    CoemtText_new.layer.borderColor = [[UIColor grayColor] CGColor];
    CoemtText_new.textAlignment = NSTextAlignmentLeft;
    [DeatilsView1 addSubview:CoemtText_new];
    
    UIButton *Okcomment_new = [UIButton buttonWithType:UIButtonTypeCustom];
    Okcomment_new.frame = CGRectMake(370, 175, 100, 80/2);
    Okcomment_new.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    [Okcomment_new setTitle:@"Ok" forState:UIControlStateNormal];
    Okcomment_new.tag = sender.tag;
    [Okcomment_new setTitle:@"Ok" forState:UIControlStateSelected];
    [Okcomment_new setTitle:@"Ok" forState:UIControlStateHighlighted];
    [Okcomment_new setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Okcomment_new setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Okcomment_new setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Okcomment_new.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [Okcomment_new addTarget:self action:@selector(closevistr1:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView1 addSubview:Okcomment_new];
    
}
-(void)closevistr2:(UIButton *)sender{
    
    
    DeatilsView1.hidden = YES;
    okCls1.hidden = YES;
    pickerBack1.hidden =YES;
}
-(void)closevistr1:(UIButton *)sender{
    
    if([CoemtText_new.text  isEqual: @""]){
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString TextCheckF] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString TextCheckD] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
            [alert show];
        }
    
    }else{
    
    
    DeatilsView1.hidden = YES;
    okCls1.hidden = YES;
    pickerBack1.hidden =YES;
    
    
    NSError *error=nil;
    
    NSString *urlString1 = [NSString stringWithFormat:@"%@add_appo.php?appoint_check=%@&child_id=%@",APPS_DOMAIN_URL,CoemtText_new.text,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
    
    NSLog(@"udgfldshgljhg......%@",urlString1);
    
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    
    
    
    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", urlString);
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL1 //1
                                   
                                   options:kNilOptions
                                   error:&error];
    [data_retrived removeAllObjects];
    [copyArray removeAllObjects];
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
    copyArray = [data_retrived mutableCopy];
    NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
    NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
    [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
    
    if([copyArray count] == 0){
        
        [FindUser removeFromSuperview];
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
    }
    
}
-(void)comment_openTime:(UIButton *)sender{

    pickerBack1 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack1.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack1];
    [mainView bringSubviewToFront:pickerBack1];
    
    okCls1 = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls1.frame = CGRectMake(635, 120, 120/2, 120/2);
    okCls1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
    [okCls1 addTarget:self action:@selector(closevistr2:) forControlEvents:UIControlEventTouchUpInside];
    okCls1.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls1];
    [mainView bringSubviewToFront:okCls1];

    
    DeatilsView1 = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 370)];
    DeatilsView1.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView1];
    [mainView bringSubviewToFront:DeatilsView1];
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView1 addSubview:ttPOP];
    
    
   startTime = [[UIButton alloc] initWithFrame:CGRectMake(30, 80, 120, 60)];
    startTime.backgroundColor = [UIColor clearColor];
    startTime.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    startTime.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    startTime.tag=sender.tag;
    [startTime addTarget:self action:@selector(openPicker_start:) forControlEvents:UIControlEventTouchUpInside];
    [startTime setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"sleep_time_start"] forState:UIControlStateNormal];
    [startTime setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"sleep_time_start"] forState:UIControlStateHighlighted];
    [startTime setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"sleep_time_start"] forState:UIControlStateSelected];
    startTime.layer.borderWidth = 2.0f;
    startTime.layer.borderColor = [[UIColor grayColor] CGColor];
    [startTime setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [startTime setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [startTime setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [DeatilsView1 addSubview:startTime];
    
    UILabel *strtLbl = [[UILabel alloc] initWithFrame:CGRectMake(42, 145, 125, 20)];
    strtLbl.textColor = [UIColor grayColor];
    strtLbl.font = [UIFont systemFontOfSize:18];
    [DeatilsView1 addSubview:strtLbl];
    
    
    endTime = [[UIButton alloc] initWithFrame:CGRectMake(185, 80, 120, 60)];
    endTime.backgroundColor = [UIColor clearColor];
    endTime.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    endTime.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    endTime.tag=sender.tag;
    [endTime addTarget:self action:@selector(openPicker_end:) forControlEvents:UIControlEventTouchUpInside];
    [endTime setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"sleep_time_stop"] forState:UIControlStateNormal];
    [endTime setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"sleep_time_stop"] forState:UIControlStateHighlighted];
    [endTime setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"sleep_time_stop"] forState:UIControlStateSelected];
    endTime.layer.borderWidth = 2.0f;
    endTime.layer.borderColor = [[UIColor grayColor] CGColor];
    [endTime setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [endTime setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [endTime setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [DeatilsView1 addSubview:endTime];
    
    
    UILabel *endtLbl = [[UILabel alloc] initWithFrame:CGRectMake(195+3, 145, 125, 20)];
    endtLbl.textColor = [UIColor grayColor];
    endtLbl.font = [UIFont systemFontOfSize:18];
    [DeatilsView1 addSubview:endtLbl];
    
    
    UIButton *Okcomment = [UIButton buttonWithType:UIButtonTypeCustom];
    Okcomment.frame = CGRectMake(350, 90, 100, 80/2);
    Okcomment.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    [Okcomment setTitle:@"Ok" forState:UIControlStateNormal];
    [Okcomment setTitle:@"Ok" forState:UIControlStateSelected];
    [Okcomment setTitle:@"Ok" forState:UIControlStateHighlighted];
    Okcomment.tag=sender.tag;
    [Okcomment setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Okcomment.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [Okcomment addTarget:self action:@selector(submitVAl:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView1 addSubview:Okcomment];
    
    //second....................
    
    strtTm = [[UIButton alloc] initWithFrame:CGRectMake(30, 80+140, 120, 60)];
    strtTm.backgroundColor = [UIColor clearColor];
    strtTm.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    strtTm.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    strtTm.tag=sender.tag;
    [strtTm addTarget:self action:@selector(openPicker_start2:) forControlEvents:UIControlEventTouchUpInside];
    [strtTm setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"second_sleep_time_start"] forState:UIControlStateNormal];
    [strtTm setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"second_sleep_time_start"] forState:UIControlStateHighlighted];
    [strtTm setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"second_sleep_time_start"] forState:UIControlStateSelected];
    strtTm.layer.borderWidth = 2.0f;
    strtTm.layer.borderColor = [[UIColor grayColor] CGColor];
    [strtTm setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [strtTm setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [strtTm setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [DeatilsView1 addSubview:strtTm];
    
    UILabel *strtLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(42, 145+140, 125, 20)];
    strtLbl2.textColor = [UIColor grayColor];
    strtLbl2.font = [UIFont systemFontOfSize:18];
    [DeatilsView1 addSubview:strtLbl2];
    
    
    endtTm = [[UIButton alloc] initWithFrame:CGRectMake(185, 80+140, 120, 60)];
    endtTm.backgroundColor = [UIColor clearColor];
    endtTm.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    endtTm.titleLabel.font = [UIFont systemFontOfSize:22.0f];
    endtTm.tag=sender.tag;
    [endtTm addTarget:self action:@selector(openPicker_end2:) forControlEvents:UIControlEventTouchUpInside];
    [endtTm setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"second_sleep_time_stop"] forState:UIControlStateNormal];
    [endtTm setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"second_sleep_time_stop"] forState:UIControlStateHighlighted];
    [endtTm setTitle:[[copyArray objectAtIndex:sender.tag]objectForKey:@"second_sleep_time_stop"] forState:UIControlStateSelected];
    endtTm.layer.borderWidth = 2.0f;
    endtTm.layer.borderColor = [[UIColor grayColor] CGColor];
    [endtTm setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [endtTm setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [endtTm setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [DeatilsView1 addSubview:endtTm];
    
    
    UILabel *endtLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(195+3, 145+140, 125, 20)];
    endtLbl2.textColor = [UIColor grayColor];
    endtLbl2.font = [UIFont systemFontOfSize:18];
    [DeatilsView1 addSubview:endtLbl2];
    
    
    UIButton *Okcomment2 = [UIButton buttonWithType:UIButtonTypeCustom];
    Okcomment2.frame = CGRectMake(350, 90+140, 100, 80/2);
    Okcomment2.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    [Okcomment2 setTitle:@"Ok" forState:UIControlStateNormal];
    [Okcomment2 setTitle:@"Ok" forState:UIControlStateSelected];
    [Okcomment2 setTitle:@"Ok" forState:UIControlStateHighlighted];
    Okcomment2.tag=sender.tag;
    [Okcomment2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Okcomment2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Okcomment2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Okcomment2.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [Okcomment2 addTarget:self action:@selector(submitVAl2:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView1 addSubview:Okcomment2];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
            ttPOP.text = @"Sovi";
            strtLbl.text = @"Frá klokkan";
            endtLbl.text = @"Til klokkan";
            strtLbl2.text = @"Frá klokkan";
            endtLbl2.text = @"Til klokkan";
    }
    else
    {
        ttPOP.text = @"Sovet";
        strtLbl.text = @"Fra klokken";
        endtLbl.text = @"Til klokken";
        strtLbl2.text = @"Fra klokken";
        endtLbl2.text = @"Til klokken";
    }
    

}
-(void)submitVAl2:(UIButton *)sender{
    
    NSError *error=nil;
    NSString *urlString1 = [NSString stringWithFormat:@"%@add_second_sleep.php?child_id=%@&timepickerStart=%@&timepickerStop=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"],strtTm.titleLabel.text,endtTm.titleLabel.text];
    
    NSLog(@"urlString1%@",urlString1);
    
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    
    
    
    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", urlString);
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL1 //1
                                   
                                   options:kNilOptions
                                   error:&error];
    [data_retrived removeAllObjects];
    [copyArray removeAllObjects];
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
    copyArray = [data_retrived mutableCopy];
    NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
    NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
    [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
    
    if([copyArray count] == 0){
        
        [FindUser removeFromSuperview];
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
    
    
    
    DeatilsView1.hidden = YES;
    okCls1.hidden = YES;
    pickerBack1.hidden =YES;
}

-(void)submitVAl:(UIButton *)sender{
    
     NSError *error=nil;
    NSString *urlString1 = [NSString stringWithFormat:@"%@add_sleep.php?child_id=%@&timepickerStart=%@&timepickerStop=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"],startTime.titleLabel.text,endTime.titleLabel.text];
    
    NSLog(@"urlString1%@",urlString1);
    
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    
    
    
    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", urlString);
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL1 //1
                                   
                                   options:kNilOptions
                                   error:&error];
    [data_retrived removeAllObjects];
    [copyArray removeAllObjects];
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
    copyArray = [data_retrived mutableCopy];
    NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
    NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
    [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
    
    if([copyArray count] == 0){
        
        [FindUser removeFromSuperview];
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

    
    
    DeatilsView1.hidden = YES;
    okCls1.hidden = YES;
    pickerBack1.hidden =YES;
}
-(void)openPicker_end2:(UIButton *)sender{
    
    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];
    secndBtn=YES;
    start =NO;
    
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    
    
    
    
    
    // Initialization code
    
    dPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(120,  160, 685/2, 190)];
    dPicker.backgroundColor = [UIColor colorWithRed:(255.0f / 255.0f) green:(255.0f / 255.0f) blue:(255.0f / 255.0f) alpha:0.7f];
    dPicker.datePickerMode = UIDatePickerModeTime;
    dPicker.hidden = NO;
    
    dPicker.date = [NSDate date];
    //    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"NL"];
    //  [dPicker setLocale:locale];
    
    [dPicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];
    
    [pickerBack addSubview:dPicker];
    
    
    
    
    UIButton *Submit_new = [UIButton buttonWithType:UIButtonTypeCustom];
    Submit_new.frame = CGRectMake(316+90, 160, 50, 57/2);
    Submit_new.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    [Submit_new addTarget:self action:@selector(closepicker) forControlEvents:UIControlEventTouchUpInside];
    [Submit_new setTitle:@"Ok" forState:UIControlStateNormal];
    [Submit_new setTitle:@"Ok" forState:UIControlStateSelected];
    [Submit_new setTitle:@"Ok" forState:UIControlStateHighlighted];
    //Submit_new.titleLabel.textColor = [UIColor blackColor];
    [Submit_new setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pickerBack addSubview:Submit_new];
    [pickerBack bringSubviewToFront:Submit_new];
    
    
    
}

-(void)openPicker_end:(UIButton *)sender{
    
    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];
    secndBtn=NO;
    start =NO;
    
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    
    
    
    
    
    // Initialization code
    
    dPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(120,  160, 685/2, 190)];
    dPicker.backgroundColor = [UIColor colorWithRed:(255.0f / 255.0f) green:(255.0f / 255.0f) blue:(255.0f / 255.0f) alpha:0.7f];
    dPicker.datePickerMode = UIDatePickerModeTime;
    dPicker.hidden = NO;
    
    dPicker.date = [NSDate date];
    //    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"NL"];
    //  [dPicker setLocale:locale];
    
    [dPicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];
    
    [pickerBack addSubview:dPicker];
    
    

    
    UIButton *Submit_new = [UIButton buttonWithType:UIButtonTypeCustom];
    Submit_new.frame = CGRectMake(316+90, 160, 50, 57/2);
    Submit_new.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    [Submit_new addTarget:self action:@selector(closepicker) forControlEvents:UIControlEventTouchUpInside];
    [Submit_new setTitle:@"Ok" forState:UIControlStateNormal];
    [Submit_new setTitle:@"Ok" forState:UIControlStateSelected];
    [Submit_new setTitle:@"Ok" forState:UIControlStateHighlighted];
    //Submit_new.titleLabel.textColor = [UIColor blackColor];
    [Submit_new setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pickerBack addSubview:Submit_new];
    [pickerBack bringSubviewToFront:Submit_new];
    
    
    
}
-(void)openPicker_start2:(UIButton *)sender{
    
    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];
    secndBtn=YES;
    start =YES;
    
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    
    
    
    
    
    // Initialization code
    
    dPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(120,  160, 685/2, 190)];
    dPicker.backgroundColor = [UIColor colorWithRed:(255.0f / 255.0f) green:(255.0f / 255.0f) blue:(255.0f / 255.0f) alpha:0.7f];
    dPicker.datePickerMode = UIDatePickerModeTime;
    dPicker.hidden = NO;
    
    dPicker.date = [NSDate date];
    //    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"NL"];
    //  [dPicker setLocale:locale];
    
    [dPicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];
    
    [pickerBack addSubview:dPicker];
    
    
    
    
    
    
    
    UIButton *Submit_new = [UIButton buttonWithType:UIButtonTypeCustom];
    Submit_new.frame = CGRectMake(316+90, 160, 50, 57/2);
    Submit_new.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    [Submit_new addTarget:self action:@selector(closepicker) forControlEvents:UIControlEventTouchUpInside];
    [Submit_new setTitle:@"Ok" forState:UIControlStateNormal];
    [Submit_new setTitle:@"Ok" forState:UIControlStateSelected];
    [Submit_new setTitle:@"Ok" forState:UIControlStateHighlighted];
    //Submit_new.titleLabel.textColor = [UIColor blackColor];
    [Submit_new setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pickerBack addSubview:Submit_new];
    [pickerBack bringSubviewToFront:Submit_new];
    
    
    
}

-(void)openPicker_start:(UIButton *)sender{

    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];
    secndBtn=NO;
    start =YES;
    
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    
    
    
    
    
    // Initialization code
    
    dPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(120,  160, 685/2, 190)];
    dPicker.backgroundColor = [UIColor colorWithRed:(255.0f / 255.0f) green:(255.0f / 255.0f) blue:(255.0f / 255.0f) alpha:0.7f];
    dPicker.datePickerMode = UIDatePickerModeTime;
    dPicker.hidden = NO;
    
    dPicker.date = [NSDate date];
    //    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"NL"];
    //  [dPicker setLocale:locale];
    
    [dPicker addTarget:self action:@selector(changeDateInLabel:) forControlEvents:UIControlEventValueChanged];
    
    [pickerBack addSubview:dPicker];
    
    
    
    
    
    
    
    UIButton *Submit_new = [UIButton buttonWithType:UIButtonTypeCustom];
    Submit_new.frame = CGRectMake(316+90, 160, 50, 57/2);
    Submit_new.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1];
    [Submit_new addTarget:self action:@selector(closepicker) forControlEvents:UIControlEventTouchUpInside];
    [Submit_new setTitle:@"Ok" forState:UIControlStateNormal];
    [Submit_new setTitle:@"Ok" forState:UIControlStateSelected];
    [Submit_new setTitle:@"Ok" forState:UIControlStateHighlighted];
   // Submit_new.titleLabel.textColor = [UIColor blackColor];
    [Submit_new setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pickerBack addSubview:Submit_new];
    [pickerBack bringSubviewToFront:Submit_new];

    
    
}
-(void)closepicker{
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    //[outputFormatter setDateFormat:@"h:mm a"];
    [outputFormatter setDateFormat:@"HH:mm"];
    

    NSLog(@"[outputFormatter stringFromDate:dPicker.date]...%@",[outputFormatter stringFromDate:dPicker.date]);
    if(secndBtn == YES){
        if(start == YES){
            
            [strtTm setTitle:[outputFormatter stringFromDate:dPicker.date] forState:UIControlStateNormal];
            [strtTm setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateHighlighted];
            [strtTm setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateSelected];
            toTme = [outputFormatter stringFromDate:dPicker.date];
        }else{
            
            [endtTm setTitle:[outputFormatter stringFromDate:dPicker.date] forState:UIControlStateNormal];
            [endtTm setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateHighlighted];
            [endtTm setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateSelected];
            toTmeEnd = [outputFormatter stringFromDate:dPicker.date];
            
        }

    
    }else{
    if(start == YES){
    
    [startTime setTitle:[outputFormatter stringFromDate:dPicker.date] forState:UIControlStateNormal];
    [startTime setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateHighlighted];
    [startTime setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateSelected];
    toTme = [outputFormatter stringFromDate:dPicker.date];
    }
    else
    {
        [endTime setTitle:[outputFormatter stringFromDate:dPicker.date] forState:UIControlStateNormal];
        [endTime setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateHighlighted];
        [endTime setTitle:[outputFormatter stringFromDate:dPicker.date]  forState:UIControlStateSelected];
        toTmeEnd = [outputFormatter stringFromDate:dPicker.date];
    
    }
    }
    [pickerBack removeFromSuperview];
    [dPicker removeFromSuperview];
    
}

- (void)changeDateInLabel:(id)sender{

    NSDateFormatter *df = [[NSDateFormatter alloc] init]; df.dateStyle = NSDateFormatterMediumStyle;

}
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

-(void)comment:(UIButton *)sender{
    
    
    NSLog(@"comment...........");
    
    
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    [mainView bringSubviewToFront:pickerBack];
    
    
    okCls = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls.frame = CGRectMake(635, 120, 120/2, 120/2);
    okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
    [okCls addTarget:self action:@selector(closevistr) forControlEvents:UIControlEventTouchUpInside];
    okCls.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls];
    [mainView bringSubviewToFront:okCls];
    
    
    
    
    DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
    DeatilsView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView];
    [mainView bringSubviewToFront:DeatilsView];
    
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:ttPOP];
    
    
    CoemtText = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
    CoemtText.font = [UIFont systemFontOfSize:16.0f];
    CoemtText.backgroundColor = [UIColor clearColor];
    CoemtText.textColor = [UIColor grayColor];
    CoemtText.scrollEnabled = YES;
    CoemtText.pagingEnabled = YES;
    CoemtText.editable = YES;
    CoemtText.delegate = self;
    CoemtText.layer.borderWidth = 1.0f;
    CoemtText.layer.borderColor = [[UIColor grayColor] CGColor];
    CoemtText.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:CoemtText];
    
    UIButton *Okcomment = [UIButton buttonWithType:UIButtonTypeCustom];
    Okcomment.frame = CGRectMake(370, 175, 100, 80/2);
    Okcomment.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    [Okcomment setTitle:@"Ok" forState:UIControlStateNormal];
    [Okcomment setTitle:@"Ok" forState:UIControlStateSelected];
    [Okcomment setTitle:@"Ok" forState:UIControlStateHighlighted];
    [Okcomment setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Okcomment.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    Okcomment.tag=sender.tag;
    [Okcomment addTarget:self action:@selector(closevistr:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:Okcomment];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
          ttPOP.text = [NSString CommentF];
    }
    else
    {
     ttPOP.text = [NSString CommentD];
    }

}
-(void)Broyt2:(UIButton *)sender{
    CmntLBL.hidden=YES;
    
    CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
    CoemtText2.font = [UIFont systemFontOfSize:16.0f];
    CoemtText2.backgroundColor = [UIColor clearColor];
    CoemtText2.textColor = [UIColor grayColor];
    CoemtText2.scrollEnabled = YES;
    CoemtText2.pagingEnabled = YES;
    if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
        
        CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
        
    }
    
    CoemtText2.editable = YES;
    CoemtText2.delegate = self;
    CoemtText2.layer.borderWidth = 1.0f;
    CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
    CoemtText2.textAlignment = NSTextAlignmentLeft;
    [DeatilsView addSubview:CoemtText2];
    
    Broyt.hidden=YES;
    UIButton *Okcomment = [UIButton buttonWithType:UIButtonTypeCustom];
    Okcomment.frame = CGRectMake(370, 175, 100, 80/2);
    Okcomment.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    [Okcomment setTitle:@"Ok" forState:UIControlStateNormal];
    [Okcomment setTitle:@"Ok" forState:UIControlStateSelected];
    [Okcomment setTitle:@"Ok" forState:UIControlStateHighlighted];
    Okcomment.tag=sender.tag;
    [Okcomment setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Okcomment.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [Okcomment addTarget:self action:@selector(closevistr2_submit:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:Okcomment];
    
}
-(void)closevistr_closee{
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
    
    [CoemtText2 resignFirstResponder];
    [CoemtText resignFirstResponder];
    
}
-(void)comment2:(UIButton *)sender{
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        if ([sender.titleLabel.text isEqualToString:[NSString Comment2F]])
        {
            //  NSLog(@"....%d",[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]].length);
            pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
            pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
            [mainView addSubview:pickerBack];
            [mainView bringSubviewToFront:pickerBack];
            
            
            okCls = [UIButton buttonWithType:UIButtonTypeCustom];
            okCls.frame = CGRectMake(635, 120, 120/2, 120/2);
            okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
            [okCls addTarget:self action:@selector(closevistr_closee) forControlEvents:UIControlEventTouchUpInside];
            okCls.titleLabel.textColor = [UIColor blackColor];
            [mainView addSubview:okCls];
            [mainView bringSubviewToFront:okCls];
            
            
            
            
            DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
            DeatilsView.backgroundColor = [UIColor whiteColor];
            [mainView addSubview:DeatilsView];
            [mainView bringSubviewToFront:DeatilsView];
            
            //    Broyt.hidden=NO;
            //    Broyt = [UIButton buttonWithType:UIButtonTypeCustom];
            //    Broyt.frame = CGRectMake(410,10, 80, 80/2);
            //    Broyt.backgroundColor = [UIColor clearColor];
            //    Broyt.tag = sender.tag;
            //    [Broyt setTitle:@"(Broyt)" forState:UIControlStateNormal];
            //    [Broyt setTitle:@"(Broyt)" forState:UIControlStateSelected];
            //    [Broyt setTitle:@"(Broyt)" forState:UIControlStateHighlighted];
            //    [Broyt setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
            //    [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
            //    [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            //    Broyt.titleLabel.font = [UIFont systemFontOfSize:15];
            //    [Broyt addTarget:self action:@selector(Broyt2:) forControlEvents:UIControlEventTouchUpInside];
            //    [DeatilsView addSubview:Broyt];
            
            
            UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 35)];
            ttPOP.backgroundColor = [UIColor clearColor];
            ttPOP.textColor = [UIColor grayColor];
            ttPOP.text = [NSString Comment2F];
            ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
            ttPOP.textAlignment = NSTextAlignmentCenter;
            [DeatilsView addSubview:ttPOP];
            
            
            
            if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != (id)[NSNull null]){
                if ([[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] length] > 0) {
                    NSLog(@"NOT NULL");
                    CmntLBL.hidden=NO;
                    CmntLBL= [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 460, 85)];
                    CmntLBL.text=[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
                    CmntLBL.textColor =[UIColor grayColor];
                    CmntLBL.textAlignment = NSTextAlignmentLeft;
                    CmntLBL.backgroundColor = [UIColor clearColor];
                    CmntLBL.font = [UIFont systemFontOfSize:17];
                    [DeatilsView addSubview:CmntLBL];
                    
                    
                } else {
                    NSLog(@"Blank");
                    
                    CoemtText2.hidden=NO;
                    CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
                    CoemtText2.font = [UIFont systemFontOfSize:16.0f];
                    CoemtText2.backgroundColor = [UIColor clearColor];
                    CoemtText2.textColor = [UIColor grayColor];
                    CoemtText2.scrollEnabled = YES;
                    CoemtText2.pagingEnabled = YES;
                    if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
                        
                        CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
                        
                    }
                    
                    CoemtText2.editable = YES;
                    CoemtText2.delegate = self;
                    CoemtText2.layer.borderWidth = 1.0f;
                    CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
                    CoemtText2.textAlignment = NSTextAlignmentLeft;
                    [DeatilsView addSubview:CoemtText2];
                    
                }
            } else {
                NSLog(@"Null");
                
                CoemtText2.hidden=NO;
                CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
                CoemtText2.font = [UIFont systemFontOfSize:16.0f];
                CoemtText2.backgroundColor = [UIColor clearColor];
                CoemtText2.textColor = [UIColor grayColor];
                CoemtText2.scrollEnabled = YES;
                CoemtText2.pagingEnabled = YES;
                if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
                    
                    CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
                    
                }
                
                CoemtText2.editable = YES;
                CoemtText2.delegate = self;
                CoemtText2.layer.borderWidth = 1.0f;
                CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
                CoemtText2.textAlignment = NSTextAlignmentLeft;
                [DeatilsView addSubview:CoemtText2];
                
            }
            
            //    @try {
            //        if(![[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]  isEqual: @"<null>"] || [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != (id)[NSNull null] || ![[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]  isEqual: @""] || [NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]].length > 0 ){
            //            CmntLBL.hidden=NO;
            //            CmntLBL= [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 460, 85)];
            //            CmntLBL.text=[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
            //            CmntLBL.textColor =[UIColor grayColor];
            //            CmntLBL.textAlignment = NSTextAlignmentLeft;
            //            CmntLBL.backgroundColor = [UIColor clearColor];
            //            CmntLBL.font = [UIFont systemFontOfSize:17];
            //            [DeatilsView addSubview:CmntLBL];
            //
            //        }else{
            //            CoemtText2.hidden=NO;
            //            CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
            //            CoemtText2.font = [UIFont systemFontOfSize:16.0f];
            //            CoemtText2.backgroundColor = [UIColor clearColor];
            //            CoemtText2.textColor = [UIColor grayColor];
            //            CoemtText2.scrollEnabled = YES;
            //            CoemtText2.pagingEnabled = YES;
            //            if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
            //
            //                CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
            //
            //            }
            //
            //            CoemtText2.editable = YES;
            //            CoemtText2.delegate = self;
            //            CoemtText2.layer.borderWidth = 1.0f;
            //            CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
            //            CoemtText2.textAlignment = NSTextAlignmentLeft;
            //            [DeatilsView addSubview:CoemtText2];
            //
            //
            //        }
            //    }
            //    @catch (NSException *exception) {
            //        NSLog(@"Exception: %@", exception.description);
            //    }
            //    @finally {
            //
            //    }
            
            UIButton *Okcomment = [UIButton buttonWithType:UIButtonTypeCustom];
            Okcomment.frame = CGRectMake(370, 175, 100, 80/2);
            Okcomment.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
            [Okcomment setTitle:@"Ok" forState:UIControlStateNormal];
            [Okcomment setTitle:@"Ok" forState:UIControlStateSelected];
            [Okcomment setTitle:@"Ok" forState:UIControlStateHighlighted];
            Okcomment.tag=sender.tag;
            [Okcomment setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
            [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            Okcomment.titleLabel.font = [UIFont boldSystemFontOfSize:24];
            [Okcomment addTarget:self action:@selector(closevistr2_submit:) forControlEvents:UIControlEventTouchUpInside];
            [DeatilsView addSubview:Okcomment];
            
        }
        else
        {
            pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
            pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
            [mainView addSubview:pickerBack];
            [mainView bringSubviewToFront:pickerBack];
            
            
            okCls = [UIButton buttonWithType:UIButtonTypeCustom];
            okCls.frame = CGRectMake(635, 120, 120/2, 120/2);
            okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
            [okCls addTarget:self action:@selector(closevistr_closee) forControlEvents:UIControlEventTouchUpInside];
            okCls.titleLabel.textColor = [UIColor blackColor];
            [mainView addSubview:okCls];
            [mainView bringSubviewToFront:okCls];
            
            
            
            
            DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
            DeatilsView.backgroundColor = [UIColor whiteColor];
            [mainView addSubview:DeatilsView];
            [mainView bringSubviewToFront:DeatilsView];
            
            //     Broyt.hidden=NO;
            Broyt = [UIButton buttonWithType:UIButtonTypeCustom];
            Broyt.frame = CGRectMake(340,10, 80, 80/2);
            Broyt.backgroundColor = [UIColor clearColor];
            Broyt.tag = sender.tag;
            [Broyt setTitle:[NSString EditF] forState:UIControlStateNormal];
            [Broyt setTitle:[NSString EditF] forState:UIControlStateSelected];
            [Broyt setTitle:[NSString EditF] forState:UIControlStateHighlighted];
            [Broyt setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
            [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
            [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            Broyt.titleLabel.font = [UIFont systemFontOfSize:15];
            [Broyt addTarget:self action:@selector(Broyt2:) forControlEvents:UIControlEventTouchUpInside];
            [DeatilsView addSubview:Broyt];
            
            
            UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 35)];
            ttPOP.backgroundColor = [UIColor clearColor];
            ttPOP.textColor = [UIColor grayColor];
            ttPOP.text = [NSString Comment2SelectedF];
            ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
            ttPOP.textAlignment = NSTextAlignmentCenter;
            [DeatilsView addSubview:ttPOP];
            
            CoemtText2.hidden=NO;
            CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
            CoemtText2.font = [UIFont systemFontOfSize:16.0f];
            CoemtText2.backgroundColor = [UIColor clearColor];
            CoemtText2.textColor = [UIColor grayColor];
            CoemtText2.scrollEnabled = YES;
            CoemtText2.pagingEnabled = YES;
            if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
                
                CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
                
            }
            
            CoemtText2.editable = NO;
            CoemtText2.delegate = self;
            CoemtText2.textAlignment = NSTextAlignmentLeft;
            [DeatilsView addSubview:CoemtText2];
            
            slettanote = [UIButton buttonWithType:UIButtonTypeCustom];
            slettanote.frame = CGRectMake(410,10, 80, 80/2);
            slettanote.backgroundColor = [UIColor clearColor];
            slettanote.tag = sender.tag;
            [slettanote setTitle:[NSString DeleteF] forState:UIControlStateNormal];
            [slettanote setTitle:[NSString DeleteF] forState:UIControlStateSelected];
            [slettanote setTitle:[NSString DeleteF] forState:UIControlStateHighlighted];
            [slettanote setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
            [slettanote setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
            [slettanote setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            slettanote.titleLabel.font = [UIFont systemFontOfSize:15];
            [slettanote addTarget:self action:@selector(Selltenote:) forControlEvents:UIControlEventTouchUpInside];
            [DeatilsView addSubview:slettanote];
        }
    }
    else
    {
    if ([sender.titleLabel.text isEqualToString:[NSString Comment2D]])
    {
    //  NSLog(@"....%d",[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]].length);
    pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
    [mainView addSubview:pickerBack];
    [mainView bringSubviewToFront:pickerBack];
    
    
    okCls = [UIButton buttonWithType:UIButtonTypeCustom];
    okCls.frame = CGRectMake(635, 120, 120/2, 120/2);
    okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
    [okCls addTarget:self action:@selector(closevistr_closee) forControlEvents:UIControlEventTouchUpInside];
    okCls.titleLabel.textColor = [UIColor blackColor];
    [mainView addSubview:okCls];
    [mainView bringSubviewToFront:okCls];
    
    
    
    
    DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
    DeatilsView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:DeatilsView];
    [mainView bringSubviewToFront:DeatilsView];
    
//    Broyt.hidden=NO;
//    Broyt = [UIButton buttonWithType:UIButtonTypeCustom];
//    Broyt.frame = CGRectMake(410,10, 80, 80/2);
//    Broyt.backgroundColor = [UIColor clearColor];
//    Broyt.tag = sender.tag;
//    [Broyt setTitle:@"(Broyt)" forState:UIControlStateNormal];
//    [Broyt setTitle:@"(Broyt)" forState:UIControlStateSelected];
//    [Broyt setTitle:@"(Broyt)" forState:UIControlStateHighlighted];
//    [Broyt setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
//    [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
//    [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    Broyt.titleLabel.font = [UIFont systemFontOfSize:15];
//    [Broyt addTarget:self action:@selector(Broyt2:) forControlEvents:UIControlEventTouchUpInside];
//    [DeatilsView addSubview:Broyt];
    
    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 35)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.text = [NSString Comment2D];
    ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
    ttPOP.textAlignment = NSTextAlignmentCenter;
    [DeatilsView addSubview:ttPOP];
    
    
    
    if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != (id)[NSNull null]){
        if ([[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] length] > 0) {
            NSLog(@"NOT NULL");
            CmntLBL.hidden=NO;
            CmntLBL= [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 460, 85)];
            CmntLBL.text=[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
            CmntLBL.textColor =[UIColor grayColor];
            CmntLBL.textAlignment = NSTextAlignmentLeft;
            CmntLBL.backgroundColor = [UIColor clearColor];
            CmntLBL.font = [UIFont systemFontOfSize:17];
            [DeatilsView addSubview:CmntLBL];
            
            
        } else {
            NSLog(@"Blank");
            
            CoemtText2.hidden=NO;
            CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
            CoemtText2.font = [UIFont systemFontOfSize:16.0f];
            CoemtText2.backgroundColor = [UIColor clearColor];
            CoemtText2.textColor = [UIColor grayColor];
            CoemtText2.scrollEnabled = YES;
            CoemtText2.pagingEnabled = YES;
            if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
                
                CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
                
            }
            
            CoemtText2.editable = YES;
            CoemtText2.delegate = self;
            CoemtText2.layer.borderWidth = 1.0f;
            CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
            CoemtText2.textAlignment = NSTextAlignmentLeft;
            [DeatilsView addSubview:CoemtText2];
            
        }
    } else {
        NSLog(@"Null");
        
        CoemtText2.hidden=NO;
        CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
        CoemtText2.font = [UIFont systemFontOfSize:16.0f];
        CoemtText2.backgroundColor = [UIColor clearColor];
        CoemtText2.textColor = [UIColor grayColor];
        CoemtText2.scrollEnabled = YES;
        CoemtText2.pagingEnabled = YES;
        if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
            
            CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
            
        }
        
        CoemtText2.editable = YES;
        CoemtText2.delegate = self;
        CoemtText2.layer.borderWidth = 1.0f;
        CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
        CoemtText2.textAlignment = NSTextAlignmentLeft;
        [DeatilsView addSubview:CoemtText2];
        
    }
    
    //    @try {
    //        if(![[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]  isEqual: @"<null>"] || [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != (id)[NSNull null] || ![[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]  isEqual: @""] || [NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"]].length > 0 ){
    //            CmntLBL.hidden=NO;
    //            CmntLBL= [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 460, 85)];
    //            CmntLBL.text=[[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
    //            CmntLBL.textColor =[UIColor grayColor];
    //            CmntLBL.textAlignment = NSTextAlignmentLeft;
    //            CmntLBL.backgroundColor = [UIColor clearColor];
    //            CmntLBL.font = [UIFont systemFontOfSize:17];
    //            [DeatilsView addSubview:CmntLBL];
    //
    //        }else{
    //            CoemtText2.hidden=NO;
    //            CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
    //            CoemtText2.font = [UIFont systemFontOfSize:16.0f];
    //            CoemtText2.backgroundColor = [UIColor clearColor];
    //            CoemtText2.textColor = [UIColor grayColor];
    //            CoemtText2.scrollEnabled = YES;
    //            CoemtText2.pagingEnabled = YES;
    //            if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
    //
    //                CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
    //
    //            }
    //
    //            CoemtText2.editable = YES;
    //            CoemtText2.delegate = self;
    //            CoemtText2.layer.borderWidth = 1.0f;
    //            CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];
    //            CoemtText2.textAlignment = NSTextAlignmentLeft;
    //            [DeatilsView addSubview:CoemtText2];
    //
    //
    //        }
    //    }
    //    @catch (NSException *exception) {
    //        NSLog(@"Exception: %@", exception.description);
    //    }
    //    @finally {
    //
    //    }
    
    UIButton *Okcomment = [UIButton buttonWithType:UIButtonTypeCustom];
    Okcomment.frame = CGRectMake(370, 175, 100, 80/2);
    Okcomment.backgroundColor = [UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    [Okcomment setTitle:@"Ok" forState:UIControlStateNormal];
    [Okcomment setTitle:@"Ok" forState:UIControlStateSelected];
    [Okcomment setTitle:@"Ok" forState:UIControlStateHighlighted];
    Okcomment.tag=sender.tag;
    [Okcomment setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Okcomment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Okcomment.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [Okcomment addTarget:self action:@selector(closevistr2_submit:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:Okcomment];
    
    }
    else
    {
        pickerBack = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
        pickerBack.backgroundColor = [UIColor colorWithRed:(0 / 255.0f) green:(0 / 255.0f) blue:(0 / 255.0f) alpha:0.7f];
        [mainView addSubview:pickerBack];
        [mainView bringSubviewToFront:pickerBack];
        
        
        okCls = [UIButton buttonWithType:UIButtonTypeCustom];
        okCls.frame = CGRectMake(635, 120, 120/2, 120/2);
        okCls.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cross"]];
        [okCls addTarget:self action:@selector(closevistr_closee) forControlEvents:UIControlEventTouchUpInside];
        okCls.titleLabel.textColor = [UIColor blackColor];
        [mainView addSubview:okCls];
        [mainView bringSubviewToFront:okCls];
        
        
        
        
        DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
        DeatilsView.backgroundColor = [UIColor whiteColor];
        [mainView addSubview:DeatilsView];
        [mainView bringSubviewToFront:DeatilsView];
        
        //     Broyt.hidden=NO;
        Broyt = [UIButton buttonWithType:UIButtonTypeCustom];
        Broyt.frame = CGRectMake(340,10, 80, 80/2);
        Broyt.backgroundColor = [UIColor clearColor];
        Broyt.tag = sender.tag;
        [Broyt setTitle:[NSString EditD] forState:UIControlStateNormal];
        [Broyt setTitle:[NSString EditD] forState:UIControlStateSelected];
        [Broyt setTitle:[NSString EditD] forState:UIControlStateHighlighted];
        [Broyt setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [Broyt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        Broyt.titleLabel.font = [UIFont systemFontOfSize:15];
        [Broyt addTarget:self action:@selector(Broyt2:) forControlEvents:UIControlEventTouchUpInside];
        [DeatilsView addSubview:Broyt];
        
        
        UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 35)];
        ttPOP.backgroundColor = [UIColor clearColor];
        ttPOP.textColor = [UIColor grayColor];
        ttPOP.text = [NSString Comment2SelectedD];
        ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
        ttPOP.textAlignment = NSTextAlignmentCenter;
        [DeatilsView addSubview:ttPOP];
        
        CoemtText2.hidden=NO;
        CoemtText2 = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
        CoemtText2.font = [UIFont systemFontOfSize:16.0f];
        CoemtText2.backgroundColor = [UIColor clearColor];
        CoemtText2.textColor = [UIColor grayColor];
        CoemtText2.scrollEnabled = YES;
        CoemtText2.pagingEnabled = YES;
        if([[copyArray objectAtIndex:sender.tag]objectForKey:@"note"] != [NSNull null]){
            
            CoemtText2.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"note"];
            
        }
        
        CoemtText2.editable = NO;
        CoemtText2.delegate = self;
        CoemtText2.textAlignment = NSTextAlignmentLeft;
        [DeatilsView addSubview:CoemtText2];
        
        slettanote = [UIButton buttonWithType:UIButtonTypeCustom];
        slettanote.frame = CGRectMake(410,10, 80, 80/2);
        slettanote.backgroundColor = [UIColor clearColor];
        slettanote.tag = sender.tag;
        [slettanote setTitle:[NSString DeleteD] forState:UIControlStateNormal];
        [slettanote setTitle:[NSString DeleteD] forState:UIControlStateSelected];
        [slettanote setTitle:[NSString DeleteD] forState:UIControlStateHighlighted];
        [slettanote setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        [slettanote setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [slettanote setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        slettanote.titleLabel.font = [UIFont systemFontOfSize:15];
        [slettanote addTarget:self action:@selector(Selltenote:) forControlEvents:UIControlEventTouchUpInside];
        [DeatilsView addSubview:slettanote];
    }
    }
}
-(void)Selltenote:(UIButton *)sender
{
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
    
    NSError *error=nil;
    
    NSString *urlString1 = [NSString stringWithFormat:@"%@delete_note.php?id=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
    
    NSLog(@"urlString1%@",urlString1);
    
    //        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    NSLog(@"serveroutput=---- %@",serverOutput);
    
    if ([serverOutput isEqualToString:@"success"])
    {
        [self viewDidAppear:YES];
    }
    
}
-(void)closevistr{
    
    
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
    
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        
        if ([textView.text isEqualToString:@"Skal útfyllast"]) {
            textView.text = @"";
            textView.textColor = [UIColor blackColor]; //optional
        }
        [textView becomeFirstResponder];
    }
    else
    {
        if ([textView.text isEqualToString:[NSString TextCheckD]]) {
            textView.text = @"";
            textView.textColor = [UIColor blackColor]; //optional
        }
        [textView becomeFirstResponder];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        
        if ([textView.text isEqualToString:@""]) {
            textView.text = @"Skal útfyllast";
            textView.textColor = [UIColor lightGrayColor]; //optional
        }
        [textView resignFirstResponder];
    }
    else
    {
        if ([textView.text isEqualToString:@""]) {
            textView.text = [NSString TextCheckD];
            textView.textColor = [UIColor lightGrayColor]; //optional
        }
        [textView resignFirstResponder];
    }

}
-(void)closevistr2_submit:(UIButton *)sender{
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        
    
    if([CoemtText2.text  isEqual: @""] || [CoemtText2.text isEqualToString:@"Skal útfyllast"]){
        
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Skal útfyllast" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        
//        [alert show];
        
        CoemtText2.text= @"Skal útfyllast";
        
        
    }else{
        
        
        DeatilsView.hidden = YES;
        okCls.hidden = YES;
        pickerBack.hidden =YES;
        
        
        
        
        
        NSError *error=nil;
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@addnote.php?child_id=%@&note_check=%@&room_id=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"],CoemtText2.text,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
        
        NSLog(@"urlString1%@",urlString1);
        
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        
        
        NSString *urlString;
        
        urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        
        
        
        
        
        
        NSLog(@" %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        
        NSLog(@"%@", urlString);
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization
                                       JSONObjectWithData:signeddataURL1 //1
                                       
                                       options:kNilOptions
                                       error:&error];
        [data_retrived removeAllObjects];
        [copyArray removeAllObjects];
        for(NSMutableDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        copyArray = [data_retrived mutableCopy];
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[copyArray count]];
        NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
        NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
        [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
        
        if([copyArray count] == 0){
            
            [FindUser removeFromSuperview];
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
        
    }
    }
    else
    {
        if([CoemtText2.text  isEqual: @""] || [CoemtText2.text isEqualToString:[NSString TextCheckD]]){
            
            
            //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Skal útfyllast" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            //
            //        [alert show];
            
            CoemtText2.text= [NSString TextCheckD];
            
            
        }else{
            
            
            DeatilsView.hidden = YES;
            okCls.hidden = YES;
            pickerBack.hidden =YES;
            
            
            
            
            
            NSError *error=nil;
            
            NSString *urlString1 = [NSString stringWithFormat:@"%@addnote.php?child_id=%@&note_check=%@&room_id=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"],CoemtText2.text,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
            
            NSLog(@"urlString1%@",urlString1);
            
            NSURL *requestURL1 = [NSURL URLWithString:urlString1];
            NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
            NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
            
            
            
            NSString *urlString;
            
            urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
            
            
            
            
            
            
            NSLog(@" %@",urlString);
            NSURL *requestURL = [NSURL URLWithString:urlString];
            
            NSLog(@"%@", urlString);
            NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
            
            NSMutableDictionary *result = [NSJSONSerialization
                                           JSONObjectWithData:signeddataURL1 //1
                                           
                                           options:kNilOptions
                                           error:&error];
            [data_retrived removeAllObjects];
            [copyArray removeAllObjects];
            for(NSMutableDictionary *dict in result)
            {
                [data_retrived addObject:dict];
                
            }
            copyArray = [data_retrived mutableCopy];
            totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[copyArray count]];
            NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
            NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
            [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
            
            if([copyArray count] == 0){
                
                [FindUser removeFromSuperview];
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
            
        }

    }
    
}

-(void)closevistr:(UIButton *)sender{
    
    if([CoemtText.text  isEqual: @""]){
        
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString TextCheckF] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString TextCheckD] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            [alert show];
        }

        
    }else{
    
    
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
    
    
    
    
    
    NSError *error=nil;
    
    NSString *urlString1 = [NSString stringWithFormat:@"%@add_appo.php?appoint_check=%@&child_id=%@",APPS_DOMAIN_URL,CoemtText.text,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
    
    NSLog(@"urlString1%@",urlString1);
    
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    
    
    
    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", urlString);
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL1 //1
                                   
                                   options:kNilOptions
                                   error:&error];
    [data_retrived removeAllObjects];
    [copyArray removeAllObjects];
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
    copyArray = [data_retrived mutableCopy];
    totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[copyArray count]];
    NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
    NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
    [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
    
    if([copyArray count] == 0){
        
        [FindUser removeFromSuperview];
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

    }
    
}
-(void)bto_action:(UIButton *)sender{


    
    
    sender.selected=YES;
    
    NSError *error=nil;
    
    NSString *urlString1 = [NSString stringWithFormat:@"%@checkstat_heim.php?id=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
    
    NSLog(@"urlString1%@",urlString1);
    
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@heimlist.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    
    
    
    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
   
    NSLog(@"%@", urlString);
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL1 //1
                                   
                                   options:kNilOptions
                                   error:&error];
    [data_retrived removeAllObjects];
    [copyArray removeAllObjects];
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
    copyArray = [data_retrived mutableCopy];
    totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[copyArray count]];
    NSRange range = NSMakeRange(0, [self numberOfSectionsInTableView:FindUser]);
    NSIndexSet *sections = [NSIndexSet indexSetWithIndexesInRange:range];
    [FindUser reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
    
    if([copyArray count] == 0){
        
        [FindUser removeFromSuperview];
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
}

-(void)backOut2{
    downloadQueue  = nil;
    
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}
-(void)backOut{
    downloadQueue  = nil;
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    ViewModel.pageId=pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}
-(void)logout{
    downloadQueue  = nil;
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
