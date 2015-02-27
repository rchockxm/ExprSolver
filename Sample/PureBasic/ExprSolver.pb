XIncludeFile "ExprSolver.pbi"

Global hExprSolverDll.i

; Prototype
Prototype.d ExprSolverTestFunc(lpszExpr.p-Ascii)
Prototype.i ExprSolverGetLastErrorFunc()

; Declare
Declare.i ExprSolverOpen(lpszDllPath.s)
Declare.i ExprSolverClose(hModule.i)
Declare.d ExprSolverTest(lpszExpr.s, hModule.i = 0)
Declare.i ExprSolverGetLastError(hModule.i = 0)        

; ExprSolverOpen
Procedure.i ExprSolverOpen(lpszDllPath.s)
    hExprSolverDll = OpenLibrary(#PB_Any, lpszDllPath)
    
    ProcedureReturn hExprSolverDll
EndProcedure

; ExprSolverClose
Procedure.i ExprSolverClose(hModule.i)
    If hModule
        CloseLibrary(hExprSolverDll)
    EndIf
    
    ProcedureReturn #True
EndProcedure

; ExprSolverTest
Procedure.d ExprSolverTest(lpszExpr.s, hModule.i = 0)
    Protected.d dResult
    Protected.ExprSolverTestFunc pFuncCall
    
    If Not hModule
        hModule = hExprSolverDll     
    EndIf
    
    If hModule
        pFuncCall = GetFunction(hModule, "ExprSolver_Test")
        dResult = pFuncCall(lpszExpr)
    EndIf
    
    ProcedureReturn dResult
EndProcedure

; ExprSolverGetLastError
Procedure.i ExprSolverGetLastError(hModule.i = 0)
    Protected.i iResult = #T_ERROR_SUCCESS
    Protected.ExprSolverGetLastErrorFunc pFuncCall
    
    If Not hModule
        hModule = hExprSolverDll     
    EndIf
    
    If hModule
        pFuncCall = GetFunction(hModule, "ExprSolver_GetLastError")
        iResult = pFuncCall()
    EndIf
    
    ProcedureReturn iResult
EndProcedure
