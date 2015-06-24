//
//  MAAlbumDetailsViewController.m
//  Mobil
//
//  Created by Soumarsi Kundu on 24/03/15.
//  Copyright (c) 2015 vega. All rights reserved.
//

#import "MAAlbumDetailsViewController.h"
#import "MAHomeViewController.h"
#import "MASecondHomeViewController.h"
#import "MALoginViewController.h"
#import "MARegistrationViewController.h"
#import "UzysGridViewCustomCell.h"
#import "UIImageView+WebCache.h"
#import "MAAlbumViewController.h"
#import "Model.h"


@interface MAAlbumDetailsViewController ()<UIScrollViewDelegate>
{
    UIView *mainView,*leftview;
    UIButton *leftmenuBt;
    UIView *ImageBackView;
    UIImageView *CrossImage;
    UIButton *Crossbutton;
    NSOperationQueue *downloadQueue;
    UIScrollView *scrollForZoomImage;
    Mymodel *obj1;
    NSMutableArray *Imagedetailsarray;
}

@end
 @implementation MAAlbumDetailsViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled=NO;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(navtopage:) name:@"pagenav" object:nil];
}
-(void)navtopage: (NSNotification *)notification
{
    UIButton *AddAlbumButton = [[UIButton alloc]initWithFrame:CGRectMake(630.0f, 100.0f, 115.0f, 30)];
    [AddAlbumButton setBackgroundColor:[UIColor colorWithRed:(101.0f/255.0f) green:(210.0f/255.0f) blue:(252.0f/255.0f) alpha:1.0f]];
    [AddAlbumButton setTitle:@"Ok" forState:UIControlStateNormal];
    [AddAlbumButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AddAlbumButton.titleLabel.font = [UIFont fontWithName:GLOBALTEXTFONT size:17];
    AddAlbumButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddAlbumButton addTarget:self action:@selector(Done:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:AddAlbumButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     obj1 = [Mymodel getInstance];
    
    
    Imagedetailsarray = [[NSMutableArray alloc]init];
    
    Imagedetailsarray = [obj1.ImageArray mutableCopy];
    
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
//    [leftview addSubview:registration];

    UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 300, 44)];
    pageTitle.backgroundColor = [UIColor clearColor];
    pageTitle.textColor = [UIColor whiteColor];
    pageTitle.font = [UIFont fontWithName:GLOBALTEXTFONT size:40];
    pageTitle.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:pageTitle];
    
    UITapGestureRecognizer *albumtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(albumtap:)];
    [pageTitle addGestureRecognizer:albumtap];
    pageTitle.userInteractionEnabled = YES;
    
    
    UILabel *AlbumName = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 798, 44)];
    AlbumName.backgroundColor = [UIColor clearColor];
    AlbumName.textColor = [UIColor whiteColor];
    AlbumName.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"Albumname"]];
    AlbumName.font = [UIFont fontWithName:GLOBALTEXTFONT_Light size:25];
    AlbumName.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:AlbumName];
    
    ImageBackView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [ImageBackView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:ImageBackView];
    [ImageBackView setHidden:YES];
    
    CrossImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-150, 100.0f, 45.0f , 45.0f)];
    [CrossImage setImage:[UIImage imageNamed:@"cross"]];
    [self.view addSubview:CrossImage];
    [CrossImage setHidden:YES];
    
    
    Crossbutton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-140, 90, 65, 65)];
    [Crossbutton setBackgroundColor:[UIColor clearColor]];
    [Crossbutton addTarget:self action:@selector(ImageCross) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Crossbutton];
    [Crossbutton setHidden:YES];
    
    scrollForZoomImage = [[UIScrollView alloc]initWithFrame:CGRectMake(0,180, self.view.frame.size.width, self.view.frame.size.height-200)];
    scrollForZoomImage.scrollEnabled = YES;
    scrollForZoomImage.delegate = self;
    scrollForZoomImage.backgroundColor=[UIColor blackColor];
    [ImageBackView addSubview:scrollForZoomImage];
    
    _gridView = [[UzysGridView alloc] initWithFrame:CGRectMake(30, 190, 798-60, 1536/2-190) numOfRow:3 numOfColumns:3 cellMargin:2];
    _gridView.delegate = self;
    _gridView.dataSource = self;
    [mainView addSubview:_gridView];
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        [logout setTitle:[NSString LogoutF] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -15, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavF] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeF] forState:UIControlStateNormal];
            pageTitle.text = [NSString GalleryF];
    }
    else
    {
        [logout setTitle:[NSString LogoutD] forState:UIControlStateNormal];
        [leftmenuBt setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        [leftmenuBt setTitleEdgeInsets:UIEdgeInsetsMake(1.0f, -35, 0, 0)];
        [leftmenuBt setTitle:[NSString RoomNavD] forState:UIControlStateNormal];
        [heim setTitle:[NSString HomeD] forState:UIControlStateNormal];
        pageTitle.text = [NSString GalleryD];
    }

    //[self ButtonTapp];
    
    // Do any additional setup after loading the view.
}
- (IBAction) ButtonTapp {
    static BOOL toggle = NO;
    
    if(toggle == YES)
    {
        toggle = NO;
    }
    else
    {
        toggle = YES;
    }
    _gridView.editable = toggle;
    [_gridView reloadData];
}

-(void)backOut2{
    
    MAHomeViewController *ViewModel = [[MAHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
}

-(void)backOut{
    
    MASecondHomeViewController *ViewModel = [[MASecondHomeViewController alloc] init];
    [self.navigationController pushViewController:ViewModel animated:NO];
    
}
-(void)logout{
    
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
-(void)Registration
{
    MARegistrationViewController *Registration = [[MARegistrationViewController alloc]init];
    [self.navigationController pushViewController:Registration animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
#pragma mark- UzysGridViewDataSource

-(NSInteger) numberOfCellsInGridView:(UzysGridView *)gridview {
    return [obj1.ImageArray count];
}
-(UzysGridViewCell *)gridView:(UzysGridView *)gridview cellAtIndex:(NSUInteger)index
{
    UzysGridViewCustomCell *cell = [[UzysGridViewCustomCell alloc] initWithFrame:CGRectNull] ;
    
    
    NSLog(@"height.. %f--------- %f",cell.image.frame.size.height,cell.image.frame.size.width);

    [cell.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@image_crop_thumb.php?img_path=http://ansa.fo/upload/albums/normal/%@&width=238&height=188",APPS_DOMAIN_URL,[[obj1.ImageArray objectAtIndex:index] objectForKey:@"image"]]]placeholderImage:[UIImage imageNamed:@"demoimage"] options:0 == 0 ? SDWebImageRefreshCached : 0];
    

    //    if(index ==0)
    //        cell.deletable = NO;
    return cell;
}

- (void)gridView:(UzysGridView *)gridview moveAtIndex:(NSUInteger)fromindex toIndex:(NSUInteger)toIndex
{
    
    NSObject *object = [Imagedetailsarray objectAtIndex:fromindex];
    [Imagedetailsarray removeObject:object];
    [Imagedetailsarray insertObject:object atIndex:toIndex];
    
    obj1.ImageArray = [Imagedetailsarray mutableCopy];
    

    
}
-(void) gridView:(UzysGridView *)gridview deleteAtIndex:(NSUInteger)index
{
    
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"lang"] isEqualToString:@"fo"])
    {
        DeleteAlert = [[UIAlertView alloc]initWithTitle:[NSString DeleteConfirmationF] message:@"" delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nei", nil];
        DeleteAlert.tag = index;
        [DeleteAlert show];
    }
    else
    {
        DeleteAlert = [[UIAlertView alloc]initWithTitle:[NSString DeleteConfirmationD] message:@"" delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nej", nil];
        DeleteAlert.tag = index;
        [DeleteAlert show];
    }

    //[obj1.ImageArray removeObjectAtIndex:index];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == 0)//OK button pressed
    {
        downloadQueue = [[NSOperationQueue alloc]init];
        [downloadQueue addOperationWithBlock:^{
            
            NSError *error;
            
            NSData *DeleteData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@delete_image.php?image_id=%@&album_id=%@",APPS_DOMAIN_URL,[NSString stringWithFormat:@"%@",[[obj1.ImageArray objectAtIndex:alertView.tag]objectForKey:@"id"]],[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"Albumid"]]]]options:NSDataReadingUncached error:&error];
            
            NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:DeleteData  options:kNilOptions error:&error];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            }];
            
            if ([[NSString stringWithFormat:@"%@",[result objectForKey:@"auth"]] isEqualToString:@"success"])
            {
                obj1 = [Mymodel getInstance];
                
                obj1.ImageArray = [result objectForKey:@"img_list"];
                if (obj1.ImageArray.count == 0)
                {
                    MAAlbumViewController *view  = [[MAAlbumViewController alloc]init];
                    [self.navigationController pushViewController:view animated:NO];
                }
                
            }
            
        }];
    }
    else if(buttonIndex == 1)//Annul button pressed.
    {
        //do something
    }
}
#pragma mark- UzysGridViewDelegate
-(void) gridView:(UzysGridView *)gridView changedPageIndex:(NSUInteger)index
{
    NSLog(@"Page : %lu",(unsigned long)index);
}
-(void) gridView:(UzysGridView *)gridView didSelectCell:(UzysGridViewCell *)cell atIndex:(NSUInteger)index
{
    NSLog(@"Cell index %lu",(unsigned long)index);
    
        [ImageBackView setHidden:NO];
    
    ImageBackView.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        [CrossImage setHidden:NO];
        [Crossbutton setHidden:NO];
        ImageBackView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
        int z = 1024;
        
        for (int k =1; k<= obj1.ImageArray.count; k++)
        {
            UIView *ImageBackView1 = [[UIView alloc]initWithFrame:CGRectMake((k-1)*1024+110, 10, 800, 450)];
            [ImageBackView1 setBackgroundColor:[UIColor whiteColor]];
            ImageBackView1.layer.cornerRadius = 5.0f;
            [scrollForZoomImage addSubview:ImageBackView1];
            
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(7,7,786,436)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@image_crop_thumb.php?img_path=http://ansa.fo/upload/albums/normal/%@&width=786&height=436",APPS_DOMAIN_URL,[[obj1.ImageArray objectAtIndex:k-1]objectForKey:@"image"]]] placeholderImage:[UIImage imageNamed:@"placeholder_image"] options: 0== 0 ? SDWebImageRefreshCached : 0];
            imageView.clipsToBounds = YES;
            //imageView.contentMode = UIViewContentModeScaleAspectFit;
            [ImageBackView1 addSubview:imageView];
            
            scrollForZoomImage.pagingEnabled = YES;
            
            [scrollForZoomImage setContentOffset:CGPointMake((index)*z, 0) animated:NO];
        }
        int m   = (int) obj1.ImageArray.count;
        scrollForZoomImage.contentSize = CGSizeMake(m*1024, scrollForZoomImage.frame.size.height);
        
    }];
    


    
    
    
}
-(void) gridView:(UzysGridView *)gridView TouchUpOoutside:(UzysGridViewCell *)cell
{
    
    static BOOL toggle = NO;
    
    if(toggle == YES)
    {
        toggle = NO;
    }
    else
    {
        toggle = YES;
    }
    _gridView.editable = NO;
    [_gridView reloadData];
}
-(void) gridView:(UzysGridView *)gridView TouchCanceled:(UzysGridViewCell *)cell
{

    _gridView.editable = NO;
    [_gridView reloadData];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    _gridView.editable = NO;
    [_gridView reloadData];
}
 -(void)ImageCross
{
    
    ImageBackView.alpha = 1.0f;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        ImageBackView.alpha = 0.0f;
    } completion:^(BOOL finished) {
       
        [ImageBackView setHidden:YES];
        [CrossImage setHidden:YES];
        [Crossbutton setHidden:YES];
    }];
}
-(void)albumtap:(UITapGestureRecognizer *)sender
{
    MAAlbumViewController *view = [[MAAlbumViewController alloc]init];
    [self.navigationController pushViewController:view animated:NO];
}

-(void)Done:(UIButton *)sender
{
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:obj1.ImageArray options:0 error:nil];
    
    NSString* jsonString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    
    NSData *swipedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@album_images.php?photolist=%@",APPS_DOMAIN_URL,[jsonString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]options:NSDataReadingUncached error:&error];
    
    
    
    NSString *swipestring = [[NSString alloc]initWithData:swipedata encoding:NSUTF8StringEncoding];
    
    if ([swipestring isEqualToString:@"success"])
    {
        MAAlbumDetailsViewController *view = [[MAAlbumDetailsViewController alloc]init];
        [self.navigationController pushViewController:view animated:NO];
    }
    
    

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
