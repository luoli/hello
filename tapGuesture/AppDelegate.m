//
//  AppDelegate.m
//  tapGuesture
//
//  Created by luolihacker on 15/7/28.
//  Copyright (c) 2015年 luolihacker. All rights reserved.
//

#import "AppDelegate.h"
#import "DBManage.h"
#import "AppnameModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"evenlaunched"]) {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"evenlauched"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"firstlaunched"];
    }
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"firstlaunched"]) {
        DBManage *dbManage = [[DBManage alloc]init];
        sqlite3 *db;
        db = [dbManage createDBOrOpen];
        [dbManage createDBTable];
        //t_modals
        NSString *path = [AppnameModel dogetAppImgPath:@"drawer_arrow" andType:@"png"];
        NSString *sqlInsertAdmin =[NSString stringWithFormat:@"insert into appinfo(apptitle,appimage) values('123','%@')",path];
//        @"insert into appinfo(apptitle,appimage) values('123','admin')";
        [dbManage insert:sqlInsertAdmin];
        NSMutableDictionary *resulutDic = [[NSMutableDictionary alloc]init];
        DBManage *dbQuery = [[DBManage alloc]init];
        [resulutDic addEntriesFromDictionary:[dbQuery queryAllData]];
        NSLog(@"______%ld",resulutDic.count);
       NSString *dropDbSql = @"drop table appinfo";
        [dbManage excuteSql:dropDbSql andDB:db];
        
        
        }
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.viewController  = [[ViewController alloc]init];
    self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
