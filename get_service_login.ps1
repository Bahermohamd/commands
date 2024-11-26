function Add-RightToUser([string] $Username, $Right) {
    $tmp = New-TemporaryFile

    $TempConfigFile = "$tmp.inf"
    $TempDbFile = "$tmp.sdb"

    Write-Host "Getting current policy"
    secedit /export /cfg $TempConfigFile

    $sid = ((New-Object System.Security.Principal.NTAccount($Username)).Translate([System.Security.Principal.SecurityIdentifier])).Value

    $currentConfig = Get-Content -Encoding ascii $TempConfigFile

    $newConfig = $null

    if ($currentConfig | Select-String -Pattern "^$Right = ") {
        if ($currentConfig | Select-String -Pattern "^$Right .*$sid.*$") {
            Write-Host "Already has right"
        }
        else {
            Write-Host "Adding $Right to $Username"

            $newConfig = $currentConfig -replace "^$Right .+", "`$0,*$sid"
        }
    }
    else {
        Write-Host "Right $Right did not exist in config. Adding $Right to $Username."

        $newConfig = $currentConfig -replace "^\[Privilege Rights\]$", "`$0`n$Right = *$sid"
    }

    if ($newConfig) {
        Set-Content -Path $TempConfigFile -Encoding ascii -Value $newConfig

        Write-Host "Validating configuration"
        $validationResult = secedit /validate $TempConfigFile

        if ($validationResult | Select-String '.*invalid.*') {
            throw $validationResult;
        }
        else {
            Write-Host "Validation Succeeded"
        }

        Write-Host "Importing new policy on temp database"
        secedit /import /cfg $TempConfigFile /db $TempDbFile

        Write-Host "Applying new policy to machine"
        secedit /configure /db $TempDbFile /cfg $TempConfigFile

        Write-Host "Updating policy"
        gpupdate /force

        Remove-Item $tmp* -ea 0
    }
}


Add-RightToUser -Username 'othaimegypt\baher.mohamed' -Right 'SeServiceLogonRight'