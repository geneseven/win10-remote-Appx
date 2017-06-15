#Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

$AppsList = "*3dbuilder*",  # 3D Builder
      "*windowsalarms*",  # 鬧鐘與時鐘APP
      "*windowscalculator*",  # 計算機APP
      "*windowscommunicationsapps*",  # 日曆和信箱APP
      "*windowscamera*",  # 相機APP
      "*officehub*",  # Get Office
      "*skypeapp*", # Get Skype
      "*getstarted*", # Get Started
      "*zunemusic*",  # Groove Music
      "*windowsmaps*",  # 地圖APP
      "*solitairecollection*",  # Microsoft Solitaire Collection
      "*bingfinance*",  # 財經APP
      "*zunevideo*",  # 電影與電視APP
      "*bingnews*", # 新聞APP
      "*onenote*",  # OneNote Mobile
      "*people*", # 聯絡人APP
      "*windowsphone*", # Phone Companion
      "*photos*", # 相片APP
      "*windowsstore*", # Windows Store
      "*bingsports*", # 運動APP
      "*soundrecorder*",  # 錄音APP
      "*bingweather*",  # 天氣APP
      "*xboxapp*" # Xbox APP

ForEach ($App in $AppsList){
  $Packages = Get-AppxPackage -allusers | Where-Object {$_.Name -eq $App}
  if ($Packages -ne $null){
    "Removing Appx Package: $App"
    foreach ($Package in $Packages) { Remove-AppxPackage -package $Package.PackageFullName }
  }
  else { "Unable to find package: $App" }

  $ProvisionedPackage = Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -like $App}
  if ($ProvisionedPackage -ne $null){
    "Removing Appx Provisioned Package: $App"
    remove-AppxProvisionedPackage -online -packagename $ProvisionedPackage.PackageName
  }
  else { "Unable to find provisioned package: $App" }
}

