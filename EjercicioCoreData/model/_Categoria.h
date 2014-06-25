//
//  _Categoria.h
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class _Producto;

@interface _Categoria : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *aProducto;
@end

@interface _Categoria (CoreDataGeneratedAccessors)

- (void)addAProductoObject:(_Producto *)value;
- (void)removeAProductoObject:(_Producto *)value;
- (void)addAProducto:(NSSet *)values;
- (void)removeAProducto:(NSSet *)values;

@end
