# Define the URLs for the two scripts on GitHub
$script1Url = "https://raw.githubusercontent.com/MelosBucinca/VulnAssess/main/MainWindows_hardening.ps1"
$script2Url = "https://raw.githubusercontent.com/MelosBucinca/VulnAssess/main/MainVulnAssess.ps1"

# Define a function to run a script and prompt the user to continue
function RunScript($scriptUrl) {
    Write-Host "Running script from URL: $scriptUrl"
    Invoke-Expression (Invoke-WebRequest @webRequestSplat -Uri $scriptUrl).Content
    Read-Host "Press any key to continue..."
}

# Define web request options for basic parsing
$webRequestSplat = @{
    UseBasicParsing = $true
}

# Loop until the user chooses to exit
while ($true) {
    # Prompt the user for which script they want to run
    $choice = Read-Host "Which script do you want to run? Enter 1 for Windows Defender Hardening, 2 for Vulnerability Assessment, or Q to quit"

    if ($choice -eq "1") {
        # Run the first script
        RunScript $script1Url
    }
    elseif ($choice -eq "2") {
        # Run the second script
        RunScript $script2Url
    }
    elseif ($choice -eq "Q" -or $choice -eq "q") {
        # Exit the loop and end the script
        break
    }
    else {
        # Invalid input
        Write-Host "Invalid choice. Please enter 1 or 2, or Q to quit."
    }
}