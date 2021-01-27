//
//  AppDelegate.h
//  Task2
//
//  Created by BBI-M 1025 on 07/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import <UIKit/UIKit.h>
# import "Data.h"
#import <sqlite3.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *record;
    sqlite3 *database1;
}
@property (strong,nonatomic) NSMutableArray *ch;
@property (strong,nonatomic) NSMutableArray *ta;
@property(strong,nonatomic) NSString *databaseName;
@property(strong,nonatomic) NSString *databasePath;
@property(strong,nonatomic) NSMutableArray *record;
@property (atomic, readwrite) sqlite3   *database1;
-(void) createTableNamed:(NSString*)tableName withField1:(NSString*) field1 withField2:(NSString*) field2 withField3:(NSString*) field3;
-(void)checkAndCreateDatabase;
-(void)readDataFromDatabase;
-(BOOL)insertIntoDatabase:(Data *)data;
-(void)removeAllRecords;
@end

