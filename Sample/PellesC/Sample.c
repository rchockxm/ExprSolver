/*
   Sample.c
   Developer: Rchockxm (rchockxm.silver@gmail.com)
   Copyright: Silence Unlimited (rchockxm.com)
   Reference: Google C++ Style Guide
   This program is free software unless you got it under another license directly
   from the author. You can redistribute it and/or modify it under the terms of
   the GNU General Public License as published by the Free Software Foundation.
   Either version 2 of the License, or (at your option) any later version.
*/

#define WIN32_DEFAULT_LIBS
#define WIN32_LEAN_AND_MEAN
/* #define NOCRYPT */
/* #define NOSERVICE */
/* #define NOMCX */
/* #define NOIME */

#include <windows.h>
#include <windowsx.h>
#include <stdio.h>
#include <stdlib.h>

#include "ExprSolver.h"

/*
 * main
 */
int main(int argc, char *argv[])
{
    HMODULE hModule = LoadLibrary("../../ExprSolver.dll");;
    
    if (hModule) 
    {
        double dResult = ExprSolverTest(hModule, "(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)");
        
        if (ExprSolverGetLastError(hModule) == T_ERROR_SUCCESS) 
        {
            printf("Test: %f", dResult);
        }
        else
        {
            printf("Error");
        }

        FreeLibrary(hModule); 
    }

    return 0;
}
