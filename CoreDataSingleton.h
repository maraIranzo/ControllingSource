//
//  CoreDataSingleton.h
//  EjercicioCoreData
//
//  Created by Mara on 25/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataSingleton : NSObject{
    
}

@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NSString *nombreModelo;


+ (id)sharedInstance;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(void) creacionDatosParaModelo;

@end

