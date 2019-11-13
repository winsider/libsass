@echo off
echo Staging include folder...
NuGet.exe pack libsass-common.nuspec -OutputDirectory builds\nuget\x86_64
NuGet.exe pack libsass-win-vc140.nuspec -OutputDirectory builds\nuget\x86_64
