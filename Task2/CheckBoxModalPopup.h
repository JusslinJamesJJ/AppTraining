//
//  CheckBoxModalPopup.h
//  Task2
//
//  Created by BBI-M 1025 on 12/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@protocol FilteringTableData <NSObject>

-(void) setTags:(NSString *)filterString;
-(void) setFlag:(int )flag;
-(void) setBoolValue:(BOOL )all bacteria:(BOOL )bac fungi:(BOOL)fun virus:(BOOL)vir hivaids:(BOOL)hiv parasites:(BOOL)par;
-(void) hideCount:(BOOL)hide;
@end


@interface CheckBoxModalPopup : UIViewController
@property (retain,nonatomic) id<FilteringTableData> obj;
@property (weak, nonatomic) IBOutlet UIView *myPopupView;

@property    BOOL Allchecked;
@property    BOOL Bacteriachecked;
@property    BOOL Fungichecked;
@property    BOOL Viruschecked;
@property    BOOL HIV_AIDSchecked;
@property    BOOL Parasiteschecked;
@property (weak, nonatomic) IBOutlet UIButton *ApplyClickedOutlet;

- (IBAction)ApplyClicked:(UIButton *)sender;
- (IBAction)CancelClicked:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *AllCheckboxbtn;
@property (weak, nonatomic) IBOutlet UIButton *BacteriaCheckboxbtn;
@property (weak, nonatomic) IBOutlet UIButton *FungiCheckboxbtn;
@property (weak, nonatomic) IBOutlet UIButton *VirusCheckboxbtn;
@property (weak, nonatomic) IBOutlet UIButton *HIV_AIDSCheckboxbtn;
@property (weak, nonatomic) IBOutlet UIButton *ParasitesCheckboxbtn;

- (IBAction)AllCheckbox:(UIButton *)sender;
- (IBAction)BacteriaCheckbox:(UIButton *)sender;
- (IBAction)FungiCheckbox:(UIButton *)sender;
- (IBAction)VirusCheckbox:(UIButton *)sender;
- (IBAction)HIV_AIDSCheckbox:(UIButton *)sender;
- (IBAction)ParasitesCheckbox:(UIButton *)sender;


@property NSMutableArray *filterArray;
@property int cnt;



@end

NS_ASSUME_NONNULL_END
