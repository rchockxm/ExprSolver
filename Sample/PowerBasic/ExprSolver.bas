#COMPILE EXE
#DIM ALL

#INCLUDE ONCE "ExprSolver.inc"

FUNCTION PBMAIN () AS LONG
    DIM dResult AS LOCAL DOUBLE

    dResult = ExprSolverTest("(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)")

    IF ExprSolverGetLastError() = %T_ERROR_SUCCESS THEN
        MSGBOX "Test" & STR$(dResult)
    ELSE
        MSGBOX "Error"
    END IF

    FUNCTION = 1

END FUNCTION
