//
//  TablaCategoriaViewController.m
//  EjercicioCoreData
//
//  Created by Mara on 23/06/14.
//  Copyright (c) 2014 Mara. All rights reserved.
//

#import "TablaCategoriaViewController.h"
#import "TableProductosViewController.h"
#import "CoreDataSingleton.h"


@interface TablaCategoriaViewController ()

@end

@implementation TablaCategoriaViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _managedObjectContext = [[CoreDataSingleton sharedInstance] managedObjectContext];
    
    
    [[CoreDataSingleton sharedInstance] creacionDatosParaModelo];
    
    
    
}


-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    self.fetchedResultsController = [Categoria get_NSFetchedResultsController_forCategories];
    
    
}


- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    
    static NSString *CellIdentifier = @"CategoriaCellIdentifier";
    Categoria *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",object.nombre];
    return cell;
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Categoria *cat = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    if([[segue identifier] isEqualToString:@"showProducts"]){
        
        TableProductosViewController *tab = [segue destinationViewController];
        
        tab.productosArray = [[NSArray alloc]initWithArray:[cat.aProducto allObjects]];
        
        
        
    }
    
    
}


@end
