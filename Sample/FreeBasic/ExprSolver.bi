#pragma Once

#Ifndef __EXPRSOVER_BI__
#Define __EXPRSOVER_BI__

#Inclib "ExprSolver"

Extern "Windows-MS"

' Error
Const T_ERROR_SUCCESS        = 0 ' Success
Const T_ERROR_EMPTY          = 1 ' Empty expression
Const T_ERROR_DIVZERO        = 2 ' Division by zero
Const T_ERROR_TOKEN          = 3 ' Unknown token type
Const T_ERROR_FUNC           = 4 ' Math function not found
Const T_ERROR_FUNC_FACTORIAL = 5 ' Argument to factorial must be positive
Const T_ERROR_BRACKETS       = 6 ' Unbalanced round brackets

' Declare
Declare Function ExprSolverTest Alias "ExprSolver_Test" (ByVal lpszExpr As ZString Ptr) As Double
Declare Function ExprSolverGetLastError Alias "ExprSolver_GetLastError" () As Integer

End Extern

#EndIf