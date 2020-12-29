//
//  ViewController.h
//  Task1
//
//  Created by BBI-M 1025 on 16/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *appTitle;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;

@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *emailTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@property (weak, nonatomic) IBOutlet UILabel *nameError;
@property (weak, nonatomic) IBOutlet UILabel *emailError;
@property (weak, nonatomic) IBOutlet UILabel *passwordError;

@property (weak, nonatomic) IBOutlet UIButton *btnOutlet;

- (IBAction)btnAction:(id)sender;


- (BOOL)textFieldShouldReturn:(UITextField *)textField;
-(BOOL)isNameValid;
-(BOOL)isEmailValid;
-(BOOL)isPasswordValid;

@end

