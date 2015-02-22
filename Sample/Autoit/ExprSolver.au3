#include-once
#include "ExprSolverConstants.au3"

; #INDEX# =======================================================================================================================
; Title .........: ExprSolver
; AutoIt Version : 1.0.0.0
; Language ......: English
; Description ...: Simple Expression Solver
; Author(s) .....: Rchockxm (rchockxm.si;ver@gmail.com)
; Dll ...........: ExprSolver.dll
; ===============================================================================================================================

Global $__g_hDll_ExprSolver = 0

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
Func ExprSolverOpen($lpszDllPath, $bSetToGlobal = True)
    Local $hDLL

    If FileExists($lpszDllPath) Then
        $hDLL = DllOpen($lpszDllPath)

		If $hDLL And $bSetToGlobal = True Then
			$__g_hDll_ExprSolver = $hDLL
		EndIf
    EndIf

    Return $hDLL
EndFunc   ;==>ExprSolverOpen

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
Func ExprSolverClose($hDLL = 0)
	If Not $hDLL Then
		$hDLL = $__g_hDll_ExprSolver
	EndIf

    If $hDLL Then
        DllClose($hDLL)
    EndIf
EndFunc   ;==>ExprSolverClose

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
Func ExprSolver_Test($lpszExpr, $hDLL = 0)
    Local $aResult = 0

	If Not $hDLL Then
		$hDLL = $__g_hDll_ExprSolver
	EndIf

    If $hDLL Then
        Local $aExprSover = DllCall($hDLL, "double", "ExprSolver_Test", "str", $lpszExpr)

        If IsArray($aExprSover) Then
            $aResult = $aExprSover[0]
        EndIf
    EndIf

    Return $aResult
EndFunc   ;==>ExprSolver_Test

; #FUNCTION# ====================================================================================================================
; Author ........: Rchockxm
; Modified.......:
; ===============================================================================================================================
Func ExprSolver_GetLastError($hDLL = 0)
    Local $aResult = $T_ERROR_SUCCESS

	If Not $hDLL Then
		$hDLL = $__g_hDll_ExprSolver
	EndIf

    If $hDLL Then
        Local $aExprSover = DllCall($hDLL, "int", "ExprSolver_GetLastError")

        If IsArray($aExprSover) Then
            $aResult = $aExprSover[0]
        EndIf
    EndIf

    Return $aResult
EndFunc   ;==>ExprSolver_GetLastError
