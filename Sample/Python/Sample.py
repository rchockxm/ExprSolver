import ctypes
import os

# Error
T_ERROR_SUCCESS        = 0 # Success
T_ERROR_EMPTY          = 1 # Empty expression
T_ERROR_DIVZERO        = 2 # Division by zero
T_ERROR_TOKEN          = 3 # Unknown token type
T_ERROR_FUNC           = 4 # Math function not found
T_ERROR_FUNC_FACTORIAL = 5 # Argument to factorial must be positive
T_ERROR_BRACKETS       = 6 # Unbalanced round brackets

hDll = ctypes.windll.LoadLibrary("..\\..\\ExprSolver.dll")

lpszExpr = "(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)"

ExprTestFunc = hDll["ExprSolver_Test"]
ExprTestFunc.restype = ctypes.c_double

dResult = ExprTestFunc(ctypes.c_char_p(lpszExpr))

if hDll.ExprSolver_GetLastError() == 0:
    print "Test: " + str(dResult)
else:
    print "Error"

os.system("pause")