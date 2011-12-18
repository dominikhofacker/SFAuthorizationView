//
//  AppDelegate.m
//  AuthorizationView
//
//  Created by Dominik Hofacker on 18.12.11.
//  Copyright (c) 2011 CCoding. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    AuthorizationItem items = {kAuthorizationRightExecute, 0, NULL, 0};
    AuthorizationRights rights = {1, &items};
    [authView setAuthorizationRights:&rights];
    authView.delegate = self;
    [authView updateStatus:nil];
    
    [touchButton setEnabled:[self isUnlocked]];
}

- (BOOL)isUnlocked {
    
    return [authView authorizationState] == SFAuthorizationViewUnlockedState;
    
}

- (void)authorizationViewDidAuthorize:(SFAuthorizationView *)view {
    
    [touchButton setEnabled:[self isUnlocked]];
}

- (void)authorizationViewDidDeauthorize:(SFAuthorizationView *)view {
    
    [touchButton setEnabled:[self isUnlocked]];
}

- (IBAction)clickTouchButton:(id)sender {
    
    system("defaults write com.apple.dock no-glass -boolean YES;killall Dock");
    
}
- (IBAction)resetAll:(id)sender {
    
    system("defaults write com.apple.dock no-glass -boolean NO;killall Dock");
}

@end
