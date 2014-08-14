//
//  GCAddViewController.m
//  IceCreamShop
//
//  Created by DetroitLabsUser on 3/17/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "GCAddViewController.h"

@interface GCAddViewController ()
@property (nonatomic, weak) IBOutlet UITextField *flavor;
@property (nonatomic, weak) IBOutlet UITextField *gallons;
@property (nonatomic, weak) IBOutlet UIButton *add;


@end

@implementation GCAddViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
