//
//  DetailsVC.m
//  Task1
//
//  Created by BBI-M 1025 on 21/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "DetailsVC.h"

@interface DetailsVC ()

@end

@implementation DetailsVC

@synthesize idLabel,numtreeLabel,nametreeLabel,tocnametreeLabel,htmlpageLabel,haspdfLabel,emailcontentLAbel;
@synthesize string_id,string_numtreeLabel,string_tocnametreeLabel,string_htmlpageLabel,string_nametreeLabel,string_haspdfLabel,string_emailcontentLAbel;






- (void)viewDidLoad {
    [super viewDidLoad];
   
    idLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    numtreeLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    nametreeLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    tocnametreeLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    htmlpageLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    haspdfLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    emailcontentLAbel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    
    _d_id.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    _d_numtree.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    _d_tocnametree.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    _d_htmlpage.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    _d_nametree.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    _d_haspdf.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    _d_emailcontent.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
