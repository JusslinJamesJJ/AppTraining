//
//  NewViewController.m
//  Task1
//
//  Created by BBI-M 1025 on 22/12/20.
//  Copyright © 2020 BBI-M 1025. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


@end
