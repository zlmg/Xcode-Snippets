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

#pragma mark - NSTextView Action
- (void)nsmenuDidAddItemAction:(NSNotification *)noti {
    if ([noti.object isKindOfClass:[NSMenu class]]) {
        NSMenu *menu = (NSMenu *)noti.object;
        if (menu && menu.itemArray.count > 0) {
            
            NSLog(@"noti = %@",noti);
            
            NSMenuItem *actionMenuItem = [menu itemWithTitle:@"SyncSelectedTextToGithub"];
            NSMenuItem *copyItem = [menu itemWithTitle:@"Copy"];
            if (copyItem && !actionMenuItem) {
                actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"SyncSelectedTextToGithub" action:@selector(syncSelectedText:) keyEquivalent:@""];
                actionMenuItem.target = self;
                [menu addItem:actionMenuItem];
            }
        }
    }
}

//
//  ACCodeSnippetRepositoryPlugin.h
//  ACCodeSnippetRepository
//
//  Created by Arnaud Coomans on 12/02/14.
//  Copyright (c) 2014 Arnaud Coomans. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "ACCodeSnippetRepositoryConfigurationWindowController.h"

@interface ACCodeSnippetRepositoryPlugin : NSObject <NSWindowDelegate, ACCodeSnippetRepositoryConfigurationWindowControllerDelegate>

@property (nonatomic, strong) NSTimer *updatesTimer;

@end