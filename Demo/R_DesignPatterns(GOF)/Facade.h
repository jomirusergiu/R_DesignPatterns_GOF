//
//  Facade.h
//  R_DesignPatterns(GOF)
//
//  Created by RocKK on 12/6/13.
//  Copyright (c) 2013 RocKK.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms are permitted
//  provided that the above copyright notice and this paragraph are
//  duplicated in all such forms and that any documentation,
//  advertising materials, and other materials related to such
//  distribution and use acknowledge that the software was developed
//  by the RocKK.  The name of the
//  RocKK may not be used to endorse or promote products derived
//  from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED ''AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import <Foundation/Foundation.h>

#pragma mark Company's Divisions

//Subsystem
@interface HumanResourcesDepartment : NSObject
- (void) fireWorkerWithName:(NSString*)name;
@end

//Subsystem
@interface AccountancyDepartment : NSObject
- (void) increaseSalaryForEmployee:(NSString*)name;
@end

//Subsystem
@interface PublicRelationsDepartment : NSObject
- (void) tvCommercial;
- (void) freeBeerForEveryone;
@end

#pragma mark The Secretary

//Facade
@interface Secretary : NSObject
{
    HumanResourcesDepartment*  hr;
    AccountancyDepartment*     ac;
    PublicRelationsDepartment* pr;
}
- (id) initWithHRDep:   (HumanResourcesDepartment*)   hrDep
         accountancy:     (AccountancyDepartment*)      acDep
     publicRelations: (PublicRelationsDepartment*)  prDep;
- (void) fireBestWorker;
- (void) giveBossARise;
- (void) tellEveryoneCompanyIsTheBest;
@end

#pragma mark The Boss

//Client
@interface Boss : NSObject
{
    Secretary* secretary;
}
- (id)   initWithSecretary:(Secretary*)newSecretary;
- (void) doMyJob;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Facade : NSObject
@end
