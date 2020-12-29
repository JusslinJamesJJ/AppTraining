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
#import "NewViewController.h"
@interface ListViewVC ()
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end

@implementation ListViewVC
@synthesize numtreeArray,idnumberArray,nametreeArray,tocnametreeArray,htmlpageArray,haspdfArray,emailContentArray,listViewBtn;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTable.delegate=self;
    _myTable.dataSource=self;
    
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
    NSArray *arraydata = [dict objectForKey:@"data"];

    for (NSDictionary *dictdata in arraydata) {
        NSString *idnum = [dictdata objectForKey:@"id"];
        [idnumberArray addObject:idnum];
        NSString *nametree = [dictdata objectForKey:@"nametree"];
        [nametreeArray addObject:nametree];
        NSString *numtree = [dictdata objectForKey:@"numtree"];
        [numtreeArray addObject:numtree];
        NSString *tocnametree = [dictdata objectForKey:@"tocnametree"];
        [tocnametreeArray addObject:tocnametree];
        NSString *htmlpage = [dictdata objectForKey:@"htmlpage"];
        [htmlpageArray addObject:htmlpage];
        NSString *haspdf = [dictdata objectForKey:@"haspdf"];
        [haspdfArray addObject:haspdf];
        NSString *emailContent = [dictdata objectForKey:@"emailContent"];
        [emailContentArray addObject:emailContent];
        
    }
    
    
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


//    DetailsVC *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsVC"];
//    [self presentViewController:detailVC animated:YES completion:nil];
    
    
    DetailsVC *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailsVC"];
    [self.navigationController pushViewController:detail animated:YES];
    
    
    detail.string_id=idnumberArray[indexPath.row];
    detail.string_numtreeLabel=numtreeArray[indexPath.row];
    detail.string_nametreeLabel=nametreeArray[indexPath.row];
    detail.string_tocnametreeLabel=tocnametreeArray[indexPath.row];
    detail.string_htmlpageLabel=htmlpageArray[indexPath.row];
    
    
    
    if (haspdfArray[indexPath.row]>0) {
        detail.string_haspdfLabel=@"false";
    }else
    {
        detail.string_haspdfLabel=@"true";
    }
    if (emailContentArray[indexPath.row]>0) {
           detail.string_emailcontentLAbel=@"false";
       }else
       {
           detail.string_emailcontentLAbel=@"true";
       }

}





- (IBAction)listViewBtnAction:(id)sender {
    
    NewViewController *nav=[self.storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
    [self.navigationController pushViewController:nav animated:YES];
}
@end
