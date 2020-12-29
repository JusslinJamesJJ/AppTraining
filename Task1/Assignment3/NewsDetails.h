//
//  NewsDetails.h
//  Task1
//
//  Created by BBI-M 1025 on 22/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetails : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backbtn;
- (IBAction)btnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailsInfoHeader;

@property (weak, nonatomic) IBOutlet UITextView *detailsInformation;

@property (weak, nonatomic)NSString *string_detailsInfoHeader;
@property (weak, nonatomic)NSString *string_detailsInformation;

@end

NS_ASSUME_NONNULL_END
