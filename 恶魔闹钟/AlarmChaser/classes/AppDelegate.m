//
//  AppDelegate.m
//  AlarmChaser
//
//  Created by as on 2015/05/12.
//  Copyright (c) 2015年 tongari. All rights reserved.
//

#import "AppDelegate.h"
#import "UserDefalutManager.h"
#import "AlarmManager.h"
#import "Router.h"
#import "ClockViewController.h"

static NSString *DID_ENTER_BACKGROUND = @"CustomNotificationApplicationDidEnterBackground";
static NSString *DID_BECOME_ACTIVE = @"CustomNotificationApplicationDidBecomeActive";
static NSString *DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE = @"CustomNotificationDidReceiveLocalNotificationInActive";
static NSString *DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE = @"CustomNotificationDidReceiveLocalNotificationStateActive";
static NSString *DID_FINISH_LAUNCHING_WITH_OPTIONS = @"CustomNotificationDidFinishLaunchingWithOptions";


@interface AppDelegate ()

@end

@implementation AppDelegate


+(NSString *)CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND{
    return DID_ENTER_BACKGROUND;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE{
    return DID_BECOME_ACTIVE;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE{
    return DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_FINISH_LAUNCHING_WITH_OPTIONS{
    return DID_FINISH_LAUNCHING_WITH_OPTIONS;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE{
    return DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) {
        
        // iOS8.0
        UIUserNotificationType types =
        UIUserNotificationTypeBadge|
        UIUserNotificationTypeSound|
        UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        [application registerUserNotificationSettings:mySettings];
    }
    
    [[AlarmManager sharedManager]setBgm];
    
    return YES;
}

//-(UINavigationController *)transportationListEnterpoint{
//    UIStoryboard *transportationList = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    return [transportationList instantiateViewControllerWithIdentifier:@"na"];
//}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    [[NSNotificationCenter defaultCenter]
     postNotification:[NSNotification notificationWithName:DID_ENTER_BACKGROUND
                                                    object:self]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
 
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [[NSNotificationCenter defaultCenter]
     postNotification:[NSNotification notificationWithName:DID_BECOME_ACTIVE
                                                    object:self]];
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
   
     
    
        if(application.applicationState == UIApplicationStateActive) {
            
            [[NSNotificationCenter defaultCenter]
             postNotification:[NSNotification notificationWithName:DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE
                                                            object:self]];
            
        }
        
        if(application.applicationState == UIApplicationStateInactive) {
            [[NSNotificationCenter defaultCenter]
             postNotification:[NSNotification notificationWithName:DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE
                                                            object:self]];
        }
    
}



@end
