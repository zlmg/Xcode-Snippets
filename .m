// 
// MMCodeFileManager.m
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 4DA9BC1B-6404-469A-8C70-8D16452E446E
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2

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
