$docsDir = "docs"
$indexPath = Join-Path $docsDir "index.md"

# 语言映射表
$langMap = @{
    "README.md"      = "Chinese"
    "README.en.md"   = "English"
    "README.ru.md"   = "Russion"
}

# 收集所有子文件夹
$folders = Get-ChildItem -Path $docsDir -Directory | Sort-Object Name

$lines = @("# 仓库文档索引", "")

foreach ($folder in $folders) {
    $repoName = $folder.Name
    $readmes = Get-ChildItem -Path $folder.FullName -Filter "README*.md" | Sort-Object Name
    if ($readmes.Count -eq 0) { continue }
    $lines += "## $repoName"
    $lines += ""
    foreach ($readme in $readmes) {
        $fileName = $readme.Name
        $lang = $langMap[$fileName]
        if (-not $lang) {
            # 处理未知语言
            if ($fileName -match "^README\.(\w+)\.md$") {
                $code = $Matches[1]
                switch ($code) {
                    "en" { $lang = "英语" }
                    "ru" { $lang = "俄文" }
                    default { $lang = $code }
                }
            } else {
                $lang = "中文"
            }
        }
        $relPath = "$repoName/$fileName"
        $lines += "- [$fileName]($relPath)（$lang）"
    }
    $lines += ""
}

Set-Content -Path $indexPath -Value $lines -Encoding UTF8
Write-Host "已生成 $indexPath"