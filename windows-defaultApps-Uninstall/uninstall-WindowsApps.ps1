# Copyright (c) 2022 astherier
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#
#uninstall-WindowsApps.ps1
#Windowsを初回インストールした時に自動インストールされる不要なアプリを削除するスクリプト
#最終更新：2022/02/10

# DropboxOEM
Get-AppxPackage C27EB4BA.DropboxOEM* | Remove-AppxPackage -ErrorAction SilentlyContinue

# Game: DragonManiaLegends
Get-AppxPackage A278AB0D.DragonManiaLegends* | Remove-AppxPackage -ErrorAction SilentlyContinue

# Teams
Get-AppxPackage MicrosoftTeams* | Remove-AppxPackage -ErrorAction SilentlyContinue

# DesktopAppInstaller(2022年1月現在アンインストールできない)
# Get-AppxPackage Microsoft.DesktopAppInstaller* | Remove-AppxPackage -ErrorAction SilentlyContinue

# GamingApp
Get-AppxPackage Microsoft.GamingApp | Remove-AppxPackage -ErrorAction SilentlyContinue

# GetHelp
Get-AppxPackage Microsoft.GetHelp* | Remove-AppxPackage -ErrorAction SilentlyContinue

# GetStarted
Get-AppxPackage Microsoft.Getstarted* | Remove-AppxPackage -ErrorAction SilentlyContinue

# Messaging
Get-AppxPackage Microsoft.Messaging* | Remove-AppxPackage -ErrorAction SilentlyContinue

# 3DViewer
Get-AppxPackage Microsoft.Microsoft3DViewer* | Remove-AppxPackage -ErrorAction SilentlyContinue

# OfficeHub
Get-AppxPackage Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage -ErrorAction SilentlyContinue

# StickyNotes
# Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage -ErrorAction SilentlyContinue

# Game: SolitaireCollection
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage -ErrorAction SilentlyContinue

# MSPaint
# Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage -ErrorAction SilentlyContinue

# OneNote
# Get-AppxPackage Microsoft.Office.OneNote* | Remove-AppxPackage -ErrorAction SilentlyContinue

# OneConnect
Get-AppxPackage Microsoft.OneConnect* | Remove-AppxPackage -ErrorAction SilentlyContinue

# People
Get-AppxPackage Microsoft.People* | Remove-AppxPackage -ErrorAction SilentlyContinue

# SkypeApp
Get-AppxPackage Microsoft.SkypeApp* | Remove-AppxPackage -ErrorAction SilentlyContinue

# WebMediaExtensoins
Get-AppxPackage Microsoft.WebMediaExtensions* | Remove-AppxPackage -ErrorAction SilentlyContinue

# WindowsCamera
# Get-AppxPackage Microsoft.WindowsCamera* | Remove-AppxPackage -ErrorAction SilentlyContinue

# FeedbackHub
Get-AppxPackage Microsoft.WindowsFeedbackHub* | Remove-AppxPackage -ErrorAction SilentlyContinue

# Photos
# Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage -ErrorAction SilentlyContinue

# Maps
Get-AppxPackage Microsoft.WindowsMaps* | Remove-AppxPackage -ErrorAction SilentlyContinue

# SoundRecorder
Get-AppxPackage Microsoft.WindowsSoundRecorder* | Remove-AppxPackage -ErrorAction SilentlyContinue

# HolographicFirstRun
Get-AppxPackage Microsoft.Windows.HolographicFirstRun* | Remove-AppxPackage -ErrorAction SilentlyContinue

# Xbox
Get-AppxPackage Microsoft.Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue

# ZuneVideo
Get-AppxPackage Microsoft.ZuneVideo* | Remove-AppxPackage -ErrorAction SilentlyContinue

