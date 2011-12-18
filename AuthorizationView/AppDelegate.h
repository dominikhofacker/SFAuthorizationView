//
//  AppDelegate.h
//  AuthorizationView
//
//  Created by Dominik Hofacker on 18.12.11.
//  Copyright (c) 2011 CCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SecurityInterface/SFAuthorizationView.h>
@interface AppDelegate : NSObject <NSApplicationDelegate> {
    
    IBOutlet SFAuthorizationView *authView;
    IBOutlet NSButton *touchButton;
}

- (BOOL)isUnlocked;
- (IBAction)clickTouchButton:(id)sender;
- (IBAction)resetAll:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
