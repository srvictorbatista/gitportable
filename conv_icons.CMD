rem a etapa de conversão foi suprimida por apenas altear a extenção do arquivo. Para se seja feita uma conversao real, é necessario um aplicativo adicional 
:: powershell -Command "Add-Type -AssemblyName System.Drawing; Get-ChildItem -File | Where-Object { $_.Extension -match '(\.png|\.jpg|\.jpeg|\.bmp|\.gif|\.tiff|\.webp)$' } | ForEach-Object { Write-Host 'Converting:' $_.FullName; $outputFile = [System.IO.Path]::Combine($_.DirectoryName, $_.BaseName + '.ico'); (New-Object System.Drawing.Bitmap $_.FullName).Save($outputFile,[System.Drawing.Imaging.ImageFormat]::Icon) }"

powershell -Command "if (-not (Test-Path \"C:\Users\$env:USERNAME\Pictures\icons\")) { New-Item -ItemType Directory -Path \"C:\Users\$env:USERNAME\Pictures\icons\" }; Get-ChildItem *.ico | ForEach-Object { Copy-Item $_.FullName -Destination \"C:\Users\$env:USERNAME\Pictures\icons\" }"


