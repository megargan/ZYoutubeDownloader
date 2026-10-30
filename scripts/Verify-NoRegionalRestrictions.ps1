param([Parameter(Mandatory)][string]$Path)

$ErrorActionPreference = 'Stop'
$files = @(Get-ChildItem -LiteralPath $Path -Recurse -File |
    Where-Object { $_.Extension -in '.dll', '.exe' })
if (!$files.Count) { throw "No binaries found in $Path" }

# Internalized dependencies do not appear in .deps.json. Inspect the actual binaries.
$markers = 'Deorcify|SLAVA_UKRAINI|Restricted region|UkraineSupportMessage|UkraineSupportTitle'
$violations = @()
foreach ($file in $files) {
    $bytes = [IO.File]::ReadAllBytes($file.FullName)
    foreach ($content in @(
        [Text.Encoding]::UTF8.GetString($bytes),
        [Text.Encoding]::Unicode.GetString($bytes),
        [Text.Encoding]::Unicode.GetString($bytes, 1, $bytes.Length - 1)
    )) {
        if ($content -match $markers) {
            $violations += "$($file.Name): $($Matches[0])"
        }
    }
}
if ($violations.Count) {
    throw "Regional restriction or message found in binaries: $($violations -join ', ')"
}
Write-Output "Verified $($files.Count) binaries: no regional restriction or support-message markers."
