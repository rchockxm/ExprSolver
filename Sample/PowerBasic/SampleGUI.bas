#COMPILE EXE
#DIM ALL

#INCLUDE "Win32API.inc"
#INCLUDE ONCE "ExprSolver.inc"

%IDC_TEXTBOX_EXPRESSION = 100
%IDC_TEXTBOX_RESULT = 101

%IDC_LABEL_EXPRESSION = 102
%IDC_LABEL_RESULT = 103
%IDC_LABEL_ERROR = 104

%IDC_LINK_RCHOCKXM = 105
%IDC_LINK_GITHUB = 106

%dGuiWidth = 280
%dGuiHeight = 100

$lpszGithubUrl = "https://github.com/rchockxm"
$lpszSilenceUnlimitedUrl = "http://rchockxm.com/"

$lpszExprSolverDll = "..\..\ExprSolver.dll"
$lpszUseMatchFunc = "ABS,ATN,COS,EXP,FIX,INT,LOG,SIN,SQR,TAN"

GLOBAL hDlg AS DWORD
GLOBAL hExpr AS DWORD

DECLARE CALLBACK FUNCTION BtnAuthorCallBack()
DECLARE CALLBACK FUNCTION BtnGithubCallBack()
DECLARE CALLBACK FUNCTION DlgProcCallBack()

FUNCTION ExprSolverErrorToString() AS STRING

    LOCAL lpszReturn AS STRING
    LOCAL iError AS INTEGER

    iError = ExprSolverGetLastError()

    SELECT CASE iError
        CASE %T_ERROR_SUCCESS
            lpszReturn = "Success"
        CASE %T_ERROR_EMPTY
            lpszReturn = "Empty expression"
        CASE %T_ERROR_DIVZERO
            lpszReturn = "Division by zero"
        CASE %T_ERROR_TOKEN
            lpszReturn = "Unknown token type"
        CASE %T_ERROR_FUNC
            lpszReturn = "Math function not found"
        CASE %T_ERROR_FUNC_FACTORIAL
            lpszReturn = "Argument to factorial must be positive"
        CASE %T_ERROR_BRACKETS
            lpszReturn = "Unbalanced round brackets"
    END SELECT

    FUNCTION = lpszReturn

END FUNCTION

CALLBACK FUNCTION BtnAuthorCallBack

    IF CB.MSG = %WM_COMMAND AND CB.CTLMSG = %BN_CLICKED THEN
        ShellExecute(hDlg, "Open", $lpszSilenceUnlimitedUrl, $NUL, $NUL, %SW_SHOWNORMAL)
    END IF

END FUNCTION

CALLBACK FUNCTION BtnGithubCallBack

    IF CB.MSG = %WM_COMMAND AND CB.CTLMSG = %BN_CLICKED THEN
        ShellExecute(hDlg, "Open", $lpszGithubUrl, $NUL, $NUL, %SW_SHOWNORMAL)
    END IF

END FUNCTION

FUNCTION PBMAIN () AS LONG

    LOCAL Result AS LONG

    DIALOG NEW 0, "ExprSolverGUI",,, %dGuiWidth, %dGuiHeight, %DS_CENTER OR %WS_CAPTION OR %WS_SYSMENU, 0 TO hDlg

    CONTROL ADD TEXTBOX, hDlg, %IDC_TEXTBOX_EXPRESSION, "", 10, 26, %dGuiWidth - 20, 12
    CONTROL ADD TEXTBOX, hDlg, %IDC_TEXTBOX_RESULT, "", 10, 62, %dGuiWidth - 20, 12

    CONTROL ADD LABEL, hDlg, %IDC_LABEL_EXPRESSION, "Expression", 10, 10, 200, 10
    CONTROL ADD LABEL, hDlg, %IDC_LABEL_RESULT, "Result", 10, 46, 200, 10

    CONTROL ADD LABEL, hDlg, %IDC_LABEL_ERROR, "", 10, %dGuiHeight - 16, 200, 10
    CONTROL ADD LABEL, hDlg, %IDC_LINK_RCHOCKXM, "Rchockxm", %dGuiWidth - 80, %dGuiHeight - 16, 50, 10, %SS_NOTIFY CALL BtnAuthorCallBack
    CONTROL ADD LABEL, hDlg, %IDC_LINK_GITHUB, "GitHub", %dGuiWidth - 40, %dGuiHeight - 16, 50, 10, %SS_NOTIFY CALL BtnGithubCallBack

    CONTROL HANDLE hDlg, %IDC_TEXTBOX_EXPRESSION TO hExpr

    DIALOG SHOW MODAL hDlg, CALL DlgProcCallBack TO Result

END FUNCTION

CALLBACK FUNCTION DlgProcCallBack () AS LONG

    SELECT CASE CB.MSG

    CASE %WM_COMMAND

        SELECT CASE CB.CTL
        CASE %IDOK
            SELECT CASE GetFocus()

            CASE hExpr
                LOCAL lpszText AS STRING
                LOCAL dResult AS DOUBLE

                CONTROL GET TEXT hDlg, %IDC_TEXTBOX_EXPRESSION TO lpszText

                dResult = ExprSolverTest(lpszText)

                CONTROL SET TEXT hDlg, %IDC_TEXTBOX_RESULT, STR$(dResult)
                CONTROL SET TEXT hDlg, %IDC_LABEL_ERROR, ExprSolverErrorToString()
            END SELECT

        CASE %IDCANCEL
            DIALOG END CB.HNDL

        END SELECT

    CASE %WM_NOTIFY

    END SELECT

END FUNCTION
