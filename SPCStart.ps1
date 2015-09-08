$webclient = New-Object System.Net.WebClient
$folder = "$env:USERPROFILE\Downloads"

function Get-WebFile
{
	param(
		[Parameter(Mandatory = $True)]
			[System.Uri]$url,
		[Parameter(Mandatory = $False)]
			[String]$filename = $($url.Segments[($url.Segments.Count - 1)])
	)
	$webclient = New-Object System.Net.WebClient
	$folder = "$env:USERPROFILE\Downloads"
	$target = "$folder\$filename"

	$webclient.DownloadFile($url,$target)
	return $target
}

Write-Output "Switching numlock on..."
$numlockSwitch = New-Object -ComObject WScript.Shell
$numlockSwitch.SendKeys('{NUMLOCK}')
Write-Output "Done switching on numlock."

Write-Output "Downloading DirectX..."
[System.Uri] $dxurl = "http://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe"
$dxFile = Get-WebFile $dxurl
Write-Output "Done downloading DirectX."
Write-Output "Installing DirectX..."
Start-Process -FilePath $dxFile -ArgumentList /Q -Wait
Write-Output "DirectX Install Complete"

Write-Output "Downloading Steam Client..."
[System.Uri] $steamurl = "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
$steamFile = Get-WebFile $steamurl
Write-Output "Done downloading Steam Client."
Write-Output "Installing Steam Client..."
Start-Process -FilePath $steamFile -Wait
Write-Output "Steam Client Install Complete"
