//
//  NewViewController.m
//  Task1
//
//  Created by BBI-M 1025 on 22/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "NewViewController.h"
#import "NewsTableViewCell.h"
#import "NewsDetails.h"


//NSArray *flag=[[NSArray alloc]init];

@interface NewViewController ()


@end

@implementation NewViewController
@synthesize idArray,dateArray,headerArray,typeArray,video_download_linkArray,video_icon_linkArray,contentArray,end_dateArray,myNewsTable,indexPathToBeDeleted;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    myNewsTable.delegate=self;
    myNewsTable.dataSource=self;
    
//     Do any additional setup after loading the view.
    idArray=[[NSMutableArray alloc]init];
     dateArray=[[NSMutableArray alloc]init];
     headerArray=[[NSMutableArray alloc]init];
     typeArray=[[NSMutableArray alloc]init];
     video_download_linkArray=[[NSMutableArray alloc]init];
     video_icon_linkArray=[[NSMutableArray alloc]init];
     contentArray=[[NSMutableArray alloc]init];
    end_dateArray=[[NSMutableArray alloc]init];

    [self doSomethingWithTheJson1];
    

}





//Parsing json
- (void)doSomethingWithTheJson1
{
    NSDictionary *dict = [self JSONFromFile];
    NSArray *arraydata = [dict objectForKey:@"All_News"];

    for (NSDictionary *dictdata in arraydata) {
        NSString *idnum = [dictdata objectForKey:@"id"];
        [idArray addObject:idnum];
        NSString *date = [dictdata objectForKey:@"date"];
        [dateArray addObject:date];
        NSString *header = [dictdata objectForKey:@"header"];
        [headerArray addObject:header];
        NSString *type = [dictdata objectForKey:@"type"];
        [typeArray addObject:type];
        NSString *video_download_link = [dictdata objectForKey:@"video_download_link"];
        [video_download_linkArray addObject:video_download_link];
        NSString *video_icon_link = [dictdata objectForKey:@"video_icon_link"];
        [video_icon_linkArray addObject:video_icon_link];
        NSString *content = [dictdata objectForKey:@"content"];
        [contentArray addObject:content];
        NSString *end_date = [dictdata objectForKey:@"end_date"];
        [end_dateArray addObject:end_date];



    }
    


   
    [self.myNewsTable reloadData];
}
- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return idArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    NSString *dateStr=dateArray[indexPath.row];

    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMddhhmmss"];
    NSDate *date = [dateFormat dateFromString:dateStr];

    // Convert date object to desired output format
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    dateStr = [dateFormat stringFromDate:date];

    
    
    
    
    
    
    
    
    
//    //long press guesture
//    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//    lpgr.minimumPressDuration = 2.0; //seconds
//    [self.myNewsTable addGestureRecognizer:lpgr];
    
    
    
    
    
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newscell"];
    
    if (cell == nil) {
        cell=[[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newscell"];
    }
    
    
    cell.topLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    cell.middleLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    cell.bottomLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:17];
    
    if(cell.alertImage.tag==0)
    {
        cell.alertImage.image  = [UIImage imageNamed:@"dot"];
               cell.topLabel.text=[headerArray objectAtIndex:indexPath.row];
               cell.middleLabel.text=dateStr;
               cell.bottomLabel.text=[contentArray objectAtIndex:indexPath.row];
    }
    else{
        cell.alertImage.hidden=YES;
        cell.topLabel.text=[headerArray objectAtIndex:indexPath.row];
        cell.middleLabel.text=dateStr;
        cell.bottomLabel.text=[contentArray objectAtIndex:indexPath.row];
    }
       
       
    
    

    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
NewsTableViewCell *cell1=[self.myNewsTable cellForRowAtIndexPath:indexPath];

    cell1.alertImage.tag=1;
    cell1.alertImage.hidden=YES;
//    NSLog(@"TAG: %ld",cell1.alertImage.tag);
    NewsDetails *newsDetails=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetails"];
    [self.navigationController pushViewController:newsDetails animated:YES];

    
    newsDetails.string_detailsInfoHeader=headerArray[indexPath.row];
    newsDetails.string_detailsInformation=contentArray[indexPath.row];

    
    

}







//delete data
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        self.indexPathToBeDeleted = indexPath;

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Are you sure to delete data?" preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

                //action performed for the delete button
                NSLog(@"Selected index: %ld",self.indexPathToBeDeleted.row);

                            [self.idArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.dateArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.headerArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.typeArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.video_download_linkArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.video_icon_linkArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.contentArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                            [self.end_dateArray removeObjectAtIndex:self.indexPathToBeDeleted.row];
                [self.myNewsTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPathToBeDeleted] withRowAnimation:UITableViewRowAnimationFade];
                                    }];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancel];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];


    }
}

































//delete handler
//-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
//{
//    NSLog(@"Long press Occurred...");
//
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Are you sure to delete data?" preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        //action performed for the delete button
//        CGPoint touchPoint = [gestureRecognizer locationInView:self.myNewsTable];
//        NSIndexPath *index = [self.myNewsTable indexPathForRowAtPoint:touchPoint];
//        NSLog(@"Selected index: %ld",index.row);
//
//        if (index == nil) {
//            NSLog(@"long press on table view but not on a row");
//        } else {
//
//                NSLog(@"long press on table view at row %ld", index.row);
//            }
//

//                        }];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:cancel];
//    [alert addAction:ok];
//    [self presentViewController:alert animated:YES completion:nil];
//
//}










@end
