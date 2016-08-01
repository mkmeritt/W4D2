//
//  ViewController.h
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *list;
@property (nonatomic) NSManagedObjectContext* context;
@property (nonatomic) NSFetchedResultsController* fetchController;

@end

