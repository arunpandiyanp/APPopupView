//
//  LoginPopupView.m
//  YouTunz
//
//  Created by Arun Pandiyan P on 20/05/17.
//  Copyright © 2017 Arun Pandiyan P. All rights reserved.
//

#import "APPopupView.h"


@implementation APPopupView

- (id)initWithFrame:(CGRect)frame withFromViewController: (id)fromController andArrayValues:(NSString*)titlArray withButtonIndex:(NSInteger )index andBookTitle:(NSString *)bookTitle
{
    
    self = [super initWithFrame:frame];
    
    if(self) {
        
        _descriptionArray =titlArray;
        
        buttonIndex = index;
        
        strBookTitle = bookTitle;
        
        [self setTranslatesAutoresizingMaskIntoConstraints: NO];
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self.layer setMasksToBounds:YES];
        
        [self.layer setCornerRadius:5];
        
        
        _APPopupViewDelegate = fromController;
        
        [self createSubViews];
        
        [self setupConstraints];
        
        
    }
    return self;
}
- (void)createSubViews {
    
    
    UIButton *closeButton = [UIButton new];
    
    [closeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [closeButton setImage:[UIImage imageNamed:@"closeIcon"] forState:UIControlStateNormal];
    
    [self addSubview:closeButton];
    [self setButtonClose:closeButton];
    _buttonClose=closeButton;

    UILabel *titleLabel = [UILabel new];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.adjustsFontSizeToFitWidth=YES;
    titleLabel.font = [UIFont systemFontOfSize:24];
    titleLabel.numberOfLines = 6;
    titleLabel.textColor=[UIColor colorWithRed:88/255.0f green:88/255.0f blue:88/255.0f alpha:1.0f];
    [titleLabel sizeToFit];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor whiteColor];
    [self addSubview: titleLabel];
    _titleLabel=titleLabel;

    
    
    UILabel *descriptionLabel = [UILabel new];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionLabel.adjustsFontSizeToFitWidth=YES;
    descriptionLabel.font = [UIFont systemFontOfSize:16];
    descriptionLabel.numberOfLines = 6;
    descriptionLabel.textColor=[UIColor colorWithRed:88/255.0f green:88/255.0f blue:88/255.0f alpha:1.0f];
    [descriptionLabel sizeToFit];
    
    descriptionLabel.textAlignment = NSTextAlignmentLeft;
    descriptionLabel.backgroundColor=[UIColor whiteColor];
    [self addSubview: descriptionLabel];
    _descriptionLabel=descriptionLabel;
   
      UIButton * continueButton = [UIButton new];
    [continueButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    continueButton.clipsToBounds = YES;
    continueButton.layer.cornerRadius=5;
    [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    continueButton.titleLabel.font = [UIFont systemFontOfSize:16];;

    
    [continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    continueButton.backgroundColor=[UIColor colorWithRed:239/255.0f green:66/255.0f blue:54/255.0f alpha:1.0f];
    [self addSubview:continueButton];
    _continueButton = continueButton;
    
    
}
-(void)setupConstraints {
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_buttonClose,_titleLabel,
                                                                   _descriptionLabel,
                                                                   _continueButton
                                                                   );
    
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_buttonClose(15)]-10-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_titleLabel]-30-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
    

    
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_descriptionLabel]-30-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_continueButton(120)]"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
    
    
    
    [NSLayoutConstraint constraintWithItem:_continueButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0].active = YES;

    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_buttonClose(15)]-5-[_titleLabel(20)]-5-[_descriptionLabel]-10-[_continueButton(<=55)]-15-|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:viewsDictionary]];
    
    //_titleLabel
    [_descriptionLabel sizeToFit];
}

@end
