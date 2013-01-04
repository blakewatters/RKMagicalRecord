//
//  RKMRAppDelegate.m
//  RKMagicalRecord
//
//  Created by Blake Watters on 1/4/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "CoreData+MagicalRecord.h"
#import "RKMRAppDelegate.h"
#import "RKMRMasterViewController.h"

@implementation RKMRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Setup MagicalRecord
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"RKMagicalRecord.sqlite"];
    
    /**
     Configure RestKit to share a Persistent Store Coordinator with MagicalRecord. This ensures that object request operations will persist back to the same Persistent Store managed by MagicalRecord, making managed objects available across the libraries.
     */
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [NSPersistentStoreCoordinator MR_defaultStoreCoordinator];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithPersistentStoreCoordinator:persistentStoreCoordinator];
    [managedObjectStore createManagedObjectContexts];
    
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://restkit.org"]];
    objectManager.managedObjectStore = managedObjectStore;
    
    // Pass the MagicalRecord
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    RKMRMasterViewController *controller = (RKMRMasterViewController *)navigationController.topViewController;
    controller.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [MagicalRecord cleanUp];
}

@end
