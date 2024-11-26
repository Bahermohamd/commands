@echo off



:: branches list
set list=1
:: devices list
set pos=11 12 

(for %%b in (%list%) do (
	echo Branch %%b
	(for %%m in (%pos%) do (
 	psexec \\10.20.%%b.%%m Reg import c:\WebviewFix.reg
	))
	))