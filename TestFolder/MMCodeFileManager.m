//
//  MMCodeFileManager.m
//  XcodePluginDemo
//
//  Created by Allan on 7/4/16.
//  Copyright © 2016 zlmg. All rights reserved.
//

#import "MMCodeFileManager.h"


@implementation MMCodeFileManager

+ (BOOL)saveText:(NSString *)text toRepositoryPath:(NSString *)repositoryPath folderName:(NSString *)folderName fileName:(NSString *)fileName error:(NSError *__autoreleasing *)error {
    folderName = folderName.length > 0 ? folderName : @"aTestFolder";
    NSString *folderPath = [NSString pathWithComponents:@[repositoryPath, folderName]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *filePath = [NSString pathWithComponents:@[folderPath, fileName]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *textData = [text dataUsingEncoding:NSUTF8StringEncoding];
        [textData writeToFile:filePath atomically:YES];
    } else {
        NSString *fileText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        fileText = [NSString stringWithFormat:@"%@\n\n%@", fileText, text];
        NSData *textData = [fileText dataUsingEncoding:NSUTF8StringEncoding];
        [textData writeToFile:filePath atomically:YES];
    }
    
    return YES;
}

@end