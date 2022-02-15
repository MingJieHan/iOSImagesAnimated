//
//  AppDelegate.m
//  iOSImagesAnimated
//
//  Created by jia yu on 2022/2/16.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    for (int i=1;i<10;i++){
        NSString *file = [NSString stringWithFormat:@"a%03d", i];
        NSString *sourceFile = [NSBundle.mainBundle pathForResource:file ofType:@"png"];
        NSString *targetFile = [path stringByAppendingPathComponent:[file stringByAppendingString:@".png"]];
        if ([NSFileManager.defaultManager fileExistsAtPath:targetFile]){
            break;
        }
        if (![NSFileManager.defaultManager fileExistsAtPath:sourceFile]){
            break;
        }
        [NSFileManager.defaultManager copyItemAtPath:sourceFile toPath:targetFile error:nil];
    }
    return YES;
}

-(void)homeMenuAction{
    NSString *home = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];
    [UIApplication.sharedApplication openURL:[NSURL fileURLWithPath:home] options:@{} completionHandler:^(BOOL success) {
    
    }];
    return;
}

-(void)buildMenuWithBuilder:(id<UIMenuBuilder>)builder{
    UIMenuIdentifier groupID = @"groupmenuidentifier";
    UIKeyCommand *menuHome = [UIKeyCommand commandWithTitle:@"Home Folder" image:nil action:@selector(homeMenuAction) input:@"H" modifierFlags:UIKeyModifierCommand propertyList:nil];
    UIMenu *m = [UIMenu menuWithTitle:@"Tools" image:nil identifier:groupID options:UIMenuOptionsDestructive children:@[menuHome]];
    [builder insertSiblingMenu:m afterMenuForIdentifier:UIMenuFile];
    return;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
