#include ExprSolver.ahk

lpszExprSolverDll := "..\..\ExprSolver.dll"

gDll := ExprSolverOpen(lpszExprSolverDll, True)
dReturn := ExprSolver_Test("(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)")

If ExprSolver_GetLastError() = T_ERROR_SUCCESS {
    MsgBox, 4096, Test, %dReturn%
} Else {
    MsgBox, 4096, Test, "Error"
}

ExprSolverClose(gDll)
