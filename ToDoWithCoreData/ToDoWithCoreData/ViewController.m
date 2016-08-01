//
//  ViewController.m
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "ViewController.h"
#import "ToDoCell.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "AddItemViewController.h"


@interface ViewController ()



@end

@implementation ViewController




NSString* reuseIdentifier = @"ToDoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    NSFetchRequest *request = [self fetchRequest];
    if ([self.context countForFetchRequest:request error:nil ] == 0) {
        [self createDataWithRequest:request];
    }
    
    [self fetchWithRequest:request];
    
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"ToDo"];
    
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    return request;
}

- (void)fetchWithRequest:(NSFetchRequest *)request {
    
    self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
    self.fetchController.delegate = self;
    [self.fetchController performFetch:nil];
}

-(void)createDataWithRequest:(NSFetchRequest *)request {
    
    ToDo *item1;
    ToDo *item2;
    ToDo *item3;
    
    item1 = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:self.context];
    item1.title = @"Clean";
    item1.todoDesc = @"Clean my room";
    item1.priorityNum = [[NSNumber alloc] initWithInt:2];
    
    
    item2 = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:self.context];
    item2.title = @"Fix";
    item2.todoDesc = @"Fix my car";
    item2.priorityNum = [[NSNumber alloc] initWithInt:2];
    
    
    item3 = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:self.context];
    item3.title = @"Exercise";
    item3.todoDesc = @"Go to gym";
    item3.priorityNum = [[NSNumber alloc] initWithInt:2];
    
    [self.context save:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.fetchController.fetchedObjects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.detailItem = object;
    }
    /*
     if ([segue.identifier isEqualToString:@"AddToDoViewController"]) {
     AddToDoViewController *addTodoVC = segue.destinationViewController;
     addTodoVC.delegate = self;
     }
     */
}


-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type{
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
    
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    UITableView *tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
    
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fetchController.fetchedObjects.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ToDo *object = [self.fetchController objectAtIndexPath:indexPath];
    
    cell.titleLbl.text = object.title;
    cell.descLbl.text = object.todoDesc;
    cell.priorityLbl.text = [NSString stringWithFormat:@"%d", [object.priorityNum intValue]];
    
    return cell;
    
}

@end
