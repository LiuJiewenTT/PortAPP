rem   Copyright 2022 LiuJiewenTT
rem   You can find source code here: https://github.com/LiuJiewenTT/PortAPP

rem   Licensed under the Apache License, Version 2.0 (the "License");
rem   you may not use this file except in compliance with the License.
rem   You may obtain a copy of the License at

rem       http://www.apache.org/licenses/LICENSE-2.0

rem   Unless required by applicable law or agreed to in writing, software
rem   distributed under the License is distributed on an "AS IS" BASIS,
rem   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem   See the License for the specific language governing permissions and
rem   limitations under the License.



@echo off
for /f "delims=" %%i in ('hostname') do ( set hn=%%i )
echo Hostname of this PC: %hn%
if exist "%~dp0%hn%" (
call "%~dp0lk.bat" "%~dp0%hn%" 
if ERRORLEVEL 1 (
echo May Fail
) else (
echo Done. Link Established!
)
) else (
echo PortAPP is not apply to this PC.
:clp
choice /M "Enter Y/N to determine if to setup for this PC:"
if ERRORLEVEL 1 (
echo Try to get ready...
mkdir "%~dp0%hn%"
echo Good.
call "%~dp0lk.bat" "%~dp0%hn%" 
if ERRORLEVEL 1 (
echo May Fail
) else (
echo Done. Link Established!
)
) else (
if ERRORLEVEL 2 (
echo Ok, won't start Setup procedure.
) else (
echo Wrong input, enter again!
goto :clp
)
)
)

