@{
    RootModule        = 'PShell-AI.psm1'
    ModuleVersion     = '0.2.5'
    GUID              = '68e0c6dd-369a-4899-9fe7-c53deeef185d'
    Author            = 'Douglas Finke'
    CompanyName       = 'Doug Finke'
    Copyright         = '© 2024 All rights reserved.'

    Description       = @'
Is a minimal, powerful AI assistant in your console
'@

    PowerShellVersion = '5.1'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules   = @(
        @{ModuleName = 'PSAI'; ModuleVersion = "0.1.0" ; GUID = "68662d19-a8f1-484f-b1b7-3bf0e8a436df" }
    )
    FunctionsToExport = @(
        'Get-DefaultModel',
        'Set-DefaultModel',
        'q'
    )

    AliasesToExport   = @(    )

    PrivateData       = @{
        PSData = @{
            Category   = "PShell AI Assistant Module"
            Tags       = @("PowerShell", "GPT", "OpenAI", "Assistant")
            ProjectUri = "https://github.com/dfinke/PShell-AI"
            LicenseUri = "https://github.com/dfinke/PShell-AI/blob/main/LICENSE"
            IconUri    = 'https://github.com/dfinke/PShell-AI/blob/0b2185936af2e0016f4748c7abec8c395356060f/media/PShell-AI.png'
        }
    }
}