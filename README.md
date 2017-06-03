# APPopupView
AppopupView using Action sheet or alert . easy to edit 

# Instruction
this popup view are create in visual format laguage constraints. if you want you can change to frame . 


## Manually
add <b>APPopupView.h ,APPopupView.m</b>  File in your Project

import your view controller in  #import "APPopupView.h"

# Usage

Add popup action
```objc
 APPopupView *popupView = [[APPopupView alloc] initWithFrame:CGRectZero
                                               withFromViewController:self
                                                       andArrayValues:stringTitle withButtonIndex:1 andBookTitle:@""];
    
    
    
    
    popupView.descriptionLabel.text=stringTitle;
    popupView.titleLabel.text=@"APPopupView";
    [self setViewPopup:popupView];
    
  UIView  * backgroundWindow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
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
    

```
Add background cancel and close button actions
```objc
-(void)backgroundWindowCancelled {
    
    [backgroundWindow removeFromSuperview];
    
    [_viewPopup removeFromSuperview];
    self.navigationController.tabBarController.tabBar.hidden = NO;
    
}

```
```objc
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

```
Using constrains to adjust popupview
```objc
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
```
License
-------------------------------------------------------
<b>The MIT License (MIT)

Copyright (c) 2017 Arun Pandiyan



Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.</b>
