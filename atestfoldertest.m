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
