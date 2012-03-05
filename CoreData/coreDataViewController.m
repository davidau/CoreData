//
//  coreDataViewController.m
//  CoreData
//
//  Created by David Au on 12-03-04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "coreDataViewController.h"
#import "coreDataAppDelegate.h"

@implementation coreDataViewController

@synthesize name, address, phone, status;

- (void) saveData {
    coreDataAppDelegate *appDelegate = 
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Contacts"
                  inManagedObjectContext:context];
    [newContact setValue:name.text forKey:@"name"];
    [newContact setValue:address.text forKey:@"address"];
    [newContact setValue:phone.text forKey:@"phone"];
    name.text = @"";
    address.text = @"";
    phone.text = @"";
    
    NSError *error;
    [context save:&error];
    status.text = @"Contact saved";    
}

- (void) findContact {
    coreDataAppDelegate *appDelegate = 
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = 
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = 
    [NSEntityDescription entityForName:@"Contacts" 
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred = 
    [NSPredicate predicateWithFormat:@"(name = %@)", 
     name.text];
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request 
                                              error:&error];
    
    if ([objects count] == 0) {
        status.text = @"No matches";
    } else {
        matches = [objects objectAtIndex:0];
        address.text = [matches valueForKey:@"address"];
        phone.text = [matches valueForKey:@"phone"];
        status.text = [NSString stringWithFormat:
                       @"%d matches found", [objects count]];
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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.name = nil;
    self.address = nil;
    self.phone = nil;
    self.status = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
