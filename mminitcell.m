// mminitcell
// 
//
// IDECodeSnippetCompletionPrefix: mminitcell
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: 8DEEECC9-AA8C-4033-96BB-29E494BAD19C
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 0
- (void)initCell {
    <#code#>
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
}

- (void)awakeFromNib {
    [self initCell];
}
