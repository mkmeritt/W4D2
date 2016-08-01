//
//  AddItemViewController.h
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"

@import CoreData;

@interface AddItemViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic, strong) ViewController* object;
@property (nonatomic, strong) NSString* titleString;
@property (nonatomic, strong) NSString* descString;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;

- (IBAction)saveBtnPressed:(id)sender;


@end
