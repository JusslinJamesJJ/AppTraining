//
//  Data.m
//  Task2
//
//  Created by BBI-M 1025 on 21/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import "Data.h"

@implementation Data
@synthesize chapterName,tagName;



-(id)initWithData:(NSString *)c_name tag:(NSString *)t_name{
    
    if(self=[super init])
    {
        [self setChapterName:c_name];
        [self setTagName:t_name];
    }
    return self;
}





@end
