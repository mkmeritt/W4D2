//
//  ToDoCell.h
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@property (weak, nonatomic) IBOutlet UILabel *priorityLbl;


@end
