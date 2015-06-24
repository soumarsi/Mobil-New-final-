//
//  MARegistrationViewController.m
//  Mobil
//
//  Created by Soumarsi Kundu on 23/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import "MARegistrationViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "UIImageView+WebCache.h"
#import "RTSpinKitView.h"


@interface MARegistrationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *mainView,*leftview;
    UIButton *leftmenuBt;
    UILabel *totlCountMem;
    UITableView *FindUser,*ListTable;
    UITableViewCell *cell;
    NSOperationQueue *downloadQueue;
    NSMutableArray *ListData,*data_retrived;
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
}

@end

@implementation MARegistrationViewController

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
    [logout setFrame:CGRectMake(40, 110, 120.0f, 49/2)];
    [logout setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [logout setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [logout.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [logout setImage:[UIImage imageNamed:@"logoutk"] forState:UIControlStateNormal];
    [logout setImage:[UIImage imageNamed:@"logoutk"] forState:UIControlStateHighlighted];
    [logout setImage:[UIImage imageNamed:@"logoutk"] forState:UIControlStateSelected];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:logout];

    
    leftmenuBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftmenuBt setFrame:CGRectMake(40, 170, 120.0f, 49/2)];
    [leftmenuBt.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateNormal];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateHighlighted];
    [leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateSelected];
    [leftmenuBt addTarget:self action:@selector(backOut2) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:leftmenuBt];
    
    
    UIButton *logout1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 95, 200, 50)];
    [logout1 setBackgroundColor:[UIColor clearColor]];
    [logout1 addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:logout1];
    
    UIButton *leftbutton1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 155, 200, 50)];
    [leftbutton1 setBackgroundColor:[UIColor clearColor]];
    [leftbutton1 addTarget:self action:@selector(backOut2) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:leftbutton1];
    
    UIButton *heim  = [UIButton buttonWithType:UIButtonTypeCustom];
    [heim setFrame:CGRectMake(35, 170, 120.0f, 49/2)];
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
    [heim addTarget:self action:@selector(backOut) forControlEvents:UIControlEventTouchUpInside];
    //[leftview addSubview:heim];

    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    
    totlCountMem = [[UILabel alloc] initWithFrame:CGRectMake(260, 60, 300, 44)];
    totlCountMem.backgroundColor = [UIColor clearColor];
    totlCountMem.textColor = [UIColor whiteColor];
    totlCountMem.text = @"";
    totlCountMem.font = [UIFont fontWithName:GLOBALTEXTFONT size:25];
    totlCountMem.textAlignment = NSTextAlignmentLeft;
    totlCountMem.hidden=YES;
    [mainView addSubview:totlCountMem];
    
    AllLabel = [[UILabel alloc]initWithFrame:CGRectMake(630.0f, 60.0f, 115.0f, 30)];
    [AllLabel setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [AllLabel setTextAlignment:NSTextAlignmentCenter];
    [AllLabel setTextColor:[UIColor whiteColor]];
    [AllLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_BOLD size:14]];
    [mainView addSubview:AllLabel];
    
    UIImageView *dropdownimage = [[UIImageView alloc]initWithFrame:CGRectMake(725, 69, 11, 11)];
    [dropdownimage setImage:[UIImage imageNamed:@"dropdownimage"]];
    [mainView addSubview:dropdownimage];
    
    AllButton = [[UIButton alloc]initWithFrame:CGRectMake(630.0f, 60.0f, 115.0f, 30.0f)];
    [AllButton setBackgroundColor:[UIColor clearColor]];
    [AllButton addTarget:self action:@selector(allbutton:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:AllButton];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        pageTitle.text = [NSString RegistrationF];
        [AllLabel setText:[NSString AllF]];
        ListData = [[NSMutableArray alloc]initWithObjects:[NSString AllF],[NSString KominF],[NSString HomeF], nil];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    }
    else
    {
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        pageTitle.text = [NSString RegistrationD];
        [AllLabel setText:[NSString AllD]];
        ListData = [[NSMutableArray alloc]initWithObjects:[NSString AllD],[NSString KominD],[NSString HomeD], nil];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
    }
    
 
    
    ListTable=[[UITableView alloc]initWithFrame:CGRectMake(630,91, 115,120) style:UITableViewStylePlain];
    ListTable.delegate=self;
    ListTable.dataSource=self;
    [ListTable setShowsHorizontalScrollIndicator:NO];
    [ListTable setShowsVerticalScrollIndicator:NO];
    ListTable.backgroundColor = [UIColor clearColor];
    ListTable.tag=1;
    ListTable.separatorColor = [UIColor clearColor];
    [mainView addSubview:ListTable];

    [ListTable setHidden:YES];
    

    
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
        
        urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
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
       // int count = 0;
        
//        for (int j = 0; j< data_retrived.count; j++)
//        {
//            if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:j]objectForKey:@"arrive_status"]] isEqualToString:@"H"])
//            {
//                count++;
//            }
//        }
        
        totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
        
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
                FindUser.separatorColor = [UIColor clearColor];
                [mainView addSubview:FindUser];
                [FindUser reloadData];
                
                
            }else{
                [self removePulseLoader];
                [backView removeFromSuperview];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        return 20;
    }
    else
    {
    return 192;
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
        return 3;
    }
    else
    {
    return [data_retrived count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
    [[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (tableView.tag == 1)
    {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        UILabel *NameLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 115, 20)];
        [NameLabel1 setBackgroundColor:[UIColor clearColor]];
        [NameLabel1 setText:[NSString stringWithFormat:@"%@",[ListData objectAtIndex:indexPath.row]]];
        [NameLabel1 setTextAlignment:NSTextAlignmentCenter];
        [NameLabel1 setTextColor:[UIColor blackColor]];
        [NameLabel1 setFont:[UIFont fontWithName:GLOBALTEXTFONT size:17]];
        [cell addSubview:NameLabel1];
    }
    else
    {
        
        [cell setBackgroundColor:[UIColor clearColor]];
    UIView *backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, 180)];
    backView1.backgroundColor = [UIColor whiteColor];
    [cell addSubview:backView1];
    
   UIImage *plcHol;
    if([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"gender" ]]  isEqual: @"M"]){
        
        plcHol=[UIImage imageNamed:@"workerplaceholderimage"];
        
    }else{
        
        plcHol=[UIImage imageNamed:@"workerplaceholderimage"];
        
    }
    
    
    UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1,193/2+28, 177)];
    pic.tag = indexPath.row;
    [cell addSubview:pic];
    [pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ansa.fo/upload/worker_photo/thumb/%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"image"]]] placeholderImage:plcHol options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    [backView1 addSubview:pic];
    
    
    
    UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 15, 200, 20)];
    [NameLabel setBackgroundColor:[UIColor clearColor]];
    [NameLabel setText:[NSString NameF]];
    [NameLabel setTextAlignment:NSTextAlignmentLeft];
    [NameLabel setTextColor:[UIColor lightGrayColor]];
    [NameLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [backView1 addSubview:NameLabel];
    
    
    UILabel *NameLabel_Text = [[UILabel alloc]initWithFrame:CGRectMake(150, 35, 200, 20)];
    [NameLabel_Text setBackgroundColor:[UIColor clearColor]];
    [NameLabel_Text setText:[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"name"]]];
    [NameLabel_Text setTextAlignment:NSTextAlignmentLeft];
    [NameLabel_Text setTextColor:[UIColor blackColor]];
    [NameLabel_Text setFont:[UIFont fontWithName:GLOBALTEXTFONT size:18]];
    [backView1 addSubview:NameLabel_Text];
    
    UILabel *AdressLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 70, 200, 20)];
    [AdressLabel setBackgroundColor:[UIColor clearColor]];
    [AdressLabel setTextAlignment:NSTextAlignmentLeft];
    [AdressLabel setTextColor:[UIColor lightGrayColor]];
    [AdressLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [backView1 addSubview:AdressLabel];
    
    
    UILabel *AdressLabel_Text = [[UILabel alloc]initWithFrame:CGRectMake(150, 90, 200, 25)];
    [AdressLabel_Text setBackgroundColor:[UIColor clearColor]];
    [AdressLabel_Text setText:[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"address"]]];
    [AdressLabel_Text setTextAlignment:NSTextAlignmentLeft];
    [AdressLabel_Text setTextColor:[UIColor blackColor]];
    [AdressLabel_Text setFont:[UIFont fontWithName:GLOBALTEXTFONT size:21]];
    [backView1 addSubview:AdressLabel_Text];
    
    
    UILabel *TelephoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 125, 200, 20)];
    [TelephoneLabel setBackgroundColor:[UIColor clearColor]];
    [TelephoneLabel setTextAlignment:NSTextAlignmentLeft];
    [TelephoneLabel setTextColor:[UIColor lightGrayColor]];
    [TelephoneLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19]];
    [backView1 addSubview:TelephoneLabel];
    
        NSString *telstr = [NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"phone"]];
        NSString *newStr = [telstr substringFromIndex:4];
    
    UILabel *TelephoneLabel_Text = [[UILabel alloc]initWithFrame:CGRectMake(150, 145, 200, 20)];
    [TelephoneLabel_Text setBackgroundColor:[UIColor clearColor]];
    [TelephoneLabel_Text setText:[NSString stringWithFormat:@"%@",newStr]];
    [TelephoneLabel_Text setTextAlignment:NSTextAlignmentLeft];
    [TelephoneLabel_Text setTextColor:[UIColor blackColor]];
    [TelephoneLabel_Text setFont:[UIFont fontWithName:GLOBALTEXTFONT size:21]];
    [backView1 addSubview:TelephoneLabel_Text];
    
    
    checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox setFrame:CGRectMake(599, 5+35, 100.0f+20, 41/2+20)];
    [checkbox setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [checkbox setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox.tag = indexPath.row;
        if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"arrive_status"]] isEqualToString:@"H"])
        {
            [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateNormal];
        }
        else
        {
    [checkbox setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox addTarget:self action:@selector(bto_actionHeim:) forControlEvents:UIControlEventTouchUpInside];
        }
   
    [backView1 addSubview:checkbox];
    

    checkbox_Komin = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox_Komin setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [checkbox_Komin setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -30.0f, 0, 0)];
    [checkbox_Komin.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:16]];
    [checkbox_Komin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox_Komin setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [checkbox_Komin setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    checkbox_Komin.tag = indexPath.row;
    if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row]objectForKey:@"arrive_status"]] isEqualToString:@"K"])
    {
            [checkbox_Komin setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateNormal];
    }
    else
    {
    [checkbox_Komin setImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [checkbox_Komin setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [checkbox_Komin setImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [checkbox_Komin addTarget:self action:@selector(bto_actionKomin:) forControlEvents:UIControlEventTouchUpInside];
    }
    

    [backView1 addSubview:checkbox_Komin];
        
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
                [AdressLabel setText:[NSString AddressF]];
                [TelephoneLabel setText:[NSString TelephoneF]];
                [checkbox setTitle:[NSString HomeF] forState:UIControlStateNormal];
                [checkbox_Komin setTitle:[NSString KominF] forState:UIControlStateNormal];
                [checkbox_Komin setFrame:CGRectMake(603, 5, 100.0f+20, 41/2+20)];
        }
        else
        {
                [AdressLabel setText:[NSString AddressD]];
                [TelephoneLabel setText:[NSString TelephoneD]];
                [checkbox setTitle:[NSString HomeD] forState:UIControlStateNormal];
                [checkbox_Komin setTitle:[NSString KominD] forState:UIControlStateNormal];
                [checkbox_Komin setFrame:CGRectMake(616.5f, 5, 100.0f+20, 41/2+20)];
        }
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [AllLabel setText:@""];
    
    [AllLabel setText:[ListData objectAtIndex:indexPath.row]];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
       
        
    
    if ([AllLabel.text isEqualToString:[NSString AllF]])
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
            
            urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
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

            totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if([data_retrived count] > 0){
                    
                    
                    
                    [self removePulseLoader];
                    [backView removeFromSuperview];
                    [FindUser removeFromSuperview];
                    
                    FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,600 ) style:UITableViewStylePlain];
                    FindUser.delegate=self;
                    FindUser.dataSource=self;
                    FindUser.backgroundColor = [UIColor clearColor];
                    FindUser.tag=2;
                    [FindUser setShowsHorizontalScrollIndicator:NO];
                    [FindUser setShowsVerticalScrollIndicator:NO];
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
    else if ([AllLabel.text isEqualToString:[NSString HomeF]])
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
            
            urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=H",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
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
    else if ([AllLabel.text isEqualToString:[NSString KominF]])
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
            
            urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=K",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];

            NSURL *requestURL = [NSURL URLWithString:urlString];
            NSError* error = nil;
            NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
            
            NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
            
            for(NSDictionary *dict in result)
            {
                [data_retrived addObject:dict];
                
            }
            
            totlCountMem.hidden=NO;
//            int count = 0;
//            
//            for (int j = 0; j< data_retrived.count; j++)
//            {
//                if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:j]objectForKey:@"arrive_status"]] isEqualToString:@"H"])
//                {
//                    count++;
//                }
//            }
            totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if([data_retrived count] > 0){
                    
                    
                    [backView removeFromSuperview];
                    [self removePulseLoader];
                     [FindUser removeFromSuperview];
                    FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,600 ) style:UITableViewStylePlain];
                    FindUser.delegate=self;
                    FindUser.dataSource=self;
                    FindUser.backgroundColor = [UIColor clearColor];
                    FindUser.tag=2;
                    [FindUser setShowsHorizontalScrollIndicator:NO];
                    [FindUser setShowsVerticalScrollIndicator:NO];
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
    }
    else
    {
        if ([AllLabel.text isEqualToString:[NSString AllD]])
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
                
                urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
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
                
                totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    if([data_retrived count] > 0){
                        
                        
                        
                        [self removePulseLoader];
                        [backView removeFromSuperview];
                        [FindUser removeFromSuperview];
                        
                        FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,600 ) style:UITableViewStylePlain];
                        FindUser.delegate=self;
                        FindUser.dataSource=self;
                        FindUser.backgroundColor = [UIColor clearColor];
                        FindUser.tag=2;
                        [FindUser setShowsHorizontalScrollIndicator:NO];
                        [FindUser setShowsVerticalScrollIndicator:NO];
                        FindUser.separatorColor = [UIColor clearColor];
                        [mainView addSubview:FindUser];
                        [FindUser reloadData];
                        
                        
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
                        nodata.text = [NSString NodataFoundD];
                        nodata.font = [UIFont fontWithName:GLOBALTEXTFONT size:32];
                        nodata.textAlignment = NSTextAlignmentLeft;
                        [backView addSubview:nodata];
                        
                    }
                }];
                
            }];
        }
        else if ([AllLabel.text isEqualToString:[NSString HomeD]])
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
                
                urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=H",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
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
                        FindUser.separatorColor = [UIColor clearColor];
                        [mainView addSubview:FindUser];
                        [FindUser reloadData];
                        
                        
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
                        nodata.text = [NSString NodataFoundD];
                        nodata.font = [UIFont fontWithName:GLOBALTEXTFONT size:32];
                        nodata.textAlignment = NSTextAlignmentLeft;
                        [backView addSubview:nodata];
                        
                    }
                }];
                
            }];
        }
        else if ([AllLabel.text isEqualToString:[NSString KominD]])
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
                
                urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=K",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]];
                
                NSURL *requestURL = [NSURL URLWithString:urlString];
                NSError* error = nil;
                NSData *signeddataURL =  [NSData dataWithContentsOfURL:requestURL options:NSDataReadingUncached error:&error];
                
                NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:signeddataURL  options:kNilOptions error:&error];
                
                for(NSDictionary *dict in result)
                {
                    [data_retrived addObject:dict];
                    
                }
                
                totlCountMem.hidden=NO;
                //            int count = 0;
                //
                //            for (int j = 0; j< data_retrived.count; j++)
                //            {
                //                if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:j]objectForKey:@"arrive_status"]] isEqualToString:@"H"])
                //                {
                //                    count++;
                //                }
                //            }
                totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    if([data_retrived count] > 0){
                        
                        
                        [backView removeFromSuperview];
                        [self removePulseLoader];
                        [FindUser removeFromSuperview];
                        FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,160, 798-60,600 ) style:UITableViewStylePlain];
                        FindUser.delegate=self;
                        FindUser.dataSource=self;
                        FindUser.backgroundColor = [UIColor clearColor];
                        FindUser.tag=2;
                        [FindUser setShowsHorizontalScrollIndicator:NO];
                        [FindUser setShowsVerticalScrollIndicator:NO];
                        FindUser.separatorColor = [UIColor clearColor];
                        [mainView addSubview:FindUser];
                        [FindUser reloadData];
                        
                        
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
                        nodata.text = [NSString NodataFoundD];
                        nodata.font = [UIFont fontWithName:GLOBALTEXTFONT size:32];
                        nodata.textAlignment = NSTextAlignmentLeft;
                        [backView addSubview:nodata];
                        
                    }
                }];
                
            }];
        }

        
    }

    [ListTable setHidden:YES];
    [AllButton addTarget:self action:@selector(allbutton:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backOut2{
    downloadQueue = nil;
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
    downloadQueue = nil;
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
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

-(void)allbutton:(UIButton *)sender
{
    [ListTable setHidden:NO];
    
    [AllButton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)add:(UIButton *)sender
{
    [ListTable setHidden:YES];
    
    [AllButton addTarget:self action:@selector(allbutton:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)bto_actionHeim:(UIButton *)sender
{

    downloadQueue = [[NSOperationQueue alloc]init];
    [downloadQueue addOperationWithBlock:^{
        NSError *error;
        NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@change_status.php?id=%@&status=H&adminid=%@&user_id=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]]]options:NSDataReadingUncached error:&error];

        
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:DeleteData  options:kNilOptions error:&error];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
        //    NSLog(@"result--- %@",result);

            if ([[result objectForKey:@"auth"] isEqualToString:@"success"])
            {
                data_retrived = [[NSMutableArray alloc] init];
                [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
                [self.view bringSubviewToFront:pulseLoaderView];
                pulseLoaderView.center = self.view.center;
                
                [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
                           backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                                     label:@"Circle"];
                
                NSString *str;
                
                if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
                {
                
                if ([AllLabel.text isEqualToString:[NSString AllF]])
                {
                    str = @"";
                }
                else if ([AllLabel.text isEqualToString:[NSString HomeF]])
                {
                    str = @"H";
                }
                else if ([AllLabel.text isEqualToString:[NSString KominF]])
                {
                    str = @"K";
                }
                }
                else
                {
                    if ([AllLabel.text isEqualToString:[NSString AllD]])
                    {
                        str = @"";
                    }
                    else if ([AllLabel.text isEqualToString:[NSString HomeD]])
                    {
                        str = @"H";
                    }
                    else if ([AllLabel.text isEqualToString:[NSString KominD]])
                    {
                        str = @"K";
                    }
                }
                downloadQueue = [[NSOperationQueue alloc]init];
                [downloadQueue addOperationWithBlock:^{
                    
                    NSString *urlString;
                    
                    urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],str];
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
//                    int count = 0;
//                    
//                    for (int j = 0; j< data_retrived.count; j++)
//                    {
//                        if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:j]objectForKey:@"arrive_status"]] isEqualToString:@"H"])
//                        {
//                            count++;
//                        }
//                    }
                    totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
                    
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
                            FindUser.separatorColor = [UIColor clearColor];
                            [mainView addSubview:FindUser];
                            [FindUser reloadData];
                            
                            
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
    
        //checkbox_Komin.selected = NO;
}

-(void)bto_actionKomin:(UIButton *)sender
{

    downloadQueue = [[NSOperationQueue alloc]init];
    [downloadQueue addOperationWithBlock:^{
        NSError *error;
        
        NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@change_status.php?id=%@&status=K&adminid=%@&user_id=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]],[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]]]options:NSDataReadingUncached error:&error];
        
        
        NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:DeleteData  options:kNilOptions error:&error];
        
       // NSLog(@"result--- %@",result);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
 
            
            if ([[result objectForKey:@"auth"] isEqualToString:@"success"])
            {
                data_retrived = [[NSMutableArray alloc] init];
                [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
                [self.view bringSubviewToFront:pulseLoaderView];
                pulseLoaderView.center = self.view.center;
                
                [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
                           backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                                     label:@"Circle"];
                
                NSString *str;
                
                if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
                {
                    
                    if ([AllLabel.text isEqualToString:[NSString AllF]])
                    {
                        str = @"";
                    }
                    else if ([AllLabel.text isEqualToString:[NSString HomeF]])
                    {
                        str = @"H";
                    }
                    else if ([AllLabel.text isEqualToString:[NSString KominF]])
                    {
                        str = @"K";
                    }
                }
                else
                {
                    if ([AllLabel.text isEqualToString:[NSString AllD]])
                    {
                        str = @"";
                    }
                    else if ([AllLabel.text isEqualToString:[NSString HomeD]])
                    {
                        str = @"H";
                    }
                    else if ([AllLabel.text isEqualToString:[NSString KominD]])
                    {
                        str = @"K";
                    }
                }
                downloadQueue = [[NSOperationQueue alloc]init];
                [downloadQueue addOperationWithBlock:^{
                    
                    NSString *urlString;
                    
                    urlString = [NSString stringWithFormat:@"%@register_list.php?adminid=%@&status=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],str];
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
//                    int count = 0;
//                    
//                    for (int j = 0; j< data_retrived.count; j++)
//                    {
//                        if ([[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:j]objectForKey:@"arrive_status"]] isEqualToString:@"H"])
//                        {
//                            count++;
//                        }
//                    }
                    totlCountMem.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)data_retrived.count];
                    
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
                            FindUser.separatorColor = [UIColor clearColor];
                            [mainView addSubview:FindUser];
                            [FindUser reloadData];
                            
                            
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
