
//
//  MMCodeFileManager.h
//  XcodePluginDemo
//
//  Created by Allan on 7/4/16.
//  Copyright © 2016 zlmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMCodeFileManager : NSObject

/**
 *  save code text to git repository
 *
 *  @param text           text string
 *  @param repositoryPath git repository path
 *  @param folderName         folder name
 *  @param fileName       file name
 *  @param error          error info
 *
 *  @return save successed/failed
 */
+ (BOOL)saveText:(NSString *)text toRepositoryPath:(NSString *)repositoryPath folderName:(NSString *)folderName fileName:(NSString *)fileName error:(NSError **)error;

@end
