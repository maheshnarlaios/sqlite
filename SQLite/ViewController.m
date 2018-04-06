//
//  ViewController.m
//  SQLite
//
//  Created by apple on 14/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *regNoTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *departmentTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;

-(IBAction)saveData:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Hello chicha");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)saveData:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    
    if (_regNoTextField.text.length>0 &&_nameTextField.text.length>0 &&
        _departmentTextField.text.length>0 &&_yearTextField.text.length>0 ) {
        success = [[DBManager getSharedInstance]saveData:
                   _regNoTextField.text name:_nameTextField.text department:
                   _departmentTextField.text year:_yearTextField.text];
    } else {
        alertString = @"Enter all fields";
    }
    
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)findData:(id)sender {
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber: _regNoTextField.text];
    
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        _regNoTextField.text = @"";
        _nameTextField.text =@"";
        _departmentTextField.text = @"";
        _yearTextField.text =@"";
    } else {
        _regNoTextField.text = _regNoTextField.text;
        _nameTextField.text =[data objectAtIndex:0];
        _departmentTextField.text = [data objectAtIndex:1];
        _yearTextField.text =[data objectAtIndex:2];
    }
}

//#pragma mark - Text field delegate
//-(void)textFieldDidBeginEditing:(UITextField *)textField {
//    [myScrollView setFrame:CGRectMake(10, 50, 300, 200)];
//    [myScrollView setContentSize:CGSizeMake(300, 350)];
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField {
//    [myScrollView setFrame:CGRectMake(10, 50, 300, 350)];
//    
//}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)getDetails:(UIButton *)sender {
    
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber: _regNoTextField.text];
    
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        _regNoTextField.text = @"";
        _nameTextField.text =@"";
        _departmentTextField.text = @"";
        _yearTextField.text =@"";
    } else {
        
        NSLog(@"Data Array %@",data);
    }

}


@end
