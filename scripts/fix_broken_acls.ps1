$endpointAgent = "C:\Windows\System32\asgard2-agent"
$endpointAgentTemp = "C:\Windows\Temp\asgard2-agent"

if (Get-Item -Path $endpointAgent | Get-Acl | where {$_.Access.IsInherited -eq $false}) {
    Write-Host "Endpoint Agent folder permission broken. Trying to fix: $endpointAgent"
    # Set the new Access Rule to inherit permissions
    $newAcl = Get-Acl -Path $endpointAgent
    $newAcl.SetAccessRuleProtection($false, $true)
    Set-Acl $endpointAgent -AclObject $newAcl -WhatIf
}
if (Get-Item -Path $endpointAgentTemp | Get-Acl | where {$_.Access.IsInherited -eq $false}) {
    Write-Host "Endpoint Agent folder permission broken. Trying to fix: $endpointAgentTemp"
    # Set the new Access Rule to inherit permissions
    $newAcl = Get-Acl -Path $endpointAgentTemp
    $newAcl.SetAccessRuleProtection($false, $true)
    Set-Acl $endpointAgentTemp -AclObject $newAcl -WhatIf
}
get-childitem -path $endpointAgent -Recurse -Depth 1 | Get-Acl | where {$_.Access.IsInherited -eq $false} | % {
    $fullPath = Convert-Path $_.Path
    Write-Host "Endpoint Agent folder permission broken. Trying to fix: $fullPath"
    # Set the new Access Rule to inherit permissions
    $newAcl = Get-Acl -Path $_.Path
    $newAcl.SetAccessRuleProtection($false, $true)
    Set-Acl $_.Path -AclObject $newAcl -WhatIf
}