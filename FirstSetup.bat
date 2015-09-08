echo "Running script..."
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/ktoll2/RandomCode/master/Powershell/AutoInstalls/AutoInstalls/SPCStart.ps1')"
echo "All done."
