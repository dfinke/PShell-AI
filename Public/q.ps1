function q {
    if(-not $Args) {
        Write-Host "Usage: q <question>"
        break
    }

    $spectreInstalled = $null -ne (Get-Command Format-SpectrePanel -ErrorAction SilentlyContinue)

    $prompt = $args -join ' '

    $instructions = @"
You are a terminal assistant. Turn the natural language instructions into a terminal command. 

By default use PowerShell unless otherwise specified. Always only output code, no usage, explanation or examples. 

- just the code
- no fence blocks

However, if the user is clearly asking a question then answer it very briefly and well.
"@

    $agent = New-Agent -Instructions $instructions -LLM(New-OpenAIChat -model (Get-DefaultModel))
    
    While ($true) { 
        $agentResponse = $agent | Get-AgentResponse $prompt
        # Write-Host $agentResponse
        # Write-Host -ForegroundColor Cyan "Follow up, Enter to copy & quit, Ctrl+C to quit."

        if ($spectreInstalled) {
            Format-SpectrePanel -Data (Get-SpectreEscapedText -Text $agentResponse) -Title "Agent Response" -Border "Rounded" -Color "Blue"

            Format-SpectrePanel -Data "Follow up, Enter to copy & quit, Ctrl+C to quit." -Title "Next Steps" -Border "Rounded" -Color "Cyan1"
        }
        else {
            Write-Host $agentResponse
            Write-Host -ForegroundColor Green "Follow up, Enter to copy & quit, Ctrl+C to quit."
        }

        $prompt = Read-Host '> '
        if ([string]::IsNullOrEmpty($prompt)) {
            if ($spectreInstalled) {
                Format-SpectrePanel -Data "Copied to clipboard." -Title "Information" -Border "Rounded" -Color "Green"
            }
            else {
                Write-Host -ForegroundColor Green "Copied to clipboard."
            }
            $agentResponse | Set-Clipboard

            break            
        }
    }
}