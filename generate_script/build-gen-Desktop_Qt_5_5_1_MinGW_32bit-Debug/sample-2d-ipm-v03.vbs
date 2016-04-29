' ----------------------------------------------
' Script Recorded by Ansoft Maxwell Version 16.0.0
' 1:48:22 下午  一月 15, 2016
' ----------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set args = WScript.Arguments
	If args.Count = 1 Then
       setting= WScript.Arguments(0)
	end if

setting_filename=setting & ".ini"

Dim WMI
Set WMI = GetObject("Winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set cOSs = WMI.ExecQuery("Select Win32_Processor from Win32_Operatingsystem")
Set CPUs = WMI.InstancesOf("Win32_Processor")
For Each ObjCPU In CPUs
CPUx =ObjCPU.NumberOfLogicalProcessors
Next

'=====================================================================
Function GetCfg(strCfg,str)
ON ERROR RESUME Next
GetCfgTmp=""
CfgParts=Split(strCfg,vbCr)
For Each CfgPart In CfgParts
if InStr(CfgPart,"=")>0 Then
Values=Split(CfgPart,"=")
If str=Values(0) Then
GetCfgTmp=Values(1)
Exit For
End If
End If
Next
GetCfg=GetCfgTmp
End Function
'=====================================================================
Function GetCfgMain(strCfgMainFile)
ON ERROR RESUME Next
str=""
Set FSO=CreateObject("Scripting.FileSystemObject")
If Not FSO.FileExists(strCfgMainFile) Then
GetCfgMain=str:Exit Function
End If
Set f=FSO.OpenTextFile(strCfgMainFile,1)
Do While Not f.AtEndOfStream
strTmp=Trim(f.ReadLine)
If strTmp<>"" Then
If Left(strTmp,1)<>"#" And Left(strTmp,2)<>"//" Then
str=str&vbCr&strTmp
End If
End If
Loop
f.Close
GetCfgMain=str
End Function
'=====================================================================

'=====================================================================

function getfolder() 
getfolder=left(wscript.scriptfullname,instrrev(wscript.scriptfullname,"\")-1) 
end function 



'=====================================================================
sub create_folder(path,foldername)
Set objFSO = CreateObject("Scripting.FileSystemObject")
a=path & "/" & foldername
Set objFolder = objFSO.CreateFolder(a)
end sub
'=====================================================================
tmp=GetCfgMain(setting_filename)

'stator'
var_stator_DiaGap=GetCfg(tmp,"var_stator_DiaGap")&"mm"
var_stator_DiaYoke=GetCfg(tmp,"var_stator_DiaYoke")&"mm"
var_stator_Length=GetCfg(tmp,"var_stator_Length")&"mm"
var_stator_Skew=GetCfg(tmp,"var_stator_Skew")&"deg"
var_stator_Slots=GetCfg(tmp,"var_stator_Slots")
var_stator_SlotType=GetCfg(tmp,"var_stator_SlotType")
var_stator_Hs0=GetCfg(tmp,"var_stator_Hs0")&"mm"
var_stator_Hs01=GetCfg(tmp,"var_stator_Hs01")&"mm"
var_stator_Hs1=GetCfg(tmp,"var_stator_Hs1")&"mm"
var_stator_Hs2=GetCfg(tmp,"var_stator_Hs2")&"mm"
var_stator_Bs0=GetCfg(tmp,"var_stator_Bs0")&"mm"
var_stator_Bs1=GetCfg(tmp,"var_stator_Bs1")&"mm"
var_stator_Bs2=GetCfg(tmp,"var_stator_Bs2")&"mm"
var_stator_Rs=GetCfg(tmp,"var_stator_Rs")&"mm"
var_stator_FilletType=GetCfg(tmp,"var_stator_FilletType")
var_stator_HalfSlot=GetCfg(tmp,"var_stator_HalfSlot")
var_stator_SegAngle=GetCfg(tmp,"var_stator_SegAngle")&"deg"
var_stator_LenRegion=GetCfg(tmp,"var_stator_LenRegion")&"mm"
var_stator_InfoCore=GetCfg(tmp,"var_stator_InfoCore")
    
'rotor'
var_rotor_DiaGap=GetCfg(tmp,"var_rotor_DiaGap")&"mm"
var_rotor_DiaYoke=GetCfg(tmp,"var_rotor_DiaYoke")&"mm"
var_rotor_Length=GetCfg(tmp,"var_rotor_Length")&"mm"
var_rotor_Poles=GetCfg(tmp,"var_rotor_Poles")
var_rotor_PoleType=GetCfg(tmp,"var_rotor_PoleType")
var_rotor_D1=GetCfg(tmp,"var_rotor_D1")&"mm"
var_rotor_O1=GetCfg(tmp,"var_rotor_O1")&"mm"
var_rotor_O2=GetCfg(tmp,"var_rotor_O2")&"mm"
var_rotor_B1=GetCfg(tmp,"var_rotor_B1")&"mm"
var_rotor_Rib=GetCfg(tmp,"var_rotor_Rib")&"mm"
var_rotor_HRib=GetCfg(tmp,"var_rotor_HRib")&"mm"
var_rotor_DminMag=GetCfg(tmp,"var_rotor_DminMag")&"mm"
var_rotor_thickMag=GetCfg(tmp,"var_rotor_thickMag")&"mm"
var_rotor_WidthMag=GetCfg(tmp,"var_rotor_WidthMag")&"mm"
var_rotor_LenRegion=GetCfg(tmp,"var_rotor_LenRegion")&"mm"
var_rotor_InfoCore=GetCfg(tmp,"var_rotor_InfoCore")
	
'coil
var_coil_DiaGap=GetCfg(tmp,"var_coil_DiaGap")&"mm"
var_coil_DiaYoke=GetCfg(tmp,"var_coil_DiaYoke")&"mm"
var_coil_Length=GetCfg(tmp,"var_coil_Length")&"mm"
var_coil_Skew=GetCfg(tmp,"var_coil_Skew")&"deg"
var_coil_Slots=GetCfg(tmp,"var_coil_Slots")
var_coil_SlotType=GetCfg(tmp,"var_coil_SlotType")
var_coil_Hs0=GetCfg(tmp,"var_coil_Hs0")&"mm"
var_coil_Hs1=GetCfg(tmp,"var_coil_Hs1")&"mm"
var_coil_Hs2=GetCfg(tmp,"var_coil_Hs2")&"mm"
var_coil_Bs0=GetCfg(tmp,"var_coil_Bs0")&"mm"
var_coil_Bs1=GetCfg(tmp,"var_coil_Bs1")&"mm"
var_coil_Bs2=GetCfg(tmp,"var_coil_Bs2")&"mm"
var_coil_Rs=GetCfg(tmp,"var_coil_Rs")&"mm"
var_coil_FilletType=GetCfg(tmp,"var_coil_FilletType")
var_coil_Layers=GetCfg(tmp,"var_coil_Layers")
var_coil_CoilPitch=GetCfg(tmp,"var_coil_CoilPitch")
var_coil_EndExt=GetCfg(tmp,"var_coil_EndExt")&"mm"
var_coil_SpanExt=GetCfg(tmp,"var_coil_SpanExt")&"mm"
var_coil_SegAngle=GetCfg(tmp,"var_coil_SegAngle")&"deg"
var_coil_LenRegion=GetCfg(tmp,"var_coil_LenRegion")&"mm"
var_coil_InfoCore=GetCfg(tmp,"var_coil_InfoCore")
	
'magnet
var_magnet_DiaGap=GetCfg(tmp,"var_magnet_DiaGap")&"mm"
var_magnet_DiaYoke=GetCfg(tmp,"var_magnet_DiaYoke")&"mm"
var_magnet_Length=GetCfg(tmp,"var_magnet_Length")&"mm"
var_magnet_Poles=GetCfg(tmp,"var_magnet_Poles")
var_magnet_PoleType=GetCfg(tmp,"var_magnet_PoleType")
var_magnet_D1=GetCfg(tmp,"var_magnet_D1")&"mm"
var_magnet_O1=GetCfg(tmp,"var_magnet_O1")&"mm"
var_magnet_O2=GetCfg(tmp,"var_magnet_O2")&"mm"
var_magnet_B1=GetCfg(tmp,"var_magnet_B1")&"mm"
var_magnet_Rib=GetCfg(tmp,"var_magnet_Rib")&"mm"
var_magnet_HRib=GetCfg(tmp,"var_magnet_HRib")&"mm"
var_magnet_DminMag=GetCfg(tmp,"var_magnet_DminMag")&"mm"
var_magnet_thickMag=GetCfg(tmp,"var_magnet_thickMag")&"mm"
var_magnet_WidthMag=GetCfg(tmp,"var_magnet_WidthMag")&"mm"
var_magnet_LenRegion=GetCfg(tmp,"var_magnet_LenRegion")&"mm"
var_magnet_InfoCore=GetCfg(tmp,"var_magnet_InfoCore")

Set oAnsoftApp = CreateObject("AnsoftMaxwell.MaxwellScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
'Set oProject = oDesktop.SetActiveProject("Project1")
Set oProject = oDesktop.NewProject
oProject.InsertDesign "Maxwell 2D", "Maxwell2DDesign1", "Magnetostatic", ""
Set oDesign = oProject.SetActiveDesign("Maxwell2DDesign1")
oDesign.RenameDesignInstance "Maxwell2DDesign1", "1_whole_motor"
oDesign.SetSolutionType "Transient", "XY"
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", "Rescale:=",  _
  false)

oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", "DllName:=",  _
  "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, "Library:=",  _
  "syslib", Array("NAME:ParamVector", Array("NAME:Pair", "Name:=", "DiaGap", "Value:=",  _
  var_stator_DiaGap), Array("NAME:Pair", "Name:=", "DiaYoke", "Value:=",  _
  var_stator_DiaYoke), Array("NAME:Pair", "Name:=", "Length", "Value:=", var_stator_Length), Array("NAME:Pair", "Name:=",  _
  "Skew", "Value:=", var_stator_Skew), Array("NAME:Pair", "Name:=", "Slots", "Value:=", var_stator_Slots), Array("NAME:Pair", "Name:=",  _
  "SlotType", "Value:=", var_stator_SlotType), Array("NAME:Pair", "Name:=", "Hs0", "Value:=", var_stator_Hs0), Array("NAME:Pair", "Name:=",  _
  "Hs01", "Value:=", var_stator_Hs01), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", var_stator_Hs1), Array("NAME:Pair", "Name:=",  _
  "Hs2", "Value:=", var_stator_Hs2), Array("NAME:Pair", "Name:=", "Bs0", "Value:=",  _
  var_stator_Bs0), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", var_stator_Bs1), Array("NAME:Pair", "Name:=",  _
  "Bs2", "Value:=", var_stator_Bs2), Array("NAME:Pair", "Name:=", "Rs", "Value:=", var_stator_Rs), Array("NAME:Pair", "Name:=",  _
  "FilletType", "Value:=", var_stator_FilletType), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=",  _
  var_stator_HalfSlot), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", var_stator_SegAngle), Array("NAME:Pair", "Name:=",  _
  "LenRegion", "Value:=", var_stator_LenRegion), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=",  _
  var_stator_InfoCore))), Array("NAME:Attributes", "Name:=", "stator", "Flags:=", "", "Color:=",  _
  "(192 192 192)", "Transparency:=", 0.800000011920929, "PartCoordinateSystem:=",  _
  "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true)
'oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
'  "SlotCore1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "stator"))))
'oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
'  "stator"), Array("NAME:ChangedProps", Array("NAME:Color", "R:=", 192, "G:=", 192, "B:=",  _
'  192))))
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", "DllName:=",  _
  "RMxprt/IPMCore", "Version:=", "15.0", "NoOfParameters:=", 16, "Library:=",  _
  "syslib", Array("NAME:ParamVector", Array("NAME:Pair", "Name:=", "DiaGap", "Value:=",  _
  var_rotor_DiaGap), Array("NAME:Pair", "Name:=", "DiaYoke", "Value:=",  _
  var_rotor_DiaYoke), Array("NAME:Pair", "Name:=", "Length", "Value:=", var_rotor_Length), Array("NAME:Pair", "Name:=",  _
  "Poles", "Value:=", var_rotor_Poles), Array("NAME:Pair", "Name:=", "PoleType", "Value:=", var_rotor_PoleType), Array("NAME:Pair", "Name:=",  _
  "D1", "Value:=", var_rotor_D1), Array("NAME:Pair", "Name:=", "O1", "Value:=", var_rotor_O1), Array("NAME:Pair", "Name:=",  _
  "O2", "Value:=", var_rotor_O2), Array("NAME:Pair", "Name:=", "B1", "Value:=",  _
  var_rotor_B1), Array("NAME:Pair", "Name:=", "Rib", "Value:=", var_rotor_Rib), Array("NAME:Pair", "Name:=",  _
  "HRib", "Value:=", var_rotor_HRib), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", var_rotor_DminMag), Array("NAME:Pair", "Name:=",  _
  "ThickMag", "Value:=", var_rotor_thickMag), Array("NAME:Pair", "Name:=",  _
  "WidthMag", "Value:=", var_rotor_WidthMag), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=",  _
  var_rotor_LenRegion), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", var_rotor_InfoCore))), Array("NAME:Attributes", "Name:=",  _
  "IPMCore1", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=",  _
  0.800000011920929, "PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=",  _
  "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=", true)
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "IPMCore1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "rotor"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "rotor"), Array("NAME:ChangedProps", Array("NAME:Color", "R:=", 0, "G:=", 255, "B:=", 0))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "rotor")
oEditor.Paste
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DCmdTab", Array("NAME:PropServers",  _
  "rotor1:CreateUserDefinedPart:1"), Array("NAME:ChangedProps", Array("NAME:InfoCore", "Value:=",  _
  "1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "rotor1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "magnet"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "magnet"), Array("NAME:ChangedProps", Array("NAME:Color", "R:=", 255, "G:=", 128, "B:=",  _
  128))))
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", "DllName:=",  _
  "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, "Library:=",  _
  "syslib", Array("NAME:ParamVector", Array("NAME:Pair", "Name:=", "DiaGap", "Value:=",  _
  var_coil_DiaGap), Array("NAME:Pair", "Name:=", "DiaYoke", "Value:=",  _
  var_coil_DiaYoke), Array("NAME:Pair", "Name:=", "Length", "Value:=", var_coil_Length), Array("NAME:Pair", "Name:=",  _
  "Skew", "Value:=", var_coil_Skew), Array("NAME:Pair", "Name:=", "Slots", "Value:=", var_coil_Slots), Array("NAME:Pair", "Name:=",  _
  "SlotType", "Value:=", var_coil_SlotType), Array("NAME:Pair", "Name:=", "Hs0", "Value:=", var_coil_Hs0), Array("NAME:Pair", "Name:=",  _
  "Hs1", "Value:=", var_coil_Hs1), Array("NAME:Pair", "Name:=", "Hs2", "Value:=",  _
  var_coil_Hs2), Array("NAME:Pair", "Name:=", "Bs0", "Value:=",  _
  var_coil_Bs0), Array("NAME:Pair", "Name:=", "Bs1", "Value:=",  _
  var_coil_Bs1), Array("NAME:Pair", "Name:=", "Bs2", "Value:=",  _
  var_coil_Bs2), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=",  _
  "FilletType", "Value:=", var_coil_FilletType), Array("NAME:Pair", "Name:=", "Layers", "Value:=", var_coil_Layers), Array("NAME:Pair", "Name:=",  _
  "CoilPitch", "Value:=", var_coil_CoilPitch), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", var_coil_EndExt), Array("NAME:Pair", "Name:=",  _
  "SpanExt", "Value:=", var_coil_SpanExt), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=",  _
  var_coil_SegAngle), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", var_coil_LenRegion), Array("NAME:Pair", "Name:=",  _
  "InfoCoil", "Value:=", var_coil_InfoCore))), Array("NAME:Attributes", "Name:=", "LapCoil1", "Flags:=",  _
  "", "Color:=", "(132 132 193)", "Transparency:=", 0.800000011920929, "PartCoordinateSystem:=",  _
  "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true)
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "LapCoil1"), Array("NAME:ChangedProps", Array("NAME:Material", "Value:=", "" & Chr(34) & "copper" & Chr(34) & ""))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "LapCoil1"), Array("NAME:ChangedProps", Array("NAME:Color", "R:=", 255, "G:=", 255, "B:=",  _
  0))))
oEditor.Rotate Array("NAME:Selections", "Selections:=", "LapCoil1", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
  "7.5deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "LapCoil1", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:DuplicateAroundAxisParameters", "CreateNewObjects:=", true, "WhichAxis:=",  _
  "Z", "AngleStr:=", "15deg", "NumClones:=", "3"), Array("NAME:Options", "DuplicateAssignments:=",  _
  true)
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "LapCoil1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseA"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "LapCoil1_2"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseB"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "LapCoil1_1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseC"))))
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=",  _
  "phaseA,phaseC,phaseB", "NewPartsModelFlag:=", "Model"), Array("NAME:DuplicateAroundAxisParameters", "CreateNewObjects:=",  _
  true, "WhichAxis:=", "Z", "AngleStr:=", "45deg", "NumClones:=", "8"), Array("NAME:Options", "DuplicateAssignments:=",  _
  true)
oProject.CopyDesign "1_whole_motor"
oProject.Paste
Set oDesign = oProject.SetActiveDesign("1_whole_motor1")
oDesign.RenameDesignInstance "1_whole_motor1", "1_partial_motor1"
oDesign.RenameDesignInstance "1_partial_motor1", "2_partial_motor1"
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Split Array("NAME:Selections", "Selections:=",  _
  "phaseA,phaseA_1,phaseA_2,phaseA_3,phaseA_4,phaseA_5,phaseA_6,phaseA_7,phaseB,p" & _ 
  "haseB_1,phaseB_2,phaseB_3,phaseB_4,phaseB_5,phaseB_6,phaseB_7,phaseC,phaseC_1," & _ 
  "phaseC_2,phaseC_3,phaseC_4,phaseC_5,phaseC_6,phaseC_7,magnet,rotor,stator", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:SplitToParameters", "SplitPlane:=", "ZX", "WhichSide:=",  _
  "PositiveOnly", "SplitCrossingObjectsOnly:=", false, "DeleteInvalidObjects:=",  _
  true)
oDesign.Undo
oEditor.Split Array("NAME:Selections", "Selections:=",  _
  "phaseA,phaseA_1,phaseA_2,phaseA_3,phaseA_4,phaseA_5,phaseA_6,phaseA_7,phaseB,p" & _ 
  "haseB_1,phaseB_2,phaseB_3,phaseB_4,phaseB_5,phaseB_6,phaseB_7,phaseC,phaseC_1," & _ 
  "phaseC_2,phaseC_3,phaseC_4,phaseC_5,phaseC_6,phaseC_7,magnet,rotor,stator", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:SplitToParameters", "SplitPlane:=", "ZX", "WhichSide:=",  _
  "PositiveOnly", "SplitCrossingObjectsOnly:=", false, "DeleteInvalidObjects:=",  _
  true)

Set oDesign = oProject.SetActiveDesign("2_partial_motor1")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Rotate Array("NAME:Selections", "Selections:=",  _
  "stator,rotor,magnet,phaseA,phaseC,phaseB,phaseA_1,phaseA_2,phaseA_3,phaseA_7,p" & _ 
  "haseC_1,phaseC_2,phaseC_3,phaseC_7,phaseB_1,phaseB_2,phaseB_3,phaseB_7", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
  "-45deg")
oEditor.Split Array("NAME:Selections", "Selections:=",  _
  "stator,rotor,magnet,phaseA,phaseC,phaseB,phaseA_1,phaseA_2,phaseA_3,phaseA_7,p" & _ 
  "haseC_1,phaseC_2,phaseC_3,phaseC_7,phaseB_1,phaseB_2,phaseB_3,phaseB_7", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:SplitToParameters", "SplitPlane:=", "ZX", "WhichSide:=",  _
  "NegativeOnly", "SplitCrossingObjectsOnly:=", false, "DeleteInvalidObjects:=",  _
  true)
oEditor.Rotate Array("NAME:Selections", "Selections:=",  _
  "stator,rotor,magnet,phaseA,phaseC,phaseB,phaseA_7,phaseC_7,phaseB_7", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:RotateParameters", "RotateAxis:=", "Z", "RotateAngle:=",  _
  "45deg")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "phaseA"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseA1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "phaseA_7"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseA2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "phaseB"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseB1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "phaseB_7"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseB2"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "phaseC"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseC1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "phaseC_7"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "phaseC2"))))
oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
  false, Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "0mm", "Y:=", "0mm", "Z:=",  _
  "0mm"), Array("NAME:PLPoint", "X:=", "200mm", "Y:=", "0mm", "Z:=", "0mm")), Array("NAME:PolylineSegments", Array("NAME:PLSegment", "SegmentType:=",  _
  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2)), Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "Polyline1", "Flags:=", "", "Color:=",  _
  "(132 132 193)", "Transparency:=", 0.800000011920929, "PartCoordinateSystem:=",  _
  "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true)
oEditor.SweepAroundAxis Array("NAME:Selections", "Selections:=", "Polyline1", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:AxisSweepParameters", "DraftAngle:=", "0deg", "DraftType:=",  _
  "Round", "CheckFaceFaceIntersection:=", false, "SweepAxis:=", "Z", "SweepAngle:=",  _
  "45deg", "NumOfSegments:=", "5")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Polyline1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Region"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Region"), Array("NAME:ChangedProps", Array("NAME:Display Wireframe", "Value:=", true))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Region"), Array("NAME:ChangedProps", Array("NAME:Display Wireframe", "Value:=", false))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Region"), Array("NAME:ChangedProps", Array("NAME:Display Wireframe", "Value:=", true))))
oEditor.SeparateBody Array("NAME:Selections", "Selections:=", "magnet", "NewPartsModelFlag:=",  _
  "Model")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "magnet"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "PM1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "magnet_Separate1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "PM2"))))
oEditor.CreateFaceCS Array("NAME:FaceCSParameters", "FaceID:=", 1374, "PartID:=",  _
  1074, Array("NAME:OriginPosn", "IsAttachedToEntity:=", true, "EntityID:=", 1475, "PositionType:=",  _
  "OnVertex", "UParam:=", 0, "VParam:=", 0, "XPosition:=", "0", "YPosition:=", "0", "ZPosition:=",  _
  "0"), Array("NAME:AxisPosn", "IsAttachedToEntity:=", true, "EntityID:=", 1472, "PositionType:=",  _
  "OnVertex", "UParam:=", 0, "VParam:=", 0, "XPosition:=", "0", "YPosition:=", "0", "ZPosition:=",  _
  "0"), "WhichAxis:=", "X"), Array("NAME:Attributes", "Name:=", "FaceCS1")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DCSTab", Array("NAME:PropServers",  _
  "FaceCS1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "PM1_CS"))))
oEditor.SetWCS Array("NAME:SetWCS Parameter", "Working Coordinate System:=", "Global")
oEditor.CreateFaceCS Array("NAME:FaceCSParameters", "FaceID:=", 1383, "PartID:=",  _
  2220, Array("NAME:OriginPosn", "IsAttachedToEntity:=", true, "EntityID:=", 1509, "PositionType:=",  _
  "OnVertex", "UParam:=", 0, "VParam:=", 0, "XPosition:=", "0", "YPosition:=", "0", "ZPosition:=",  _
  "0"), Array("NAME:AxisPosn", "IsAttachedToEntity:=", true, "EntityID:=", 1510, "PositionType:=",  _
  "OnVertex", "UParam:=", 0, "VParam:=", 0, "XPosition:=", "0", "YPosition:=", "0", "ZPosition:=",  _
  "0"), "WhichAxis:=", "X"), Array("NAME:Attributes", "Name:=", "FaceCS1")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DCSTab", Array("NAME:PropServers",  _
  "FaceCS1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "PM2_CS"))))
oEditor.SetWCS Array("NAME:SetWCS Parameter", "Working Coordinate System:=", "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "PM1"), Array("NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "PM1_CS"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "PM2"), Array("NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "PM2_CS"))))
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.AddMaterial Array("NAME:Material1", "CoordinateSystemType:=",  _
  "Cartesian", Array("NAME:AttachedData"), Array("NAME:ModifierData"), "permeability:=",  _
  "1.03", Array("NAME:magnetic_coercivity", "property_type:=", "VectorProperty", "Magnitude:=",  _
  "-920000A_per_meter", "DirComp1:=", "1", "DirComp2:=", "0", "DirComp3:=", "0"))
oDefinitionManager.EditMaterial "Material1", Array("NAME:N36z_20", "CoordinateSystemType:=",  _
  "Cartesian", Array("NAME:AttachedData"), Array("NAME:ModifierData"), "permeability:=",  _
  "1.03", Array("NAME:magnetic_coercivity", "property_type:=", "VectorProperty", "Magnitude:=",  _
  "-920000A_per_meter", "DirComp1:=", "1", "DirComp2:=", "0", "DirComp3:=", "0"))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "PM1"), Array("NAME:ChangedProps", Array("NAME:Material", "Value:=", "" & Chr(34) & "N36z_20" & Chr(34) & ""))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "PM2"), Array("NAME:ChangedProps", Array("NAME:Material", "Value:=", "" & Chr(34) & "N36z_20" & Chr(34) & ""))))
oDefinitionManager.AddMaterial Array("NAME:M19_29G", "CoordinateSystemType:=",  _
  "Cartesian", Array("NAME:AttachedData"), Array("NAME:ModifierData"), Array("NAME:permeability", "property_type:=",  _
  "nonlinear", "BType:=", "normal", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array("NAME:BHCoordinates", Array("NAME:Coordinate", "X:=",  _
  0, "Y:=", 0), Array("NAME:Coordinate", "X:=", 22.28, "Y:=", 0.05), Array("NAME:Coordinate", "X:=",  _
  25.46, "Y:=", 0.1), Array("NAME:Coordinate", "X:=", 31.83, "Y:=", 0.15), Array("NAME:Coordinate", "X:=",  _
  47.74, "Y:=", 0.36), Array("NAME:Coordinate", "X:=", 63.66, "Y:=", 0.54), Array("NAME:Coordinate", "X:=",  _
  79.57, "Y:=", 0.65), Array("NAME:Coordinate", "X:=", 159.15, "Y:=", 0.99), Array("NAME:Coordinate", "X:=",  _
  318.3, "Y:=", 1.2), Array("NAME:Coordinate", "X:=", 477.46, "Y:=", 1.28), Array("NAME:Coordinate", "X:=",  _
  636.61, "Y:=", 1.33), Array("NAME:Coordinate", "X:=", 795.77, "Y:=", 1.36), Array("NAME:Coordinate", "X:=",  _
  1591.5, "Y:=", 1.44), Array("NAME:Coordinate", "X:=", 3183, "Y:=", 1.52), Array("NAME:Coordinate", "X:=",  _
  4774.6, "Y:=", 1.58), Array("NAME:Coordinate", "X:=", 6366.1, "Y:=", 1.63), Array("NAME:Coordinate", "X:=",  _
  7957.7, "Y:=", 1.67), Array("NAME:Coordinate", "X:=", 15915, "Y:=", 1.8), Array("NAME:Coordinate", "X:=",  _
  31830, "Y:=", 1.9), Array("NAME:Coordinate", "X:=", 111407, "Y:=", 2), Array("NAME:Coordinate", "X:=",  _
  190984, "Y:=", 2.1), Array("NAME:Coordinate", "X:=", 340138, "Y:=", 2.3))), Array("NAME:magnetic_coercivity", "property_type:=",  _
  "VectorProperty", "Magnitude:=", "0A_per_meter", "DirComp1:=", "1", "DirComp2:=",  _
  "0", "DirComp3:=", "0"))
oDefinitionManager.EditMaterial "M19_29G", Array("NAME:M19_29G", "CoordinateSystemType:=",  _
  "Cartesian", Array("NAME:AttachedData", Array("NAME:CoreLossMultiCurveData", "property_data:=",  _
  "coreloss_multi_curve_data", "coreloss_unit:=", "w_per_kg", Array("NAME:AllCurves", Array("NAME:OneCurve", "Frequency:=",  _
  "50Hz", Array("NAME:Coordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array("NAME:Coordinate", "X:=",  _
  0.1, "Y:=", 0.03), Array("NAME:Coordinate", "X:=", 0.2, "Y:=", 0.07), Array("NAME:Coordinate", "X:=",  _
  0.3, "Y:=", 0.13), Array("NAME:Coordinate", "X:=", 0.4, "Y:=", 0.22), Array("NAME:Coordinate", "X:=",  _
  0.5, "Y:=", 0.31), Array("NAME:Coordinate", "X:=", 0.6, "Y:=", 0.43), Array("NAME:Coordinate", "X:=",  _
  0.7, "Y:=", 0.54), Array("NAME:Coordinate", "X:=", 0.8, "Y:=", 0.68), Array("NAME:Coordinate", "X:=",  _
  0.9, "Y:=", 0.83), Array("NAME:Coordinate", "X:=", 1, "Y:=", 1.01), Array("NAME:Coordinate", "X:=",  _
  1.1, "Y:=", 1.2), Array("NAME:Coordinate", "X:=", 1.2, "Y:=", 1.42), Array("NAME:Coordinate", "X:=",  _
  1.3, "Y:=", 1.7), Array("NAME:Coordinate", "X:=", 1.4, "Y:=", 2.12), Array("NAME:Coordinate", "X:=",  _
  1.5, "Y:=", 2.47), Array("NAME:Coordinate", "X:=", 1.6, "Y:=", 2.8), Array("NAME:Coordinate", "X:=",  _
  1.7, "Y:=", 3.05), Array("NAME:Coordinate", "X:=", 1.8, "Y:=", 3.25))), Array("NAME:OneCurve", "Frequency:=",  _
  "100Hz", Array("NAME:Coordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array("NAME:Coordinate", "X:=",  _
  0.1, "Y:=", 0.04), Array("NAME:Coordinate", "X:=", 0.2, "Y:=", 0.16), Array("NAME:Coordinate", "X:=",  _
  0.3, "Y:=", 0.34), Array("NAME:Coordinate", "X:=", 0.4, "Y:=", 0.55), Array("NAME:Coordinate", "X:=",  _
  0.5, "Y:=", 0.8), Array("NAME:Coordinate", "X:=", 0.6, "Y:=", 1.08), Array("NAME:Coordinate", "X:=",  _
  0.7, "Y:=", 1.38), Array("NAME:Coordinate", "X:=", 0.8, "Y:=", 1.73), Array("NAME:Coordinate", "X:=",  _
  0.9, "Y:=", 2.1), Array("NAME:Coordinate", "X:=", 1, "Y:=", 2.51), Array("NAME:Coordinate", "X:=",  _
  1.1, "Y:=", 2.98), Array("NAME:Coordinate", "X:=", 1.2, "Y:=", 3.51), Array("NAME:Coordinate", "X:=",  _
  1.3, "Y:=", 4.15), Array("NAME:Coordinate", "X:=", 1.4, "Y:=", 4.97), Array("NAME:Coordinate", "X:=",  _
  1.5, "Y:=", 5.92))), Array("NAME:OneCurve", "Frequency:=", "200Hz", Array("NAME:Coordinates", Array("NAME:Coordinate", "X:=",  _
  0, "Y:=", 0), Array("NAME:Coordinate", "X:=", 0.1, "Y:=", 0.09), Array("NAME:Coordinate", "X:=",  _
  0.2, "Y:=", 0.37), Array("NAME:Coordinate", "X:=", 0.3, "Y:=", 0.79), Array("NAME:Coordinate", "X:=",  _
  0.4, "Y:=", 1.31), Array("NAME:Coordinate", "X:=", 0.5, "Y:=", 1.91), Array("NAME:Coordinate", "X:=",  _
  0.6, "Y:=", 2.61), Array("NAME:Coordinate", "X:=", 0.7, "Y:=", 3.39), Array("NAME:Coordinate", "X:=",  _
  0.8, "Y:=", 4.26), Array("NAME:Coordinate", "X:=", 0.9, "Y:=", 5.23), Array("NAME:Coordinate", "X:=",  _
  1, "Y:=", 6.3), Array("NAME:Coordinate", "X:=", 1.1, "Y:=", 7.51), Array("NAME:Coordinate", "X:=",  _
  1.2, "Y:=", 8.88), Array("NAME:Coordinate", "X:=", 1.3, "Y:=", 10.5), Array("NAME:Coordinate", "X:=",  _
  1.4, "Y:=", 12.5), Array("NAME:Coordinate", "X:=", 1.5, "Y:=", 14.9))), Array("NAME:OneCurve", "Frequency:=",  _
  "400Hz", Array("NAME:Coordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array("NAME:Coordinate", "X:=",  _
  0.1, "Y:=", 0.21), Array("NAME:Coordinate", "X:=", 0.2, "Y:=", 0.92), Array("NAME:Coordinate", "X:=",  _
  0.3, "Y:=", 1.99), Array("NAME:Coordinate", "X:=", 0.4, "Y:=", 3.33), Array("NAME:Coordinate", "X:=",  _
  0.5, "Y:=", 4.94), Array("NAME:Coordinate", "X:=", 0.6, "Y:=", 6.84), Array("NAME:Coordinate", "X:=",  _
  0.7, "Y:=", 9), Array("NAME:Coordinate", "X:=", 0.8, "Y:=", 11.4), Array("NAME:Coordinate", "X:=",  _
  0.9, "Y:=", 14.2), Array("NAME:Coordinate", "X:=", 1, "Y:=", 17.3), Array("NAME:Coordinate", "X:=",  _
  1.1, "Y:=", 20.9), Array("NAME:Coordinate", "X:=", 1.2, "Y:=", 24.9), Array("NAME:Coordinate", "X:=",  _
  1.3, "Y:=", 29.5), Array("NAME:Coordinate", "X:=", 1.4, "Y:=", 35.4), Array("NAME:Coordinate", "X:=",  _
  1.5, "Y:=", 41.8))), Array("NAME:OneCurve", "Frequency:=", "1000Hz", Array("NAME:Coordinates", Array("NAME:Coordinate", "X:=",  _
  0, "Y:=", 0), Array("NAME:Coordinate", "X:=", 0.1, "Y:=", 0.99), Array("NAME:Coordinate", "X:=",  _
  0.2, "Y:=", 3.67), Array("NAME:Coordinate", "X:=", 0.3, "Y:=", 7.63), Array("NAME:Coordinate", "X:=",  _
  0.4, "Y:=", 12.7), Array("NAME:Coordinate", "X:=", 0.5, "Y:=", 18.9), Array("NAME:Coordinate", "X:=",  _
  0.6, "Y:=", 26.4), Array("NAME:Coordinate", "X:=", 0.7, "Y:=", 35.4), Array("NAME:Coordinate", "X:=",  _
  0.8, "Y:=", 46), Array("NAME:Coordinate", "X:=", 0.9, "Y:=", 58.4), Array("NAME:Coordinate", "X:=",  _
  1, "Y:=", 73), Array("NAME:Coordinate", "X:=", 1.1, "Y:=", 90.1)))))), Array("NAME:ModifierData"), Array("NAME:permeability", "property_type:=",  _
  "nonlinear", "BType:=", "normal", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array("NAME:BHCoordinates", Array("NAME:Coordinate", "X:=",  _
  0, "Y:=", 0), Array("NAME:Coordinate", "X:=", 22.28, "Y:=", 0.05), Array("NAME:Coordinate", "X:=",  _
  25.46, "Y:=", 0.1), Array("NAME:Coordinate", "X:=", 31.83, "Y:=", 0.15), Array("NAME:Coordinate", "X:=",  _
  47.74, "Y:=", 0.36), Array("NAME:Coordinate", "X:=", 63.66, "Y:=", 0.54), Array("NAME:Coordinate", "X:=",  _
  79.57, "Y:=", 0.65), Array("NAME:Coordinate", "X:=", 159.15, "Y:=", 0.99), Array("NAME:Coordinate", "X:=",  _
  318.3, "Y:=", 1.2), Array("NAME:Coordinate", "X:=", 477.46, "Y:=", 1.28), Array("NAME:Coordinate", "X:=",  _
  636.61, "Y:=", 1.33), Array("NAME:Coordinate", "X:=", 795.77, "Y:=", 1.36), Array("NAME:Coordinate", "X:=",  _
  1591.5, "Y:=", 1.44), Array("NAME:Coordinate", "X:=", 3183, "Y:=", 1.52), Array("NAME:Coordinate", "X:=",  _
  4774.6, "Y:=", 1.58), Array("NAME:Coordinate", "X:=", 6366.1, "Y:=", 1.63), Array("NAME:Coordinate", "X:=",  _
  7957.7, "Y:=", 1.67), Array("NAME:Coordinate", "X:=", 15915, "Y:=", 1.8), Array("NAME:Coordinate", "X:=",  _
  31830, "Y:=", 1.9), Array("NAME:Coordinate", "X:=", 111407, "Y:=", 2), Array("NAME:Coordinate", "X:=",  _
  190984, "Y:=", 2.1), Array("NAME:Coordinate", "X:=", 340138, "Y:=", 2.3))), Array("NAME:magnetic_coercivity", "property_type:=",  _
  "VectorProperty", "Magnitude:=", "0A_per_meter", "DirComp1:=", "1", "DirComp2:=",  _
  "0", "DirComp3:=", "0"), Array("NAME:core_loss_type", "property_type:=",  _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=",  _
  "184.233670546732", "core_loss_kc:=", "0.386260592696451", "core_loss_ke:=",  _
  "0.270231418332487", "core_loss_kdc:=", "0", "mass_density:=", "7872")
oEditor.AssignMaterial Array("NAME:Selections", "Selections:=", "rotor,stator"), Array("NAME:Attributes", "MaterialValue:=",  _
  "" & Chr(34) & "M19_29G" & Chr(34) & "", "SolveInside:=", true)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignMaster Array("NAME:Master1", "Edges:=", Array(2200), "ReverseV:=",  _
  false)
oModule.AssignSlave Array("NAME:Slave1", "Edges:=", Array(2211), "ReverseU:=", true, "Master:=",  _
  "Master1", "SameAsMaster:=", false)
oModule.AssignVectorPotential Array("NAME:zero_flux", "Edges:=", Array(2205, 2206,  _
  2207, 2208, 2209, 2210), "Value:=", "0", "CoordinateSystem:=", "")
oProject.CopyDesign "2_partial_motor1"
oProject.Paste
Set oDesign = oProject.SetActiveDesign("2_partial_motor2")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignCoilGroup Array("phaseA1", "phaseA2", "phaseB1", "phaseB2",  _
  "phaseC1", "phaseC2"), Array("NAME:phaseA1", "Objects:=", Array("phaseA1", "phaseA2",  _
  "phaseB1", "phaseB2", "phaseC1", "phaseC2"), "Conductor number:=", "9", "PolarityType:=",  _
  "Positive")
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:Maxwell2D", Array("NAME:PropServers",  _
  "BoundarySetup:phaseC1"), Array("NAME:ChangedProps", Array("NAME:Polarity Type", "Value:=",  _
  "Negative"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:Maxwell2D", Array("NAME:PropServers",  _
  "BoundarySetup:phaseC2"), Array("NAME:ChangedProps", Array("NAME:Polarity Type", "Value:=",  _
  "Negative"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", Array("NAME:PropServers",  _
  "LocalVariables"), Array("NAME:NewProps", Array("NAME:Poles", "PropType:=", "VariableProp", "UserDef:=",  _
  true, "Value:=", "8"), Array("NAME:PolePairs", "PropType:=", "VariableProp", "UserDef:=",  _
  true, "Value:=", "Poles/2"), Array("NAME:Speed_rpm", "PropType:=", "VariableProp", "UserDef:=",  _
  true, "Value:=", "3000"), Array("NAME:Omega", "PropType:=", "VariableProp", "UserDef:=",  _
  true, "Value:=", "360*Speed_rpm*PolePairs/60"), Array("NAME:Omega_rad", "PropType:=",  _
  "VariableProp", "UserDef:=", true, "Value:=", "Omega*pi/180"), Array("NAME:Thet_deg", "PropType:=",  _
  "VariableProp", "UserDef:=", true, "Value:=", "20"), Array("NAME:Thet", "PropType:=",  _
  "VariableProp", "UserDef:=", true, "Value:=", "thet_deg*pi/180"), Array("NAME:Imax", "PropType:=",  _
  "VariableProp", "UserDef:=", true, "Value:=", "250A"))))
oModule.AssignWindingGroup Array("NAME:Phase_A", "Type:=", "Current", "IsSolid:=",  _
  false, "Current:=", "Imax*sin(Omega_rad*Time+Thet)", "Resistance:=", "0ohm", "Inductance:=",  _
  "0mH", "Voltage:=", "0V", "ParallelBranchesNum:=", "1")
oModule.AddCoilstoWinding Array("NAME:AddTerminalsToWinding", Array("NAME:BoundaryList", Array("NAME:phaseA1", "Objects:=", Array( _
  "phaseA1"), "ParentBndID:=", "Phase_A", "Conductor number:=", "9", "Winding:=",  _
  "Phase_A", "PolarityType:=", "Positive"), Array("NAME:phaseA2", "Objects:=", Array( _
  "phaseA2"), "ParentBndID:=", "Phase_A", "Conductor number:=", "9", "Winding:=",  _
  "Phase_A", "PolarityType:=", "Positive")))
oModule.AssignWindingGroup Array("NAME:Phase_B", "Type:=", "Current", "IsSolid:=",  _
  false, "Current:=", "Imax*sin(Omega_rad*Time-2*pi/3+Thet)", "Resistance:=",  _
  "0ohm", "Inductance:=", "0mH", "Voltage:=", "0V", "ParallelBranchesNum:=", "1")
oModule.AssignWindingGroup Array("NAME:Phase_C", "Type:=", "Current", "IsSolid:=",  _
  false, "Current:=", "Imax*sin(Omega_rad*Time+2*pi/3+Thet)", "Resistance:=",  _
  "0ohm", "Inductance:=", "0mH", "Voltage:=", "0V", "ParallelBranchesNum:=", "1")
oModule.AddCoilstoWinding Array("NAME:AddTerminalsToWinding", Array("NAME:BoundaryList", Array("NAME:phaseB1", "Objects:=", Array( _
  "phaseB1"), "ParentBndID:=", "Phase_B", "Conductor number:=", "9", "Winding:=",  _
  "Phase_B", "PolarityType:=", "Positive"), Array("NAME:phaseB2", "Objects:=", Array( _
  "phaseB2"), "ParentBndID:=", "Phase_B", "Conductor number:=", "9", "Winding:=",  _
  "Phase_B", "PolarityType:=", "Positive")))
oModule.AddCoilstoWinding Array("NAME:AddTerminalsToWinding", Array("NAME:BoundaryList", Array("NAME:phaseC1", "Objects:=", Array( _
  "phaseC1"), "ParentBndID:=", "Phase_C", "Conductor number:=", "9", "Winding:=",  _
  "Phase_C", "PolarityType:=", "Negative"), Array("NAME:phaseC2", "Objects:=", Array( _
  "phaseC2"), "ParentBndID:=", "Phase_C", "Conductor number:=", "9", "Winding:=",  _
  "Phase_C", "PolarityType:=", "Negative")))
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.Copy Array("NAME:Selections", "Selections:=", "Region")
oEditor.Paste
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Region1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "band"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DPolylineTab", Array("NAME:PropServers",  _
  "band:CreatePolyline:2:Segment0"), Array("NAME:ChangedProps", Array("NAME:Point2", "X:=",  _
  "80.575mm", "Y:=", "0mm", "Z:=", "0mm"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DCmdTab", Array("NAME:PropServers",  _
  "band:SweepAroundAxis:1"), Array("NAME:ChangedProps", Array("NAME:Number of Segments", "Value:=",  _
  "0"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "band")
oEditor.Paste
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "band1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "band_in"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DPolylineTab", Array("NAME:PropServers",  _
  "band_in:CreatePolyline:2:Segment0"), Array("NAME:ChangedProps", Array("NAME:Point2", "X:=",  _
  "80.4mm", "Y:=", "0mm", "Z:=", "0mm"))))
oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
  false, Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "78.72mm", "Y:=", "0mm", "Z:=",  _
  "0mm"), Array("NAME:PLPoint", "X:=", "80.2mm", "Y:=", "0mm", "Z:=", "0mm")), Array("NAME:PolylineSegments", Array("NAME:PLSegment", "SegmentType:=",  _
  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2)), Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "Polyline1", "Flags:=", "", "Color:=",  _
  "(132 132 193)", "Transparency:=", 0.800000011920929, "PartCoordinateSystem:=",  _
  "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true)
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Polyline1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Rotor2"))))
oEditor.SweepAroundAxis Array("NAME:Selections", "Selections:=", "Rotor2", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:AxisSweepParameters", "DraftAngle:=", "0deg", "DraftType:=",  _
  "Round", "CheckFaceFaceIntersection:=", false, "SweepAxis:=", "Z", "SweepAngle:=",  _
  "45deg", "NumOfSegments:=", "0")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Rotor2"), Array("NAME:ChangedProps", Array("NAME:Material", "Value:=", "" & Chr(34) & "M19_29G" & Chr(34) & ""))))
oDesign.Undo
oDesign.Redo
oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
  false, Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "78.72mm", "Y:=", "0mm", "Z:=",  _
  "0mm"), Array("NAME:PLPoint", "X:=", "79.46mm", "Y:=", "0mm", "Z:=", "0mm")), Array("NAME:PolylineSegments", Array("NAME:PLSegment", "SegmentType:=",  _
  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2)), Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "Polyline1", "Flags:=", "", "Color:=",  _
  "(132 132 193)", "Transparency:=", 0.800000011920929, "PartCoordinateSystem:=",  _
  "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
  true)
oEditor.SweepAroundAxis Array("NAME:Selections", "Selections:=", "Polyline1", "NewPartsModelFlag:=",  _
  "Model"), Array("NAME:AxisSweepParameters", "DraftAngle:=", "0deg", "DraftType:=",  _
  "Round", "CheckFaceFaceIntersection:=", false, "SweepAxis:=", "Z", "SweepAngle:=",  _
  "45deg", "NumOfSegments:=", "0")
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Polyline1"), Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Rotor3"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", Array("NAME:PropServers",  _
  "Rotor3"), Array("NAME:ChangedProps", Array("NAME:Material", "Value:=", "" & Chr(34) & "M19_29G" & Chr(34) & ""))))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Coils", "RefineInside:=", true, "Enabled:=",  _
  true, "Objects:=", Array("phaseA1", "phaseA2", "phaseB1", "phaseB2", "phaseC1",  _
  "phaseC2"), "RestrictElem:=", false, "NumMaxElem:=", "1000", "RestrictLength:=",  _
  true, "MaxLength:=", "4mm")
oModule.AssignLengthOp Array("NAME:Magnets", "RefineInside:=", true, "Enabled:=",  _
  true, "Objects:=", Array("PM2", "PM1"), "RestrictElem:=", false, "NumMaxElem:=",  _
  "1000", "RestrictLength:=", true, "MaxLength:=", "3mm")
oModule.AssignLengthOp Array("NAME:rotor", "RefineInside:=", true, "Enabled:=",  _
  true, "Objects:=", Array("rotor"), "RestrictElem:=", false, "NumMaxElem:=",  _
  "1000", "RestrictLength:=", true, "MaxLength:=", "4mm")
oModule.AssignLengthOp Array("NAME:Length1", "RefineInside:=", true, "Enabled:=",  _
  true, "Objects:=", Array("stator"), "RestrictElem:=", false, "NumMaxElem:=",  _
  "1000", "RestrictLength:=", true, "MaxLength:=", "4mm")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetCoreLoss Array("stator", "rotor", "Rotor2", "Rotor3"), false
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:Data", "Move Type:=", "Rotate", "Coordinate System:=",  _
  "Global", "Axis:=", "Z", "Is Positive:=", true, "InitPos:=", "30deg", "HasRotateLimit:=",  _
  false, "NonCylindrical:=", false, "Consider Mechanical Transient:=", false, "Angular Velocity:=",  _
  "3000rpm", "Objects:=", Array("band"))
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "PreserveTranSolnAfterDatasetEdit:=",  _
  false, "ComputeTransientInductance:=", false, "PerfectConductorThreshold:=",  _
  1E+030, "InsulatorThreshold:=", 1, "ModelDepth:=", "83.82mm", "EnableTranTranLinkWithSimplorer:=",  _
  false, "BackgroundMaterialName:=", "vacuum", "Multiplier:=", "8")
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "Enabled:=", true, "NonlinearSolverResidual:=",  _
  "1e-006", "TimeIntegrationMethod:=", 0, "StopTime:=", "15ms", "TimeStep:=",  _
  "250us", "OutputError:=", false, "UseControlProgram:=", false, "ControlProgramName:=",  _
  " ", "ControlProgramArg:=", " ", "CallCtrlProgAfterLastStep:=", false, "HasSweepSetup:=",  _
  true, "SweepSetupType:=", "LinearStep", "StartValue:=", "0s", "StopValue:=",  _
  "15ms", "StepSize:=", "250us", "TransientComputeHc:=", false, Array("NAME:HcOption", "TransientHcNonLinearBH:=",  _
  true, "TransientComputeHc:=", false), "UseAdaptiveTimeStep:=", false, "InitialTimeStep:=",  _
  "0.002s", "MinTimeStep:=", "0.001s", "MaxTimeStep:=", "0.003s", "TimeStepErrTolerance:=",  _
  0.0001)
'oProject.Save
oDesign.AnalyzeAll
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "Rectangular Plot",  _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All"), "Poles:=", Array( _
  "All"), "Speed_rpm:=", Array("All"), "Thet_deg:=", Array("All"), "Imax:=", Array( _
  "All")), Array("X Component:=", "Time", "Y Component:=", Array( _
  "Moving1.Torque")), Array()
oModule.CreateReport "XY Plot 3", "Transient", "Rectangular Plot",  _
  "Setup1 : Transient", Array("Domain:=", "Sweep"), Array("Time:=", Array("All"), "Poles:=", Array( _
  "Nominal"), "Speed_rpm:=", Array("Nominal"), "Thet_deg:=", Array("Nominal"), "Imax:=", Array( _
  "Nominal")), Array("X Component:=", "Time", "Y Component:=", Array("CoreLoss")), Array()
  
dir=getfolder()
call create_folder(dir, setting)

oModule.ExportToFile "Torque",  _
  dir & "/" & setting & "/torque.csv"
oModule.ExportToFile "XY Plot 3",  _
  dir & "/" & setting & "/coreloss.csv"
  
a1= dir & "/" & setting & "/" & setting & ".mxwl"
oProject.SaveAs a1, true

'set y=getobject("winmgmts:\\.\root\cimv2") '和上面解释一样，这也是涉及到微软的WMI技术！  
'set x=y.execquery("select * from win32_process where name='maxwell.exe'")   
'for each i in x   
'i.terminate()  '卡巴要启动马上就终止……  
'next

oDesktop.QuitApplication