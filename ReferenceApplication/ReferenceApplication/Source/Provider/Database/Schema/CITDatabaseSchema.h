//
//  CITDatabaseSchema.h
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CITDatabaseProvider.h"

@interface CITDatabaseSchema : NSObject <CITDatabaseSchema, CITDatabaseSchemaMigration>

@end
