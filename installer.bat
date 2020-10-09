@rem author: Kasin Sparks
@rem collaborator: Jerin Sparks
@rem version: 1.0
@rem date: 9 March 19

@echo off
color 2

echo --------------------------------------------------------------------------------
echo                                     WARNING!
echo                 Your mods and config folder will be OVERWRITTEN!                          
echo --------------------------------------------------------------------------------

:loop
set /p opt=Do you wish to continue? (Y/N):

if "%opt%" == "y" (
	set opt=Y
) else if "%opt%" == "n" (
	set opt=N
)


if "%opt%" == "Y" (
	goto continue
) else if "%opt%" == "N" (
	exit
)
goto loop

:continue

echo --------------------------------------------------------------------------------
echo                     DarkLight Matrix Executable Initialized.
echo --------------------------------------------------------------------------------

if exist "%userprofile%\AppData\Roaming\.minecraft" (
	echo What is real? 
	echo How do you define 'real'? 
	echo If you're talking about what you can feel...
	echo what you can smell...
	echo what you can taste and see...
	echo then 'real' is simply electrical signals interpreted by your brain. -Morpheus
	if exist "%userprofile%\AppData\Roaming\.minecraft\config" (
		rmdir /s /q "%userprofile%\AppData\Roaming\.minecraft\config"
	)
	
	if exist "%userprofile%\AppData\Roaming\.minecraft\mods" (
		rmdir /s /q "%userprofile%\AppData\Roaming\.minecraft\mods"
	)

	WinRAR.exe x -ibck "%CD%"\minecraft.rar . "%userprofile%\AppData\Roaming\.minecraft\"
	WinRAR.exe x -ibck "%CD%"\mods.rar . "%userprofile%\AppData\Roaming\.minecraft\"
	WinRAR.exe x -ibck "%CD%"\config.rar . "%userprofile%\AppData\Roaming\.minecraft\"
	
	@rem minecraft forge server will detect if files were not unpacked when started
) else (
	echo                        You must of taken the blue pill...
	echo                            Please install Minecraft.
	echo --------------------------------------------------------------------------------
	pause
	exit
)

if exist "%userprofile%\AppData\Roaming\.minecraft\versions\1.7.10-Forge10.13.4.1614-1.7.10" (
	echo --------------------------------------------------------------------------------
	echo                        Forge has already been installed!
) else (
	echo --------------------------------------------------------------------------------
	echo                                We got trouble...
	echo          Please ensure that the forge install directory is as follows: 
	echo                  "%userprofile%\AppData\Roaming\.minecraft"
	echo --------------------------------------------------------------------------------
	forge-1.7.10-10.13.4.1614-1.7.10-installer-win.exe
	pause
	echo --------------------------------------------------------------------------------
	if exist "%userprofile%\AppData\Roaming\.minecraft\versions\1.7.10-Forge10.13.4.1614-1.7.10" (
		echo                            Forge has been installed!
		del /q "forge-1.7.10-10.13.4.1614-1.7.10-installer-win.exe.log"
	) else (
		echo                            Forge can't be installed!
		echo                         Contact Aotyrek For Assistance.
		echo --------------------------------------------------------------------------------
		pause
		exit
	)
)
echo --------------------------------------------------------------------------------
echo I'm trying to free your mind, %username%...
echo But I can only show you the door...
echo You're the one that has to walk through it -Morpheus
echo --------------------------------------------------------------------------------
echo                         Welcome to the Matrix %username%
echo --------------------------------------------------------------------------------
pause
