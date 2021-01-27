//
//  Data.h
//  Task2
//
//  Created by BBI-M 1025 on 21/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
{
    NSString *chapterName;
    NSString *tagName;
}
-(id)initWithData:(NSString *)c_name tag:(NSString *)t_name;
@property(strong,nonatomic) NSString *chapterName;
@property(strong,nonatomic) NSString *tagName;

@end

NS_ASSUME_NONNULL_END
