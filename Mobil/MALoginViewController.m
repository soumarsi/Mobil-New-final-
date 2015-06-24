//
//  MALoginViewController.m
//  Dr.Margrethu
//
//  Created by Anirban Tah on 19/03/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import "MALoginViewController.h"
#import "SVProgressHUD.h"
#import "MAHomeViewController.h"

@interface MALoginViewController ()
{
    NSMutableArray *arrFonts;
}

@end

@implementation MALoginViewController

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
    
    //[self getAllFonts];
    
     prefs = [NSUserDefaults standardUserDefaults];
    NSLog(@"...===%f",self.view.frame.size.height);
    mainView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024,1536/2)];
    mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
      [self.view addSubview:mainView];
    
    boxView =[[UIView alloc]initWithFrame:CGRectMake(200, 80, 1255/2,1173/2)];
    boxView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgbox"]];
    [mainView addSubview:boxView];
    
    
    UILabel *Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 1255/2,40)];
    Title.text = @"Ansa";
    [Title setBackgroundColor:[UIColor clearColor]];
    Title.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    Title.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    [Title setTextAlignment:NSTextAlignmentCenter];
    [boxView addSubview:Title];
    
    
    UILabel *lowrLbl = [[UILabel alloc] initWithFrame:CGRectMake(170, 135, 1255/2-340,38)];
    lowrLbl.text = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ";
    lowrLbl.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    lowrLbl.textAlignment = NSTextAlignmentCenter;
    lowrLbl.numberOfLines = 3;
    lowrLbl.lineBreakMode = NSLineBreakByWordWrapping;
    lowrLbl.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:12];
   // [boxView addSubview:lowrLbl];
    

    UIView *lftVwe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 38)];
    lftVwe.backgroundColor = [UIColor clearColor];
    
    
    UIView *UsBackView = [[UIView alloc] initWithFrame:CGRectMake(135, 190,726/2, 85/2)];
    UsBackView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"usernameFld"]];
    [boxView addSubview:UsBackView];
    
    UserName = [[UITextField alloc] initWithFrame:CGRectMake(135, 190, 726/2, 85/2)];
    UserName.backgroundColor = [UIColor clearColor];
    UserName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    UserName.font = [UIFont systemFontOfSize:18.0f];
    UserName.placeholder = @"Email";
    //UserName.text=@"aljo@olivant.fo";
    UserName.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    [UserName setValue:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [UserName setValue:[UIFont systemFontOfSize:18]  forKeyPath:@"_placeholderLabel.font"];

    [UserName setDelegate:self];
    UserName.leftView = lftVwe;
    UserName.leftViewMode = UITextFieldViewModeAlways;
    [boxView addSubview:UserName];
    [UserName becomeFirstResponder];

    
    UIView *lftVwe3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 32.5f)];
    lftVwe3.backgroundColor = [UIColor clearColor];
    
    UIView *psBackView = [[UIView alloc] initWithFrame:CGRectMake(135, 250, 726/2, 85/2)];
    psBackView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"passwordfld"]];
    [boxView addSubview:psBackView];
    
    Password = [[UITextField alloc] initWithFrame:CGRectMake(135, 250, 726/2, 85/2)];
    Password.backgroundColor = [UIColor clearColor];
    Password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    Password.font = [UIFont systemFontOfSize:18.0f];
    Password.placeholder = @"Password";
   // Password.text=@"123456";
    Password.textColor = [UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1];
    [Password setValue:[UIColor colorWithRed:(94.0f/255.0f) green:(94.0f/255.0f) blue:(94.0f/255.0f) alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [Password setValue:[UIFont systemFontOfSize:18] forKeyPath:@"_placeholderLabel.font"];
    [Password setSecureTextEntry:YES];
    [Password setDelegate:self];
    Password.leftView = lftVwe3;
    Password.leftViewMode = UITextFieldViewModeAlways;
    [boxView addSubview:Password];

    UIButton *Login = [UIButton buttonWithType:UIButtonTypeCustom];
    Login.frame = CGRectMake(135, 320, 726/2, 85/2);
    Login.backgroundColor = [UIColor colorWithRed:(235.0f/255.0f) green:(62.0f/255.0f) blue:(35.0f/255.0f) alpha:0.6f];
    [Login setTitle:@"Login" forState:UIControlStateNormal];
    [Login setTitle:@"Login" forState:UIControlStateSelected];
    [Login setTitle:@"Login" forState:UIControlStateHighlighted];
    [Login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Login setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [Login setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    Login.titleLabel.font = [UIFont systemFontOfSize:24];
    [Login addTarget:self action:@selector(LoginApp:) forControlEvents:UIControlEventTouchUpInside];
    [boxView addSubview:Login];

    
    
//    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(298+15,270+110 ,17,17)];
//    checkbox.backgroundColor=[UIColor clearColor];
//    
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"checkbox_2.png"]
//                        forState:UIControlStateNormal];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"checkbox_1.png"]
//                        forState:UIControlStateSelected];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"checkbox_1.png"]
//                        forState:UIControlStateHighlighted];
//    checkbox.adjustsImageWhenHighlighted=YES;
//    [checkbox addTarget:self action:@selector(bto_action:) forControlEvents:UIControlEventTouchUpInside];
//    [mainView addSubview:checkbox];
//
//    
//    
//    UIView *postlayer = [[UIView alloc] initWithFrame:CGRectMake(260, 255+110, 200, 45)];
//    postlayer.backgroundColor = [UIColor clearColor];
//    [mainView addSubview:postlayer];
//    
//    UITapGestureRecognizer *postTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bto_action:)];
//    [postTap setDelegate:self];
//    [postTap setNumberOfTapsRequired:1];
//    [postTap setNumberOfTouchesRequired:1];
//    [postlayer addGestureRecognizer:postTap];
//    
//    UILabel *rem = [[UILabel alloc] initWithFrame:CGRectMake(290+15, 270+110, 200, 17)];
//    rem.text = @"Remember Me";
//    rem.textColor = [[UIColor colorWithRed:(140.0f/255.0f) green:(139.0f/255.0f) blue:(135.0f/255.0f) alpha:1.0f]colorWithAlphaComponent:0.9f];
//    rem.font = [UIFont boldSystemFontOfSize:18];
//    rem.backgroundColor = [UIColor clearColor];
//    rem.textAlignment = NSTextAlignmentCenter;
//    [mainView addSubview:rem];


    
}
-(void)getAllFonts
{
    for(id familyName in [UIFont familyNames]){
        NSLog(@"FontFamily = %@",familyName);
        for(id fontNameL in [UIFont fontNamesForFamilyName:familyName]){
            [arrFonts addObject:fontNameL];
            NSLog(@"Fonts at family %@ %@",fontNameL, familyName);
  
        }
    }  
}
- (void)bto_action:(UIButton *)sender{
    //    checkBoxSelected = !checkBoxSelected;
    if([checkbox isSelected]) {
        [checkbox setSelected:NO];
        checkBoxSelected = NO;
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"rembr"];
        prefs = [NSUserDefaults standardUserDefaults];
        
       
        
        
    } else {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"rembr"];
        prefs = [NSUserDefaults standardUserDefaults];
       
       
        
        
        [checkbox setSelected:YES];
        checkBoxSelected = YES;
    }
    
}
-(void)LoginApp:(UIButton *)sender{

    UIButton *Targ= (UIButton *)sender;
    Targ.selected = YES;

    [UserName resignFirstResponder];
    
    [Password resignFirstResponder];
    
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    
    
    
    
    if([UserName.text length]<=0||[Password.text length]<=0||[Password.text rangeOfCharacterFromSet:whitespace].location != NSNotFound||[UserName.text rangeOfCharacterFromSet:whitespace].location !=NSNotFound)
        
    {
        
        if([UserName.text length]<=0)
            
        {
            
            [self dismissError:@"Please enter your valid email"];
            
            return;
            
        }
        
        if([Password.text length]<=0)
            
        {
            
            [self dismissError:@"Please enter your valid password"];
            
            return;
            
            
            
        }
        
        if([Password.text rangeOfCharacterFromSet:whitespace].location != NSNotFound)
            
        {
            
            [self dismissError:@"Please enter your valid password"];
            
            return;
            
        }
        
        if([UserName.text rangeOfCharacterFromSet:whitespace].location !=NSNotFound)
            
        {
            
            [self dismissError:@"Please enter your valid email"];
            
            return;
            
        }
        
    }else{
    
        
        NSError *error=nil;
        
 
        prefs = [NSUserDefaults standardUserDefaults];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        NSString *urlString1 = [NSString stringWithFormat:@"%@login.php?email=%@&password=%@",APPS_DOMAIN_URL,UserName.text,Password.text];
        
        NSLog(@"url...%@",urlString1);
        
        NSURL *requestURL1 = [NSURL URLWithString:urlString1];
        NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
        NSMutableDictionary *result1 = [NSJSONSerialization JSONObjectWithData:signeddataURL1  options:kNilOptions error:&error];

        
        NSLog(@"====%@",result1);
        
        
        if([[NSString stringWithFormat:@"%@",[result1 objectForKey:@"auth"]] isEqualToString:@"failed"] ){
        
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Login failed !" message:@"Please check email & password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alrt show];
            
        }else{
            
            
           
            prefs= [NSUserDefaults standardUserDefaults];
            
             [[NSUserDefaults standardUserDefaults] synchronize];
            
            [prefs setObject:[[result1 objectForKey:@"details"] objectForKey:@"subAdminId"] forKey:@"id"];
            [prefs setObject:[[result1 objectForKey:@"details"] objectForKey:@"id"] forKey:@"userid"];
            
//            if([NSString stringWithFormat:@"%@",[[result1  objectForKey:@"details"] objectForKey:@"name"]].length > 0){
//                [prefs setObject:[[result1  objectForKey:@"details"] objectForKey:@"name"] forKey:@"name"];
//            }
            
            [prefs setObject:[[result1  objectForKey:@"details"] objectForKey:@"date_of_birth"] forKey:@"date_of_birth"];
            [prefs setObject:[[result1  objectForKey:@"details"] objectForKey:@"email"] forKey:@"email"];
            
            if([NSString stringWithFormat:@"%@",[[result1  objectForKey:@"details"] objectForKey:@"phone"]].length > 0){
                
                [prefs setObject:[[result1  objectForKey:@"details"] objectForKey:@"phone"] forKey:@"phone"];
            }
            
            if([NSString stringWithFormat:@"%@",[[result1  objectForKey:@"details"] objectForKey:@"address"]].length > 0){
                [prefs setObject:[[result1  objectForKey:@"details"] objectForKey:@"address"] forKey:@"address"];
            }
            if([NSString stringWithFormat:@"%@",[[result1  objectForKey:@"details"] objectForKey:@"subAdminId"]].length > 0){
                [prefs setObject:[[result1  objectForKey:@"details"] objectForKey:@"subAdminId"] forKey:@"adminid"];
            }
            
            
//            if ([NSString stringWithFormat:@"%@",[result1 objectForKey:@"admin_type"]].length > 0) {
//                [prefs setObject:[result1 objectForKey:@"admin_type"] forKey:@"admin_type"];
//            }
//            if ([NSString stringWithFormat:@"%@",[result1 objectForKey:@"username"]].length > 0) {
//                [prefs setObject:[result1 objectForKey:@"username"] forKey:@"username"];
//            }
            if ([NSString stringWithFormat:@"%@",[result1 objectForKey:@"site_name"] ].length > 0) {
                [prefs setObject:[result1 objectForKey:@"site_name"] forKey:@"sitename"];
            }
            if ([NSString stringWithFormat:@"%@",[result1 objectForKey:@"site_url"] ].length > 0) {
                [prefs setObject:[result1 objectForKey:@"site_url"] forKey:@"siteurl"];
            }
            
            if ([NSString stringWithFormat:@"%@",[result1 objectForKey:@"site_language"] ].length > 0) {
                [prefs setObject:[result1 objectForKey:@"site_language"] forKey:@"lang"];
            }
//            if ([NSString stringWithFormat:@"%@",[result1 objectForKey:@"site_url"]].length > 0) {
//                [prefs setObject:[result1 objectForKey:@"site_url"] forKey:@"site_url"];
//            }
        
            
            [prefs setBool:checkBoxSelected forKey:@"rem"];
            [prefs setObject:Password.text forKey:@"paswd"];
            
            [[NSUserDefaults standardUserDefaults]setObject:@"login" forKey:@"rememberlogin"];
            
            
         [[NSUserDefaults standardUserDefaults] synchronize];
            
            NSLog(@"====&&&******%@",[prefs objectForKey:@"id"]);
            
            MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
            [self.navigationController pushViewController:ViewModel animated:NO];
            
        }
        
    
    }

    
    
}
- (void)dismissError:(NSString *)msg {
    

	[SVProgressHUD showErrorWithStatus:msg];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
