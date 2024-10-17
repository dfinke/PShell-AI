$script:defaultModel = 'gpt-4o-mini'

. $PSScriptRoot\Public\q.ps1

function Get-DefaultModel {
    $script:defaultModel
}

function Set-DefaultModel {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("gpt-3.5-turbo-0125", "gpt-3.5-turbo-0613", "gpt-3.5-turbo-1106", "gpt-3.5-turbo-16k-0613", "gpt-3.5-turbo-16k", "gpt-3.5-turbo", "gpt-4-0125-preview", "gpt-4-0314", "gpt-4-0613", "gpt-4-1106-preview", "gpt-4-32k-0314", "gpt-4-32k-0613", "gpt-4-32k", "gpt-4-turbo-2024-04-09", "gpt-4-turbo-preview", "gpt-4-turbo", "gpt-4-vision-preview", "gpt-4", "gpt-4o-2024-05-13", "gpt-4o-2024-08-06", "gpt-4o-mini-2024-07-18", "gpt-4o-mini", "gpt-4o", "o1-mini-2024-09-12", "o1-mini", "o1-preview-2024-09-12", "o1-preview")]
        [string]$model
    )

    Write-Verbose "Setting default model to $model"
    $script:defaultModel = $model
}
