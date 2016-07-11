// mminitView
// 
//
// IDECodeSnippetCompletionPrefix: mminitview
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: C5872A81-F766-428C-A5F2-1515079ADF69
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (void)initView {
    <#code#>
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)awakeFromNib {
    [self initView];
}