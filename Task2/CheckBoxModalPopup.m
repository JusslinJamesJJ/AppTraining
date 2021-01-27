//
//  CheckBoxModalPopup.m
//  Task2
//
//  Created by BBI-M 1025 on 12/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import "CheckBoxModalPopup.h"
#import "ViewController.h"
@interface CheckBoxModalPopup ()

@end

@implementation CheckBoxModalPopup

@synthesize Allchecked,Bacteriachecked,Fungichecked,Viruschecked,HIV_AIDSchecked,Parasiteschecked,AllCheckboxbtn,BacteriaCheckboxbtn,FungiCheckboxbtn,VirusCheckboxbtn,HIV_AIDSCheckboxbtn,ParasitesCheckboxbtn,ApplyClickedOutlet,filterArray,obj;

- (void)viewDidLoad {
    [super viewDidLoad];
     
    _myPopupView.layer.cornerRadius=10;
    
    if (!Allchecked && !Bacteriachecked && !Fungichecked && !Viruschecked && !HIV_AIDSchecked && !Parasiteschecked) {
        ApplyClickedOutlet.userInteractionEnabled=NO;
        ApplyClickedOutlet.alpha=.5;
    }
    
    
    filterArray=[[NSMutableArray alloc]init];
    

    // Do any additional setup after loading the view.

    
    NSLog(@"Allchecked: %d",Allchecked);
    NSLog(@"Bacteriachecked: %d",Bacteriachecked);
    NSLog(@"Fungichecked: %d",Fungichecked);
    NSLog(@"Viruschecked: %d",Viruschecked);
    NSLog(@"HIV_AIDSchecked: %d",HIV_AIDSchecked);
    NSLog(@"Parasiteschecked: %d",Parasiteschecked);
        if (Allchecked) {
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        }
        else{
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        if (Bacteriachecked) {
            [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        }
        else{
            [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        if (Fungichecked) {
            [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        }
        else{
            [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        if (Viruschecked) {
            [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        }
        else{
            [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        if (HIV_AIDSchecked) {
            [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        }
        else{
            [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        if (Parasiteschecked) {
            [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        }
        else{
            [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }

    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */






- (IBAction)VirusCheckbox:(UIButton *)sender {
    if(!Viruschecked){
        Viruschecked=YES;
        if(Bacteriachecked && Fungichecked && Viruschecked && HIV_AIDSchecked && Parasiteschecked){
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }else{
            
            //        Viruschecked=YES;
            [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        ApplyClickedOutlet.userInteractionEnabled=YES;
        ApplyClickedOutlet.alpha=1;
        }
        
    }
    else{
        Viruschecked=NO;
        if(!Bacteriachecked || !Fungichecked || !Viruschecked || !HIV_AIDSchecked || !Parasiteschecked){
            Allchecked=NO;
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        
        }
        [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        
//        *********** to disble button if none selected
        if (!Bacteriachecked && !Fungichecked && !Viruschecked && !HIV_AIDSchecked && !Parasiteschecked) {
            ApplyClickedOutlet.userInteractionEnabled=NO;
            ApplyClickedOutlet.alpha=.5;
        }
//       *************
    }
    
    
    
}








- (IBAction)FungiCheckbox:(UIButton *)sender {
    if(!Fungichecked){
        Fungichecked=YES;
        if(Bacteriachecked && Fungichecked && Viruschecked && HIV_AIDSchecked && Parasiteschecked){
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];;
            [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }else{
            //            Fungichecked=YES;
            [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }
        
    }
    else{
        Fungichecked=NO;
        if(!Bacteriachecked || !Fungichecked || !Viruschecked || !HIV_AIDSchecked || !Parasiteschecked){
            Allchecked=NO;
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        
        [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        
        
        //        *********** to disble button if none selected
                if (!Bacteriachecked && !Fungichecked && !Viruschecked && !HIV_AIDSchecked && !Parasiteschecked) {
                    ApplyClickedOutlet.userInteractionEnabled=NO;
                    ApplyClickedOutlet.alpha=.5;
                }
        //       *************
        
        
    }
    
    
}










- (IBAction)BacteriaCheckbox:(UIButton *)sender {
    if(!Bacteriachecked){
        Bacteriachecked=YES;
        if(Bacteriachecked && Fungichecked && Viruschecked && HIV_AIDSchecked && Parasiteschecked){
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];;
            [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }else{
            //            Bacteriachecked=YES;
            [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }
        
        
        
    }
    else{
        Bacteriachecked=NO;
        if(!Bacteriachecked || !Fungichecked || !Viruschecked || !HIV_AIDSchecked || !Parasiteschecked){
            Allchecked=NO;
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        
        [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        
        
        //        *********** to disble button if none selected
                if (!Bacteriachecked && !Fungichecked && !Viruschecked && !HIV_AIDSchecked && !Parasiteschecked) {
                    ApplyClickedOutlet.userInteractionEnabled=NO;
                    ApplyClickedOutlet.alpha=.5;
                }
              
        //       *************
    }
    
    
}


- (IBAction)ParasitesCheckbox:(UIButton *)sender {
    if(!Parasiteschecked){
        Parasiteschecked=YES;
        if(Bacteriachecked && Fungichecked && Viruschecked && HIV_AIDSchecked && Parasiteschecked){
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];;
            [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
            
        }else{
            //            Parasiteschecked=YES;
            [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }
        
        
        
    }
    else{
        Parasiteschecked=NO;
        if(!Bacteriachecked || !Fungichecked || !Viruschecked || !HIV_AIDSchecked || !Parasiteschecked){
            Allchecked=NO;
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        
        [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        
        
        //        *********** to disble button if none selected
                if (!Bacteriachecked && !Fungichecked && !Viruschecked && !HIV_AIDSchecked && !Parasiteschecked) {
                    ApplyClickedOutlet.userInteractionEnabled=NO;
                    ApplyClickedOutlet.alpha=.5;
                }

        //       *************
        
        
    }
}

- (IBAction)HIV_AIDSCheckbox:(UIButton *)sender {
    if(!HIV_AIDSchecked){
        HIV_AIDSchecked=YES;
        if(Bacteriachecked && Fungichecked && Viruschecked && HIV_AIDSchecked && Parasiteschecked){
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];;
            [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }else{
            //            HIV_AIDSchecked=YES;
            [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
            ApplyClickedOutlet.userInteractionEnabled=YES;
            ApplyClickedOutlet.alpha=1;
        }
        
        
        
    }
    else{
        HIV_AIDSchecked=NO;
        if(!Bacteriachecked || !Fungichecked || !Viruschecked || !HIV_AIDSchecked || !Parasiteschecked){
            Allchecked=NO;
            [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        }
        
        [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        
        
        //        *********** to disble button if none selected
                if (!Bacteriachecked && !Fungichecked && !Viruschecked && !HIV_AIDSchecked && !Parasiteschecked) {
                    ApplyClickedOutlet.userInteractionEnabled=NO;
                    ApplyClickedOutlet.alpha=.5;
                }
        //       *************
        
    }
}







- (IBAction)AllCheckbox:(UIButton *)sender {
    if(!Allchecked){
        
        
        Allchecked=YES;
        Bacteriachecked=YES;
        Fungichecked=YES;
        Viruschecked=YES;
        HIV_AIDSchecked=YES;
        Parasiteschecked=YES;
        
        [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];;
        [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_full.png"] forState:(UIControlState)UIControlStateNormal];
        ApplyClickedOutlet.userInteractionEnabled=YES;
        ApplyClickedOutlet.alpha=1;

        
    }
    else{
        Allchecked=NO;
        Bacteriachecked=NO;
        Fungichecked=NO;
        Viruschecked=NO;
        HIV_AIDSchecked=NO;
        Parasiteschecked=NO;
        [AllCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        [BacteriaCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        [FungiCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        [VirusCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        [HIV_AIDSCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        [ParasitesCheckboxbtn setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:(UIControlState)UIControlStateNormal];
        ApplyClickedOutlet.userInteractionEnabled=NO;
        ApplyClickedOutlet.alpha=.5;
    }
    
    
    
}
- (IBAction)CancelClicked:(UIButton *)sender {
    NSLog(@"Cancel Clicked called...");
    NSString *str=@"Bacteria Fungi Viruses HIV/AIDS Parasites";
        Allchecked=NO;
        Bacteriachecked=NO;
        Fungichecked=NO;
        Viruschecked=NO;
        HIV_AIDSchecked=NO;
        Parasiteschecked=NO;
    
    [obj setBoolValue:Allchecked bacteria:Bacteriachecked fungi:Fungichecked virus:Viruschecked hivaids:HIV_AIDSchecked parasites:Parasiteschecked];
    [obj hideCount:YES];
    [obj setFlag:1];
    [obj setTags:str];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ApplyClicked:(UIButton *)sender {
    [filterArray removeAllObjects];
    NSString *str=@"";
    if (Bacteriachecked==YES) {
//        str=@"Bacteria";
        str = [str stringByAppendingString:@"Bacteria "];
//        [filterArray addObject:str];
    }
    if (Fungichecked==YES) {
//        str=@"Fungi";
        str = [str stringByAppendingString:@"Fungi "];
//        [filterArray addObject:str];
    }
    if (Viruschecked==YES) {
//        str=@"Viruses";
        str = [str stringByAppendingString:@"Viruses "];
//        [filterArray addObject:str];
    }
    if (HIV_AIDSchecked==YES) {
//        str=@"HIV/AIDS";
        str = [str stringByAppendingString:@"HIV/AIDS "];
//        [filterArray addObject:str];
    }
    if (Parasiteschecked==YES) {
//        str=@"Parasites";
        str = [str stringByAppendingString:@"Parasites "];
//        [filterArray addObject:str];
    }
    NSString *trimmed = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    [filterArray addObject:trimmed];
    [obj hideCount:NO];
    [obj setFlag:1];
    [obj setTags:trimmed];
    [obj setBoolValue:Allchecked bacteria:Bacteriachecked fungi:Fungichecked virus:Viruschecked hivaids:HIV_AIDSchecked parasites:Parasiteschecked];
    [self dismissViewControllerAnimated:YES completion:nil];

}




@end
