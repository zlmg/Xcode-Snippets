// Objective-C -isEqual: and -hash Methods
// Check equality of two objects.
//
// IDECodeSnippetCompletionPrefix: isEqual
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: 5A5D2E4F-F69C-44EF-B8DB-2A8BD47343BC
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        return <#comparison expression#>;
    }
}

- (NSUInteger)hash
{
    return <#hash expression#>;
}
