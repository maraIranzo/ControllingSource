//
//  Categoria.m
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "Categoria.h"

@implementation Categoria

//--- constructor para generar las instancias
+(id)categoriaWithContext:(NSManagedObjectContext *)context {
    
    Categoria *cat = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Categoria"
                        inManagedObjectContext:context];
    return cat;
}



@end
