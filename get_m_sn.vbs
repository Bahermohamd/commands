Set fso = CreateObject ("Scripting.FileSystemObject")
Set stdout = fso.GetStandardStream (1)


on error resume next
strComputer = WScript.Arguments.Item(0)
Set objWMIService = GetObject("winmgmts:" _
  & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\WMI")
Set colMonitors = objWMIService. _
  ExecQuery("SELECT * FROM WmiMonitorID")

For Each objMonitor in colMonitors
  InstanceName = objMonitor.InstanceName
  SerialNumber = ""


  'Convert serial number to ASCII
  For I = 0 To Ubound(objMonitor.SerialNumberID)
    If objMonitor.SerialNumberID(I) <> 0 Then
      SerialNumber = SerialNumber & Chr(objMonitor.SerialNumberID(I))
    End If
  Next


 'tmp = inputBox ("Serial Number:  " & SerialNumber & vbNewLine)
  stdout.WriteLine SerialNumber

Next