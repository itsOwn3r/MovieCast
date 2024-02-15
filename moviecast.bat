@echo off
setlocal enabledelayedexpansion

set "SEARCHTEXT=."
set "REPLACETEXT= "

set movie=%~nx1
set "modified=!movie:%SEARCHTEXT%=%REPLACETEXT%!"
for /f "tokens=4 delims=." %%a in ("!modified!") do (
    set "year=%%a"
)

set "wordsBeforeYear=!modified:%year%=!"

set string=%modified%


set t=%string%
:loop
for /f "tokens=1*" %%a in ("%t%") do (
   set "word=%%a"
    if "!word!"=="1080p" (
        call set "name=%%name%% cast"
        goto :Done
    )
    if "!word!"=="720p" (
        call set "name=%%name%% cast"
        goto :Done
    )
    if "!word!"=="480p" (
        call set "name=%%name%% cast"
        goto :Done
    )
   call set "name=%%name%% %%a"
   set t=%%b
   )
if defined t goto :loop
   :Done
   start "" "https://www.google.com/search?q=%name%&sourceid=chrome&ie=UTF-8&clie=1"
   echo Hello

endlocal



