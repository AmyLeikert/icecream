//
//  GCListViewController.m
//  IceCreamShop
//
//  Created by DetroitLabsUser on 3/17/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "GCListViewController.h"
#import "GCAddViewController.h"

@interface GCListViewController ()
@property (nonatomic, strong) NSMutableArray *iceCream;
@property (nonatomic, strong) UITableView *flavorsTableView;
@property (nonatomic, strong) GCAddViewController *secondViewController;

@end

@implementation GCListViewController
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.iceCream.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[[self.iceCream objectAtIndex:indexPath.row] objectForKey:@"Flavor"];
    cell.detailTextLabel.text=[[self.iceCream objectAtIndex:indexPath.row] objectForKey:@"Gallons"];
    NSLog(@"%i", _iceCream.count);
    return cell;
}



-(NSString *)returnDocumentsPath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingString:[fileName stringByAppendingString:@"plist"]];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _secondViewController = [[GCAddViewController alloc] initWithNibName:@"GCAddViewController" bundle:nil];
    [self.navigationController pushViewController:_secondViewController animated:YES];
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
    [self setTitle:@"Ice Cream"];
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Flavors" ofType:@"plist"];
    NSString *documentsPath = [self returnDocumentsPath:@"Flavors"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:documentsPath error:&error];
        
    }
    self.iceCream=[[NSMutableArray alloc] initWithContentsOfFile:documentsPath];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
