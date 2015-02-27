EnableExplicit

XIncludeFile "ExprSolver.pb"

Global lpszExprSolverDll.s = "../../ExprSolver.dll"

Global hDll.i = ExprSolverOpen(lpszExprSolverDll)
Global dResult.d = ExprSolverTest("(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)")

If OpenConsole()
    If ExprSolverGetLastError() = #T_ERROR_SUCCESS
        PrintN("Test: " + StrD(dResult))
    Else
        PrintN("Error")
    EndIf
    
    Input()
EndIf