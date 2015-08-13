//
//  MAStatViewController.m
//  Mobil
//
//  Created by Soumarsi Kundu on 27/07/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import "MAStatViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "RTSpinKitView.h"
#import "UIImageView+WebCache.h"
@interface MAStatViewController ()<UITableViewDataSource,UITableViewDelegate,NSURLSessionTaskDelegate>
{
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
    NSMutableArray *data_retrived,*copyArray;
    UITableView *FindUser;
    UITableViewCell *cell;
    
}

@property (nonatomic, strong)UIView *mainView;
@property (nonatomic, strong)UIView *leftview;
@property (nonatomic, strong) UIButton *leftmenuBt;
@end

@implementation MAStatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    _mainView =[[UIView alloc]initWithFrame:CGRectMake(226, 0, 798,1536/2)];
    _mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgkomin.png"]];
    [self.view addSubview:_mainView];
    
    
    _leftview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 226, 1536/2)];
    _leftview.backgroundColor = [[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1.0f]colorWithAlphaComponent:0.9f];
    [self.view addSubview:_leftview];
    
    
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
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [_leftview addSubview:logout];
    
    UIButton *logout1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 95, 200, 50)];
    [logout1 setBackgroundColor:[UIColor clearColor]];
    [logout1 addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [_leftview addSubview:logout1];
    
    _leftmenuBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftmenuBt setFrame:CGRectMake(40, 170, 120.0f, 49/2)];
    [_leftmenuBt.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:19]];
    [_leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [_leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [_leftmenuBt setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [_leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateNormal];
    [_leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateHighlighted];
    [_leftmenuBt setImage:[UIImage imageNamed:@"stver"] forState:UIControlStateSelected];
    [_leftmenuBt addTarget:self action:@selector(backOut2) forControlEvents:UIControlEventTouchUpInside];
    [_leftview addSubview:_leftmenuBt];
    
    UIButton *leftbutton1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 155, 200, 50)];
    [leftbutton1 setBackgroundColor:[UIColor clearColor]];
    [leftbutton1 addTarget:self action:@selector(backOut2) forControlEvents:UIControlEventTouchUpInside];
    [_leftview addSubview:leftbutton1];
    
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
    [heim addTarget:self action:@selector(backOut) forControlEvents:UIControlEventTouchUpInside];
    [_leftview addSubview:heim];
    
    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 50)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [_mainView addSubview:pageTitle];
    
    
    _checkBox = [[UIButton alloc]initWithFrame:CGRectMake(32, 163,26,25)];
    [_checkBox setBackgroundColor:[UIColor clearColor]];
    [_checkBox setBackgroundImage:[UIImage imageNamed:@"chknr"] forState:UIControlStateNormal];
    [_checkBox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateHighlighted];
    [_checkBox setBackgroundImage:[UIImage imageNamed:@"chksel"] forState:UIControlStateSelected];
    [_checkBox addTarget:self action:@selector(freeButton:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView addSubview:_checkBox];
    
    _freeLabel = [[UILabel alloc]initWithFrame:CGRectMake(63.0f, 160.0f, 35, 31)];
    [_freeLabel setBackgroundColor:[UIColor clearColor]];
    [_freeLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:28]];
    [_freeLabel setTextAlignment:NSTextAlignmentLeft];
    [_freeLabel setTextColor:[UIColor whiteColor]];
    [_mainView addSubview:_freeLabel];
    
    _startDate = [[UIButton alloc]initWithFrame:CGRectMake(105, 155, 150, 40)];
    [_startDate setBackgroundColor:[UIColor whiteColor]];
    _startDate.layer.cornerRadius =3.0f;
    [_startDate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_startDate.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:15]];
    [_startDate addTarget:self action:@selector(startDate:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView addSubview:_startDate];
    
    _endDate = [[UIButton alloc]initWithFrame:CGRectMake(270, 155, 150, 40)];
    [_endDate setBackgroundColor:[UIColor whiteColor]];
    _endDate.layer.cornerRadius =3.0f;
    [_endDate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_endDate.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:15]];
    [_endDate addTarget:self action:@selector(endDate:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView addSubview:_endDate];
    
    _allChild = [[UIButton alloc]initWithFrame:CGRectMake(435, 155, 150, 40)];
    [_allChild setBackgroundColor:[UIColor whiteColor]];
    _allChild.layer.cornerRadius =3.0f;
    [_allChild setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_allChild.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:15]];
    [_allChild addTarget:self action:@selector(allChildButton:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView addSubview:_allChild];
    
    _searchButton = [[UIButton alloc]initWithFrame:CGRectMake(600, 155, 150, 40)];
    [_searchButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    _searchButton.layer.cornerRadius =3.0f;
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_searchButton.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT size:18]];
    [_searchButton addTarget:self action:@selector(searchChild:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView addSubview:_searchButton];
    
    
    _blackView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [_blackView setBackgroundColor:[UIColor blackColor]];
    [_blackView setAlpha:0.7f];
    [self.view addSubview:_blackView];
    [_blackView setHidden:YES];
    
    
    _datePickerBackView = [[UIView alloc]initWithFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
    [_datePickerBackView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_datePickerBackView];
    [_datePickerBackView setHidden:YES];
    
    
    _childPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
    _childPicker.layer.zPosition=9;
    _childPicker.backgroundColor=[UIColor clearColor];
    _childPicker.dataSource = self;
    _childPicker.delegate = self;
    _childPicker.tag = 3;
    _childPicker.showsSelectionIndicator = YES;
    [self.view addSubview:_childPicker];
    [_childPicker setHidden:YES];
    
    
    
    _childPickerDoneButton = [[UIButton alloc]initWithFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
    [_childPickerDoneButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [_childPickerDoneButton setTitle:@"Ok" forState:UIControlStateNormal];
    _childPickerDoneButton.layer.cornerRadius  = 3.0f;
    [_childPickerDoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _childPickerDoneButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    _childPickerDoneButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_childPickerDoneButton addTarget:self action:@selector(DonePicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_childPickerDoneButton];
    [_childPickerDoneButton setHidden:YES];
    
    _childPickerCancelButton = [[UIButton alloc]initWithFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
    [_childPickerCancelButton setBackgroundColor:[UIColor colorWithRed:(97.0f/255.0f) green:(97.0f/255.0f) blue:(97.0f/255.0f) alpha:1.0f]];
    [_childPickerCancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _childPickerCancelButton.layer.cornerRadius  = 3.0f;
    _childPickerCancelButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    _childPickerCancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_childPickerCancelButton addTarget:self action:@selector(CancelButtonPicker:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_childPickerCancelButton];
    [_childPickerCancelButton setHidden:YES];
    
    
 
    _childArray = [[NSMutableArray alloc]init];
    NSLog(@"_childarray-- %@", _childArray);
    //childlist api fire:
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        // Add code here to do background processing
        //
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@all_childlist.php?room_id=%@&SubDomainId=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]]];
        
        NSLog(@"childstring-- %@", [NSString stringWithFormat:@"%@all_childlist.php?room_id=%@&SubDomainId=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]]);
        
        NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            if(error == nil)
                                                            {
                                                                
                                                              NSMutableDictionary *childdictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                                
                                                             
                                                                NSMutableDictionary  *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%@",[NSString allChildF]],@"name",@"",@"id", nil];
                                                                
                                                                NSLog(@"newdictionary-=-=-=-= %@", childdictionary);
                                                                
                                                                 [_childArray addObject:dict];
                                                                
                                                                for (NSDictionary *innerdict in childdictionary)
                                                                    
                                                                [_childArray addObject:innerdict];
                                                               
                                                                NSLog(@"_childarray-- %@", _childArray);
                                                                
                                                                [_childPicker reloadAllComponents];
                                                            }
                                                        }];
        
        [dataTask resume];

        dispatch_async( dispatch_get_main_queue(), ^{
           
            // Add code here to update the UI/send notifications based on the
            // results of the background processing
        });
    });
    
    
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [_leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [_leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [_leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
        [pageTitle setText:[NSString statNameF]];
        [_freeLabel setText:[NSString freeF]];
        [_startDate setTitle:[NSString startDateF] forState:UIControlStateNormal];
        [_endDate setTitle:[NSString endDateF] forState:UIControlStateNormal];
        [_allChild setTitle:[NSString allChildF] forState:UIControlStateNormal];
        [_searchButton setTitle:[NSString SearchF] forState:UIControlStateNormal];
        [_childPickerCancelButton setTitle:[NSString CancelF] forState:UIControlStateNormal];
        
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [_leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [_leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [_leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        [pageTitle setText:[NSString statNameD]];
        [_freeLabel setText:[NSString freeD]];
        [_startDate setTitle:[NSString startDateD] forState:UIControlStateNormal];
        [_endDate setTitle:[NSString endDateD] forState:UIControlStateNormal];
        [_allChild setTitle:[NSString allChildD] forState:UIControlStateNormal];
        [_searchButton setTitle:[NSString SearchD] forState:UIControlStateNormal];
        [_childPickerCancelButton setTitle:[NSString CancelD] forState:UIControlStateNormal];
    }

 

    
    // Do any additional setup after loading the view.
}
- (void)LabelChange:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterNoStyle;
    df.dateFormat=@"dd-MM-yyyy";
    
}
-(void)backOut2{
    
    //downloadQueue = nil;
    
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
   // downloadQueue = nil;
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}
-(void)logout{
    //downloadQueue = nil;
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

//Free button

-(void)freeButton:(UIButton *)sender
{
    if (sender.selected == YES)
    {
        sender.selected = NO;
    }
    else
    {
        sender.selected = YES;
    }
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    startdateString=@"";
    enddateString=@"";
    free_number=@"";
    
        _globalArray = [[NSMutableArray alloc]init];
    
    [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    data_retrived = [[NSMutableArray alloc] init];
    copyArray = [[NSMutableArray alloc] init];
//    searchResults = [[NSArray alloc] init];
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
    dispatch_async(queue, ^{
        // Do some computation here.
        
        // Update UI after computation.
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *urlString;
            
            urlString = [NSString stringWithFormat:@"%@kidstatistic.php?room_id=%@&admin_id=%@&start_date=&end_date=&child_id=&free_chk=",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"]];
            
            
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
            for (int k = 0;k< data_retrived.count; k++)
            {
                NSMutableArray *innerArray = [[NSMutableArray alloc]init];
                
                //   [_globalArray addObject:[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"]];
                
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"] objectAtIndex:ij]];
                }
                
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] objectAtIndex:ij]];
                }
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] objectAtIndex:ij]];
                }
                
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"sick_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"sick_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"sick_days"] objectAtIndex:ij]];
                }
                
                [_globalArray addObject:innerArray];
                //[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"]]
            }
            
            NSLog(@"_globalArray--- %lu", (unsigned long)_globalArray.count);
            
            copyArray = [data_retrived mutableCopy];
            if([copyArray count] > 0){
                
                NSLog(@"==data..%@",copyArray);
                float thgt = [copyArray count]*140;
                
                if(thgt > 550){
                    
                    thgt = 550;
                }
                
                [self removePulseLoader];
                FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,210, 798-60,thgt ) style:UITableViewStylePlain];
                FindUser.delegate=self;
                FindUser.dataSource=self;
                FindUser.backgroundColor = [UIColor clearColor];
                FindUser.tag=2;
                [FindUser setShowsHorizontalScrollIndicator:NO];
                [FindUser setShowsVerticalScrollIndicator:NO];
                FindUser.separatorColor = [UIColor clearColor];
                
                [_mainView addSubview:FindUser];
                [FindUser reloadData];
                
            }else{
                [self removePulseLoader];
                
                backView = [[UIView alloc] initWithFrame:CGRectMake(30, 210, 798-60, 108)];
                backView.backgroundColor = [UIColor whiteColor];
                [_mainView addSubview:backView];
                
                
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
    NSLog(@"indexpath--- %ld--=-=--=--= %@", [[_globalArray objectAtIndex:indexPath.row] count],[_globalArray objectAtIndex:indexPath.row]);
    
    return [[_globalArray objectAtIndex:indexPath.row] count]*20+180;
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

    
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 798-60, [[_globalArray objectAtIndex:indexPath.row] count]*20+170)];
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
 
    UILabel *totalTime = [[UILabel alloc] initWithFrame:CGRectMake(140, 64, 200, 20)];
    totalTime.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    totalTime.textColor = [UIColor lightGrayColor];
    totalTime.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:totalTime];
    
    
    UILabel *totalTimeTxt = [[UILabel alloc] initWithFrame:CGRectMake(140, 84, 230, 20)];
    totalTimeTxt.backgroundColor = [UIColor clearColor];
    //FDatoTxt.text = [[copyArray objectAtIndex:indexPath.row]objectForKey:@"date_of_birth" ];
    totalTimeTxt.font =  [UIFont fontWithName:GLOBALTEXTFONT size:14];
    totalTimeTxt.textColor = [UIColor blackColor];
    totalTimeTxt.lineBreakMode=NSLineBreakByWordWrapping;
    [backView addSubview:totalTimeTxt];
    
    
    NSString *hourCheck=[NSString stringWithFormat:@"%@",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"tothour"]];
    
    
    
    
    
    
    UIView *dev = [[UIView alloc] initWithFrame:CGRectMake(310, 13, 1, 164/2+20)];
    dev.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"div"]];
    [backView addSubview:dev];
    
    ///=====/////////===============
    
    if ([_checkBox isSelected])
    {
        
        Free = [[UILabel alloc] initWithFrame:CGRectMake(340,8, 150, 20)];
        Free.font =[UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
        Free.textColor = [UIColor lightGrayColor];
        Free.textAlignment = NSTextAlignmentLeft;
        Free.backgroundColor=[UIColor clearColor];
        [backView addSubview:Free];
        
        freearray=[[NSMutableArray alloc]init];
        freearray=[[copyArray objectAtIndex:indexPath.row]objectForKey:@"fri_days"];
        Free_Days = [freearray componentsJoinedByString:@" "];
        
        freeText = [[UILabel alloc]init];
        [freeText setBackgroundColor:[UIColor clearColor]];
        [freeText setTextAlignment:NSTextAlignmentLeft];
        [freeText setTextColor:[UIColor blackColor]];
        freeText.numberOfLines = [freearray count];
        [freeText setFont:[UIFont fontWithName:GLOBALTEXTFONT size:19.0f]];
        [backView addSubview:freeText];
        
        if (freearray.count == 0)
        {
            freeText.frame = CGRectMake(340, Free.frame.origin.y+Free.frame.size.height+5, 180, 20);
        }
        else
        {
            freeText.frame = CGRectMake(340, Free.frame.origin.y+15, 100, [freearray count]*20+70);
        }

    }
   else
   {
    sick = [[UILabel alloc] initWithFrame:CGRectMake(340, 20-12, 180, 20)];
    sick.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    sick.textColor = [UIColor lightGrayColor];
    sick.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:sick];
    
    sickArray=[[NSMutableArray alloc]init];
    sickArray=[[copyArray objectAtIndex:indexPath.row]objectForKey:@"sick_days"];
    sick_Days = [sickArray componentsJoinedByString:@" "];
    
  
    sickText = [[UILabel alloc]init];
    [sickText setBackgroundColor:[UIColor clearColor]];
    [sickText setTextAlignment:NSTextAlignmentLeft];
    [sickText setTextColor:[UIColor blackColor]];
    [sickText setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16.5]];
    [backView addSubview:sickText];
    
    if (sickArray.count == 0)
    {
        sickText.frame = CGRectMake(340, sick.frame.origin.y+sick.frame.size.height+5, 180, 20);
    }
    else
    {
         sickText.frame = CGRectMake(340, sick.frame.origin.y+sick.frame.size.height+15, 180, [sickArray  count]*18);
    }
   
    
    notArrived = [[UILabel alloc] initWithFrame:CGRectMake(340,sickText.frame.origin.y+sickText.frame.size.height+10, 200, 20)];
    notArrived.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    notArrived.textColor = [UIColor lightGrayColor];
    notArrived.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:notArrived];
    
    dataarray=[[NSMutableArray alloc]init];
    dataarray=[[copyArray objectAtIndex:indexPath.row]objectForKey:@"not_arrive_days"];
    absent_dates = [dataarray componentsJoinedByString:@" "];
    
    
    notArrivedText = [[UILabel alloc]init];
    [notArrivedText setBackgroundColor:[UIColor clearColor]];
    [notArrivedText setTextAlignment:NSTextAlignmentLeft];
    [notArrivedText setTextColor:[UIColor blackColor]];
    notArrivedText.numberOfLines = [dataarray count];
    [notArrivedText setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16.5f]];
    [backView addSubview:notArrivedText];

    
    if (dataarray.count == 0)
    {
        notArrivedText.frame = CGRectMake(340, notArrived.frame.origin.y+notArrived.frame.size.height+5, 180, 20);
    }
    else
    {
        notArrivedText.frame = CGRectMake(340, notArrived.frame.origin.y+20, 100, [dataarray count]*20);
    }
    

    Free = [[UILabel alloc] initWithFrame:CGRectMake(340,notArrivedText.frame.origin.y+notArrivedText.frame.size.height+5, 150, 20)];
    Free.font =[UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    Free.textColor = [UIColor lightGrayColor];
    Free.textAlignment = NSTextAlignmentLeft;
    Free.backgroundColor=[UIColor clearColor];
    [backView addSubview:Free];
 
    freearray=[[NSMutableArray alloc]init];
    freearray=[[copyArray objectAtIndex:indexPath.row]objectForKey:@"fri_days"];
    Free_Days = [freearray componentsJoinedByString:@" "];
    
    freeText = [[UILabel alloc]init];
    [freeText setBackgroundColor:[UIColor clearColor]];
    [freeText setTextAlignment:NSTextAlignmentLeft];
    [freeText setTextColor:[UIColor blackColor]];
    freeText.numberOfLines = [freearray count];
    [freeText setFont:[UIFont fontWithName:GLOBALTEXTFONT size:16.5f]];
    [backView addSubview:freeText];
    
    if (freearray.count == 0)
    {
        freeText.frame = CGRectMake(340, Free.frame.origin.y+Free.frame.size.height+5, 180, 20);
    }
    else
    {
        freeText.frame = CGRectMake(340, Free.frame.origin.y+20, 100, [freearray count]*20);
    }
   }

    UIView *dev1 = [[UIView alloc] initWithFrame:CGRectMake(510, 13, 1, [[_globalArray objectAtIndex:indexPath.row] count]*20+165)];
    dev1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"div"]];
    [backView addSubview:dev1];
    
    UILabel *komin = [[UILabel alloc] initWithFrame:CGRectMake(540, 8, 200, 20)];
    komin.font =[UIFont fontWithName:GLOBALTEXTFONT_Light size:15];
    komin.textColor = [UIColor lightGrayColor];
    komin.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:komin];
    
    

    NSMutableArray *komin_array=[[NSMutableArray alloc]init];
    komin_array=[[copyArray objectAtIndex:indexPath.row]objectForKey:@"in_arrive_days"];
    NSString *komin_time = [komin_array componentsJoinedByString:@" "];

   
    UILabel *komin_status1 = [[UILabel alloc] init];
    komin_status1.font =[UIFont fontWithName:GLOBALTEXTFONT_Light size:16.5];
    komin_status1.textColor = [UIColor blackColor];
    komin_status1.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:komin_status1];
     komin_status1.frame = CGRectMake(540, komin.frame.origin.y+komin.frame.size.height+5, 180, 20);
 


    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        totalTime.text = [NSString totalTimeF];
        sick.text = [NSString sickF];
        notArrived.text = [NSString notArrivedF];
        komin.text=[NSString KominF];
        if ([hourCheck isEqualToString:@"0"])
        {
            totalTimeTxt.text=[NSString stringWithFormat:@"%@ Tímar",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"tothour"]];
            
        }
        else
        {
            totalTimeTxt.text=[NSString stringWithFormat:@"%@ Tímar %@ Min %@ Sek",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"tothour"],[[copyArray objectAtIndex:indexPath.row]objectForKey:@"totminutes"],[[copyArray objectAtIndex:indexPath.row]objectForKey:@"totsec"]];
            
        }

        if (sickArray.count == 0)
        {
            sickText.text = [NSString stringWithFormat:@"0 %@",[NSString NodayF]];
        }
        else
        {
            sickText.text = sick_Days;
        }
        
        
        if (dataarray.count == 0)
        {
            notArrivedText.text = [NSString stringWithFormat:@"0 %@",[NSString NodayF]];
        }
        else
        {
            notArrivedText.text = absent_dates;
        }
        
        if (freearray.count == 0)
        {
            freeText.text = [NSString stringWithFormat:@"0 %@",[NSString NodayF]];
        }
        else
        {
            freeText.text = Free_Days;
        }
        Free.text = [NSString freeF];
        
        
        if (komin_array.count==0)
        {
            komin_status1.text=[NSString notArrivedF];
        }
        else
        {
            NSString *new_time = [komin_time stringByReplacingOccurrencesOfString: @"###" withString:@" , "];
            
            NSString *new_time2 = [new_time stringByReplacingOccurrencesOfString: @"##" withString:@" \n "];
            
            
            UILabel *komin_status=[[UILabel alloc]initWithFrame:CGRectMake(540,komin.frame.origin.y+komin.frame.size.height+5, 180, [komin_array count]*40)];
            komin_status.font = [UIFont fontWithName:GLOBALTEXTFONT size:16.5f];
            komin_status.text=new_time2;
            komin_status.backgroundColor=[UIColor clearColor];
            [backView addSubview:komin_status];
            komin_status.numberOfLines = [komin_array count]*2;
            
            
            
        }
    }
    else
    {
        
        totalTime.text = [NSString totalTimeD];
        sick.text = [NSString sickD];
        notArrived.text = [NSString notArrivedD];
        komin.text=[NSString KominD];
        if ([hourCheck isEqualToString:@"0"])
        {
            totalTimeTxt.text=[NSString stringWithFormat:@"%@ Times",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"tothour"]];
            
        }
        else
        {
            totalTimeTxt.text=[NSString stringWithFormat:@"%@ Timer %@ Min %@ Sec",[[copyArray objectAtIndex:indexPath.row]objectForKey:@"tothour"],[[copyArray objectAtIndex:indexPath.row]objectForKey:@"totminutes"],[[copyArray objectAtIndex:indexPath.row]objectForKey:@"totsec"]];
            
        }

        
        if (sickArray.count == 0)
        {
            sickText.text = [NSString stringWithFormat:@"0 %@",[NSString NodayD]];
        }
        else
        {
            sickText.text = sick_Days;
        }
        
        if (dataarray.count == 0)
        {
            notArrivedText.text = [NSString stringWithFormat:@"0 %@",[NSString NodayD]];
        }
        else
        {
            notArrivedText.text = absent_dates;
        }
        
        if (freearray.count == 0)
        {
            freeText.text = [NSString stringWithFormat:@"0 %@",[NSString NodayD]];
        }
        else
        {
            freeText.text = Free_Days;
        }
         Free.text = [NSString freeD];
        
        if (komin_array.count==0)
        {
            komin_status1.text=[NSString notArrivedF];
        }
        else
        {
            NSString *new_time = [komin_time stringByReplacingOccurrencesOfString: @"###" withString:@" , "];
            
            NSString *new_time2 = [new_time stringByReplacingOccurrencesOfString: @"##" withString:@" \n "];
            
            
            UILabel *komin_status=[[UILabel alloc]initWithFrame:CGRectMake(540,komin.frame.origin.y+komin.frame.size.height+5, 180, [komin_array count]*40)];
            komin_status.font = [UIFont fontWithName:GLOBALTEXTFONT size:16.5f];
            komin_status.text=new_time2;
            komin_status.backgroundColor=[UIColor clearColor];
            [backView addSubview:komin_status];
            komin_status.numberOfLines = [komin_array count]*2;
            
            
            
        }

    }

    return cell;
    
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
    [_mainView addSubview:spinnview];
    
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




-(void)allChildButton:(UIButton *)sender
{
    
    [_childPicker selectRow:0 inComponent:0 animated:NO];
     DataString = [NSString stringWithFormat:@"%@",[NSString allChildF]];
    childid = @"";
    globalString = @"child";
    
    [_blackView setHidden:NO];
    [_datePickerBackView setHidden:NO];
    [_childPickerDoneButton setHidden:NO];
    [_childPickerCancelButton setHidden:NO];
    [_childPicker setHidden:NO];
    
    [_blackView setAlpha:0.0f];
    
    [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
    [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
    [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
    [_childPicker setFrame:CGRectMake(0.0f, 568.0f+250.0f, self.view.frame.size.width, 150.0f)];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        [_blackView setAlpha:0.6f];
        [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
        [_childPicker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
        
    } completion:^(BOOL finished)
    {
       
    }];
    
}

-(void)startDate:(UIButton *)sender
{
    
    _date_picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(300, 568.0f+50.0f, 424, 260)];
    _date_picker.datePickerMode = UIDatePickerModeDate;
    [_date_picker addTarget:self
                     action:@selector(LabelChange:)
           forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_date_picker];
 
    _date_picker.date = [NSDate date];
    _date_picker.maximumDate = [NSDate date];
    globalString = @"startdate";
    [_blackView setHidden:NO];
    [_datePickerBackView setHidden:NO];
    [_childPickerDoneButton setHidden:NO];
    [_childPickerCancelButton setHidden:NO];
    [_date_picker setHidden:NO];
    
    [_blackView setAlpha:0.0f];
    
    [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
    [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
    [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
    [_date_picker setFrame:CGRectMake(0.0f, 568.0f+250.0f, self.view.frame.size.width, 150.0f)];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        [_blackView setAlpha:0.6f];
        [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
        [_date_picker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)endDate:(UIButton *)sender
{
   
    _date_picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(300, 568.0f+50.0f, 424, 260)];
    _date_picker.datePickerMode = UIDatePickerModeDate;
    [_date_picker addTarget:self
                     action:@selector(LabelChange:)
           forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_date_picker];
    
   
    NSDate *dateFromString = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    dateFromString = [dateFormatter dateFromString:startdateString];
    int daysToAdd = 0;
    NSDate *newDate1 = [dateFromString dateByAddingTimeInterval:60*60*24*daysToAdd];
    
    [_date_picker setMinimumDate:newDate1];

   
    globalString = @"enddate";
    
    [_blackView setHidden:NO];
    [_datePickerBackView setHidden:NO];
    [_childPickerDoneButton setHidden:NO];
    [_childPickerCancelButton setHidden:NO];
    [_date_picker setHidden:NO];
    
    [_blackView setAlpha:0.0f];
    
    [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
    [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
    [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
    [_date_picker setFrame:CGRectMake(0.0f, 568.0f+250.0f, self.view.frame.size.width, 150.0f)];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        [_blackView setAlpha:0.6f];
        [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
        [_date_picker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)DonePicker:(UIButton *)sender
{
    if([globalString isEqualToString:@"child"])
    {
    [_blackView setAlpha:0.6f];
    
    [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
    [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
    [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
    [_childPicker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        [_blackView setAlpha:0.0f];
        
        [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
        [_childPicker setFrame:CGRectMake(0.0f, 568.0f+200.0f, self.view.frame.size.width, 150.0f)];
        
    } completion:^(BOOL finished) {
        
        [_blackView setHidden:YES];
        [_datePickerBackView setHidden:YES];
        [_childPickerDoneButton setHidden:YES];
        [_childPickerCancelButton setHidden:YES];
        [_childPicker setHidden:YES];
    }];
    [_allChild setTitle:DataString forState:UIControlStateNormal];
    }
    else if ([globalString isEqualToString:@"startdate"])
    {
        [_blackView setAlpha:0.6f];
        
        [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
        [_date_picker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
        
        
        [UIView animateWithDuration:0.8 animations:^{
            
            [_blackView setAlpha:0.0f];
            
            [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
            [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
            [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
            [_date_picker setFrame:CGRectMake(0.0f, 568.0f+200.0f, self.view.frame.size.width, 150.0f)];
            
        } completion:^(BOOL finished) {
            
            [_blackView setHidden:YES];
            [_datePickerBackView setHidden:YES];
            [_childPickerDoneButton setHidden:YES];
            [_childPickerCancelButton setHidden:YES];
            [_date_picker setHidden:YES];
            
            NSDate *myDate = _date_picker.date;
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd-MM-yyyy"];
            startdateString = [dateFormat stringFromDate:myDate];
            [_startDate setTitle:startdateString forState:UIControlStateNormal];
            
        }];
        
        
    }
    else
    {
        
        _date_picker.maximumDate = [NSDate date];
        [_blackView setAlpha:0.6f];
        
        [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
        [_date_picker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
        
        
        [UIView animateWithDuration:0.8 animations:^{
            
            [_blackView setAlpha:0.0f];
            
            [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
            [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
            [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
            [_date_picker setFrame:CGRectMake(0.0f, 568.0f+200.0f, self.view.frame.size.width, 150.0f)];
            
        } completion:^(BOOL finished) {
            
            [_blackView setHidden:YES];
            [_datePickerBackView setHidden:YES];
            [_childPickerDoneButton setHidden:YES];
            [_childPickerCancelButton setHidden:YES];
            [_date_picker setHidden:YES];
            
            NSDate *myDate = _date_picker.date;
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd-MM-yyyy"];
            enddateString = [dateFormat stringFromDate:myDate];
            [_endDate setTitle:enddateString forState:UIControlStateNormal];
        }];
    }
}
-(void)CancelButtonPicker:(UIButton *)sender
{
    
    [_blackView setAlpha:0.6f];
    
    [_datePickerBackView setFrame:CGRectMake(0.0f,568.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
    [_childPickerDoneButton setFrame:CGRectMake(900.0f, 573.0f, 83, 35.0f)];
    [_childPickerCancelButton setFrame:CGRectMake(800.0f, 573.0f, 83, 35.0f)];
    [_childPicker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
    [_date_picker setFrame:CGRectMake(0.0f, 568.0f+50.0f, self.view.frame.size.width, 150.0f)];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        [_blackView setAlpha:0.0f];
   
        [_datePickerBackView setFrame:CGRectMake(0.0f,768.0f, self.view.frame.size.width, self.view.frame.size.height-568)];
        [_childPickerDoneButton setFrame:CGRectMake(900.0f, 773.0f, 83, 35.0f)];
        [_childPickerCancelButton setFrame:CGRectMake(800.0f, 773.0f, 83, 35.0f)];
        [_childPicker setFrame:CGRectMake(0.0f, 568.0f+200.0f, self.view.frame.size.width, 150.0f)];
        [_date_picker setFrame:CGRectMake(0.0f, 568.0f+200.0f, self.view.frame.size.width, 150.0f)];

    } completion:^(BOOL finished) {
        
        [_blackView setHidden:YES];
        [_datePickerBackView setHidden:YES];
        [_childPickerDoneButton setHidden:YES];
        [_childPickerCancelButton setHidden:YES];
        [_childPicker setHidden:YES];
        [_date_picker setHidden:YES];
    }];
    
}

#pragma UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
   
        UILabel *retval = (id)view;
        if (!retval) {
            retval= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)] ;
        }
        
        
        //retval.font = [UIFont fontWithName:GLOBALTEXTFONT size:19];
        retval.textAlignment= NSTextAlignmentCenter;
        retval.textColor = [UIColor blackColor];

        retval.text = [NSString stringWithFormat:@"%@",[[self.childArray objectAtIndex:row] objectForKey:@"name"]];
  
        return retval;
        
    }
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
    
    return 90.0f;

    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
   
        return self.childArray.count;

}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
        DataString = [NSString stringWithFormat:@"%@",[[self.childArray objectAtIndex:[_childPicker selectedRowInComponent:component]] objectForKey:@"name"]];
        
        childid = [[self.childArray objectAtIndex:[_childPicker selectedRowInComponent:component]] objectForKey:@"id"];
 
    
}

//search child
-(void)searchChild:(UIButton *)sender
{
    [_globalArray removeAllObjects];
    
    NSLog(@" Test Ok >>>>>>>>%@",childid);
    
    if (childid.length == 0 && startdateString.length==0 && enddateString.length==0)
    {
        childid=@"";
        
        startdateString=@"";
        
        enddateString=@"";
        
        if ([_checkBox isSelected])
        {
            free_number=@"1";
        }
        else
        {
            free_number=@"";
        }
    }
    else if (childid.length == 0 && startdateString.length==0 )
    {
        childid=@"";
        
        startdateString=@"";
        
        enddateString=@"";

        if ([_checkBox isSelected])
        {
            free_number=@"1";
        }
        else
        {
            free_number=@"";
        }

    }
    else if (childid.length == 0)
    {
        childid=@"";
        
        if ([_checkBox isSelected])
        {
            free_number=@"1";
        }
        else
        {
            free_number=@"";
        }

    }
//    else
//    {
//        startdateString=@"";
//        
//        enddateString=@"";
//        
//        free_number=@"";
//    }
 
    NSLog(@"childis---- %@", childid);
    
    [self callPulseLoaderView:CGRectMake(80, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    data_retrived = [[NSMutableArray alloc] init];
    copyArray = [[NSMutableArray alloc] init];
    //    searchResults = [[NSArray alloc] init];
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
    dispatch_async(queue, ^{
        // Do some computation here.
        
        // Update UI after computation.
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *urlString;
            
            urlString = [NSString stringWithFormat:@"%@kidstatistic.php?room_id=%@&admin_id=%@&start_date=%@&end_date=%@&child_id=%@&free_chk=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],startdateString,enddateString,childid,free_number];
            
            
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
            
            if ([_checkBox isSelected])
            {
                for (int k = 0;k< data_retrived.count; k++)
                {
                    NSMutableArray *innerArray = [[NSMutableArray alloc]init];
        
                    if (![[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] isKindOfClass:[NSNull class]])
                    {
                        for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] count]; ij++)
                            [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] objectAtIndex:ij]];
                    }
                    if (![[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] isKindOfClass:[NSNull class]])
                    {
                        for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] count]; ij++)
                            [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] objectAtIndex:ij]];
                    }
                    
                    [_globalArray addObject:innerArray];
                }
            }
            else
            {
            for (int k = 0;k< data_retrived.count; k++)
            {
                NSMutableArray *innerArray = [[NSMutableArray alloc]init];

             //   [_globalArray addObject:[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"]];
                
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"] count]; ij++)
                    [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"not_arrive_days"] objectAtIndex:ij]];
                }
                
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"] objectAtIndex:ij]];
                }
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"in_arrive_days"] objectAtIndex:ij]];
                }
                
                if (![[[data_retrived objectAtIndex:k]objectForKey:@"sick_days"] isKindOfClass:[NSNull class]])
                {
                    for (int ij = 0; ij < [[[data_retrived objectAtIndex:k]objectForKey:@"sick_days"] count]; ij++)
                        [innerArray addObject:[[[data_retrived objectAtIndex:k]objectForKey:@"sick_days"] objectAtIndex:ij]];
                }
                
                [_globalArray addObject:innerArray];
             //[[data_retrived objectAtIndex:k]objectForKey:@"fri_days"]]
            }
            }
             NSLog(@"-=-=-=-globalarray-=-== %@",_globalArray);
            
            copyArray = [data_retrived mutableCopy];
            if([copyArray count] > 0){
                
                NSLog(@"==data..%@",copyArray);
                float thgt = [copyArray count]*140;
                
                if(thgt > 550){
                    
                    thgt = 550;
                }
                
                [FindUser removeFromSuperview];
                [backView removeFromSuperview];
                [self removePulseLoader];
                FindUser=[[UITableView alloc]initWithFrame:CGRectMake(30,210, 798-60,550 ) style:UITableViewStylePlain];
                FindUser.delegate=self;
                FindUser.dataSource=self;
                FindUser.backgroundColor = [UIColor clearColor];
                FindUser.tag=2;
                [FindUser setShowsHorizontalScrollIndicator:NO];
                [FindUser setShowsVerticalScrollIndicator:NO];
                FindUser.separatorColor = [UIColor clearColor];
                
                [_mainView addSubview:FindUser];
                [FindUser reloadData];
                
            }else{
                [self removePulseLoader];
                
                [FindUser removeFromSuperview];
                [backView removeFromSuperview];
                
                backView = [[UIView alloc] initWithFrame:CGRectMake(30, 210, 798-60, 108)];
                backView.backgroundColor = [UIColor whiteColor];
                [_mainView addSubview:backView];
                
                
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
