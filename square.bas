10 REM Define the subroutine to draw a square with centered text
20 REM Parameters: X, Y, W, LineType, Text$
30 REM LineType: 0 = Bold, 1 = Thin
40 GOSUB 1000
50 END

1000 REM DrawSquare(X, Y, W, LineType)
1010 REM Parameters: X = column, Y = row, W = width, LineType = 0 (Bold) or 1 (Thin), Text$ = String to display
1020 REM Define characters for bold and thin lines
1030 IF POKE(3) = 0 THEN
1040   REM Bold lines
1050   TopLeft = CHR$(135): TopRight = CHR$(139): LeftBar = CHR$(133): RightBar = CHR$(138): TopBar = CHR$(131): BottomBar = CHR$(140): BottomLeft = CHR$(141): BottomRight = CHR$(142)
1060 ELSE
1070   REM Thin lines
1080   TopLeft = CHR$(146): TopRight = CHR$(147): LeftBar = CHR$(151): RightBar = CHR$(152): TopBar = CHR$(150): BottomBar = CHR$(154): BottomLeft = CHR$(153): BottomRight = CHR$(155)
1090 END IF

1100 LOCATE POKE(0), POKE(1)
1110 PRINT TopLeft;
1120 FOR I = 1 TO POKE(2) - 2
1130   PRINT TopBar;
1140 NEXT I
1150 PRINT TopRight

1160 FOR J = 1 TO POKE(2) - 2
1170   LOCATE POKE(0), POKE(1) + J
1180   PRINT LeftBar;
1190   FOR K = 1 TO POKE(2) - 2
1200     PRINT " ";
1210 NEXT K
1220   PRINT RightBar
1230 NEXT J

1240 LOCATE POKE(0), POKE(1) + POKE(2) - 1
1250 PRINT BottomLeft;
1260 FOR I = 1 TO POKE(2) - 2
1270   PRINT BottomBar;
1280 NEXT I
1290 PRINT BottomRight

1300 REM Center the text inside the box
1310 X = POKE(0) + 1
1320 Y = POKE(1) + (POKE(2) - 1) / 2
1330 Text$ = MID$(Text$, 1, POKE(2) - 2)  REM Ensure the text fits within the box width
1340 TextLength = LEN(Text$)
1350 IF TextLength < POKE(2) - 2 THEN
1360   LOCATE X, Y
1370   PRINT MID$(" " + Text$ + SPACE(POKE(2) - 2 - TextLength), (POKE(2) - 2 - TextLength) / 2 + 1);
1380 END IF

1390 RETURN
10 REM Set parameters
20 X = 10         ' Column position
30 Y = 5          ' Row position
40 W = 15         ' Width of the square
50 LineType = 0   ' 0 = Bold, 1 = Thin
60 Text$ = "Hello" ' Text to display

70 REM Pass parameters to memory
80 POKE 0, X
90 POKE 1, Y
100 POKE 2, W
110 POKE 3, LineType

120 REM Call the subroutine to draw the square with centered text
130 GOSUB 1000

140 REM Call the subroutine again with different parameters
150 X = 15
160 Y = 10
170 W = 8
180 LineType = 1  ' Thin lines
190 Text$ = "Hi"

200 REM Pass parameters to memory
210 POKE 0, X
220 POKE 1, Y
230 POKE 2, W
240 POKE 3, LineType

250 REM Call the subroutine to draw the square with centered text
260 GOSUB 1000
