#requires -Version 5.1
<#
.SYNOPSIS
    Installs the Phosphor theme for JDownloader 2 and patches JDownloader.jar so
    download-link progress bars inherit the theme foreground color.

.DESCRIPTION
    1. Creates a timestamped backup of JDownloader.jar.
    2. Copies FlatPhosphor.jar into <JD>\libs\laf\
    3. Patches ExtProgressColumn.class inside JDownloader.jar:
       ExtProgressColumn.getDefaultForeground() hardcodes a black/white contrast
       color that ignores the LookAndFeel. The patch makes it return null so bars
       inherit the theme foreground.
       Byte pattern patched (unique match required):
         aload_0; invokevirtual getDefaultBackground; invokestatic getContrastBWColor; areturn
       -> replaced with: aconst_null; areturn (+ nops)

    JDownloader auto-updates revert this patch: re-run the script after updates.

.PARAMETER ThemeJar
    Path to FlatPhosphor.jar. Defaults to .\FlatPhosphor.jar next to this script.

.PARAMETER JdDir
    JDownloader 2 installation folder. Defaults to %LOCALAPPDATA%\JDownloader 2.

.PARAMETER SkipThemeCopy
    Only run the bytecode patch.

.EXAMPLE
    .\Install-Phosphor.ps1 -ThemeJar .\FlatPhosphor.jar
#>
[CmdletBinding()]
param(
    [string]$ThemeJar,
    [string]$JdDir = (Join-Path $env:LOCALAPPDATA "JDownloader 2"),
    [switch]$SkipThemeCopy
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Test-JdRunning {
    Get-Process -Name "JDownloader2", "JDownloader", "updateJDownloader" -ErrorAction SilentlyContinue
}

if (Test-JdRunning) {
    Write-Error "JDownloader is running. Close it completely (including tray icon) and re-run."
}

$jarPath = Join-Path $JdDir "JDownloader.jar"
if (-not (Test-Path -LiteralPath $jarPath)) {
    Write-Error "JDownloader.jar not found at: $jarPath (use -JdDir to point at your install)"
}

# --- 1. backup ---------------------------------------------------------------
$bak = "$jarPath.bak-" + (Get-Date -Format "yyyyMMdd-HHmmss")
Copy-Item -LiteralPath $jarPath -Destination $bak -Force
Write-Host "[ok] backup -> $(Split-Path -Leaf $bak)"

# --- 2. install theme jar ----------------------------------------------------
if (-not $SkipThemeCopy) {
    if (-not $ThemeJar) { $ThemeJar = Join-Path $PSScriptRoot "FlatPhosphor.jar" }
    if (-not (Test-Path -LiteralPath $ThemeJar)) {
        Write-Error "FlatPhosphor.jar not found at: $ThemeJar"
    }
    $lafDir = Join-Path $JdDir "libs\laf"
    if (-not (Test-Path -LiteralPath $lafDir)) { Write-Error "LAF folder not found: $lafDir" }
    Copy-Item -LiteralPath $ThemeJar -Destination (Join-Path $lafDir "FlatPhosphor.jar") -Force
    Write-Host "[ok] theme installed -> $lafDir\FlatPhosphor.jar"
}

# --- 3. patch JDownloader.jar ------------------------------------------------
$entryName = "org/appwork/swing/exttable/columns/ExtProgressColumn.class"

$zip = [System.IO.Compression.ZipFile]::Open($jarPath, "Update")
try {
    $entry = $zip.GetEntry($entryName)
    if (-not $entry) { Write-Error "Entry not found in jar: $entryName" }

    $ms = New-Object System.IO.MemoryStream
    $s = $entry.Open()
    $s.CopyTo($ms); $s.Dispose()
    $bytes = $ms.ToArray(); $ms.Dispose()

    # find unique pattern: 2A B6 ?? ?? B8 ?? ?? B0
    $hits = @()
    for ($i = 0; $i -le $bytes.Length - 8; $i++) {
        if ($bytes[$i] -eq 0x2A -and $bytes[$i+1] -eq 0xB6 -and
            $bytes[$i+4] -eq 0xB8 -and $bytes[$i+7] -eq 0xB0) {
            $hits += $i
        }
    }

    if ($hits.Count -gt 1) {
        Write-Error ("Pattern matched {0} times - aborting, nothing was modified." -f $hits.Count)
    }

    if ($hits.Count -eq 0) {
        # maybe already patched: look for 01 B0 followed by six 0x00
        for ($i = 0; $i -le $bytes.Length - 8; $i++) {
            if ($bytes[$i] -eq 0x01 -and $bytes[$i+1] -eq 0xB0 -and
                $bytes[$i+2] -eq 0x00 -and $bytes[$i+3] -eq 0x00 -and
                $bytes[$i+4] -eq 0x00 -and $bytes[$i+5] -eq 0x00 -and
                $bytes[$i+6] -eq 0x00 -and $bytes[$i+7] -eq 0x00) {
                Write-Host "[ok] already patched - nothing to do"
                return
            }
        }
        Write-Error "Pattern not found - unsupported JDownloader version. Nothing was modified."
    }

    $off = $hits[0]
    $replacement = [byte[]](0x01, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)  # aconst_null; areturn; nop x6
    for ($k = 0; $k -lt 8; $k++) { $bytes[$off + $k] = $replacement[$k] }

    $entry.Delete()
    $newEntry = $zip.CreateEntry($entryName)
    $os = $newEntry.Open()
    $os.Write($bytes, 0, $bytes.Length)
    $os.Dispose()

    Write-Host ("[ok] patched ExtProgressColumn.getDefaultForeground() at offset {0}" -f $off)
}
finally {
    $zip.Dispose()
}

Write-Host ""
Write-Host "Done. Start JDownloader 2, then select:"
Write-Host "  Settings > User Interface > Look and Feel > Phosphor"
