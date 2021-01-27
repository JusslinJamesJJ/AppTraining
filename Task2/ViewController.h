//
//  ViewController.h
//  Task2
//
//  Created by BBI-M 1025 on 07/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "CheckBoxModalPopup.h"
#import "AppDelegate.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,FilteringTableData>
{
    AppDelegate *appDelegate;
}

@property (weak, nonatomic) IBOutlet UIButton *filterbtnOutlet;
//- (IBAction)filterbtnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lbl_card_count;

@property (strong,nonatomic) NSMutableArray *StringTagArray;
@property (strong,nonatomic) NSMutableArray *chapter_titleArray;
@property (strong,nonatomic) NSMutableArray *selectedTag;

@property (strong,nonatomic) NSMutableArray *filteredStringTagArray;
@property (strong,nonatomic) NSMutableArray *filteredchapter_titleArray;

@property (strong,nonatomic) NSMutableArray *mutableWords;

-(void)fetchJson;
-(void)fetchJsonFromFile;
@property int visited;
@property int v;
@property int ItemCount;
@property NSString *selectedfilter;
@property BOOL hideCount;

@property    BOOL Allchecked_view;
@property    BOOL Bacteriachecked_view;
@property    BOOL Fungichecked_view;
@property    BOOL Viruschecked_view;
@property    BOOL HIV_AIDSchecked_view;
@property    BOOL Parasiteschecked_view;
@end

