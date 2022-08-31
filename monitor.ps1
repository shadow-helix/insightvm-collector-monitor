$sixHoursAgo = (Get-Date).ToUniversalTime().AddHours(-6).ToString("yyyy-MM-ddTHH:mm:ss.fffZ")

$requestHeader = @{
  "X-Api-Key" = "INSERT-CLOUD-API-KEY-HERE"
  "Content-Type" = "application/json"
}

$requestBody = @{
  "asset" = "last_scan_end > $sixHoursAgo"
} | convertto-json
$scanResults = Invoke-RestMethod "https://eu.api.insight.rapid7.com/vm/v4/integration/assets?includeSame=true&size=1&sort=last_scan_end,desc" -Headers $requestHeader -Body $requestBody -Method POST
$lastCloudImport = $scanResults.data | select -expand last_scan_end

if($lastCloudImport -lt $sixHoursAgo){
  Write-Host "No uploads in past six hours"
}
