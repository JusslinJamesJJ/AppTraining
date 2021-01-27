//
//  ViewController.m
//  Task2
//
//  Created by BBI-M 1025 on 07/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import "ViewController.h"
#import "CheckBoxModalPopup.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mytable;

@end
int count;
int flag=0;
@implementation ViewController

@synthesize chapter_titleArray,StringTagArray,selectedTag,visited,filteredStringTagArray,filteredchapter_titleArray,mutableWords,selectedfilter,Allchecked_view,Bacteriachecked_view,Fungichecked_view,Viruschecked_view,HIV_AIDSchecked_view,Parasiteschecked_view,v,ItemCount,hideCount;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //    https://s3-eu-west-1.amazonaws.com/bbi.appsdata.2013/guideline-cdiff.json
    NSLog(@"View Didload called...");
    
    //    pull to refresh
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(pullToRefreshMethod:) forControlEvents:UIControlEventValueChanged];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Loading ..."];
    _mytable.refreshControl=refreshControl;
    
    
    selectedTag=[[NSMutableArray alloc]init];
    StringTagArray=[[NSMutableArray alloc]init];
    chapter_titleArray=[[NSMutableArray alloc]init];
    mutableWords=[[NSMutableArray alloc]init];
    
    
    filteredStringTagArray=[[NSMutableArray alloc]init];
    filteredchapter_titleArray=[[NSMutableArray alloc]init];
    _mytable.delegate=self;
    _mytable.dataSource=self;
    
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    BOOL result= [self connectedToNetwork];
    
    if(result){
        NSLog(@"You are connected to the network. Inside CHECK block");
                /*local json*/        NSString *path = @"https://s3-eu-west-1.amazonaws.com/bbi.appsdata.2013/guideline-cdiff.json";
                /*local json*/        NSURL *url = [NSURL URLWithString:path];
                /*local json*/        NSData *data1 = [NSData dataWithContentsOfURL:url];
                /*local json*/        NSString *str = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
        // *****************************************************************************************************************************************************
//
//
//        //to check if database created, if not create database and table.
//        [appDelegate checkAndCreateDatabase];
//
//
//
//
//        [self fetchJson];
//
//
//
//
//        NSLog(@"Fetching Complete");
//        //read from database
//
//        //        double delayInSeconds = 10.0;
//        //        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//        //        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [appDelegate readDataFromDatabase];
//        //        });
//
//
//
//
//
//
        
        // *****************************************************************************************************************************************************
                /*local json*/        [self writeStringToFile:str];
                /*local json*/        [self fetchJsonFromFile];
    }
    else{
        NSLog(@"You are NOT connected to the network.Inside CHECK block");
//***********************************************
        
//        [appDelegate readDataFromDatabase];
//
//
//
//        for (int i=0; i<[appDelegate.ch count]; i++) {
//            [chapter_titleArray addObject:appDelegate.ch[i]];
//            [StringTagArray addObject:appDelegate.ta[i]];
//        }
//

        
//***********************************************
        
/*local json*/                  [self fetchJsonFromFile];
        
        //        NSLog(@"Chapter_titleArray:%@",self.chapter_titleArray);
        //        NSLog(@"StringTagArray:%@",self.StringTagArray);
        
    }
    
}


-(void)pullToRefreshMethod:(UIRefreshControl *)refreshControl{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [refreshControl endRefreshing];
        if([self connectedToNetwork]){
            NSLog(@"You are connected to the network. Inside CHECK block");
            /*local json*/        NSString *path = @"https://s3-eu-west-1.amazonaws.com/bbi.appsdata.2013/guideline-cdiff.json";
            /*local json*/        NSURL *url = [NSURL URLWithString:path];
            /*local json*/        NSData *data1 = [NSData dataWithContentsOfURL:url];
            /*local json*/        NSString *str = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
            
            
            
//***********************************************
//                    [appDelegate checkAndCreateDatabase];
//                    [self fetchJson];
//                    [appDelegate readDataFromDatabase];
            
 //***********************************************
            
            
            
            
            /*local json*/        [self writeStringToFile:str];
            /*local json*/        [self fetchJsonFromFile];
        }
        _mytable.reloadData;
    });
    
    return;
}




-(void)setTags:(NSString *)filterString{
    selectedfilter=filterString;
    //    [selectedTag addObject:filterArray];
    NSLog(@"\nInside setTag Function:%@",selectedfilter);
    NSArray *arr = [selectedfilter componentsSeparatedByString:@" "];
    
//    count = [arr count];
    
    
    
    
    
    // ***************************
    if(hideCount==NO)
    {
        
        UILabel *lbl_card_count = [[UILabel alloc]initWithFrame:CGRectMake(50,0, 16, 16)];
        lbl_card_count.textColor = [UIColor blackColor];
        lbl_card_count.textAlignment = NSTextAlignmentCenter;
        lbl_card_count.text = [NSString stringWithFormat:@"%d",count];
        lbl_card_count.layer.borderWidth = 1;
        lbl_card_count.layer.cornerRadius = 8;
        lbl_card_count.layer.masksToBounds = YES;
        lbl_card_count.layer.borderColor =[[UIColor clearColor] CGColor];
        lbl_card_count.layer.shadowColor = [[UIColor clearColor] CGColor];
        lbl_card_count.layer.shadowOffset = CGSizeMake(0.0, 0.0);
        lbl_card_count.layer.shadowOpacity = 0.0;
        lbl_card_count.backgroundColor = [UIColor whiteColor];
        lbl_card_count.font = [UIFont fontWithName:@"ArialMT" size:15];
        [self.filterbtnOutlet addSubview:lbl_card_count];
    }
    else{
        UILabel *lbl_card_count = [[UILabel alloc]initWithFrame:CGRectMake(50,0, 16, 16)];
        lbl_card_count.textColor = [UIColor blackColor];
        lbl_card_count.textAlignment = NSTextAlignmentCenter;
        lbl_card_count.text = [NSString stringWithFormat:@"0"];
        lbl_card_count.layer.borderWidth = 1;
        lbl_card_count.layer.cornerRadius = 8;
        lbl_card_count.layer.masksToBounds = YES;
        lbl_card_count.layer.borderColor =[[UIColor clearColor] CGColor];
        lbl_card_count.layer.shadowColor = [[UIColor clearColor] CGColor];
        lbl_card_count.layer.shadowOffset = CGSizeMake(0.0, 0.0);
        lbl_card_count.layer.shadowOpacity = 0.0;
        lbl_card_count.backgroundColor = [UIColor whiteColor];
        lbl_card_count.font = [UIFont fontWithName:@"ArialMT" size:15];
        [self.filterbtnOutlet addSubview:lbl_card_count];
        
    }
    // ***************************
    
    
    
    
    
    
    //filtering for new array
    for(int i=0;i<[StringTagArray count];i++){   //for big array
        
        NSArray *words = [StringTagArray[i] componentsSeparatedByString: @" "];  //seperation of big array
        [mutableWords addObjectsFromArray:words];
        
        //to find empty tag data
        if ([mutableWords containsObject:@""]) {
            
            [filteredchapter_titleArray addObject:chapter_titleArray[i]];
            [filteredStringTagArray addObject:StringTagArray[i]];
        }
        
        
        
        int found=0;
        for (int j=0; j<[mutableWords count]; j++) {
            
            for (int k=0; k<[arr count]; k++) {
                if(arr[k]==mutableWords[j])
                {
                    //                    NSLog(@"Found same %@ : %@ ",arr[k],mutableWords[j]);
                    [filteredchapter_titleArray addObject:chapter_titleArray[i]];
                    [filteredStringTagArray addObject:StringTagArray[i]];
                    found=1;
                    break;
                }
            }
            if (found==1) {
                break;
            }
            
        }
        
        [mutableWords removeAllObjects];
        
    }
    
    //    NSLog(@"Filtered Chapter_titleArray:%@",filteredchapter_titleArray);
    //           NSLog(@"Filtered StringTagArray:%@",filteredStringTagArray);
    
    [_mytable reloadData];
}


- (void)setFlag:(int)flag{
    visited=flag;
    [filteredStringTagArray removeAllObjects];
    [filteredchapter_titleArray removeAllObjects];
}
- (void)setBoolValue:(BOOL)all bacteria:(BOOL)bac fungi:(BOOL)fun virus:(BOOL)vir hivaids:(BOOL)hiv parasites:(BOOL)par{
    Allchecked_view=all;
    Bacteriachecked_view=bac;
    Fungichecked_view=fun;
    Viruschecked_view=vir;
    HIV_AIDSchecked_view=hiv;
    Parasiteschecked_view=par;
    v=1;
}
- (void)hideCount:(BOOL)hide{
    hideCount=hide;
    NSLog(@"Hide Count: %d",hideCount);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //    NSLog(@"\nInside PrepareForSegue");
    CheckBoxModalPopup *viewcheckbox=[segue destinationViewController];
    viewcheckbox.obj=self;
//    NSLog(@"\nFrom prepareForSeque cnt: %i",viewcheckbox.cnt);
    
    
    
    viewcheckbox.Allchecked=Allchecked_view;
    viewcheckbox.Bacteriachecked=Bacteriachecked_view;
    viewcheckbox.Fungichecked=Fungichecked_view;
    viewcheckbox.Viruschecked=Viruschecked_view;
    viewcheckbox.HIV_AIDSchecked=HIV_AIDSchecked_view;
    viewcheckbox.Parasiteschecked=Parasiteschecked_view;
    
    
    
}




-(BOOL)connectedToNetwork  {
    NSURL* url = [[NSURL alloc] initWithString:@"https://google.com/"];
    NSData* data = [NSData dataWithContentsOfURL:url];
    if (data != nil)
    {
        return YES;
    }
    else{
        flag=1;
        return NO;
    
    }
}



//write to json file
- (void)writeStringToFile:(NSString*)aString {
    NSLog(@"Write started.");
    // Build the path, and create if needed.
    
    //1st alternative
    //    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //    NSString* fileName = @"mydata.json";
    //    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    //    NSLog(@"\nFile Location:%@",fileAtPath);
    //    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
    //        NSLog(@"\nChecking if file exist.");
    //        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    //    }
    //
    //
    //    // The main act...
    //    [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:YES];
    //    NSLog(@"\nWrite end.");
    
    
    
    // 2nd alternative
    NSURL *myUrl = [NSURL URLWithString:@"https://s3-eu-west-1.amazonaws.com/bbi.appsdata.2013/guideline-cdiff.json"];
    NSString *lastPathComponent = [myUrl lastPathComponent]; //last name of file
    NSString *fileName=lastPathComponent;
    
    
    NSString *homepath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"HomePath: %@",homepath);
    
    NSString *newfilePath=[NSString stringWithFormat:@"%@/Json", homepath];
    NSLog(@"New Path: %@",newfilePath);
    BOOL folderExists=[[NSFileManager defaultManager] fileExistsAtPath:newfilePath];
    if (!folderExists)
    {
        NSString* fileAtPath = [newfilePath stringByAppendingPathComponent:fileName];
        NSError *error = NULL;
        [[NSFileManager defaultManager] createDirectoryAtPath:newfilePath withIntermediateDirectories:NO attributes:nil error:&error];
        NSLog(@"Folder Created");
        [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:YES];
        NSLog(@"\nWrite end.");
    }
    else
    {
        NSString* fileAtPath = [newfilePath stringByAppendingPathComponent:fileName];
        NSLog(@"Folder Already exist");
        [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:YES];
        NSLog(@"\nWrite end.");
    }
    
}




//read from local json file
- (NSData*)readStringFromFile {
    NSLog(@"Read started.");
    // Build the path...
    
    NSURL *myUrl = [NSURL URLWithString:@"https://s3-eu-west-1.amazonaws.com/bbi.appsdata.2013/guideline-cdiff.json"];
    NSString *lastPathComponent = [myUrl lastPathComponent]; //last name of file
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePathWithJson=[filePath stringByAppendingPathComponent:@"Json"];
    NSString* fileName = lastPathComponent;
    NSString* fileAtPath = [filePathWithJson stringByAppendingPathComponent:fileName];
    NSLog(@"***fileAtPath : %@",fileAtPath);
    
    return  [NSData dataWithContentsOfFile:fileAtPath];
    
    
}




-(void)fetchJsonFromFile{
    NSLog(@"\nInside Fetch");
    NSData *data=[self readStringFromFile];
    NSLog(@"\nData read successful.");
    //    NSString *str1 = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    //    NSLog(@"\nData2: %@",str1);
    
    if(data==nil){
        NSLog(@"\nData is nil");
        return;
    }
    else{
        
        NSError *err;
        NSMutableDictionary *jsondata=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if(err){
            NSLog(@"\nFailed to parse the JSON data ! : %@",err);
            return;
        }
        
        //parsing json data
        
        NSMutableArray *guidelines=[jsondata objectForKey:@"guidelines"];
        
        for(NSMutableDictionary *guidelinesdict in guidelines)
        {
            NSMutableArray *insidechapter=[guidelinesdict objectForKey:@"chapters"];
            for(NSMutableDictionary *chapterdict in insidechapter)
            {
                NSString *chapterString= [chapterdict objectForKey:@"chapter_title"];
                [self.chapter_titleArray addObject:chapterString];
                NSMutableArray *searchtags=[chapterdict objectForKey:@"search_tag_keywords"];
                NSString *tagString=@"";
                for(NSMutableArray *tags in searchtags)
                {
                    tagString=[tagString stringByAppendingString:tags];
                    tagString=[tagString stringByAppendingString:@" "];
                }
                NSString *trimmed = [tagString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                [self.StringTagArray addObject:trimmed];
                //                [self.StringTagArray addObject:tagString];
                
                //** inside nested chapters<>
                
                NSMutableArray *nestedChapter=[chapterdict objectForKey:@"chapters"];
                if (nestedChapter==NULL) {
                    return;
                }
                else{
                    for(NSMutableDictionary *insideNestedChapter in nestedChapter)
                    {
                        NSString *nestedChapterString=[insideNestedChapter objectForKey:@"chapter_title"];
                        [self.chapter_titleArray addObject:nestedChapterString];
                        NSMutableArray *nestedSearchTag=[insideNestedChapter objectForKey:@"search_tag_keywords"];
                        tagString=@"";
                        for(NSMutableArray *nestedtags in nestedSearchTag)
                        {
                            tagString=[tagString stringByAppendingString:nestedtags];
                            tagString=[tagString stringByAppendingString:@" "];
                        }
                        NSString *trimmed = [tagString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                        [self.StringTagArray addObject:trimmed];
                    }
                }
                //   ** inside nested chapters</>
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.mytable reloadData];
            
        });
        
        
        //            NSLog(@"Chapter_titleArray:%@",self.chapter_titleArray);
        //            NSLog(@"StringTagArray:%@",self.StringTagArray);
        
    } /*check if data not nil bracket */
}


















-(void)fetchJson{
    
    NSLog(@"\n*** Inside FetchJson() Method...");
    StringTagArray=[[NSMutableArray alloc]init];
    chapter_titleArray=[[NSMutableArray alloc]init];
    NSString *urlString=@"https://s3-eu-west-1.amazonaws.com/bbi.appsdata.2013/guideline-cdiff.json";
    NSURL *url= [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if(data==nil){
            NSLog(@"\nData is nil");
            return;
        }
        else{
            
            NSError *err;
            NSMutableDictionary *jsondata=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            if(err){
                NSLog(@"\nFailed to parse the JSON data ! : %@",err);
                return;
            }
            
            //parsing json data
            
            NSMutableArray *guidelines=[jsondata objectForKey:@"guidelines"];
            
            for(NSMutableDictionary *guidelinesdict in guidelines)
            {
                NSMutableArray *insidechapter=[guidelinesdict objectForKey:@"chapters"];
                for(NSMutableDictionary *chapterdict in insidechapter)
                {
                    NSString *chapterString= [chapterdict objectForKey:@"chapter_title"];
                    [self.chapter_titleArray addObject:chapterString];
                    NSMutableArray *searchtags=[chapterdict objectForKey:@"search_tag_keywords"];
                    NSString *tagString=@"";
                    for(NSMutableArray *tags in searchtags)
                    {
                        tagString=[tagString stringByAppendingString:tags];
                        tagString=[tagString stringByAppendingString:@" "];
                    }
                    NSString *trimmed = [tagString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                    [self.StringTagArray addObject:trimmed];
                    //                [self.StringTagArray addObject:tagString];
                    
                    //** inside nested chapters<>
                    
                    NSMutableArray *nestedChapter=[chapterdict objectForKey:@"chapters"];
                    if (nestedChapter==NULL) {
                        return;
                    }
                    else{
                        for(NSMutableDictionary *insideNestedChapter in nestedChapter)
                        {
                            NSString *nestedChapterString=[insideNestedChapter objectForKey:@"chapter_title"];
                            [self.chapter_titleArray addObject:nestedChapterString];
                            NSMutableArray *nestedSearchTag=[insideNestedChapter objectForKey:@"search_tag_keywords"];
                            tagString=@"";
                            for(NSMutableArray *nestedtags in nestedSearchTag)
                            {
                                tagString=[tagString stringByAppendingString:nestedtags];
                                tagString=[tagString stringByAppendingString:@" "];
                            }
                            NSString *trimmed = [tagString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                            [self.StringTagArray addObject:trimmed];
                        }
                    }
                    //   ** inside nested chapters</>
                }
            }
            
            //            NSLog(@"\nchapter_titleArray : %@",self.chapter_titleArray);
            //            NSLog(@"\nStringTagArray : %@",self.StringTagArray);
            //            double delayInSeconds = 10.0;
            //                  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            //                  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //                    [self.mytable reloadData];
            //                  });
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.mytable reloadData];
                
            });
        }//data nil else bracket
        
        //to delete data to database
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [appDelegate removeAllRecords];
            
            
            //to insert data to database
            for (int i=0; i<[self.chapter_titleArray count]; i++) {
                Data *d=[[Data alloc] initWithData:self.chapter_titleArray[i] tag:self.StringTagArray[i]];
                [appDelegate insertIntoDatabase:d];
            }
            
        });
        
    }]resume] ;
    
}








//tableview delegate methods




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"\nTable Delegate Called");
    NSLog(@"\nInside numberOfSectionsInTableView");
    //    NSLog(@"Visited: %i",visited);
    NSInteger numOfSections = 0;
    if (visited==1) {
        if ([filteredchapter_titleArray count]>0)
        {
            _mytable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            numOfSections= 1;
            _mytable.backgroundView = nil;
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"No data available ! Please connect to Internet." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
            
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            //********
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            messageLabel.text = @"No data is currently available. Please pull down to refresh.";
            messageLabel.textColor = [UIColor blackColor];
            messageLabel.numberOfLines = 0;
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
            [messageLabel sizeToFit];
            self.mytable.backgroundView = messageLabel;
            self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
            //********
        }
    }
    else{
        if ([self.chapter_titleArray count]>0)
        {
            NSLog(@"self.chapter_titleArray count : %lu",(unsigned long)[self.chapter_titleArray count]);
            NSLog(@"Chapter_titleArray:%@",self.chapter_titleArray);
            
            _mytable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            numOfSections= 1;
            _mytable.backgroundView = nil;
        }
        else if(flag==1)
        {
            
            //            NSLog(@"Alert Block");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"No data available ! Please connect to Internet." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { }];
            
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            //********
            UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            messageLabel.text = @"No data is currently available. Please pull down to refresh.";
            messageLabel.textColor = [UIColor blackColor];
            messageLabel.numberOfLines = 0;
            messageLabel.textAlignment = NSTextAlignmentCenter;
            messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
            [messageLabel sizeToFit];
            self.mytable.backgroundView = messageLabel;
            self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
            //********
        }
    }
    
    
    return numOfSections;
}








- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"\nInside numberOfRowsInSection");
    if (visited==1) {
        
        return [filteredchapter_titleArray count];
    }
    else{
        return [self.chapter_titleArray count];
    }
    
    
}

//selectedTag
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"\nInside cellForRowAtIndexPath");
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    if (visited==1) {
        cell.textLabel.text=[filteredchapter_titleArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text=[filteredStringTagArray objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text=[self.chapter_titleArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text=[self.StringTagArray objectAtIndex:indexPath.row];
    }
    return cell;
}



@end





