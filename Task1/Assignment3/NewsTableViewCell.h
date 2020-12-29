//
//  NewsTableViewCell.h
//  Task1
//
//  Created by BBI-M 1025 on 22/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *alertImage;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;



@end

NS_ASSUME_NONNULL_END
