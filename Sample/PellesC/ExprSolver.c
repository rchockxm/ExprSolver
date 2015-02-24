/*
   ExprSolver.c
   Developer: Rchockxm (rchockxm.silver@gmail.com)
   Copyright: Silence Unlimited (rchockxm.com)
   Reference: Google C++ Style Guide
   This program is free software unless you got it under another license directly
   from the author. You can redistribute it and/or modify it under the terms of
   the GNU General Public License as published by the Free Software Foundation.
   Either version 2 of the License, or (at your option) any later version.
*/

#include <windows.h>
#include <windowsx.h>

#include "ExprSolver.h"

/*
 * ExprSolverTest
 */
double ExprSolverTest(HMODULE hModule, char* lpszExpr)
{
    if (hModule)
    {
        ExprSolverTestFunc* ExprSolverTest = (ExprSolverTestFunc*) GetProcAddress(hModule, "ExprSolver_Test");

        return ExprSolverTest(lpszExpr);
    }

    return 0;
}

/*
 * ExprSolverGetLastError
 */
int ExprSolverGetLastError(HMODULE hModule)
{
    if (hModule)
    {
        ExprSolverGetLastErrorFunc* ExprSolverGetLastError = (ExprSolverGetLastErrorFunc*) GetProcAddress(hModule, "ExprSolver_GetLastError");

        return ExprSolverGetLastError();
    }

    return 0;
}
