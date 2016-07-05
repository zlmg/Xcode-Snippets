// singleton
// 
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: C13CEFFC-2198-4F69-B9A8-CEA51C8A7045
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
<<<<<<< HEAD
// singleton
// 
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 373EBF67-7326-40BA-BECF-D72D7B6C36DA
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
=======
>>>>>>> parent of 3e71b38... Imported user code snippets
---
title: "Shared Singleton"
summary: "Class method that returns a singleton instance"
completion-scope: Class Implementation
---

+ (instancetype)shared<#name#> {
    static <#class#> *_shared<#name#> = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared<#name#> = <#initializer#>;
    });

    return _shared<#name#>;
}
