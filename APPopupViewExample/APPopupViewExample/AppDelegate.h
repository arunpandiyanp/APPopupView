//
//  AppDelegate.h
//  APPopupViewExample
//
//  Created by Arun Pandiyan P on 03/06/17.
//  Copyright © 2017 Arun Pandiyan P. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

