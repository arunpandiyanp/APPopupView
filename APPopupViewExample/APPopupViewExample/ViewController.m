//
//  ViewController.m
//  APPopupViewExample
//
//  Created by Arun Pandiyan P on 03/06/17.
//  Copyright © 2017 Arun Pandiyan P. All rights reserved.
//

#import "ViewController.h"
#import "APPopupView.h"

#define SCREEN_WIDTH                    [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT                   [UIScreen mainScreen].bounds.size.height

//DEVICE TYPE

#define IS_IPHONE_DEVICE                (([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) ? NO : YES)

#define IS_IPHONE4                      (([[UIScreen mainScreen] bounds].size.height-480) ? NO : YES)
#define IS_IPHONE5                      (([[UIScreen mainScreen] bounds].size.height-568) ? NO : YES)
#define IS_IPHONE6                      (([[UIScreen mainScreen] bounds].size.height-667) ? NO : YES)
#define IS_IPHONE6_Plus                 (([[UIScreen mainScreen] bounds].size.height-736) ? NO : YES)

#define IS_IPAD                         (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)




@interface ViewController ()<UIGestureRecognizerDelegate>
{
    NSString *stringTitle;
    UIView *backgroundWindow;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self CreateView];
     stringTitle=@"This is Customize Popupview you can add anything .tableview or collection view or button etc..less coding";
    
    
    
}
-(void)CreateView
{
    
    UIButton * popupButton = [UIButton new];
    
    [popupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [popupButton setTitle:@"POPUPBUTTON" forState:UIControlStateNormal];
    [popupButton setBackgroundColor:[UIColor redColor]];
   [popupButton addTarget:self action:@selector(popaction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:popupButton];
    NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(popupButton);
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[popupButton]-50-|" //popupButton
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewDictionary]];
    
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-75-[popupButton(50)]"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewDictionary]];
    
    
}

-(void)popaction{
    
    APPopupView *popupView = [[APPopupView alloc] initWithFrame:CGRectZero
                                               withFromViewController:self
                                                       andArrayValues:stringTitle withButtonIndex:1 andBookTitle:@""];
    
    
    
    
    popupView.descriptionLabel.text=stringTitle;
    popupView.titleLabel.text=@"APPopupView";
    [self setViewPopup:popupView];
    
    backgroundWindow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    backgroundWindow.backgroundColor = [UIColor blackColor];
    backgroundWindow.backgroundColor = [backgroundWindow.backgroundColor colorWithAlphaComponent:0.6];
    backgroundWindow.userInteractionEnabled = YES;
    [self.view addSubview:backgroundWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:backgroundWindow];
    
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundWindowCancelled)];
    singleFingerTap.delegate = self;
    [backgroundWindow addGestureRecognizer:singleFingerTap];
    
    [self.view addSubview:popupView];
    [[UIApplication sharedApplication].keyWindow addSubview:popupView];
    
    
    [self setupPopViewConstraints];
    
    [popupView setAlpha:0.0];
    
    popupView.transform = CGAffineTransformMakeScale(0.75, 0.75);
    [UIView animateWithDuration:0.25 animations:^{
        popupView.transform = CGAffineTransformIdentity;
        [popupView setAlpha:1.0];
        
    } completion:^(BOOL finished) {
        
    }];
    
    [popupView.buttonClose addTarget:self action:@selector(closeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [popupView.continueButton addTarget:self action:@selector(continueAction) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)backgroundWindowCancelled {
    
    [backgroundWindow removeFromSuperview];
    
    [_viewPopup removeFromSuperview];
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
}

-(void)setupPopViewConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_viewPopup
                                                                   );
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_viewPopup]-20-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=190)-[_viewPopup]-(<=260)-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
}


-(void)closeButtonAction:(UIButton *)sender {
    
    [backgroundWindow removeFromSuperview];
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _viewPopup.transform = CGAffineTransformMakeScale(0.65, 0.65);
        [_viewPopup setAlpha:0.0];
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)continueAction
{
    [backgroundWindow removeFromSuperview];
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _viewPopup.transform = CGAffineTransformMakeScale(0.65, 0.65);
        [_viewPopup setAlpha:0.0];
        
    } completion:^(BOOL finished) {
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
