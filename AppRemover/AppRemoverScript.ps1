#Requires -Version 5

Write-Host -ForegroundColor Green "Starting . . ."

$crapApps = Get-Content $PSScriptRoot\AppList.txt

foreach ($app in $crapApps) {
    Write-Host -ForegroundColor Green "Trying to remove $app . . ."
    Try {
        Get-AppxPackage *$app* | Remove-AppxPackage
    } Catch {
        $ErrorMessage = $_.Exception.Message
        Write-Host $ErrorMessage
    }
}

Write-Host -ForegroundColor Green "Done!"