echo off
if exist "%ProgramFiles(x86)%\MSBuild\14.0\" (
    echo found MSBuild version 14.0
    set libsass_MSBuild="%ProgramFiles(x86)%\MSBuild\14.0\Bin\MSBuild"
) else (
    echo found MSBuild version 12.0
    set libsass_MSBuild="%ProgramFiles(x86)%\MSBuild\12.0\Bin\MSBuild"
)

if exist "%ProgramFiles(x86)%\MSBuild\Microsoft.Cpp\v4.0\v141" (
    echo found platform toolset v141
    set libsass_Toolset=v141
    set "VCTargetsPath=%ProgramFiles(x86)%\MSBuild\Microsoft.Cpp\v4.0\v141\"
) else if exist "%ProgramFiles(x86)%\MSBuild\Microsoft.Cpp\v4.0\v140" (
    echo found platform toolset 140
    set libsass_Toolset=v140    
    set "VCTargetsPath=%ProgramFiles(x86)%\MSBuild\Microsoft.Cpp\v4.0\v140\"
)

:: 32-bits debug build:
%libsass_MSBuild% libsass.sln /p:LIBSASS_STATIC_LIB=1 /p:Configuration=Debug /p:Platform="Win32" /p:PlatformToolset=%libsass_Toolset%

:: 32-bits release build:
%libsass_MSBuild% libsass.sln /p:LIBSASS_STATIC_LIB=1 /p:Configuration=Release /p:Platform="Win32" /p:PlatformToolset=%libsass_Toolset%

:: 64-bits debug build:
%libsass_MSBuild% libsass.sln /p:LIBSASS_STATIC_LIB=1 /p:Configuration=Debug /p:Platform="Win64" /p:PlatformToolset=%libsass_Toolset%

:: 64-bits release build:
%libsass_MSBuild% libsass.sln /p:LIBSASS_STATIC_LIB=1 /p:Configuration=Release /p:Platform="Win64" /p:PlatformToolset=%libsass_Toolset%
