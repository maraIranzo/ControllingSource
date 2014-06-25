//
//  DetalleProductoViewController.h
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Producto.h"


@interface DetalleProductoViewController : UIViewController{
    
    
}


@property (nonatomic, strong) Producto *prod_selecc;//<-- recibido desde la vista de detalle


@property (weak, nonatomic) IBOutlet UILabel *lab_nombre;
@property (weak, nonatomic) IBOutlet UIImageView *imag_producto;


- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end
