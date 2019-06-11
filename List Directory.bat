


@echo off
setlocal disableDelayedExpansion
:: Load the file path "array"
for /f "tokens=1* delims=:" %%A in ('dir /s /b^|findstr /n "^"') do (
  set "file.%%A=%%B"
  set "file.count=%%A"
)

:: Access the values
setlocal enableDelayedExpansion
for /l %%N in (1 1 %file.count%) do echo !file.%%N!

pause