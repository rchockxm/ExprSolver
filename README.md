ExprSolver
==========

Simple Expression Solver

<h2><a name="about" class="anchor" href="#about"><span class="mini-icon mini-icon-link"></span></a>About</h2>

Very simple solution for solving mathematical expressions.

<img src="http://i.imgur.com/ycBh6Pi.png" />

<h2><a name="demo" class="anchor" href="#demo"><span class="mini-icon mini-icon-link"></span></a>Demo</h2>

```
(1*2)*(6^5)+sin(30)+cos(2)*int(4.6)
```

<h2><a name="function" class="anchor" href="#function"><span class="mini-icon mini-icon-link"></span></a>Function</h2>

<code>
ABS
ATN
COS
EXP
FIX
INT
LOG
SIN
SQR
TAN
</code>

<h2><a name="dllfunction" class="anchor" href="#dllfunction"><span class="mini-icon mini-icon-link"></span></a>DLL Function</h2>

<code>
ExprSolver_Test
ExprSolver_GetLastError
</code>

Autoit:

```autoit
$lpszExpr = "1+2+3/4"

$result = DllCall($hDLL, "double", "ExprSolver_Test", "str", $lpszExpr)
DllCall($hDLL, "int", "ExprSolver_GetLastError")
```

AutoHotkey:

```autohotkey
lpszExpr = "1+2+3/4"

result = DllCall("ExprSolver\ExprSolver_Test", "AStr", lpszExpr, "Double")
DllCall("ExprSolver\ExprSolver_GetLastError", "Int")
```

<h2><a name="changelog" class="anchor" href="#changelog"><span class="mini-icon mini-icon-link"></span></a>Changelog</h2>

<h4>1.0.0</h4>
- Fixed a bug in the blank expression has caused an incorrect calculation problem.

<h2><a name="author" class="anchor" href="#author"><span class="mini-icon mini-icon-link"></span></a>Author</h2>
* 2015 rchockxm (rchockxm.silver@gmail.com)

<h2><a name="credits" class="anchor" href="#credits"><span class="mini-icon mini-icon-link"></span></a>Credits</h2>
