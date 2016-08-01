//
//  ToDo+CoreDataProperties.h
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *todoDesc;
@property (nullable, nonatomic, retain) NSNumber *priorityNum;
@property (nullable, nonatomic, retain) NSNumber *isCompleted;

@end

NS_ASSUME_NONNULL_END
