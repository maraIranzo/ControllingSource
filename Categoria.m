//
//  Categoria.m
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "Categoria.h"
#import "CoreDataSingleton.h"

@implementation Categoria

//--- constructor para generar las instancias
+(id)categoriaWithContext:(NSManagedObjectContext *)context {
    
    Categoria *cat = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Categoria"
                        inManagedObjectContext:context];
    return cat;
}

+(NSFetchedResultsController *) get_NSFetchedResultsController_forCategories{
    
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Categoria"];
    
    fetch.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"nombre" ascending:YES]];
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:fetch managedObjectContext:[[CoreDataSingleton sharedInstance] managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
}

@end
