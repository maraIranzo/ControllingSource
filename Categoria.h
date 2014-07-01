//
//  Categoria.h
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "_Categoria.h"

@interface Categoria : _Categoria

+(id)categoriaWithContext:(NSManagedObjectContext *)context;

+(NSFetchedResultsController *) get_NSFetchedResultsController_forCategories;


@end
