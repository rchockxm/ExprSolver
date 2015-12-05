#Include Once "ExprSolver.bi"

Dim As Double dResult = ExprSolverTest("(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)")

Print dResult

If ExprSolverGetLastError() = T_ERROR_SUCCESS Then
    Print "Test" & STR$(dResult)
Else
    Print "Error"
End If

