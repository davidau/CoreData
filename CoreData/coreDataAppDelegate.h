//
//  coreDataAppDelegate.h
//  CoreData
//
//  Created by David Au on 12-03-04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "coreDataViewController.h"

@interface coreDataAppDelegate : UIResponder <UIApplicationDelegate> {
    coreDataViewController *viewController;
}

@property (strong, nonatomic) IBOutlet coreDataViewController *viewController;
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
