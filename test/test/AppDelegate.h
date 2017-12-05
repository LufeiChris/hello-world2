//
//  AppDelegate.h
//  test
//
//  Created by a123 on 17/4/6.
//  Copyright © 2017年 LUFEICHENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

