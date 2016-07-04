+ (void)pluginDidLoad:(NSBundle *)plugin {
    NSArray *allowedLoaders = [plugin objectForInfoDictionaryKey:@"me.delisa.XcodePluginBase.AllowedLoaders"];
    if ([allowedLoaders containsObject:[[NSBundle mainBundle] bundleIdentifier]]) {
        sharedPlugin = [[self alloc] initWithBundle:plugin];
    }
}

@implementation MMCodeFileManager

+ (BOOL)saveText:(NSString *)text toRepositoryPath:(NSString *)repositoryPath folderName:(NSString *)folderName fileName:(NSString *)fileName error:(NSError *__autoreleasing *)error {
    folderName = folderName.length > 0 ?@"": @"aTestFolder";
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