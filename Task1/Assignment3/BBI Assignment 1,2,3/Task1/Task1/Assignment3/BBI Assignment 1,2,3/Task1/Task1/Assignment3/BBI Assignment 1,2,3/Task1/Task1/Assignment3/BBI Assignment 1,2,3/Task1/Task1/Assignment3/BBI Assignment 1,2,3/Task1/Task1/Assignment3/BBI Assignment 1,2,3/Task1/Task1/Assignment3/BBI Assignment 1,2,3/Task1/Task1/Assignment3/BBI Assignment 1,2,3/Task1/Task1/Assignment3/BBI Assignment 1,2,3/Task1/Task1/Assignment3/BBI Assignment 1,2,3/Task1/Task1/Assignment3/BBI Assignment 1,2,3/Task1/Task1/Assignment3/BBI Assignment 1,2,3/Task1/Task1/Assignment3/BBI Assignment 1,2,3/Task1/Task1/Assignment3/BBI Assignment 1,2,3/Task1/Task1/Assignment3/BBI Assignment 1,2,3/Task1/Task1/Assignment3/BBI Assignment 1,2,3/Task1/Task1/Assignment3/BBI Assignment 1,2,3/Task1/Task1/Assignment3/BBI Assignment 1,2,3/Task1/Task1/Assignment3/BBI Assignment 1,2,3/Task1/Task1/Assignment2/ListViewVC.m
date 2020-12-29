//
//  ListViewVC.m
//  Task1
//
//  Created by BBI-M 1025 on 21/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "ListViewVC.h"
#import "ListViewTableViewCell.h"
#import "DetailsVC.h"
@interface ListViewVC ()
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end

@implementation ListViewVC
@synthesize numtreeArray,idnumberArray,nametreeArray,tocnametreeArray,htmlpageArray,haspdfArray,emailContentArray,listViewBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    listViewBtn.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:23];
 
    idnumberArray=[[NSMutableArray alloc]init];
    nametreeArray=[[NSMutableArray alloc]init];
    numtreeArray=[[NSMutableArray alloc]init];
    tocnametreeArray=[[NSMutableArray alloc]init];
    htmlpageArray=[[NSMutableArray alloc]init];
    haspdfArray=[[NSMutableArray alloc]init];
    emailContentArray=[[NSMutableArray alloc]init];
    
    [self doSomethingWithTheJson];
}



//Parsing json
- (void)doSomethingWithTheJson
{
    NSDictionary *dict = [self JSONFromFile];
    NSArray *colours = [dict objectForKey:@"data"];

    for (NSDictionary *colour in colours) {
        NSString *idnum = [colour objectForKey:@"id"];
        [idnumberArray addObject:idnum];
        NSString *nametree = [colour objectForKey:@"nametree"];
        [nametreeArray addObject:nametree];
        NSString *numtree = [colour objectForKey:@"numtree"];
        [numtreeArray addObject:numtree];
        NSString *tocnametree = [colour objectForKey:@"tocnametree"];
        [tocnametreeArray addObject:tocnametree];
        NSString *htmlpage = [colour objectForKey:@"htmlpage"];
        [htmlpageArray addObject:htmlpage];
        NSString *haspdf = [colour objectForKey:@"haspdf"];
        [haspdfArray addObject:haspdf];
        NSString *emailContent = [colour objectForKey:@"emailContent"];
        [emailContentArray addObject:emailContent];
        
    }
    
    NSLog(@"%@",emailContentArray);
    [self.myTable reloadData];
}
- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TocTree_2" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}










//tableview
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.idnumberArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListViewTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell=[[ListViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.Label1.text=[idnumberArray objectAtIndex:indexPath.row];
    cell.Label2.text=[nametreeArray objectAtIndex:indexPath.row];
    cell.Label3.text=[numtreeArray objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//


    DetailsVC *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    [self presentViewController:detailVC animated:YES completion:nil];
    
    
    
    detailVC.idLabel.text=idnumberArray[indexPath.row];
    detailVC.numtreeLabel.text=numtreeArray[indexPath.row];
    detailVC.nametreeLabel.text=nametreeArray[indexPath.row];
    detailVC.tocnametreeLabel.text=tocnametreeArray[indexPath.row];
    detailVC.htmlpageLabel.text=htmlpageArray[indexPath.row];
    if (haspdfArray[indexPath.row]>0) {
        detailVC.haspdfLabel.text=@"false";
    }else
    {
        detailVC.haspdfLabel.text=@"true";
    }
    if (emailContentArray[indexPath.row]>0) {
           detailVC.emailcontentLAbel.text=@"false";
       }else
       {
           detailVC.emailcontentLAbel.text=@"true";
       }

}





@end
