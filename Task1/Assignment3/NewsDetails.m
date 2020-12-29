//
//  NewsDetails.m
//  Task1
//
//  Created by BBI-M 1025 on 22/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "NewsDetails.h"
#import "NewViewController.h"
#import "NewsTableViewCell.h"
@interface NewsDetails ()

@end

@implementation NewsDetails
@synthesize detailsInfoHeader,detailsInformation,string_detailsInfoHeader,string_detailsInformation;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

    
    
    
    // Do any additional setup after loading the view.
    _backbtn.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:15];
    _detailsLabel.font=[UIFont fontWithName:@"Roboto-Bold" size:30];
    detailsInfoHeader.font=[UIFont fontWithName:@"Roboto-Bold" size:25];
    detailsInformation.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    
    
    detailsInfoHeader.text=string_detailsInfoHeader;
    detailsInformation.text=string_detailsInformation;
    
}



- (IBAction)btnAction:(id)sender {
    
//    NewViewController *newView=[self.storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
//    [self.navigationController pushViewController:newView animated:true];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
