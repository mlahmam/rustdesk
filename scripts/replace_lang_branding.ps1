$files = Get-ChildItem -Path src/lang -Filter *.rs
foreach ($file in $files) {
    $text = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $lines = $text -split "\r?\n"
    $modified = $false
    $newLines = @()
    foreach ($line in $lines) {
        if ($line -match 'RustDesk|rustdesk|Rustdesk') {
            $idx = $line.IndexOf('", "')
            if ($idx -ge 0) {
                $head = $line.Substring(0, $idx + 4)
                $tail = $line.Substring($idx + 4)
                $newTail = $tail -replace 'https://www\.rustdesk\.com','https://sntl.ma'
                $newTail = $newTail -replace 'https://rustdesk\.com','https://sntl.ma'
                $newTail = $newTail -replace 'http://rustdesk\.com','http://sntl.ma'
                $newTail = $newTail -replace 'rustdesk\.com','sntl.ma'
                $newTail = $newTail -replace 'RustDesk','SNTL-RemoteAccess'
                $newTail = $newTail -replace 'Rustdesk','SNTL-RemoteAccess'
                $newTail = $newTail -replace 'rustdesk','sntl-remoteaccess'
                if ($newTail -ne $tail) {
                    $line = $head + $newTail
                    $modified = $true
                }
            }
        }
        $newLines += $line
    }
    if ($modified) {
        $newLines -join "`n" | Set-Content -Path $file.FullName -Encoding UTF8
        Write-Host "Updated $($file.FullName)"
    }
}
