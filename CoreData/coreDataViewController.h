//
//  coreDataViewController.h
//  CoreData
//
//  Created by David Au on 12-03-04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface coreDataViewController : UIViewController {
    UITextField *name;
    UITextField *address;
    UITextField *phone;
    UILabel     *status;
}

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction) saveData;
- (IBAction) findContact;

@end
