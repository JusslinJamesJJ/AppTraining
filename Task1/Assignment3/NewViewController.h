//
//  NewViewController.h
//  Task1
//
//  Created by BBI-M 1025 on 22/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewViewController : ViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSIndexPath *indexPathToBeDeleted;

@property (weak, nonatomic) IBOutlet UITableView *myNewsTable;
@property(strong,nonatomic)NSMutableArray *idArray;
@property(strong,nonatomic)NSMutableArray *dateArray;
@property(strong,nonatomic)NSMutableArray *headerArray;
@property(strong,nonatomic)NSMutableArray *typeArray;
@property(strong,nonatomic)NSMutableArray *video_download_linkArray;
@property(strong,nonatomic)NSMutableArray *video_icon_linkArray;
@property(strong,nonatomic)NSMutableArray *contentArray;
@property(strong,nonatomic)NSMutableArray *end_dateArray;


//-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer;
@end

NS_ASSUME_NONNULL_END
