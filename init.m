// init
// 
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: E84A96C0-1050-4F99-AE53-F85E57E2A0B2
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
---
title: "init"
summary: "Designated incantation for your designated initializers"
completion-scope: Function or Method
---

self = [super init];
if (!self) {
  return nil;
}

<#initializations#>

return self;
