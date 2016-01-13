//
//  CITDatabaseSchema.h
//  DatabaseSample
//
//  Created by Henrique Gouveia on 12/1/15.
//  Copyright © 2015 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CITDatabaseManager.h"

@interface CITDatabaseSchema : NSObject <CITDatabaseSchema, CITDatabaseSchemaMigration>

@end
