//
//  Proxy.m
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

#import "Proxy.h"

#pragma mark FileDownloader

//Subject
@implementation FileDownloader
-(id) init
{
    self = [super init];
    return self;
}
-(void) slowDownload
{
    NSLog(@"Sloooooowly downloading...");
}
-(void) fastDownload
{
    NSLog(@"Shuuuuuh, already downloaded...");
}
@end

#pragma mark FileDownloaderProxy

//Proxy
@implementation FileDownloaderProxy
-(void) fastDownload
{
    if (!_isPremiumUser)
    {
        [self slowDownload];
        return;
    }
    
    if (!_downloader)
        _downloader = [[FileDownloader alloc] init];
    
    [self checkNetworkConnectivity];
    
    [_downloader fastDownload];
}
-(void) slowDownload
{
    if (!_downloader)
        _downloader = [[FileDownloader alloc] init];
    
    [self checkNetworkConnectivity];
    
    [_downloader slowDownload];
}
-(void) checkNetworkConnectivity
{
    NSLog(@"Checking network connectivity...");
}
@end

#pragma mark [Application Interface]

//Application Interface
@implementation Proxy
- (id)init
{
    NSLog(@"Proxy Created");
    
    FileDownloaderProxy *proxy = [[FileDownloaderProxy alloc] init];
    
    NSLog(@"Simple User");
    [proxy setIsPremiumUser:NO];
    [proxy fastDownload];
    
    NSLog(@"Premium User");
    [proxy setIsPremiumUser:YES];
    [proxy fastDownload];
    
    NSLog(@"\n");
    return self;
}
@end
