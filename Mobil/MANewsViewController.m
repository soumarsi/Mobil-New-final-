//
//  MANewsViewController.m
//  Mobil
//
//  Created by Soumarsi Kundu on 19/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import "MANewsViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "RTSpinKitView.h"
#import "MARegistrationViewController.h"
@interface MANewsViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UIAlertViewDelegate>
{
    UIView *mainView,*leftview;
    UIButton *leftmenuBt;
    NSMutableArray *data_retrived;
    UITableView *FindUser;
    UILabel *totlCountMem;
    UITableViewCell *cell;
    UIView *Blackview;
    UIView *WhiteView;
    UITextView *CoemtText;
    NSOperationQueue *downloadQueue;
    UILabel *AddNewLabel;
    NSString *check;
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
}

@end

@implementation MANewsViewController

- (void)viewDidLoad{
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
    
 
    totlCountMem = [[UILabel alloc] initWithFrame:CGRectMake(180, 80, 300, 44)];
    totlCountMem.backgroundColor = [UIColor clearColor];
    totlCountMem.textColor = [UIColor whiteColor];
    totlCountMem.text = @"";
    totlCountMem.font = [UIFont fontWithName:GLOBALTEXTFONT size:25];
    totlCountMem.textAlignment = NSTextAlignmentLeft;
    totlCountMem.hidden=YES;
    [mainView addSubview:totlCountMem];
    
    
    UIButton *AddNewsButton = [[UIButton alloc]initWithFrame:CGRectMake(630.0f, 100.0f, 115.0f, 30)];
    [AddNewsButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [AddNewsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AddNewsButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    AddNewsButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddNewsButton addTarget:self action:@selector(AddnewsButton:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:AddNewsButton];
    

    Blackview = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [Blackview setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:Blackview];
    [Blackview setHidden:YES];
    
    WhiteView = [[UIView alloc]init];
    [WhiteView setBackgroundColor:[UIColor whiteColor]];
    WhiteView.layer.cornerRadius = 3.0f;
    [self.view addSubview:WhiteView];
    [WhiteView setHidden:YES];
    
    
    AddNewLabel = [[UILabel alloc]initWithFrame:CGRectMake(35.0f, 15.0f, 200.0f, 35.0f)];
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
    [NewsLabel setTextAlignment:NSTextAlignmentLeft];
    [NewsLabel setTextColor:[UIColor lightGrayColor]];
    [NewsLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:17]];
    [WhiteView addSubview:NewsLabel];
    
    
    CoemtText = [[UITextView alloc]initWithFrame:CGRectMake(35,113,420,153)];
    CoemtText.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:16];
    CoemtText.backgroundColor = [UIColor clearColor];
    CoemtText.textColor = [UIColor grayColor];
    CoemtText.scrollEnabled = YES;
    CoemtText.pagingEnabled = YES;
    CoemtText.editable = YES;
    CoemtText.delegate = self;
    CoemtText.layer.borderWidth = 1.0f;
    CoemtText.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    CoemtText.textAlignment = NSTextAlignmentLeft;
    CoemtText.layer.cornerRadius = 3.0f;
    [CoemtText setAutocorrectionType:UITextAutocorrectionTypeNo];
    [WhiteView addSubview:CoemtText];
    
    UIButton *CrossButton = [[UIButton alloc]initWithFrame:CGRectMake(460.0f, 7.5f, 28, 28)];
    [CrossButton setBackgroundImage:[UIImage imageNamed:@"NewsCross"] forState:UIControlStateNormal];
    [CrossButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:CrossButton];
    
    
    UIButton *CloseButton = [[UIButton alloc]initWithFrame:CGRectMake(277.0f, 280.0f, 84.0f, 32)];
    [CloseButton setBackgroundColor:[UIColor colorWithRed:(97.0f/255.0f) green:(97.0f/255.0f) blue:(97.0f/255.0f) alpha:1.0f]];
    [CloseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CloseButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    CloseButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [CloseButton addTarget:self action:@selector(Cross) forControlEvents:UIControlEventTouchUpInside];
    [WhiteView addSubview:CloseButton];
    
    SubmitButton = [[UIButton alloc]initWithFrame:CGRectMake(370.0f, 280.0f, 84.0f, 32)];
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
        pageTitle.text = [NSString NewsF];
        [AddNewsButton setTitle:@"Stovna" forState:UIControlStateNormal];
        [NewsLabel setText:[NSString stringWithFormat:@"%@:",[NSString NewsF]]];
        [CloseButton setTitle:[NSString CancelF] forState:UIControlStateNormal];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = @"Nyheder";
        [AddNewsButton setTitle:@"Ny" forState:UIControlStateNormal];
        [NewsLabel setText:[NSString stringWithFormat:@"%@:",[NSString NewsD]]];
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
    
    urlString = [NSString stringWithFormat:@"%@news_list.php?adminid=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
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
        [FindUser removeFromSuperview];
        
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    UIFont *font1 = [UIFont fontWithName:GLOBALTEXTFONT size:16];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: font1 forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"news_desc"] attributes: arialDict];
    
    CGRect rect;

        rect =[aAttrString1 boundingRectWithSize:CGSizeMake(715, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];

    return rect.size.height + 100;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data_retrived count];
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
    UIFont *font1 = [UIFont fontWithName:GLOBALTEXTFONT size:16];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: font1 forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"news_desc"] attributes: arialDict];
    CGRect rect;
    rect =[aAttrString1 boundingRectWithSize:CGSizeMake(715, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    UIView *cellbackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 715, rect.size.height+86)];
    cellbackView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Newscellimage"]];
    [cell addSubview:cellbackView];
    
    UILabel *descLabl = [[UILabel alloc]init];
    [descLabl setBackgroundColor:[UIColor clearColor]];
    descLabl.numberOfLines = 0;
    [descLabl setTextAlignment:NSTextAlignmentLeft];
    [descLabl setTextColor:[UIColor colorWithRed:(135.0f/255.0f) green:(135.0f/255.0f) blue:(135.0f/255.0f) alpha:1.0f]];
    descLabl.clipsToBounds = YES;
    [cell addSubview:descLabl];
    

    [cellbackView addSubview:descLabl];
    descLabl.attributedText = aAttrString1;

    UILabel *Posted_on = [[UILabel alloc]init];
    [Posted_on setBackgroundColor:[UIColor clearColor]];
    [Posted_on setText:[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:indexPath.row] objectForKey:@"posted_on"]]];
    [Posted_on setTextAlignment:NSTextAlignmentLeft];
    [Posted_on setTextColor:[UIColor colorWithRed:(60.0f/255.0f) green:(154.0f/255.0f) blue:(189.0f/255.0f) alpha:1.0f]];
    [Posted_on setFont:[UIFont fontWithName:GLOBALTEXTFONT size:18]];
    [cellbackView addSubview:Posted_on];
    

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
    
    descLabl.frame = CGRectMake(15, 5, 600, rect.size.height+55);
    Posted_on.frame = CGRectMake(15, rect.size.height+52, 600, 30);
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)EditButton:(UIButton *)sender
{
    check = @"edit";
    
    [Blackview setHidden:NO];
    [WhiteView setHidden:NO];
    Blackview.alpha = 0.0f;
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
          [AddNewLabel setText:[NSString EditNewsF]];
    }
    else
    {
          [AddNewLabel setText:[NSString EditNewsD]];
    }
  
    SubmitButton.tag = sender.tag;
    CoemtText.text = [NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"news_desc"]];
    WhiteView.alpha = 0.0f;
    WhiteView.frame = CGRectMake(360, -50, 500, 354) ;
    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.8f;
        WhiteView.alpha = 1.0f;
        WhiteView.frame = CGRectMake(360, 160, 500, 354) ;
        
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
    }}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if (alertView == DeleteAlert)
    {

    
    if(buttonIndex == 0)//OK button pressed
    {
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            
            NSError *error;
            
            NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@delete_news.php?table_id=%@&admin_id=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:alertView.tag]objectForKey:@"id"]],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:alertView.tag]objectForKey:@"admin_id"]]]]options:NSDataReadingUncached error:&error];
            

            
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
-(void)AddnewsButton:(UIButton *)sender
{
    check  =@"add";
    
    [Blackview setHidden:NO];
    [WhiteView setHidden:NO];
    CoemtText.text = @"";
    Blackview.alpha = 0.0f;
   
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
         [AddNewLabel setText:@"Stovna"];
    }
    else
    {
         [AddNewLabel setText:@"Ny"];
    }
    WhiteView.alpha = 0.0f;
    WhiteView.frame = CGRectMake(360, -50, 500, 354) ;
    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.8f;
        WhiteView.alpha = 1.0f;
        WhiteView.frame = CGRectMake(360, 160, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
    }];
    
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



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    
    
    if([text isEqualToString:@"\n"]) {
        
        [CoemtText resignFirstResponder];
        
        return NO;
        
    }
    
    
    
    return YES;
    
}

-(void)Cross
{
    [CoemtText resignFirstResponder];
    
    Blackview.alpha = 0.8f;
    WhiteView.alpha = 1.0f;
    WhiteView.frame = CGRectMake(360, 160, 500, 354) ;
    [UIView animateWithDuration:0.8 animations:^{
        Blackview.alpha = 0.0f;
        WhiteView.alpha = 0.0f;
        WhiteView.frame = CGRectMake(360, -50, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
        [Blackview setHidden:YES];
        [WhiteView setHidden:YES];
    }];
}

-(void)SubmitButton:(UIButton *)sender
{
   // NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if ([CoemtText.text isEqualToString:@""])
    {
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
        {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"skriva Stovna" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
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
    if ([check isEqualToString:@"edit"])
    {
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            
            NSError *error;
            
            NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@update_news.php?room_id=%@&news_desc=%@&table_id=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"room_id"]],[CoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[NSString stringWithFormat:@"%@",[[data_retrived objectAtIndex:sender.tag]objectForKey:@"id"]]]]options:NSDataReadingUncached error:&error];
            

            
            NSString *string = [[NSString alloc] initWithData:DeleteData encoding:NSUTF8StringEncoding] ;
            
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if ([string isEqualToString:@"success"])
                {
                    Blackview.alpha = 0.8f;
                    WhiteView.alpha = 1.0f;
                    WhiteView.frame = CGRectMake(360, 160, 500, 354) ;
                    [UIView animateWithDuration:0.8 animations:^{
                        Blackview.alpha = 0.0f;
                        WhiteView.alpha = 0.0f;
                        WhiteView.frame = CGRectMake(360, -50, 500, 354) ;
                        
                    } completion:^(BOOL finished) {
                        
                        [Blackview setHidden:YES];
                        [WhiteView setHidden:YES];
                    }];
                    [self updatedata];
                }
                
                
            }];
            
        }];
    }
    else if ([check isEqualToString:@"add"])
    {
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            
            NSError *error;
            
            NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@insert_news.php?admin_id=%@&user_id=%@&room_id=%@&news_desc=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"adminid"],[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"userid"]],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"],[CoemtText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]options:NSDataReadingUncached error:&error];
     
            
            NSString *string = [[NSString alloc] initWithData:DeleteData encoding:NSUTF8StringEncoding] ;
            
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                if ([string isEqualToString:@"success"])
                {
                    Blackview.alpha = 0.8f;
                    WhiteView.alpha = 1.0f;
                    WhiteView.frame = CGRectMake(360, 160, 500, 354) ;
                    [UIView animateWithDuration:0.8 animations:^{
                        Blackview.alpha = 0.0f;
                        WhiteView.alpha = 0.0f;
                        WhiteView.frame = CGRectMake(360, -50, 500, 354) ;
                        
                    } completion:^(BOOL finished) {
                        
                        [Blackview setHidden:YES];
                        [WhiteView setHidden:YES];
                    }];
                     [self updatedata];
                }
                
                
            }];
            
        }];
    }
}
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.6 animations:^{

        WhiteView.frame = CGRectMake(360, 100, 500, 354) ;
        
    } completion:^(BOOL finished) {
        

    }];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.6 animations:^{
        
        WhiteView.frame = CGRectMake(360, 160, 500, 354) ;
        
    } completion:^(BOOL finished) {
        
        
    }];
}

-(void)updatedata
{
    
    [CoemtText resignFirstResponder];
    

    
    data_retrived = [[NSMutableArray alloc] init];
    
    NSString *urlString;
    
    urlString = [NSString stringWithFormat:@"%@news_list.php?adminid=%@&room_id=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"pageid"]];
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
    
    
    if([data_retrived count] > 0)
    {
    
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
        //[FindUser setSeparatorStyle:UITableViewCellSeparatorStyleNone];
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
