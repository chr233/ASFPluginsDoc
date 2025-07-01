function Get-RepoListFromFile {
    param (
        [string]$filePath,
        [string]$userName
    )
    $lines = Get-Content $filePath | Where-Object { $_.Trim() -ne "" }
    $repoList = @()
    foreach ($line in $lines) {
        $repoList += "$userName/$line"
    }
    return $repoList
}

function Get-GitHubUserName {
    param (
        [string]$token,
        [string]$proxy = $null
    )
    $headers = @{ Authorization = "token $token"; "User-Agent" = "PowerShell" }
    $apiUrl = "https://api.github.com/user"
    $invokeParams = @{ Uri = $apiUrl; Headers = $headers }
    if ($proxy) {
        $invokeParams["Proxy"] = $proxy
    }
    try {
        $user = Invoke-RestMethod @invokeParams
        return $user.login
    }
    catch {
        Write-Error "无法获取用户名，请检查 token 是否有效。"
        return $null
    }
}

function Get-GitHubRepoReadmes {
    param (
        [string]$token,
        [string]$repoFullName,
        [string]$proxy = $null
    )
    $headers = @{ Authorization = "token $token"; "User-Agent" = "PowerShell" }
    $apiUrl = "https://api.github.com/repos/$repoFullName/contents"
    $tmpDir = "tmp"
    if (-not (Test-Path $tmpDir)) {
        New-Item -ItemType Directory -Path $tmpDir | Out-Null
    }
    $invokeParams = @{ Uri = $apiUrl; Headers = $headers }
    if ($proxy) {
        $invokeParams["Proxy"] = $proxy
    }
    try {
        $items = Invoke-RestMethod @invokeParams
        foreach ($item in $items) {
            if ($item.type -eq "file" -and $item.name -match "^README") {
                $outPath = Join-Path $tmpDir $item.name
                if (-not (Test-Path $outPath)) {
                    $downloadParams = @{ Uri = $item.download_url; Headers = $headers }
                    if ($proxy) {
                        $downloadParams["Proxy"] = $proxy
                    }
                    $content = Invoke-RestMethod @downloadParams
                    Set-Content -Path $outPath -Value $content
                }
            }
        }
    }
    catch {
        Write-Host "$repoFullName 获取失败"
    }
}

function Move-ReadmesToDocs {
    param (
        [string]$repoFullName,
        [string]$docsDir = "docs"
    )
    $tmpDir = "tmp"
    $repoName = ($repoFullName -split "/")[-1]
    $targetDir = Join-Path $docsDir $repoName
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }
    Get-ChildItem -Path $tmpDir -Filter "README*" | ForEach-Object {
        $fileName = $_.Name
        $destPath = Join-Path $targetDir $fileName
        Move-Item $_.FullName $destPath -Force
    }
}

function Update-MarkdownIndex {
    param (
        [string]$DocsDir = "docs"
    )
    $indexPath = Join-Path $DocsDir "index.md"

    # 语言映射表
    $langMap = @{
        "README.md"    = "Chinese"
        "README.en.md" = "English"
        "README.ru.md" = "Russian"
    }

    # 收集所有子文件夹
    $folders = Get-ChildItem -Path $DocsDir -Directory | Sort-Object Name

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
                        "en" { $lang = "English" }
                        "ru" { $lang = "Russian" }
                        default { $lang = $code }
                    }
                }
                else {
                    $lang = "Chinese"
                }
            }
            $relPath = "$repoName/$fileName"
            $lines += "- [$fileName]($relPath)（$lang）"
        }
    }

    Set-Content -Path $indexPath -Value $lines -Encoding UTF8
    Write-Host "已生成 $indexPath"
}

function Test {
    param (
        [string]$Token,
        [string]$RepoFileName = "RepoNameList.txt",
        [string]$Proxy = $null,
        [string]$DocsDir = "docs"
    )
    if (-not (Test-Path $RepoFileName)) {
        Write-Error "File $RepoFileName not found!!!"
        exit 1
    }
    $userName = Get-GitHubUserName -token $Token -proxy $Proxy
    if (-not $userName) {
        Write-Error "Can not get GitHub username!!!"
        exit 1
    }
    $repoList = Get-RepoListFromFile -filePath $RepoFileName -userName $userName
    foreach ($repo in $repoList) {
        Write-Host "Processing: $repo"
        Get-GitHubRepoReadmes -token $Token -repoFullName $repo -proxy $Proxy
        Move-ReadmesToDocs -repoFullName $repo -docsDir $DocsDir
    }

    Update-MarkdownIndex -DocsDir $DocsDir
}

# $repoFileName = "RepoNameList.txt"
# if (-not (Test-Path $repoFileName)) {
#     Write-Error "文件 $repoFileName 不存在，请检查脚本目录下是否有该文件。"
#     exit 1
# }
# $repoList =Get-RepoListFromFile -filePath $repoFileName -userName $userName

# $token = ""
# $userName = Get-GitHubUserName -token $token -proxy "http://127.0.0.1:8080"

# foreach($repo in $repoList) {
#     Write-Host "正在处理仓库: $repo"
#     Get-GitHubRepoReadmes -token $token -repoFullName $repo -proxy "http://127.0.0.1:8080"
#     Move-ReadmesToDocs -repoFullName $repo
# }