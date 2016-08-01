
//
//  DetailViewController.h
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo* detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
