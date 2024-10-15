![alt text](media/PShell-AI-Logo.png)

# PShell-AI

> "Ten minutes of Googling is now ten seconds in the terminal."
>
> ~ John D.

## About
For developers, referencing things online is inevitable – but one can only look up "how to do [X] in docker or git" so many times before losing your mind.

## Install
```powershell
Install-Module PShell-AI -Scope CurrentUser
```

## Usage

### Configuration

Set your [OpenAI API key](https://platform.openai.com/api-keys).

```powershell
$env:OpenAIKey='[your-key]'
```

## Examples

### Shell Commands

`q make a new git branch`

```powershell
git branch new-branch
```

`q find files that contain "administrative" in the name`

```powershell
Get-ChildItem -Path "C:\Path\To\Search" -Filter "*administrative*" -Recurse
```

### Code Snippets

`q initialize a static map in golang`

```powershell
    staticMap := map[string]int{
        "apple":  1,
        "banana": 2,
        "cherry": 3,
    }
```

`q greet fn in PowerShell`

```powershell
function Greet {
    param (
        [string]$Name = "Guest"
    )
    Write-Host "Hello, $Name! Welcome to PowerShell!"
}
```

`q create a generator function in python for dates`

```python
from datetime import datetime, timedelta

def date_generator(start_date, end_date):
    current_date = start_date
    while current_date <= end_date:
        yield current_date
        current_date += timedelta(days=1)
```