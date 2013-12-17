//
//  Proxy.h
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

#pragma mark FileDownloader

//Subject
@interface FileDownloader : NSObject
-(void) slowDownload;
-(void) fastDownload;
@end

#pragma mark FileDownloaderProxy

//Proxy
@interface FileDownloaderProxy : NSObject
{
@private FileDownloader *_downloader;
}
@property (nonatomic) bool isPremiumUser;
-(void) slowDownload;
-(void) fastDownload;
@end

#pragma mark [Application Interface]

//Application Interface
@interface Proxy : NSObject
@end
