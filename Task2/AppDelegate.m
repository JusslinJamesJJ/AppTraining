//
//  AppDelegate.m
//  Task2
//
//  Created by BBI-M 1025 on 07/01/21.
//  Copyright © 2021 BBI-M 1025. All rights reserved.
//

#import "AppDelegate.h"
# import <sqlite3.h>
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databaseName,databasePath,record,ta,ch;




//***************APP DELEGATE METHODS

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.record=[[NSMutableArray alloc]init];
    self.databaseName=@"myDatabase.db";
    NSArray *documentPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir=[documentPath objectAtIndex:0];
    self.databasePath=[documentsDir stringByAppendingPathComponent:self.databaseName];
    NSLog(@"\nDatabasePath: %@",self.databasePath);
    //    [self checkAndCreateDatabase];
    //    [self readDataFromDatabase];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

//***************DATABASE METHODS

-(void)checkAndCreateDatabase{
    NSLog(@"\n*** Inside checkAndCreateDatabase() Method...");
    BOOL success;
    NSString *tablename=@"Record";
    NSString *filed1=@"id";
    NSString *filed2=@"Chapter";
    NSString *filed3=@"Tag";
    
    NSFileManager *filemanager=[NSFileManager defaultManager];
    success=[filemanager fileExistsAtPath:self.databasePath];
    NSLog(@"Success : %d", success);
    if (success)
    {
        NSLog(@"Database Already Exist.");
        //        [self createTableNamed:tablename withField1:filed1 withField2:filed2 withField3:filed3];
        
        //        NSString *sql=[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@'(%@ INTEGER PRIMARY KEY AUTOINCREMENT ,'%@' TEXT,'%@' TEXT);",tablename,filed1,filed2,filed3];
        //        if (sqlite3_open([self.databasePath UTF8String], &database1) == SQLITE_OK)
        //        {
        //            char *err = NULL;
        //         if (sqlite3_exec(database1, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        //                           NSLog(@"TABLE NOT CREATED");
        //                            NSLog(@"Error : %s",sqlite3_errmsg(database1));
        //                            sqlite3_close(database1);
        //                        }
        //                       else{
        //                           NSLog(@"TABLE CREATED");
        //                       }
        //                    sqlite3_close(database1);
        //            }
        
    }
    else{
        NSLog(@"Database DOES NOT Exist.");
        NSString *databasePathFromApp=[[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:self.databaseName];
        [filemanager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
        NSString *sql=[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@'(%@ INTEGER PRIMARY KEY AUTOINCREMENT ,'%@' TEXT,'%@' TEXT);",tablename,filed1,filed2,filed3];
        
        
        if (sqlite3_open([self.databasePath UTF8String], &database1) == SQLITE_OK)
        {
            char *err = NULL;
            
            if (sqlite3_exec(database1, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
                NSLog(@"TABLE NOT CREATED");
                NSLog(@"Error : %s",sqlite3_errmsg(database1));
                sqlite3_close(database1);
            }
            
            
            else{
                NSLog(@"TABLE CREATED");
            }
            sqlite3_close(database1);
        }
    }
}



-(void)readDataFromDatabase{
    NSLog(@"\n*** Inside readDataFromDatabase() Method...");
    [self.record removeAllObjects];
    ch=[[NSMutableArray alloc]init];
    ta=[[NSMutableArray alloc]init];
    //    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database1)==SQLITE_OK)
    {
        char *sqlStatement="select * from Record";
        sqlite3_stmt *compiledStatement;
        
        if (sqlite3_prepare(database1, sqlStatement, -1, &compiledStatement, NULL)==SQLITE_OK) {
            while (sqlite3_step(compiledStatement)==SQLITE_ROW) {
                char * c=sqlite3_column_text(compiledStatement, 1);
                char * t=sqlite3_column_text(compiledStatement, 2);
                
                NSString *chapterString=[NSString stringWithUTF8String:c];
                NSString *tagString=[NSString stringWithUTF8String:t];
                
                [ch addObject:chapterString];
                [ta addObject:tagString];
                
               
                //                Data *data=[[Data alloc] initWithData:chapterString tag:tagString];
                //                [self.record addObject:data];
                
                
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database1);
    NSLog(@"Database closed after read");
//    NSLog(@"\nch : %@",ch);
//    NSLog(@"\nta : %@",ta);

}



-(BOOL)insertIntoDatabase:(Data *)data {
    NSLog(@"\n*** Inside insertIntoDatabase() Method...");
    //    sqlite3 *database;
    BOOL returnCode=YES;
    
    if (sqlite3_open([self.databasePath UTF8String], &database1)==SQLITE_OK) {
        char *sqlStatement="Insert into Record values(NULL,?,?)";
        sqlite3_stmt *compiledStatement;
        if (sqlite3_prepare_v2(database1, sqlStatement, -1, &compiledStatement, NULL)==SQLITE_OK) {
            sqlite3_bind_text(compiledStatement, 1, [data.chapterName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [data.tagName UTF8String], -1, SQLITE_TRANSIENT);
        }
        if (sqlite3_step(compiledStatement)!=SQLITE_DONE) {
            NSLog(@"Error : %s",sqlite3_errmsg(database1));
            returnCode=NO;
        }
        else{
            NSLog(@"Insert into row id=%lld ",sqlite3_last_insert_rowid(database1));
        }
        sqlite3_finalize(compiledStatement);
    }
    
    sqlite3_close(database1);
    return returnCode;
}


//- (void)removeAllRecords{
//    NSLog(@"Inside REMOVE RECORDS block");
//    NSString *query = @"delete from Record";
//    const char *sqlStatement = [query UTF8String];
//    sqlite3_stmt *compiledStatement;
//    if(sqlite3_prepare_v2(database1, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
//        // Loop through the results and add them to the feeds array
//        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
//            // Read the data from the result row
//            NSLog(@"Deleted successfully");
//        }
//
//        // Release the compiled statement from memory
//        sqlite3_finalize(compiledStatement);
//    }
//
//}



- (void)removeAllRecords{
    if (sqlite3_open([self.databasePath UTF8String], &database1) == SQLITE_OK) {
        //*************** insert value in database******************************\\

        NSString  *sql = [NSString stringWithFormat:@"delete from Record"];
        const char *insert_stmt = [sql UTF8String];
        sqlite3_stmt *compiledStatement;
        sqlite3_prepare_v2(database1,insert_stmt, -1, &compiledStatement, NULL);
        if(sqlite3_step(compiledStatement)==SQLITE_DONE)
        {
            NSLog(@"Delete successfully");
        }
        else
        {
            NSLog(@"Delete not successfully");

        }
        sqlite3_finalize(compiledStatement);
        sqlite3_close(database1);
      }
    }
    
    





@end
