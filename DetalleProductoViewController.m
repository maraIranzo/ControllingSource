//
//  DetalleProductoViewController.m
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "DetalleProductoViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface DetalleProductoViewController ()

@end

@implementation DetalleProductoViewController

-(void) viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    
    self.lab_nombre.text = self.prod_selecc.nombre;
    
//    [self.imag_producto setImageWithURL:[NSURL URLWithString:self.prod_selecc.url]];
    
    NSURL *url = [NSURL URLWithString:self.prod_selecc.url];
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        
        if (succeeded) {
            
            self.imag_producto.image = image;
            
        }
        
    }];
   


}


- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //--- hacemos la llamada
        NSURLResponse *response;
        NSError *error;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ( !error )
            {
                UIImage *image = [[UIImage alloc] initWithData:data];
                completionBlock(YES,image);
            } else{
                completionBlock(NO,nil);
            }
        });
    });
    
}

@end
