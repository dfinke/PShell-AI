function q {
    $prompt = $args -join ' '

    $instructions = "Use PowerShell unless otherwise specified."
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

#q what is the capital of "france"
# q what is the structure of a powershell module
# q print my local ip formatted like so - ip: [0] - for my windows machine
# q merge a branch as a single commit
