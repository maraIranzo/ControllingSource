//
//  TableProductosViewController.m
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "TableProductosViewController.h"
#import "DetalleProductoViewController.h"


@interface TableProductosViewController ()

@end

@implementation TableProductosViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)setProductosArray:(NSArray *)productosArray
{
    _productosArray = [productosArray copy];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nombre"
                                                                   ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    _productosArray = (NSMutableArray *)[_productosArray sortedArrayUsingDescriptors:sortDescriptors];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.productosArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProductoCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Producto * prod= [self.productosArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",prod.nombre];
    
    return cell;
}

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     Producto *prod = [self.productosArray objectAtIndex:indexPath.row];
     
     if([[segue identifier] isEqualToString:@"pushDetalleProducto"]){
         
         DetalleProductoViewController *det = [segue destinationViewController];
         
         det.prod_selecc = prod;
         
     }
    
 }
 

@end
