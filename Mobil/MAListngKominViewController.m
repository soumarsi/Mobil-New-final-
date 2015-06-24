//
//  MAListngKominViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MAListngKominViewController.h"
#import "UIImageView+WebCache.h"
#import "MALoginViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MARegistrationViewController.h"
#import "RTSpinKitView.h"
@interface MAListngKominViewController ()
{
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
    NSOperationQueue *downloadQueue;
    UIView *blackview;
    UIView *WhiteView;
    UILabel *AddNewLabel;
}

@end

@implementation MAListngKominViewController
@synthesize pageId;
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
    //[leftview addSubview:registration];
    
    
    
    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    totlCountMem = [[UILabel alloc] initWithFrame:CGRectMake(225, 80, 300, 44)];
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

   
    blackview = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [blackview setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:blackview];
    [blackview setHidden:YES];
    
    
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
    
    UILabel *NewsLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 70.0f, 150.0f, 35.0f)];
    [NewsLabel setBackgroundColor:[UIColor clearColor]];
    [NewsLabel setText:@"Dato:"];
    [NewsLabel setTextAlignment:NSTextAlignmentLeft];
    [NewsLabel setTextColor:[UIColor lightGrayColor]];
    [NewsLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:17]];
    [WhiteView addSubview:NewsLabel];
    
    
    UIButton *CrossButton = [[UIButton alloc]initWithFrame:CGRectMake(460.0f, 7.5f, 28, 28)];
    [CrossButton setBackgroundImage:[UIImage imageNamed:@"NewsCross"] forState:UIControlStateNormal];
    [CrossButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:CrossButton];
    
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
        pageTitle.text = [NSString KominF];
        [UserName setPlaceholder:[NSString SearchF]];
            [AddNewLabel setText:[NSString sickByParentF]];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString KominD];
        [UserName setPlaceholder:[NSString SearchD]];
         [AddNewLabel setText:[NSString sickByParentD]];
    }

    
    //[NSTimer scheduledTimerWithTimeInterval:1200 target:self selector:@selector(updateNewDate) userInfo:nil repeats:YES];
    
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
    downloadQueue = [[NSOperationQueue alloc]init];
    [downloadQueue addOperationWithBlock:^{
    
        NSString *urlString;
    
            urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];

        NSLog(@" %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        NSError* error = nil;
        NSLog(@"%@", urlString);
        NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
    
        for(NSMutableDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
    
    
    totlCountMem.hidden=NO;
    totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)[data_retrived count]];
    
    copyArray = [data_retrived mutableCopy];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
if([data_retrived count] > 0){
    NSLog(@"==data..%@",data_retrived);
    float thgt = [data_retrived count]*162;
    
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
    [FindUser setShowsHorizontalScrollIndicator:NO];
    [FindUser setShowsVerticalScrollIndicator:NO];
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
        
        NSLog(@"dataretrive---- %@", data_retrived);
  
      searchResults = [data_retrived filteredArrayUsingPredicate:resultPredicate];
        
        NSLog(@"searchreslt----%@",searchResults);
        
        copyArray=[[NSMutableArray alloc] initWithArray:searchResults];
        
        [FindUser reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
        
        NSLog(@"coparray------%@",copyArray);
        
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


- (BOOL)searchForString:(NSString *)mainItem matchphrase:(NSString *)matchphrase {
    BOOL match = NO;
    [copyArray removeAllObjects];

    NSLog(@"searchForString");
    
    if(matchphrase.length > 0){
        
        NSPredicate *commentPredicatebird;
        
        NSArray *compoundPredicateArraybird = [data_retrived mutableCopy];
        
        
        commentPredicatebird = [NSPredicate predicateWithFormat:@"name CONTAINS[c] %@",matchphrase]; //ANY keywords.name
        
        compoundPredicateArraybird = [compoundPredicateArraybird filteredArrayUsingPredicate:commentPredicatebird];
        
        NSLog(@"compoundPredicateArraybirdcompoundPredicateArraybird..%@",compoundPredicateArraybird);
        copyArray = [compoundPredicateArraybird mutableCopy];
        
    }
    
    
    
    if([copyArray count] == 0){
        copyArray = data_retrived;
    }
    
    [FindUser reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    
	return match;
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        return 30;
    }
    else
    {
    return 162;
    }
    return false;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (tableView.tag == 1)
    {
        return ChildDateList.count;
    }
    else
    {
    return [copyArray count];
    }

    
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
    
    if (tableView.tag == 1)
    {
        UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 150, 30)];
        FDatoTxt.text = [ChildDateList objectAtIndex:indexPath.row];
        FDatoTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:18];
        FDatoTxt.textColor = [UIColor blackColor];
        FDatoTxt.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:FDatoTxt];
    }
    else
    {
    //108
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, 150)];
    backView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:backView];
    UIImage *plcHol;
    
    if([[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"gender" ]]  isEqual: @"M"]){
    
        plcHol=[UIImage imageNamed:@"Placeolderm"];
        
    }else{
    
        plcHol=[UIImage imageNamed:@"Placeolderf"];
    
    }
    
    
    UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1,193/2+28, 147)];
    pic.tag = indexPath.row;
    [cell addSubview:pic];
    [pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ansa.fo/upload/children_photo/thumb/%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"photo" ]]]
        placeholderImage:plcHol options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    [backView addSubview:pic];
    
    
    
    
    
    UILabel *Name = [[UILabel alloc] initWithFrame:CGRectMake(140, 20, 200, 20)];
    Name.text = @"Navn";
    Name.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    Name.textColor = [UIColor lightGrayColor];
    Name.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:Name];
    
    
    
    UILabel *NameTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 20+23, 260, 20)];
    
    if([[copyArray objectAtIndex:indexPath.row]objectForKey:@"name"] != [NSNull null]){
    
    NameTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"name"];
        
    }
    NameTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:18];
    NameTxt.textColor = [UIColor blackColor];
    NameTxt.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:NameTxt];
    
    
    UILabel *FDato = [[UILabel alloc] initWithFrame:CGRectMake(140, 68, 200, 20)];
    FDato.text = @"F.Dato";
    FDato.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    FDato.textColor = [UIColor lightGrayColor];
    FDato.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:FDato];
    
    
    UILabel *FDatoTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 92, 300, 20)];
    FDatoTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"date_of_birth"];
    FDatoTxt.font = [UIFont fontWithName:GLOBALTEXTFONT size:18];
    FDatoTxt.textColor = [UIColor blackColor];
    FDatoTxt.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:FDatoTxt];

    
    
    comment = [UIButton buttonWithType:UIButtonTypeCustom];
    comment.frame = CGRectMake(93, 112, 200, 80/2);
    comment.backgroundColor = [UIColor clearColor];
        if ([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appo_stat"]  isEqual: @""] || [[[copyArray objectAtIndex:indexPath.row]objectForKey:@"appo_stat"]  isEqual: @"<null>"] || [[copyArray objectAtIndex:indexPath.row]objectForKey:@"appo_stat"] == (id)[NSNull null] )
        {
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
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
        else
        {
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
            {
                [comment setTitle:[NSString CommentSelectedF] forState:UIControlStateNormal];
                [comment setTitle:[NSString CommentSelectedF] forState:UIControlStateSelected];
                [comment setTitle:[NSString CommentSelectedF] forState:UIControlStateHighlighted];
            }
            else
            {
                [comment setTitle:[NSString CommentSelectedD] forState:UIControlStateNormal];
                [comment setTitle:[NSString CommentSelectedD] forState:UIControlStateSelected];
                [comment setTitle:[NSString CommentSelectedD] forState:UIControlStateHighlighted];
            }
        }
    [comment setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
    [comment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [comment setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    comment.titleLabel.font = [UIFont systemFontOfSize:17];
        comment.tag = indexPath.row;
    [comment addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:comment];
    
    UIButton *comment2 = [UIButton buttonWithType:UIButtonTypeCustom];
    comment2.frame = CGRectMake(300, 112, 200, 80/2);
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
    
    
    
    

    
     UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox setFrame:CGRectMake(599, 15, 100.0f+20, 41/2+20)];
    [checkbox setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [checkbox setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox.tag = indexPath.row;
    [checkbox setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox addTarget:self action:@selector(bto_actionKomin:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:checkbox];
    
    if([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"timeover_status"] isEqual:@"yes"]){
    
    checkbox.userInteractionEnabled=NO;
    
    }
    
    UIButton *checkbox_Fri = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox_Fri setImageEdgeInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    [checkbox_Fri setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, 20.0f, 0, 0)];
    [checkbox_Fri.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox_Fri setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox_Fri setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox_Fri setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox_Fri.tag = indexPath.row;
   // [checkbox_Fri setBackgroundColor:[UIColor yellowColor]];
    [checkbox_Fri setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox_Fri setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox_Fri setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox_Fri addTarget:self action:@selector(bto_actionFri:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:checkbox_Fri];
    

    
    
    
    UIButton *checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];

    [checkbox1 setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [checkbox1 setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox1.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox1.tag = indexPath.row;
    //[checkbox1 setBackgroundColor:[UIColor redColor]];
    [checkbox1 setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox1 setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox1 setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox1 addTarget:self action:@selector(bto_actionSjk:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:checkbox1];
    
    if([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"arrive_status" ]  isEqual: @"S"]){
        
        checkbox1.selected = YES;
        if ([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"status_changed_by" ] isEqual:@"P"])
        {
        UILabel *fri_Label = [[UILabel alloc]initWithFrame:CGRectMake(635, 125, 100, 20)];
        [fri_Label setBackgroundColor:[UIColor clearColor]];
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
            {
        [fri_Label setText:[NSString sickByParentF]];
            }
            else
            {
             [fri_Label setText:[NSString sickByParentD]];
            }
        [fri_Label setTextAlignment:NSTextAlignmentCenter];
        [fri_Label setTextColor:[UIColor redColor]];
        [fri_Label setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
        [backView addSubview:fri_Label];
    }
}
    
    
    
    if([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"arrive_status" ]  isEqual: @"F"])
    {
        
        checkbox_Fri.selected = YES;
        
        if ([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"status_changed_by" ] isEqual:@"P"])
        {
            
            UILabel *fri_Label = [[UILabel alloc]initWithFrame:CGRectMake(640, 65, 100, 20)];
            [fri_Label setBackgroundColor:[UIColor clearColor]];
            if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
            {
                [fri_Label setText:[NSString sickByParentF]];
            }
            else
            {
                [fri_Label setText:[NSString sickByParentD]];
            }
            fri_Label.tag = indexPath.row;
            [fri_Label setTextAlignment:NSTextAlignmentCenter];
            [fri_Label setTextColor:[UIColor redColor]];
            [fri_Label setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
            [backView addSubview:fri_Label];
            
            UITapGestureRecognizer *Fri_LabelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Fri_Tap:)];
            [fri_Label addGestureRecognizer:Fri_LabelTap];
            [fri_Label setUserInteractionEnabled:YES];
            
            
        }
        
    }
    

    
    UIButton *checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox2 setFrame:CGRectMake(600, 62+8+29+10, 100.0f+20, 41/2+20)];
    [checkbox2 setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [checkbox2 setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox2.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox2 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox2.tag = indexPath.row;
    [checkbox2 setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox2 setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox2 setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox2 setTitle:@"Ikki komin" forState:UIControlStateNormal];
    [checkbox2 addTarget:self action:@selector(bto_actioniki:) forControlEvents:UIControlEventTouchUpInside];
    //[backView addSubview:checkbox2];
    
    if([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"arrive_status" ]  isEqual: @"NA"]){
        
        checkbox2.selected = YES;
    }
    
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
                [checkbox setTitle:[NSString KominF] forState:UIControlStateNormal];
                [checkbox_Fri setTitle:@"Frí" forState:UIControlStateNormal];
                [checkbox1 setTitle:@"Sjúk/ur" forState:UIControlStateNormal];
                [checkbox_Fri setFrame:CGRectMake(585, 5+50, 50.0f+20, 41/2+20)];
                [checkbox1 setFrame:CGRectMake(595, 37+15+40, 100.0f+30, 41/2+20)];
        }
    else
    {
        [checkbox setTitle:[NSString KominD] forState:UIControlStateNormal];
            [checkbox_Fri setTitle:@"Fri" forState:UIControlStateNormal];
            [checkbox1 setTitle:@"Syg" forState:UIControlStateNormal];
            [checkbox_Fri setFrame:CGRectMake(571, 5+50, 50.0f+20, 41/2+20)];
            [checkbox1 setFrame:CGRectMake(571, 37+15+40, 100.0f+30, 41/2+20)];
    }
//    UILabel *reglbl = [[UILabel alloc] initWithFrame:CGRectMake(590, 85, 130, 15)];
//    reglbl.text = @"Registered as arrived";
//    reglbl.font = [UIFont fontWithName:@"Roboto-Light" size:13];;
//    reglbl.textColor = [UIColor redColor];
//    reglbl.textAlignment = NSTextAlignmentLeft;
//    [backView addSubview:reglbl];
    
        if ([[[copyArray objectAtIndex:indexPath.row]objectForKey:@"birth_stat" ] isEqual:@"Y"])
        {
            UIImageView *HappyBirthday = [[UIImageView alloc]initWithFrame:CGRectMake(485, 20, 75, 55)];
            [HappyBirthday setImage:[UIImage imageNamed:@"birthdayimage"]];
            [backView addSubview:HappyBirthday];
        }
        
    }
    
    
    return cell;
    
}

-(void)Fri_Tap:(UITapGestureRecognizer *)sender
{
    [blackview setHidden:NO];
    [WhiteView setHidden:NO];
    blackview.alpha = 0.0f;
    WhiteView.alpha = 0.0f;
    WhiteView.frame = CGRectMake(360, -50, 500, 250) ;
    [UIView animateWithDuration:0.8 animations:^{
        blackview.alpha = 0.8f;
        WhiteView.alpha = 1.0f;
        WhiteView.frame = CGRectMake(360, 160, 500, 250) ;
        
    } completion:^(BOOL finished) {
        
        
        UIActivityIndicatorView *progress= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(245, 180, 30, 30)];
        progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [WhiteView addSubview: progress];
        [progress startAnimating];
        
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            NSError *error;
            
            NSData *Fri_Details = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@free_time.php?child_id=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.view.tag]objectForKey:@"id"]]] options:NSDataReadingUncached error:&error];
            
            ChildDateList = [NSJSONSerialization JSONObjectWithData:Fri_Details options:kNilOptions error:&error];
            
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                ChildDate=[[UITableView alloc]initWithFrame:CGRectMake(35,110, 200,130) style:UITableViewStylePlain];
                ChildDate.delegate=self;
                ChildDate.dataSource=self;
                ChildDate.backgroundColor = [UIColor clearColor];
                ChildDate.tag=1;
                [ChildDate setShowsHorizontalScrollIndicator:NO];
                [ChildDate setShowsVerticalScrollIndicator:NO];
                [ChildDate setSeparatorStyle:UITableViewCellSeparatorStyleNone];
                FindUser.separatorColor = [UIColor clearColor];
                
                [WhiteView addSubview:ChildDate];
                [ChildDate reloadData];
                
                [progress stopAnimating];
            }];
            
        }];
        
    }];
}
-(void)Cross
{

    
    blackview.alpha = 0.8f;
    WhiteView.alpha = 1.0f;
    WhiteView.frame = CGRectMake(360, 160, 500, 250) ;
    [UIView animateWithDuration:0.8 animations:^{
        blackview.alpha = 0.0f;
        WhiteView.alpha = 0.0f;
        WhiteView.frame = CGRectMake(360, -50, 500, 250) ;
        
    } completion:^(BOOL finished) {
        
        [blackview setHidden:YES];
        [WhiteView setHidden:YES];
    }];
}
-(void)Broyt:(UIButton *)sender{
    //CmntLBL.hidden=YES;
    
    CoemtText2.editable = YES;
    CoemtText2.layer.borderWidth = 1.0f;
    CoemtText2.layer.borderColor = [[UIColor grayColor] CGColor];

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
    [Okcomment addTarget:self action:@selector(closevistr2:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:Okcomment];
    
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
    
//     Broyt.hidden=NO;
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
//    [Broyt addTarget:self action:@selector(Broyt:) forControlEvents:UIControlEventTouchUpInside];
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
    [Okcomment addTarget:self action:@selector(closevistr2:) forControlEvents:UIControlEventTouchUpInside];
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
            [Broyt addTarget:self action:@selector(Broyt:) forControlEvents:UIControlEventTouchUpInside];
            [DeatilsView addSubview:Broyt];
        
        
        UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 200, 35)];
        ttPOP.backgroundColor = [UIColor clearColor];
        ttPOP.textColor = [UIColor grayColor];
        ttPOP.text = @"Vís viðmerking";
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
            
            //     Broyt.hidden=NO;
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
            //    [Broyt addTarget:self action:@selector(Broyt:) forControlEvents:UIControlEventTouchUpInside];
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
            [Okcomment addTarget:self action:@selector(closevistr2:) forControlEvents:UIControlEventTouchUpInside];
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
            [Broyt addTarget:self action:@selector(Broyt:) forControlEvents:UIControlEventTouchUpInside];
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
-(void)comment:(UIButton *)sender
{
     NSLog(@"text----- %@", sender.titleLabel.text);
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
    
        NSLog(@"asche abar");
    if ([sender.titleLabel.text isEqualToString:[NSString CommentF]])
    {
     
        NSLog(@"asche");
        
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

    
    UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 30)];
    ttPOP.backgroundColor = [UIColor clearColor];
    ttPOP.textColor = [UIColor grayColor];
    ttPOP.text = @"Skráset avtalu";
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
    Okcomment.tag = sender.tag;
    [Okcomment addTarget:self action:@selector(closevistr:) forControlEvents:UIControlEventTouchUpInside];
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
        [okCls addTarget:self action:@selector(closevistr_closeeEDIT) forControlEvents:UIControlEventTouchUpInside];
        okCls.titleLabel.textColor = [UIColor blackColor];
        [mainView addSubview:okCls];
        [mainView bringSubviewToFront:okCls];
        
        
        DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
        DeatilsView.backgroundColor = [UIColor whiteColor];
        [mainView addSubview:DeatilsView];
        [mainView bringSubviewToFront:DeatilsView];
        
        
        UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 200, 30)];
        ttPOP.backgroundColor = [UIColor clearColor];
        ttPOP.textColor = [UIColor grayColor];
        ttPOP.text = @"Vís avtalu";
        ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
        ttPOP.textAlignment = NSTextAlignmentCenter;
        [DeatilsView addSubview:ttPOP];
        
        
        
        CoemtText = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
        CoemtText.font = [UIFont systemFontOfSize:16.0f];
        CoemtText.backgroundColor = [UIColor clearColor];
        CoemtText.textColor = [UIColor grayColor];
        CoemtText.scrollEnabled = YES;
        CoemtText.pagingEnabled = YES;
        CoemtText.editable = NO;
        CoemtText.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"appo_stat"];
        CoemtText.delegate = self;
        CoemtText.textAlignment = NSTextAlignmentLeft;
        [DeatilsView addSubview:CoemtText];
        
        broytbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        broytbutton.frame = CGRectMake(340,10, 80, 80/2);
        broytbutton.backgroundColor = [UIColor clearColor];
        broytbutton.tag = sender.tag;
        [broytbutton setTitle:[NSString EditF] forState:UIControlStateNormal];
        [broytbutton setTitle:[NSString EditF] forState:UIControlStateSelected];
        [broytbutton setTitle:[NSString EditF] forState:UIControlStateHighlighted];
        [broytbutton setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        [broytbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [broytbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        broytbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [broytbutton addTarget:self action:@selector(Broytappo:) forControlEvents:UIControlEventTouchUpInside];
        [DeatilsView addSubview:broytbutton];
        
        slettabutton = [UIButton buttonWithType:UIButtonTypeCustom];
        slettabutton.frame = CGRectMake(410,10, 80, 80/2);
        slettabutton.backgroundColor = [UIColor clearColor];
        slettabutton.tag = sender.tag;
        [slettabutton setTitle:[NSString DeleteF] forState:UIControlStateNormal];
        [slettabutton setTitle:[NSString DeleteF] forState:UIControlStateSelected];
        [slettabutton setTitle:[NSString DeleteF] forState:UIControlStateHighlighted];
        [slettabutton setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
        [slettabutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [slettabutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        slettabutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [slettabutton addTarget:self action:@selector(Sellteappo:) forControlEvents:UIControlEventTouchUpInside];
        [DeatilsView addSubview:slettabutton];

    }
    }
    else
    {
        if ([sender.titleLabel.text isEqualToString:[NSString CommentD]])
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
            
            
            UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 490, 30)];
            ttPOP.backgroundColor = [UIColor clearColor];
            ttPOP.textColor = [UIColor grayColor];
            ttPOP.text = [NSString CommentD];
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
            Okcomment.tag = sender.tag;
            [Okcomment addTarget:self action:@selector(closevistr:) forControlEvents:UIControlEventTouchUpInside];
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
            [okCls addTarget:self action:@selector(closevistr_closeeEDIT) forControlEvents:UIControlEventTouchUpInside];
            okCls.titleLabel.textColor = [UIColor blackColor];
            [mainView addSubview:okCls];
            [mainView bringSubviewToFront:okCls];
            
            
            DeatilsView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 490, 250)];
            DeatilsView.backgroundColor = [UIColor whiteColor];
            [mainView addSubview:DeatilsView];
            [mainView bringSubviewToFront:DeatilsView];
            
            
            UILabel *ttPOP = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 200, 30)];
            ttPOP.backgroundColor = [UIColor clearColor];
            ttPOP.textColor = [UIColor grayColor];
            ttPOP.text = [NSString CommentSelectedD];
            ttPOP.font = [UIFont fontWithName:GLOBALTEXTFONT size:30];
            ttPOP.textAlignment = NSTextAlignmentCenter;
            [DeatilsView addSubview:ttPOP];
            
            
            
            CoemtText = [[UITextView alloc]initWithFrame:CGRectMake(15,70,460,85)];
            CoemtText.font = [UIFont systemFontOfSize:16.0f];
            CoemtText.backgroundColor = [UIColor clearColor];
            CoemtText.textColor = [UIColor grayColor];
            CoemtText.scrollEnabled = YES;
            CoemtText.pagingEnabled = YES;
            CoemtText.editable = NO;
            CoemtText.text = [[copyArray objectAtIndex:sender.tag]objectForKey:@"appo_stat"];
            CoemtText.delegate = self;
            CoemtText.textAlignment = NSTextAlignmentLeft;
            [DeatilsView addSubview:CoemtText];
            
            broytbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            broytbutton.frame = CGRectMake(340,10, 80, 80/2);
            broytbutton.backgroundColor = [UIColor clearColor];
            broytbutton.tag = sender.tag;
            [broytbutton setTitle:[NSString EditD] forState:UIControlStateNormal];
            [broytbutton setTitle:[NSString EditD] forState:UIControlStateSelected];
            [broytbutton setTitle:[NSString EditD] forState:UIControlStateHighlighted];
            [broytbutton setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
            [broytbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
            [broytbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            broytbutton.titleLabel.font = [UIFont systemFontOfSize:15];
            [broytbutton addTarget:self action:@selector(Broytappo:) forControlEvents:UIControlEventTouchUpInside];
            [DeatilsView addSubview:broytbutton];
            
            slettabutton = [UIButton buttonWithType:UIButtonTypeCustom];
            slettabutton.frame = CGRectMake(410,10, 80, 80/2);
            slettabutton.backgroundColor = [UIColor clearColor];
            slettabutton.tag = sender.tag;
            [slettabutton setTitle:[NSString DeleteD] forState:UIControlStateNormal];
            [slettabutton setTitle:[NSString DeleteD] forState:UIControlStateSelected];
            [slettabutton setTitle:[NSString DeleteD] forState:UIControlStateHighlighted];
            [slettabutton setTitleColor:[UIColor colorWithRed:(95.0f/255.0f) green:(171.0f/255.0f) blue:(222.0f/255.0f) alpha:1] forState:UIControlStateNormal];
            [slettabutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
            [slettabutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            slettabutton.titleLabel.font = [UIFont systemFontOfSize:15];
            [slettabutton addTarget:self action:@selector(Sellteappo:) forControlEvents:UIControlEventTouchUpInside];
            [DeatilsView addSubview:slettabutton];
            
        }

    }
}
-(void)Broytappo:(UIButton *)sender
{
    CoemtText.editable = YES;
    CoemtText.layer.borderWidth = 1.0f;
    CoemtText.layer.borderColor = [[UIColor grayColor] CGColor];
    
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
    Okcomment.tag = sender.tag;
    [Okcomment addTarget:self action:@selector(closevistr:) forControlEvents:UIControlEventTouchUpInside];
    [DeatilsView addSubview:Okcomment];

}
-(void)Sellteappo:(UIButton *)sender
{
    
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
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
-(void)closevistr_closeeEDIT
{
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
    
    [CoemtText2 resignFirstResponder];
    [CoemtText resignFirstResponder];
    
}
-(void)closevistr_closee{
    DeatilsView.hidden = YES;
    okCls.hidden = YES;
    pickerBack.hidden =YES;
    
    [CoemtText2 resignFirstResponder];
    [CoemtText resignFirstResponder];

}

-(void)closevistr:(UIButton *)sender
{
    
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
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@add_newappo.php?appoint_check=%@&id=%@&room_id=%@",APPS_DOMAIN_URL,CoemtText.text,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
        
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

-(void)closevistr2:(UIButton *)sender{
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
    
    if([CoemtText2.text  isEqual: @""] || [CoemtText2.text isEqualToString:@"Skal útfyllast"]){
        
        
        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Skal útfyllast" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        //
        //        [alert show];
        
        CoemtText2.text= @"Skal útfyllast";
        
        
    }
    else
    {
        
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
        
        urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        
        NSURL *requestURL = [NSURL URLWithString:urlString];
        
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization
                                       JSONObjectWithData:signeddataURL1 //1
                                       
                                       options:kNilOptions
                                       error:&error];
        [copyArray removeAllObjects];
        [data_retrived removeAllObjects];
        for(NSMutableDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        copyArray = [data_retrived mutableCopy];
        [FindUser reloadData];
        [CoemtText2 resignFirstResponder];
    }
    }
    else
    {
        if([CoemtText2.text  isEqual: @""] || [CoemtText2.text isEqualToString:[NSString TextCheckD]]){
            
            
            //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Skal útfyllast" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            //
            //        [alert show];
            
            CoemtText2.text= [NSString TextCheckD];
            
            
        }
        else
        {
            
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
            
            urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
            
            NSURL *requestURL = [NSURL URLWithString:urlString];
            
            NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
            
            NSMutableDictionary *result = [NSJSONSerialization
                                           JSONObjectWithData:signeddataURL1 //1
                                           
                                           options:kNilOptions
                                           error:&error];
            [copyArray removeAllObjects];
            [data_retrived removeAllObjects];
            for(NSMutableDictionary *dict in result)
            {
                [data_retrived addObject:dict];
                
            }
            copyArray = [data_retrived mutableCopy];
            [FindUser reloadData];
            [CoemtText2 resignFirstResponder];
        }
    }
    
}
-(void)bto_actioniki:(UIButton *)sender{
    
    

        
        sender.selected=YES;
        
        NSError *error=nil;
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@checkstat.php?id=%@&status=NA ",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
        
        NSLog(@"urlString1%@",urlString1);
        
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        
        
        NSString *urlString;
        
        urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
        NSURL *requestURL = [NSURL URLWithString:urlString];
    
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization
                                       JSONObjectWithData:signeddataURL1 //1
                                       
                                       options:kNilOptions
                                       error:&error];
        [copyArray removeAllObjects];
        [data_retrived removeAllObjects];
        for(NSMutableDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        copyArray = [data_retrived mutableCopy];
           [FindUser reloadData];
        
    
  
    
}
-(void)bto_actionFri:(UIButton *)sender{
    
    
    
    
    sender.selected=YES;
    
    NSError *error=nil;
    
    NSString *urlString1 = [NSString stringWithFormat:@"%@checkstat.php?id=%@&status=F",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
    
    NSLog(@"urlString1%@",urlString1);
    
    NSURL *requestURL1 = [NSURL URLWithString:urlString1];
    NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
    NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
    
    
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,pageId,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
    
    
    
    NSLog(@" %@",urlString);
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", urlString);
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
    
    NSMutableDictionary *result = [NSJSONSerialization
                                   JSONObjectWithData:signeddataURL1 //1
                                   
                                   options:kNilOptions
                                   error:&error];
    [copyArray removeAllObjects];
    [data_retrived removeAllObjects];
    for(NSMutableDictionary *dict in result)
    {
        [data_retrived addObject:dict];
        
    }
    copyArray = [data_retrived mutableCopy];
    [FindUser reloadData];
    
    
    
    
}

-(void)bto_actionSjk:(UIButton *)sender{



    
        sender.selected=YES;
    
        NSError *error=nil;
    
        NSString *urlString1 = [NSString stringWithFormat:@"%@checkstat.php?id=%@&status=S",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"]];
        
        NSLog(@"urlString1%@",urlString1);
        
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSString* urlTextEscaped = [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *signeddataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlTextEscaped]options:NSDataReadingUncached error:&error];
        NSString *serverOutput = [[NSString alloc] initWithData:signeddataURL encoding: NSASCIIStringEncoding];
        
        
        
        NSString *urlString;
        
        urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
        
        
        
        NSLog(@" %@",urlString);
        NSURL *requestURL = [NSURL URLWithString:urlString];
        
        NSLog(@"%@", urlString);
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
        
        NSMutableDictionary *result = [NSJSONSerialization
                                       JSONObjectWithData:signeddataURL1 //1
                                       
                                       options:kNilOptions
                                       error:&error];
        [copyArray removeAllObjects];
        [data_retrived removeAllObjects];
        for(NSMutableDictionary *dict in result)
        {
            [data_retrived addObject:dict];
            
        }
        copyArray = [data_retrived mutableCopy];
        [FindUser reloadData];
        
        


}


-(void)bto_actionKomin:(UIButton *)sender{
    
    
    if(sender.selected == YES){
    
        sender.selected=NO;
        
    }else{
        
        sender.selected=YES;
        
        NSError *error=nil;
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@checkstat.php?id=%@&status=A&appoint_check=%@",APPS_DOMAIN_URL,[[copyArray objectAtIndex:sender.tag]objectForKey:@"id"],CoemtText.text];
        
        NSLog(@"urlString1%@",urlString1);
           urlString1= [urlString1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:signeddataURL1 options:kNilOptions error:&error];

        if ([[dict objectForKey:@"auth"] isEqualToString:@"success"])
        {
            NSString *urlString;
            
            urlString = [NSString stringWithFormat:@"%@arrived_list.php?room_id=%@&admin_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
            
            
            
            NSLog(@" %@",urlString);
            NSURL *requestURL = [NSURL URLWithString:urlString];
            
            NSLog(@"%@", urlString);
            NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
            
            NSMutableDictionary *result = [NSJSONSerialization
                                           JSONObjectWithData:signeddataURL //1
                                           
                                           options:kNilOptions
                                           error:&error];
            [copyArray removeAllObjects];
            [data_retrived removeAllObjects];
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

-(void)backOut2{
    downloadQueue = nil;
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
    downloadQueue = nil;
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    ViewModel.pageId=pageId;
    [self.navigationController pushViewController:ViewModel animated:NO];

}
-(void)logout{
    downloadQueue = nil;
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
