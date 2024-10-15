function q {
    [CmdletBinding()]
    param ()

    $prompt = $args -join ' '

    $instructions = @"
You are an expert software engineer and polyglot.
Use PowerShell unless otherwise specified.

Respond with consise, accurate, and complete answers.

- just the code
- no fence blocks
"@
    $agent = New-Agent -Instructions $instructions 
    
    While ($true) { 
        $agentResponse = $agent | Get-AgentResponse $prompt
        Write-Host $agentResponse
        Write-Host -ForegroundColor Cyan "Follow up, Enter to copy & quit, Ctrl+C to quit."

        $prompt = Read-Host '> '
        if ([string]::IsNullOrEmpty($prompt)) {
            Write-Host -ForegroundColor Green "Copied to clipboard."
            $agentResponse | clip
            break            
        }
    }
}