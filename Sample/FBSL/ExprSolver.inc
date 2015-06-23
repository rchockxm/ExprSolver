' Error
#Define T_ERROR_SUCCESS        0 ' Success
#Define T_ERROR_EMPTY          1 ' Empty expression
#Define T_ERROR_DIVZERO        2 ' Division by zero
#Define T_ERROR_TOKEN          3 ' Unknown token type
#Define T_ERROR_FUNC           4 ' Math function not found
#Define T_ERROR_FUNC_FACTORIAL 5 ' Argument to factorial must be positive
#Define T_ERROR_BRACKETS       6 ' Unbalanced round brackets

' Declare
#DLLDECLARE Kernel32("GetProcAddress")
'#DllDeclare ExprSolver( _
    '"ExprSolver_Test", _
    '"ExprSolver_GetLastError" _
')

Dim %hExprSolverDll

' ExprSolverOpen
Function ExprSolverOpen(ByVal $lpszDllPath) As Integer
    hExprSolverDll = LoadLibrary(lpszDllPath)
    
    Return hExprSolverDll
End Function

' ExprSolverClose
Function ExprSolverClose(ByVal %hModule = 0) As Integer
    hExprSolverDll = LoadLibrary(lpszDllPath)
    
    If hModule Then
        
    End If
    
    Return hExprSolverDll
End Function

' ExprSolverTest
Function ExprSolverTest(ByVal $lpszExpr, BYVAL %hModule = 0) As Double
    If Not hModule Then
        hModule = hExprSolverDll
    End If
    
    Dim %pCtor = GetProcAddress(hModule, "ExprSolver_Test")
    
    Return FunCall(pCtor, lpszExpr)
End Function

' ExprSolverGetLastError
Function ExprSolverGetLastError(ByVal %hModule = 0) As Integer
    If Not hModule Then
        hModule = hExprSolverDll
    End If
    
    Dim %pCtor = GetProcAddress(hModule, "ExprSolver_GetLastError")
    
    Return FunCall(pCtor)
End Function
