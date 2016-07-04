// aTestFolder/test
// 
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: B15B509D-C0A6-4FD3-8FB9-8569EB3609F1
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
#pragma mark - NSTextView Action
- (void)selectionDidChange:(NSNotification *)noti {
    if ([noti.object isKindOfClass:[NSTextView class]]) {
        NSTextView *textView = (NSTextView *)noti.object;
        
        NSArray* selectedRanges = [textView selectedRanges];
        if (selectedRanges.count == 0) {
            return;
        }
        
        NSRange selectedRange = [[selectedRanges objectAtIndex:0] rangeValue];
        NSString* text = textView.textStorage.string;
        self.selectedText = [text substringWithRange:selectedRange];
    }
}

- (void)syncSelectedText:(id)sender {
    id<ACCodeSnippetDataStoreProtocol> dataStore = [[NSClassFromString(@"IDECodeSnippetRepository") sharedRepository] dataStores].firstObject;
    
    NSData *textData = [self.selectedText dataUsingEncoding:NSUTF8StringEncoding];
    NSString *folderName = [NSString pathWithComponents:@[dataStore.localRepositoryPath, @"aTestFolder"]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:folderName]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:folderName withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *fileName = [NSString pathWithComponents:@[folderName, @"test.m"]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        [textData writeToFile:fileName atomically:YES];
    } else {
        NSLog(@"file exists");
        NSString *text = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
        text = [NSString stringWithFormat:@"%@\n\n%@", text, self.selectedText];
        NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
        [data writeToFile:fileName atomically:YES];
    }
    [self updateAction:nil];
}

#pragma mark - NSTextView Action
- (void)selectionDidChange:(NSNotification *)noti {
    if ([noti.object isKindOfClass:[NSTextView class]]) {
        NSTextView *textView = (NSTextView *)noti.object;
        
        NSArray* selectedRanges = [textView selectedRanges];
        if (selectedRanges.count == 0) {
            return;
        }
        
        NSRange selectedRange = [[selectedRanges objectAtIndex:0] rangeValue];
        NSString* text = textView.textStorage.string;
        self.selectedText = [text substringWithRange:selectedRange];
    }
}
