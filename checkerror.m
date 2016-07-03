// checkerror
// 
//
// IDECodeSnippetIdentifier: 65FA9B29-1F35-4040-9DEC-0CB09F706D33
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
<<<<<<< HEAD
// checkerror
// 
//
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: C46BB10A-9291-449C-85ED-A58D6279D789
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
=======
>>>>>>> parent of 3e71b38... Imported user code snippets
---
title: "CheckError"
summary: "Function that extracts human-readable information from OSStatus codes."
credit: "'Learning Core Audio: A Hands-on Guide to Audio Programming for Mac and iOS', by Chris Adamson, Kevin Avila"
completion-scopes:
  - Code Expression
  - Function or Method
---

static void CheckError(OSStatus error, const char *operation) {
    if (error == noErr) {
      return;
    }

    char str[20];
    *(UInt32 *) (str + 1) = CFSwapInt32HostToBig(error);
    if (isprint(str[1]) && isprint(str[2]) && isprint(str[3]) && isprint(str[4])) {
        str[0] = str[5] = '\'';
        str[6] = '\0';
    } else {
        sprintf(str, "%d", (int)error);
    }

    fprintf(stderr, "[Error] %s (%s)\n", operation, str);
    exit(1);
}
