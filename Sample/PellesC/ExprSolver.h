/*
   ExprSolver.h
   Developer: Rchockxm (rchockxm.silver@gmail.com)
   Copyright: Silence Unlimited (rchockxm.com)
   Reference: Google C++ Style Guide
   This program is free software unless you got it under another license directly
   from the author. You can redistribute it and/or modify it under the terms of
   the GNU General Public License as published by the Free Software Foundation.
   Either version 2 of the License, or (at your option) any later version.
*/

#ifndef __EXPRSOLVER_H__
#define __EXPRSOLVER_H__

/*
 * Error
 */
enum EXPRSOLVER_ERROR {
    T_ERROR_SUCCESS        = 0, // Success
    T_ERROR_EMPTY          = 1, // Empty expression
    T_ERROR_DIVZERO        = 2, // Division by zero
    T_ERROR_TOKEN          = 3, // Unknown token type
    T_ERROR_FUNC           = 4, // Math function not found
    T_ERROR_FUNC_FACTORIAL = 5, // Argument to factorial must be positive
    T_ERROR_BRACKETS       = 6  // Unbalanced round brackets
};

/*
 * Typeof
 */
typedef double __cdecl ExprSolverTestFunc(char*);
typedef int __cdecl ExprSolverGetLastErrorFunc(void);

/*
 * Declare
 */
double ExprSolverTest(HMODULE hModule, char* lpszExpr);
int ExprSolverGetLastError(HMODULE hModule);

#endif /* __EXPRSOLVER_H__ */
