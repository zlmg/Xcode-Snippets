// Core Data Property Accessors (Scalar Type)
// The getter and setter for a property with a scalar type.
//
// IDECodeSnippetCompletionPrefix: 
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: BF09FE0E-C5F7-49D0-BF11-ACAE2365593D
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (<#propertyScalarType#>)<#propertyName#>
{
    [self willAccessValueForKey:@"<#propertyName#>"];
    <#propertyScalarType#> value = <#propertyName#>;
    [self didAccessValueForKey:@"<#propertyName#>"];
    return value;
}

- (void)set<#CapitalizedPropertyName#>:(<#propertyScalarType#>)value
{
    [self willChangeValueForKey:@"<#propertyName#>"];
    <#propertyName#> = value;
    [self didChangeValueForKey:@"<#propertyName#>"];
}
