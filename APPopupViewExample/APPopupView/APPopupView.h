//
//  LoginPopupView.h
//  YouTunz
//
//  Created by Arun Pandiyan P on 20/05/17.
//  Copyright © 2017 Arun Pandiyan P. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol APTitleDelegate <NSObject>

- (void)selectedLoginTitle: (NSDictionary *)LoginTitle withSelected:(NSInteger)indexval;

@end
@interface APPopupView : UIView
{
    NSInteger buttonIndex;
    
    NSDictionary *dictSelectedBook;
    
    NSString *strBookTitle;
}




@property (strong, nonatomic) UIButton *buttonClose;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *descriptionLabel;

@property (strong, nonatomic) UIButton *continueButton;

@property (strong, nonatomic) NSString *descriptionArray;

- (id)initWithFrame:(CGRect)frame withFromViewController: (id)fromController andArrayValues:(NSString*)titlArray withButtonIndex:(NSInteger )index andBookTitle:(NSString *)bookTitle;



@property (nonatomic, retain) id<APTitleDelegate> APPopupViewDelegate;




@end
