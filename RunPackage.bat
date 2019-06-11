net use x: \\10.125.153.15\w$\FTP_Data\dpsa_w /user:vulindlelaprd\vulshrp VULSHRP

rem - get the year from the first file, and the Fourth Token
FOR %%F IN (x:\*.*) DO (
 set filename=%%F
 goto getYear
)
:getYear
FOR /f "tokens=4 delims=^" %%a IN ("%filename%") DO (
 set daYear=%%a
)
IF NOT DEFINED daYear (set daYear=2019)

net use w: \\10.125.153.15\w$\Vulindlela_Downloads\apps\placeholder\SHRP\%daYear% /user:vulindlelaprd\vulshrp VULSHRP

dtexec /FILE "C:\FileMover SHRP\Package.dtsx" /CONFIGFILE "C:\FileMover SHRP\SHRP Mover.dtsConfig"  /CHECKPOINTING OFF  /REPORTING EWCD
net use x: /delete
net use w: /delete