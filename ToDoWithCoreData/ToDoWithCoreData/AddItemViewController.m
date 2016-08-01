//
//  AddItemViewController.m
//  ToDoWithCoreData
//
//  Created by Mark Meritt on 2016-07-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.titleTextField resignFirstResponder];
    [self.descTextField resignFirstResponder];
    
    self.titleString = self.titleTextField.text;
    self.descString = self.descTextField.text;
    
    return true;
}

- (IBAction)saveBtnPressed:(id)sender {
    
    NSManagedObjectContext *taskContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    
    ToDo* item;
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:taskContext];
    
    item.title = self.titleTextField.text;
    item.todoDesc = self.descTextField.text;
    item.priorityNum = [[NSNumber alloc] initWithInt:3];
    
    [taskContext save:nil];
    [self.object.tableView reloadData];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

@end
