//
//  BrowserViewController.h
//  QRCodeReader
//
//  Created by Paul Habermehl on 3/15/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *uiWebView;

- (IBAction)handleCausesBtn:(id)sender;
- (IBAction)handlePartnersBtn:(id)sender;
- (IBAction)handleMemberBtn:(id)sender;

@end
