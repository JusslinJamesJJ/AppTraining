//
//  ListViewVC.h
//  Task1
//
//  Created by BBI-M 1025 on 21/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListViewVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *listViewBtn;
- (IBAction)listViewBtnAction:(id)sender;





@property(strong,nonatomic)NSMutableArray *numtreeArray;
@property(strong,nonatomic)NSMutableArray *idnumberArray;
@property(strong,nonatomic)NSMutableArray *nametreeArray;
@property(strong,nonatomic)NSMutableArray *tocnametreeArray;
@property(strong,nonatomic)NSMutableArray *htmlpageArray;
@property(strong,nonatomic)NSMutableArray *haspdfArray;
@property(strong,nonatomic)NSMutableArray *emailContentArray;



@end

NS_ASSUME_NONNULL_END
