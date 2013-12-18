//
//  Facade.m
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

#import "Facade.h"

#pragma mark Company's Divisions

//Subsystem
@implementation HumanResourcesDepartment
- (void) fireWorkerWithName:(NSString*)name
{
    NSLog(@"Firing employee: %@", name);
}
@end

//Subsystem
@implementation AccountancyDepartment
- (void) increaseSalaryForEmployee:(NSString*)name { NSLog(@"Increasing salary for: %@", name); }
@end

//Subsystem
@implementation PublicRelationsDepartment
- (void) tvCommercial { NSLog(@"TV Commerial: Everything should be opensource"); }
- (void) freeBeerForEveryone { NSLog(@"Company Policy: Free beer for every employee"); }
@end

#pragma mark The Secretary

//Facade
@implementation Secretary
- (id) initWithHRDep:   (HumanResourcesDepartment*)   hrDep
         accountancy:     (AccountancyDepartment*)      acDep
     publicRelations: (PublicRelationsDepartment*)  prDep
{
    if ([super init] != nil)
    {
        hr = hrDep;
        ac = acDep;
        pr = prDep;
    }
    return self;
}
- (void) fireBestWorker { [hr fireWorkerWithName:@"RocKK"]; }
- (void) giveBossARise { [ac increaseSalaryForEmployee:@"Boss"]; }
- (void) tellEveryoneCompanyIsTheBest
{
    [pr tvCommercial];
    [pr freeBeerForEveryone];
}
- (void) dealloc
{
    hr = nil;
    ac = nil;
    ac = nil;
}
@end

#pragma mark The Boss

//Client
@implementation Boss
- (id) initWithSecretary:(Secretary*)newSecretary
{
    if ([super init] != nil)
    {
        secretary = newSecretary;
    }
    return self;
}
- (void) doMyJob
{
    [secretary giveBossARise];
    [secretary fireBestWorker];
    [secretary tellEveryoneCompanyIsTheBest];
}
- (void) dealloc
{
    secretary = nil;
}
@end

#pragma mark Helpful function

Secretary* buildTheCompany()
{
    HumanResourcesDepartment* hrDep = [HumanResourcesDepartment new];
    AccountancyDepartment* acDep = [AccountancyDepartment new];
    PublicRelationsDepartment* prDep = [PublicRelationsDepartment new];
    Secretary* secretary = [[Secretary alloc] initWithHRDep:hrDep accountancy:acDep publicRelations:prDep];
    return secretary;
}

#pragma mark [Application Interface]

//Application Interface
@implementation Facade

- (id)init
{
    NSLog(@"Facade Created");
    
    Secretary* secretary = buildTheCompany();
    Boss* boss = [[Boss alloc] initWithSecretary:secretary];
    
    [boss doMyJob];
    secretary = nil;
    boss = nil;
    
    NSLog(@"\n");
    return self;
}

@end
