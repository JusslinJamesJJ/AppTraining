//
//  DetailsVC.h
//  Task1
//
//  Created by BBI-M 1025 on 21/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;

@property (weak, nonatomic) IBOutlet UILabel *d_id;
@property (weak, nonatomic) IBOutlet UILabel *d_numtree;
@property (weak, nonatomic) IBOutlet UILabel *d_tocnametree;
@property (weak, nonatomic) IBOutlet UILabel *d_htmlpage;
@property (weak, nonatomic) IBOutlet UILabel *d_nametree;
@property (weak, nonatomic) IBOutlet UILabel *d_haspdf;
@property (weak, nonatomic) IBOutlet UILabel *d_emailcontent;




@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *numtreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nametreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tocnametreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *htmlpageLabel;
@property (weak, nonatomic) IBOutlet UILabel *haspdfLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailcontentLAbel;



@property (weak, nonatomic)NSString *string_id;
@property (weak, nonatomic)NSString *string_numtreeLabel;
@property (weak, nonatomic)NSString *string_nametreeLabel;
@property (weak, nonatomic)NSString *string_tocnametreeLabel;
@property (weak, nonatomic)NSString *string_htmlpageLabel;
@property (weak, nonatomic)NSString *string_haspdfLabel;
@property (weak, nonatomic)NSString *string_emailcontentLAbel;



@end

NS_ASSUME_NONNULL_END
