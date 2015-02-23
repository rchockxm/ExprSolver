#include <MsgBoxConstants.au3>
#include "ExprSolver.au3"

Global Const $lpszExprSolverDll = "..\..\ExprSolver.dll"

Global $gDll = ExprSolverOpen($lpszExprSolverDll, True)

If ExprSolver_GetLastError() = $T_ERROR_SUCCESS Then
    MsgBox(4096, "Test", ExprSolver_Test("(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)"))
Else
    MsgBox(4096, "Test", "Error")
EndIf

ExprSolverClose()
