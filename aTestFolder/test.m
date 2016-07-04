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