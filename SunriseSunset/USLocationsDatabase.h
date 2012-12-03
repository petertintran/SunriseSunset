//
//  USLocationsDatabase.h
//  SQLiteTableView
//
//  Created by Michael Shafae on 11/8/12.
//  Copyright (c) 2012 Michael Shafae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Location.h"

@interface USLocationsDatabase : NSObject
{
  sqlite3* _database;
}


+ (USLocationsDatabase*) database;
- (NSArray*) someLocations: (NSString*) selectedState;
- (NSArray*) allLocations;



@end
