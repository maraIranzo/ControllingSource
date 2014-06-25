//
//  Producto.m
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "Producto.h"

@implementation Producto


//--- constructor para generar las instancias
+(id)productoWithContext:(NSManagedObjectContext *)context {
    
    Producto *prod = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Producto"
                      inManagedObjectContext:context];
    return prod;
}




@end
