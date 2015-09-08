echo "Running script..."
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/ktoll2/autoinstall/master/SPCStart.ps1')"
echo "All done."
