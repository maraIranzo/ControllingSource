//
//  _Producto.h
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class _Categoria;

@interface _Producto : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) _Categoria *aCategoria;

@end
