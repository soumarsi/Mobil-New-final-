//
//  MAHomeViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "MARegistrationViewController.h"
#import "RTSpinKitView.h"
#import "Mobil-Prefix.pch"
@interface MAHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSOperationQueue *MainQueue;
    NSMutableArray *HomeDataArray;
    UITableView *HomeTable;
    UIView *pulseLoaderView,*spinnview;
    RTSpinKitView *PulseSpinner;
    float x ;
    float y ;
}

@end

@implementation MAHomeViewController

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
    mainView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024,1536/2)];
    mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:mainView];
    
    x = 0.0f;
    
    demoView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024,1536/2)];
    demoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [mainView addSubview:demoView];
    
    UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 155, 1024,60)];
    [Title setBackgroundColor:[UIColor clearColor]];
    if ([[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"sitename"]] isKindOfClass:[NSNull class]] || [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"sitename"]] == (id)[NSNull null] || [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"sitename"]].length == 0 || [[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"sitename"]] isEqualToString:@""] || [[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"sitename"]] isEqualToString:@"(null)"])
    {
        Title.text = @"";
    }
    else
    {
    Title.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"sitename"]];
    }
    Title.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    Title.textAlignment = NSTextAlignmentCenter;
    Title.font = [UIFont fontWithName:GLOBALTEXTFONT size:45];
    [demoView addSubview:Title];
    
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake(160, 50, 120.0f, 49/2)];
    [logout setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [logout setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [logout.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateHighlighted];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateSelected];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:logout];
    
    
    
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
    [demoView addSubview:Registration];
    
    UIButton *Refrsh = [UIButton buttonWithType:UIButtonTypeCustom];
    [Refrsh setFrame:CGRectMake(770, 50, 120.0f, 49/2)];
    [Refrsh setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [Refrsh setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [Refrsh.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
    [Refrsh setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [Refrsh setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [Refrsh setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    
    [Refrsh setImage:[UIImage imageNamed:@"RefreshREd"] forState:UIControlStateNormal];
    [Refrsh setImage:[UIImage imageNamed:@"RefreshREd"] forState:UIControlStateHighlighted];
    [Refrsh setImage:[UIImage imageNamed:@"RefreshREd"] forState:UIControlStateSelected];
    [Refrsh setTitle:@"Dagfør" forState:UIControlStateNormal];
    [Refrsh addTarget:self action:@selector(refres) forControlEvents:UIControlEventTouchUpInside];
   // [demoView addSubview:Refrsh];

    [self callPulseLoaderView:CGRectMake(180, 180, 40, 40) view:self.view];
    [self.view bringSubviewToFront:pulseLoaderView];
    pulseLoaderView.center = self.view.center;
    
    [self insertSpinnerOfStyle: RTSpinKitViewStyleCircle
               backgroundColor:[UIColor colorWithRed:0.161 green:0.502 blue:0.725 alpha:1.0]
                         label:@"Circle"];
    
    UIView *HomeView = [[UIView alloc]initWithFrame:CGRectMake(0, 245, 1024, 500)];
    [HomeView setBackgroundColor:[UIColor clearColor]];
    [demoView addSubview:HomeView];
    
    HomeDataArray = [[NSMutableArray alloc]init];
    
    MainQueue = [[NSOperationQueue alloc]init];
    [MainQueue addOperationWithBlock:^{
        
        NSError *error = nil;
        
        NSData *HomeData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@room_newlist.php?adminid=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]]]options:NSDataReadingUncached error:&error];
        

        
        HomeDataArray = [NSJSONSerialization JSONObjectWithData:HomeData options:kNilOptions error:&error];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
  
            
            float th = 0;
            
            th = ceil((float)HomeDataArray.count / 4)*180;
            
            if (th>500.0f) {
                th = 500.0f;
            }
            [self removePulseLoader];
            
            HomeTable = [[UITableView alloc]initWithFrame:CGRectMake(150.0f, 10.0f, 1024-300, th) style:UITableViewStylePlain];
            [HomeTable setDelegate:self];
            [HomeTable setDataSource:self];
            [HomeTable setShowsHorizontalScrollIndicator:NO];
            [HomeTable setShowsVerticalScrollIndicator:NO];
            [HomeTable setIndicatorStyle:UIScrollViewIndicatorStyleDefault];
            [HomeTable setBackgroundColor:[UIColor clearColor]];
            [HomeTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            [HomeView addSubview:HomeTable];
            
        }];
        
    }];
    //[NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(updateNewDate) userInfo:nil repeats:YES];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
            [Registration setTitle:[NSString RegistrationF] forState:UIControlStateNormal];
            [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
    }
    else
    {
        [Registration setTitle:[NSString RegistrationD] forState:UIControlStateNormal];
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
    }
    
}
-(void)refres{

    [demoView removeFromSuperview];
    
  spinner = [[UIActivityIndicatorView alloc]
               initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(500, 380);
    spinner.hidesWhenStopped = YES;
    [mainView addSubview:spinner];
    [spinner startAnimating];
    
    LoadngLbl = [[UILabel alloc] initWithFrame:CGRectMake(450, 410, 150, 30)];
    LoadngLbl.text = @"Loading...";
    LoadngLbl.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:25];
    LoadngLbl.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    [mainView addSubview:LoadngLbl];
    
    
    [self performSelector:@selector(loadpage) withObject:nil afterDelay:2];
    

}
-(void)loadpage{

    [spinner stopAnimating];
    demoView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024,1536/2)];
    demoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [mainView addSubview:demoView];
    
    UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, 1024,45)];
    Title.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"site_name"]];
    Title.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    Title.textAlignment = NSTextAlignmentCenter;
    Title.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:35];
    [demoView addSubview:Title];
    
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake(160, 50, 120.0f, 49/2)];
    [logout setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [logout setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [logout.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [logout setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateHighlighted];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateSelected];
    [logout setTitle:@"Útrita" forState:UIControlStateNormal];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:logout];
    
    UIButton *Refrsh = [UIButton buttonWithType:UIButtonTypeCustom];
    [Refrsh setFrame:CGRectMake(770, 50, 120.0f, 49/2)];
    [Refrsh setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [Refrsh setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
    [Refrsh.titleLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_Light size:15]];
    [Refrsh setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1]forState:UIControlStateNormal];
    [Refrsh setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateHighlighted];
    [Refrsh setTitleColor:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forState:UIControlStateSelected];
    [Refrsh setImage:[UIImage imageNamed:@"RefreshREd"] forState:UIControlStateNormal];
    [Refrsh setImage:[UIImage imageNamed:@"RefreshREd"] forState:UIControlStateHighlighted];
    [Refrsh setImage:[UIImage imageNamed:@"RefreshREd"] forState:UIControlStateSelected];
    [Refrsh setTitle:@"Dagfør" forState:UIControlStateNormal];
    [Refrsh addTarget:self action:@selector(refres) forControlEvents:UIControlEventTouchUpInside];
    [demoView addSubview:Refrsh];
    
    
    [HomeTable removeFromSuperview];
    
    UIView *HomeView = [[UIView alloc]initWithFrame:CGRectMake(0, 245, 1024, 500)];
    [HomeView setBackgroundColor:[UIColor clearColor]];
    [demoView addSubview:HomeView];
    
    //HomeDataArray = [[NSMutableArray alloc]init];
    
    MainQueue = [[NSOperationQueue alloc]init];
    [MainQueue addOperationWithBlock:^{
        
        NSError *error = nil;
        
        NSData *HomeData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@room_newlist.php?adminid=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]]]options:NSDataReadingUncached error:&error];
        
        NSLog(@"=========string-----------> %@", [NSString stringWithFormat:@"%@room_newlist.php?adminid=%@",APPS_DOMAIN_URL,[[NSUserDefaults standardUserDefaults]objectForKey:@"id"]]);
        
        HomeDataArray = [NSJSONSerialization JSONObjectWithData:HomeData options:kNilOptions error:&error];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            NSLog(@"============array--------> %@", HomeDataArray);
            float th = 0;
            th = ceil((float)HomeDataArray.count / 4)*180;
            
            if (th>500.0f) {
                th = 500.0f;
            }
            
            HomeTable = [[UITableView alloc]initWithFrame:CGRectMake(150.0f, 10.0f, 1024-300, th) style:UITableViewStylePlain];
            [HomeTable setDelegate:self];
            [HomeTable setDataSource:self];
            [HomeTable setBackgroundColor:[UIColor clearColor]];
            HomeTable.separatorColor = [UIColor clearColor];
            [HomeTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            [HomeView addSubview:HomeTable];
            
        }];
        
    }];

}

-(void)updateNewDate{

    NSLog(@"updateNewDate");
    
   [self viewDidLoad];
    
}
-(void)backOut{
    
    [self.navigationController popViewControllerAnimated:YES];
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
-(void)gonxt:(UIGestureRecognizer *)sender
{
    
    NSLog(@"%ld",(long)sender.view.tag);
    
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    ViewModel.pageId = [NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:sender.view.tag]objectForKey:@"id"]];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:sender.view.tag]objectForKey:@"id"]] forKey:@"pageid"];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:sender.view.tag]objectForKey:@"subAdminId"]] forKey:@"subadminid"];
    [ViewModel setWorkTitle:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:sender.view.tag]objectForKey:@"title"]]];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:sender.view.tag]objectForKey:@"title"]] forKey:@"title"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
   [self.navigationController pushViewController:ViewModel animated:NO];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return 180.0f;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return ceil((float)HomeDataArray.count / 4);
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSUInteger firstPhotoInCell = indexPath.row * 4;
    
    NSUInteger lastPhotoInCell  = firstPhotoInCell + 4;
    
    if (HomeDataArray.count <= firstPhotoInCell) {
        
        return nil;
        
    }
    
    NSUInteger currentPhotoIndex = 0;
    x = 0;
    y = 0;
  
    
    NSUInteger lastPhotoIndex = MIN(lastPhotoInCell, HomeDataArray.count);
    
    for ( ; firstPhotoInCell + currentPhotoIndex < lastPhotoIndex ; currentPhotoIndex++) {
        
        float padLeft = (12 * (currentPhotoIndex + 1)) + (currentPhotoIndex * 168);
        
        if (lastPhotoIndex - firstPhotoInCell == 1)
        {
            UIImageView *BorderImage = [[UIImageView alloc]initWithFrame:CGRectMake(275, 7.5f, 165, 165)];
            [BorderImage setBackgroundColor:[UIColor clearColor]];
            BorderImage.layer.borderWidth = 4.0f;
            BorderImage.layer.borderColor = [[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"BorderColorCode"]]CGColor];
            BorderImage.tag = firstPhotoInCell+currentPhotoIndex;
            BorderImage.layer.cornerRadius = 165/2;
            BorderImage.clipsToBounds = YES;
            [cell addSubview:BorderImage];
            
            UIImageView *MainImage = [[UIImageView alloc]initWithFrame:CGRectMake(13, 13.0f, 139, 139)];
            [MainImage setBackgroundColor:[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"colorCode"]]];
            MainImage.layer.cornerRadius = 145/2;
            MainImage.clipsToBounds = YES;
            [BorderImage addSubview:MainImage];
            
            UILabel *MainImageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, 20.0f, 119.0f, 99.0f)];
            [MainImageLabel setBackgroundColor:[UIColor clearColor]];
            [MainImageLabel setText:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"title"]]];
            [MainImageLabel setTextAlignment:NSTextAlignmentCenter];
            [MainImageLabel setTextColor:[UIColor whiteColor]];
            [MainImageLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_BOLD size:18]];
            [MainImage addSubview:MainImageLabel];
            
            
            UITapGestureRecognizer *ImageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gonxt:)];
            [BorderImage addGestureRecognizer:ImageTap];
            [BorderImage setUserInteractionEnabled:YES];
        }
        else if (lastPhotoIndex - firstPhotoInCell == 2)
            
        {
           
            
            UIImageView *BorderImage = [[UIImageView alloc]initWithFrame:CGRectMake(x+145, 7.5f, 165, 165)];
            [BorderImage setBackgroundColor:[UIColor clearColor]];
            BorderImage.layer.borderWidth = 4.0f;
            BorderImage.layer.borderColor = [[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"BorderColorCode"]]CGColor];
            BorderImage.tag = firstPhotoInCell+currentPhotoIndex;
            BorderImage.layer.cornerRadius = 165/2;
            BorderImage.clipsToBounds = YES;
            [cell addSubview:BorderImage];
            
            UIImageView *MainImage = [[UIImageView alloc]initWithFrame:CGRectMake(13, 13.0f, 139, 139)];
            [MainImage setBackgroundColor:[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"colorCode"]]];
            MainImage.layer.cornerRadius = 145/2;
            MainImage.clipsToBounds = YES;
            [BorderImage addSubview:MainImage];
            
            UILabel *MainImageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, 20.0f, 119.0f, 99.0f)];
            [MainImageLabel setBackgroundColor:[UIColor clearColor]];
            [MainImageLabel setText:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"title"]]];
            [MainImageLabel setTextAlignment:NSTextAlignmentCenter];
            [MainImageLabel setTextColor:[UIColor whiteColor]];
            [MainImageLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_BOLD size:18]];
            [MainImage addSubview:MainImageLabel];
            
            
            UITapGestureRecognizer *ImageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gonxt:)];
            [BorderImage addGestureRecognizer:ImageTap];
            [BorderImage setUserInteractionEnabled:YES];
            
            x = x+275;
        }
        else if (lastPhotoIndex - firstPhotoInCell == 3)
        {
            UIImageView *BorderImage = [[UIImageView alloc]initWithFrame:CGRectMake(y+80, 7.5f, 165, 165)];
            [BorderImage setBackgroundColor:[UIColor clearColor]];
            BorderImage.layer.borderWidth = 4.0f;
            BorderImage.layer.borderColor = [[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"BorderColorCode"]]CGColor];
            BorderImage.tag = firstPhotoInCell+currentPhotoIndex;
            BorderImage.layer.cornerRadius = 165/2;
            BorderImage.clipsToBounds = YES;
            [cell addSubview:BorderImage];
            
            UIImageView *MainImage = [[UIImageView alloc]initWithFrame:CGRectMake(13, 13.0f, 139, 139)];
            [MainImage setBackgroundColor:[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"colorCode"]]];
            MainImage.layer.cornerRadius = 145/2;
            MainImage.clipsToBounds = YES;
            [BorderImage addSubview:MainImage];
            
            UILabel *MainImageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, 20.0f, 119.0f, 99.0f)];
            [MainImageLabel setBackgroundColor:[UIColor clearColor]];
            [MainImageLabel setText:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"title"]]];
            [MainImageLabel setTextAlignment:NSTextAlignmentCenter];
            [MainImageLabel setTextColor:[UIColor whiteColor]];
            [MainImageLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_BOLD size:18]];
            [MainImage addSubview:MainImageLabel];
            
            
            UITapGestureRecognizer *ImageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gonxt:)];
            [BorderImage addGestureRecognizer:ImageTap];
            [BorderImage setUserInteractionEnabled:YES];
            
            y = y+200;
        }
        else
        {
    
        UIImageView *BorderImage = [[UIImageView alloc]initWithFrame:CGRectMake(padLeft, 7.5f, 165, 165)];
        [BorderImage setBackgroundColor:[UIColor clearColor]];
        BorderImage.layer.borderWidth = 4.0f;
        BorderImage.layer.borderColor = [[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"BorderColorCode"]]CGColor];
        BorderImage.tag = firstPhotoInCell+currentPhotoIndex;
        BorderImage.layer.cornerRadius = 165/2;
        BorderImage.clipsToBounds = YES;
        [cell addSubview:BorderImage];
        
        
        UIImageView *MainImage = [[UIImageView alloc]initWithFrame:CGRectMake(13, 13.0f, 139, 139)];
        [MainImage setBackgroundColor:[self colorFromHexString:[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"colorCode"]]];
        MainImage.layer.cornerRadius = 145/2;
        MainImage.clipsToBounds = YES;
        [BorderImage addSubview:MainImage];
        
        
        UILabel *MainImageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, 20.0f, 119.0f, 99.0f)];
        [MainImageLabel setBackgroundColor:[UIColor clearColor]];
        [MainImageLabel setText:[NSString stringWithFormat:@"%@",[[HomeDataArray objectAtIndex:firstPhotoInCell+currentPhotoIndex]objectForKey:@"title"]]];
        [MainImageLabel setTextAlignment:NSTextAlignmentCenter];
        [MainImageLabel setTextColor:[UIColor whiteColor]];
        [MainImageLabel setFont:[UIFont fontWithName:GLOBALTEXTFONT_BOLD size:18]];
        [MainImage addSubview:MainImageLabel];
        
        
        UITapGestureRecognizer *ImageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gonxt:)];
        [BorderImage addGestureRecognizer:ImageTap];
        [BorderImage setUserInteractionEnabled:YES];
        
}
            }
    return cell;
    
}

- (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
-(void)Registration
{
    MainQueue  = nil;
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
    [spinnview setFrame:CGRectMake(105, 100, 750, 650)];
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
