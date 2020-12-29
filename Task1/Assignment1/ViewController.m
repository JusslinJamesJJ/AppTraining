//
//  ViewController.m
//  Task1
//
//  Created by BBI-M 1025 on 16/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "ViewController.h"
#import "ListViewVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
    
    
    self.nameTf.delegate=self;
    self.emailTf.delegate=self;
    self.passwordTf.delegate=self;
    

    //hide error label
     _nameError.hidden=YES;
     _emailError.hidden=YES;
     _passwordError.hidden=YES;
    
    _passwordTf.secureTextEntry=true;
         
     //Button shadow
         _btnOutlet.layer.shadowColor=[UIColor colorWithRed:157.0f/255.0f green:58.0f/255.0f blue:64.0f/255.0f alpha:1.0f].CGColor;
         _btnOutlet.layer.shadowOffset = CGSizeMake(4, 4.0f);
         _btnOutlet.layer.shadowOpacity = 1.0f;
         
         
         _nameLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:20];
         _emailLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:20];
         _passwordLbl.font=[UIFont fontWithName:@"Roboto-Regular" size:20];
         _btnOutlet.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:23];
     
     
     

}


- (void)viewDidLayoutSubviews{
            
    
    [super viewDidLayoutSubviews];
     
         //custom textfield
         //name Tf
    self.view.autoresizingMask=UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
             CALayer *border_name = [CALayer layer];
             CGFloat borderWidth_name = 2;
             border_name.borderColor = [UIColor whiteColor].CGColor;
             border_name.borderWidth = borderWidth_name;
             border_name.frame = CGRectMake(0, _nameTf.frame.size.height - borderWidth_name, _nameTf.frame.size.width, _nameTf.frame.size.height);
             [_nameTf.layer addSublayer:border_name];
             _nameTf.layer.masksToBounds = YES;
     
     
     //email Tf
         CALayer *border_email = [CALayer layer];
         CGFloat borderWidth_email = 2;
         border_email.borderColor = [UIColor whiteColor].CGColor;
         border_email.borderWidth = borderWidth_email;
         border_email.frame = CGRectMake(0, _emailTf.frame.size.height - borderWidth_email, _emailTf.frame.size.width, _emailTf.frame.size.height);
         border_email.borderWidth = borderWidth_email;
         [_emailTf.layer addSublayer:border_email];
         _emailTf.layer.masksToBounds = YES;
         
         

     //password Tf
         CALayer *border_pass = [CALayer layer];
         CGFloat borderWidth_pass = 2;
         border_pass.borderColor = [UIColor whiteColor].CGColor;
         border_pass.borderWidth = borderWidth_pass;
         border_pass.frame = CGRectMake(0, _passwordTf.frame.size.height - borderWidth_pass, _passwordTf.frame.size.width, _passwordTf.frame.size.height);
         border_pass.borderWidth = borderWidth_pass;
         [_passwordTf.layer addSublayer:border_pass];
         _passwordTf.layer.masksToBounds = YES;
    
    
    
    
    
    
    //add image to textfield
        
        
//            UIImageView *imgforRight=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
//            [imgforRight setImage:[UIImage imageNamed:@"cross.png"]];
//            [imgforRight setContentMode:UIViewContentModeScaleAspectFit];
//            self.nameTf.rightView=imgforRight;
//            self.nameTf.rightViewMode=UITextFieldViewModeAlways;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}





- (IBAction)btnAction:(id)sender {
    
     _nameError.hidden=YES;
    _emailError.hidden=YES;
    _passwordError.hidden=YES;
 
    
    
//validation for name Textfield
    
        
    
        if (_nameTf.text.length<3) {
            _nameError.hidden=NO;
            _nameError.text=@"at least 3 characters";
        }
        else if(self.isNameValid==false){
            _nameError.hidden=NO;
            _nameError.text=@"Use underscore & alphabets only.";
        }
        
    
    
    
    
    
//validation for email Textfield
  
        
    
        else if (_emailTf.text.length==0) {
            _emailError.hidden=NO;
            _emailError.text=@"Cannot be blank";
        }
        else if(self.isEmailValid==false){
            _emailError.hidden=NO;
            _emailError.text=@"Invalid Email.";
        }
        
    
    
    
    
 //validation for password Textfield
    
           
       
           else if (_passwordTf.text.length==0) {
               _passwordError.hidden=NO;
               _passwordError.text=@"Cannot be blank";
           }
           else if(self.isPasswordValid==false){
//
               _passwordError.hidden=NO;
               _passwordError.text=@"Invalid format.";
//               
           }
           
       
    
    
    
    
    

    else{

        _nameTf.text=@"";
        _emailTf.text=@"";
        _passwordTf.text=@"";
        ListViewVC *list=[self.storyboard instantiateViewControllerWithIdentifier:@"ListViewVC"];
        [self.navigationController pushViewController:list animated:YES];
    }
}









-(BOOL)isNameValid{
    
    NSString *nameRegex = @"^[a-zA-Z_]*$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [nameTest evaluateWithObject:_nameTf.text];
}



-(BOOL)isEmailValid{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:_emailTf.text];
}


-(BOOL)isPasswordValid{
    NSString *passRegex =@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}";

    NSPredicate *passTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passRegex];
    return [passTest evaluateWithObject:_passwordTf.text];
}
         



@end
