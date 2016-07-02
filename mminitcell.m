// mminitcell
// 
//
// IDECodeSnippetCompletionPrefix: mminitcell
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: FD89A121-DAE8-4027-A831-D384F7A833A1
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 0
/// Initialization code
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
