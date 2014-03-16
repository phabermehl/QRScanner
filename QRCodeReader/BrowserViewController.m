//
//  BrowserViewController.m
//  QRCodeReader
//
//  Created by Paul Habermehl on 3/15/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"]){
        NSLog (@"Successfully received the test notification!");
        NSDictionary *dict = notification.userInfo;
        NSString *myObject = [dict objectForKey:@"scandata"];
        NSLog (@"data=%@",myObject);
        
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:myObject]];
        [self.uiWebView loadRequest:urlRequest];
        
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://minidonations.org/"]];
    [self.uiWebView loadRequest:urlRequest];
    
    NSLog (@"Register test notification!");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)handleCausesBtn:(id)sender{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://minidonations.org/search/index?search_type=causes"]];
    [self.uiWebView loadRequest:urlRequest];
   
}
- (IBAction)handlePartnersBtn:(id)sender{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://minidonations.org/search/index?search_type=partners"]];
    [self.uiWebView loadRequest:urlRequest];
 
}
- (IBAction)handleMemberBtn:(id)sender{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://minidonations.org/search/index?search_type=donors"]];
    [self.uiWebView loadRequest:urlRequest];

}


@end
