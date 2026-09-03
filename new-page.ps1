param(
  [Parameter(Mandatory)][string]$Title,
  [ValidateSet('life', 'prints', 'research', 'hobbies', 'art', 'books')]
  [string]$Section = 'life'
)

$slug = $Title.ToLowerInvariant() -replace '[^a-z0-9]+', '-'
$slug = $slug.Trim('-')
$target = Join-Path $PSScriptRoot "_entries/$slug.md"

if (Test-Path -LiteralPath $target) {
  throw "That page already exists: $target"
}

$today = Get-Date
$displayDate = $today.ToString('MMMM dd, yyyy')
$order = $today.ToString('yyyyMMddHHmm')
$safeTitle = $Title.Replace('"', '\"')
$contents = @"
---
title: "$safeTitle"
section: $Section
subtitle: "$displayDate"
tile_text: "$($displayDate.ToUpperInvariant()) - $safeTitle"
order: $order
# image: /assets/images/your-folder/your-image.jpg
# image_alt: "Describe the image"
---

Write your page here. Leave a blank line between paragraphs.
"@

New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
Set-Content -LiteralPath $target -Value $contents -Encoding utf8
Write-Host "Created $target"
