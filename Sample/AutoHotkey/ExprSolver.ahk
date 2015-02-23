#include ExprSolverConstants.ahk

; #INDEX# =======================================================================================================================
; Title .........: ExprSolver
; AutoIt Version : 1.0.0.0
; Language ......: English
; Description ...: Simple Expression Solver
; Author(s) .....: Rchockxm (rchockxm.si;ver@gmail.com)
; Dll ...........: ExprSolver.dll
; ===============================================================================================================================

__g_hDll_ExprSolver := 0

; #CURRENT# =====================================================================================================================
; ExprSolverOpen
; ExprSolverClose
; ExprSolver_Test
; ExprSolver_GetLastError
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
ExprSolverOpen(lpszDllPath, bSetToGlobal = True) {
    hDLL := 0

    If FileExist(lpszDllPath) {
        hDLL := DllCall("LoadLibrary", "Str", lpszDllPath)
        
        If hDLL And bSetToGlobal = True {
            __g_hDll_ExprSolver = hDLL
        }
    }

    Return hDLL
}   ;==>ExprSolverOpen

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
ExprSolverClose(hDLL = 0) {
    If Not hDLL {
        hDLL := __g_hDll_ExprSolver
    }

    If hDLL {
        DllCall("FreeLibrary", "Int", hDLL)
    }
}   ;==>ExprSolverClose

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
ExprSolver_Test(lpszExpr) {
    Return DllCall("ExprSolver\ExprSolver_Test", "AStr", lpszExpr, "Double")
}   ;==>ExprSolver_Test

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
ExprSolver_GetLastError() {
    Return DllCall("ExprSolver\ExprSolver_GetLastError", "Int")
}   ;==>ExprSolver_GetLastError