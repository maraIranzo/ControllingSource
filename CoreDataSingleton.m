//
//  CoreDataSingleton.m
//  EjercicioCoreData
//
//  Created by Mara on 25/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "CoreDataSingleton.h"
#import "Categoria.h"
#import "Producto.h"


@implementation CoreDataSingleton



+ (id)sharedInstance {
    
    static CoreDataSingleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    
    if (self = [super init]) {
        
        _nombreModelo = [NSString stringWithFormat:@"EjercicioCoreData"];
        _managedObjectContext = [self managedObjectContext];
    
    }
    return self;
}




//Un getter personalizado para la propiedad managedObjectContext donde el contexto solo se crea la primera vez, y en las siguientes invocaciones se obtiene del NSPersistentStoreCoordinator.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

//Un getter personalizado para la propiedad managedObjectModel que recupera el modelo de datos de nuestro fichero con extensión .xcdatamodeld, haciendo una comprobación previa para garantizar que la lectura a disco del fichero se haga una única vez.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    ///------ modelo de datos con los
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:_nombreModelo withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

//Un getter personalizado para la propiedad persistentStoreCoordinator que genera una única instancia de esta propiedad, y la inicializa al tipo NSSQLiteStoreType (SQLite).
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    
    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",_nombreModelo]];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
    
    
    
}


- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


//-- guardamos los datos en CORE DATA comprobando antes si han habido cambios en el contexto para asi mejorar el acceso
/*
 Dicho código lo incluiremos en los siguientes métodos:
 applicationWillResignActive
 applicationDidEnterBackground
 applicationWillTerminate
 
 De este modo, cada vez que el usuario salga de la app, o ésta se cierre por cualquier motivo, la información quedara guardada en Core Data.
 
 */
- (void)saveContext
{
    NSError *error = nil;
    if (_managedObjectContext != nil) {
        if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}



-(void) creacionDatosParaModelo{
    
    
    ///--- comprobamos si es la primera vez que entramos para saber si tenemos que meter valores en la base de datos
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL baseDatosCreada = [defaults boolForKey:@"baseDatosCreada"];
    
    if (!baseDatosCreada) {
        
        // actualizamos valor en NSUSERDEFAULTS
        [defaults setBool:YES forKey:@"baseDatosCreada"];
        [defaults synchronize];
        
        
        
        NSManagedObjectContext *context = [self managedObjectContext];
        
        //------- CATEGORIA 1
        Categoria *cat = [Categoria categoriaWithContext:context];
        cat.nombre = @"iPad";
        
        //------- PRODUCTOS 1
        Producto *prod_ipad = [Producto productoWithContext:context];
        prod_ipad.nombre = @"iPad mini";
        prod_ipad.url = @"http://i.picasion.com/pic77/bb9988d41d66a396672275d04f114fb0.gif";
        
        Producto *prod_ipad2 = [Producto productoWithContext:context];
        prod_ipad2.nombre = @"iPad Air";
        prod_ipad2.url = @"http://i.picasion.com/pic77/93b925ca9f87940b916319f9c5a39b06.gif";
        
        
        cat.aProducto = [NSSet setWithObjects:prod_ipad ,prod_ipad2, nil];//<--- asignamos productos a la categoria
        
        //------- CATEGORIA 2
        Categoria *cat1 = [Categoria categoriaWithContext:context];
        cat1.nombre = @"Apple";
        
        //------- PRODUCTOS 2
        Producto *prod_apple = [Producto productoWithContext:context];
        prod_apple.nombre = @"iMac";
        prod_apple.url = @"http://i.picasion.com/pic77/0cf97dc24231cf14800572fc1b6d6129.gif";
        
        Producto *prod_apple2 = [Producto productoWithContext:context];
        prod_apple2.nombre = @"MacBook";
        prod_apple2.url = @"http://i.picasion.com/pic77/766a12255940820db65acc8e9089084f.gif";
        
        Producto *prod_apple3 = [Producto productoWithContext:context];
        prod_apple3.nombre = @"iPod";
        prod_apple3.url = @"http://i.picasion.com/pic77/b7043116b1011358fd75a3cdb6ce797a.gif";
        
        
        Producto *prod_apple4 = [Producto productoWithContext:context];
        prod_apple4.nombre = @"iPhone";
        prod_apple4.url = @"http://i.picasion.com/pic77/12392c7b0f3d5099438063e38715cbb6.gif";
        
        
        cat1.aProducto = [NSSet setWithObjects:prod_apple ,prod_apple2,prod_apple3,prod_apple4, nil];//<--- asignamos productos a la categoria
        
        
        
        //------- CATEGORIA 3
        Categoria *cat2 = [Categoria categoriaWithContext:context];
        cat2.nombre = @"iPhone";
        
        
        //------- PRODUCTOS 3
        Producto *prod_iphone = [Producto productoWithContext:context];
        prod_iphone.nombre = @"iPhone 5";
        prod_iphone.url = @"http://i.picasion.com/pic77/ed706bcf52992b958953c1c5b824dadd.gif";
        
        Producto *prod_iphone2 = [Producto productoWithContext:context];
        prod_iphone2.nombre = @"iPhone 5s";
        prod_iphone2.url = @"http://i.picasion.com/pic77/066763bf51009fda8a26e26e78907d48.gif";
        
        Producto *prod_iphone3 = [Producto productoWithContext:context];
        prod_iphone3.nombre = @"iPhone 5c";
        prod_iphone3.url = @"http://i.picasion.com/pic77/35eba9054d1778a8ba8cfc486bbcc3b8.gif";
        
        
        cat2.aProducto = [NSSet setWithObjects:prod_iphone ,prod_iphone2,prod_iphone3, nil];//<--- asignamos productos a la categoria
        
        
        [self saveContext];
        
        
        
    }
    

    
    
}





@end