#NoTrayIcon

#pragma compile(Out, SampleGUI.exe)
#pragma compile(ExecLevel, highestavailable)
#pragma compile(Compatibility, win7)
#pragma compile(UPX, False)
#pragma compile(FileDescription, SampleGUI for ExpSolver)
#pragma compile(ProductName, ExprSolverGUI)
#pragma compile(ProductVersion, 1.0)
#pragma compile(FileVersion, 1.0.0.0, 1.0.000.0)
#pragma compile(LegalCopyright, Silence Unlimited, Inc)
#pragma compile(LegalTrademarks, '')
#pragma compile(CompanyName, 'Silence Unlimited, Inc')

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "ExprSolver.au3"

Global Const $dGuiWidth = 400
Global Const $dGuiHeight = 140

Global Const $lpszExprSolverDll = "..\..\ExprSolver.dll"
Global Const $lpszUseMatchFunc = "ABS,ATN,COS,EXP,FIX,INT,LOG,SIN,SQR,TAN"

Global $gDll = ExprSolverOpen($lpszExprSolverDll, True)

Func ExprSolverErrorToString()
    Local $lpszReturn = ""
    Local $iError = ExprSolver_GetLastError()

    Switch $iError
        Case $T_ERROR_SUCCESS
            $lpszReturn = "Success"
        Case $T_ERROR_EMPTY
            $lpszReturn = "Empty expression"
        Case $T_ERROR_DIVZERO
            $lpszReturn = "Division by zero"
        Case $T_ERROR_TOKEN
            $lpszReturn = "Unknown token type"
        Case $T_ERROR_FUNC
            $lpszReturn = "Math function not found"
        Case $T_ERROR_FUNC_FACTORIAL
            $lpszReturn = "Argument to factorial must be positive"
        Case $T_ERROR_BRACKETS
            $lpszReturn = "Unbalanced round brackets"
    EndSwitch

    Return $lpszReturn
EndFunc

Func BtnExpression($lpszExpression)
    Local $dResult = ExprSolver_Test($lpszExpression)

    Return $dResult
EndFunc

Func WinMain()
    Local $hGUI = GUICreate("ExprSolverGUI", $dGuiWidth, $dGuiHeight)
    Local $hExpression = GUICtrlCreateInput("", 10, 30, $dGuiWidth - 20, 20)
    Local $hResult = GUICtrlCreateInput("", 10, 80, $dGuiWidth - 20, 20)
    Local $hErrorStr = GUICtrlCreateLabel("", 10, $dGuiHeight - 20, 200, 20)

    GUICtrlCreateLabel("Expression", 10, 10)
    GUICtrlCreateLabel("Result", 10, 60)

    GUISetStyle(BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX))
    GUISetState(@SW_SHOW, $hGUI)

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
            Case $GUI_EVENT_RESIZED:
            Case $hExpression:
                Local $lpszExpression = GUICtrlRead($hExpression)
                Local $dResult = BtnExpression($lpszExpression)
                Local $lpszError = ExprSolverErrorToString()

                GUICtrlSetData($hResult, $dResult)
                GUICtrlSetData($hErrorStr, $lpszError)
        EndSwitch
    WEnd

    ExprSolverClose()

    GUIDelete($hGUI)
EndFunc

WinMain()
