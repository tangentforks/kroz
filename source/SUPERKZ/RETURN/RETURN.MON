{//-------------------------------------------------------------------------}
{/*                                                                         }
{Copyright (C) 1987, 2009 - Apogee Software, Ltd.                           }
{                                                                           }
{This file is part of Kroz. Kroz is free software; you can redistribute it  }
{and/or modify it under the terms of the GNU General Public License         }
{as published by the Free Software Foundation; either version 2             }
{of the License, or (at your option) any later version.                     }
{                                                                           }
{This program is distributed in the hope that it will be useful,            }
{but WITHOUT ANY WARRANTY; without even the implied warranty of             }
{MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                       }
{                                                                           }
{See the GNU General Public License for more details.                       }
{                                                                           }
{You should have received a copy of the GNU General Public License          }
{along with this program; if not, write to the Free Software                }
{Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.}
{                                                                           }
{Original Source: 1987-1990 Scott Miller                                    }
{Prepared for public release: 03/19/09 - Joe Siegler, Apogee Software, Ltd. }
{*/                                                                         }
{//-------------------------------------------------------------------------}
{*** RETURN TO KROZ monster movement routines.  By Scott Miller 07/30/89 ***}

procedure Move_Slow;
  var Loop : integer;
  label Continue;
 begin
  if T[6]>0 then
    if FastPC then T[1] := 3
    else T[1]:=Null
  else
    if T[4]<1 then T[1]:=STime
    else T[1]:=STime*5;
  if SNum < 1 then exit;
  for Loop:=1 to SNum do
   begin
    if SX[Loop] = Null then goto Continue;
    if PF[SX[Loop],SY[Loop]] <> 1 then
     begin SX[Loop]:=Null;goto Continue;end;
    PF[SX[Loop],SY[Loop]]:=Null;
    gotoxy(SX[Loop],SY[Loop]);
    write(' ');
    XDir:=0;YDir:=0;
    if PX<SX[Loop] then begin SX[Loop]:=SX[Loop]-1;XDir:=1;end
    else if PX>SX[Loop] then begin SX[Loop]:=SX[Loop]+1;XDir:=-1;end;
    if PY<SY[Loop] then begin SY[Loop]:=SY[Loop]-1;YDir:=1;end
    else if PY>SY[Loop] then begin SY[Loop]:=SY[Loop]+1;YDir:=-1;end;
    gotoxy(SX[Loop],SY[Loop]);
    case PF[SX[Loop],SY[Loop]] of
     Null:begin
           col(12,7);
           write(Slow);
           sound(20);nosound;
           PF[SX[Loop],SY[Loop]]:=1;
          end;
     1..3,6,13,14,17,19..25,28..37,39,41,42,44..47,52..56,58..63:
          begin
           SX[Loop]:=SX[Loop]+XDir;
           SY[Loop]:=SY[Loop]+YDir;
           PF[SX[Loop],SY[Loop]]:=1;
           gotoxy(SX[Loop],SY[Loop]);
           col(12,7);
           write(Slow);
          end;
        4,38,43,64:begin
           PF[SX[Loop],SY[Loop]]:=Null;
           SX[loop]:=Null;
           write(' ');
           Score:=Score+1;
           sound(800);delay(18);sound(400);delay(20);nosound;
          end;
       40:begin
           sound(400);delay(25);nosound;SX[loop]:=Null;
           Gems:=Gems-1;if Gems<0 then Dead(true);
           if Gems>9 then col(4,7) else col(20,23);bak(7,0);
           gotoxy(71,8);
           write('     ');
           str(Gems,StrVal);
           gotoxy(73-length(StrVal) div 2,8);
           write(StrVal);
           bak(0,0);
          end;
       5,7..12,15,16,18,26,27,48..51:
          begin
           col(12,7);
           write(Slow);
           PF[SX[Loop],SY[Loop]]:=1;
           GrabSound;
          end
     else begin
           SX[Loop]:=SX[Loop]+XDir;
           SY[Loop]:=SY[Loop]+YDir;
           PF[SX[Loop],SY[Loop]]:=1;
           gotoxy(SX[Loop],SY[Loop]);
           col(12,7);
           write(Slow);
          end;
         end; {case}
    CONTINUE:
    if random(8)=1 then Player_Move;
   end;
 end; { Move_Slow }

procedure Move_Medium;
  var Loop : integer;
  label Continue;
 begin
  if T[6]>0 then
    if FastPC then T[2] := 3
    else T[2]:=Null
  else
    if T[4]<1 then T[2]:=MTime
    else T[2]:=MTime*5;
  if MNum < 1 then exit;
  for Loop:=1 to MNum do
   begin
    if MX[Loop] = Null then goto Continue;
    if PF[MX[Loop],MY[Loop]] <> 2 then
     begin MX[Loop]:=Null;goto Continue;end;
    PF[MX[Loop],MY[Loop]]:=Null;
    gotoxy(MX[Loop],MY[Loop]);
    write(' ');
    XDir:=0;YDir:=0;
    if PX<MX[Loop] then begin MX[Loop]:=MX[Loop]-1;XDir:=1;end
    else if PX>MX[Loop] then begin MX[Loop]:=MX[Loop]+1;XDir:=-1;end;
    if PY<MY[Loop] then begin MY[Loop]:=MY[Loop]-1;YDir:=1;end
    else if PY>MY[Loop] then begin MY[Loop]:=MY[Loop]+1;YDir:=-1;end;
    gotoxy(MX[Loop],MY[Loop]);
    case PF[MX[Loop],MY[Loop]] of
     Null:begin
           col(10,7);
           write(Medium);
           sound(20);nosound;
           PF[MX[Loop],MY[Loop]]:=2;
          end;
     1..3,6,13,14,17,19..25,28..37,39,41,42,44..47,52..56,58..63:
          begin
           MX[Loop]:=MX[Loop]+XDir;
           MY[Loop]:=MY[Loop]+YDir;
           PF[MX[Loop],MY[Loop]]:=2;
           gotoxy(MX[Loop],MY[Loop]);
           col(10,7);
           write(Medium);
          end;
        4,38,43,64:begin
           PF[MX[Loop],MY[Loop]]:=Null;
           MX[Loop]:=Null;
           write(' ');
           Score:=Score+2;
           sound(800);delay(18);sound(400);delay(20);nosound;
          end;
       40:begin
           sound(600);delay(25);nosound;MX[loop]:=Null;
           Gems:=Gems-2;if Gems<0 then Dead(true);
           if Gems>9 then col(4,7) else col(20,23);bak(7,0);
           gotoxy(71,8);
           write('     ');
           str(Gems,StrVal);
           gotoxy(73-length(StrVal) div 2,8);
           write(StrVal);
           bak(0,0);
          end;
       5,7..12,15,16,18,26,27,48..51:
          begin
           col(10,7);
           write(Medium);
           PF[MX[Loop],MY[Loop]]:=2;
           GrabSound;
          end
     else begin
           MX[Loop]:=MX[Loop]+XDir;
           MY[Loop]:=MY[Loop]+YDir;
           PF[MX[Loop],MY[Loop]]:=2;
           gotoxy(MX[Loop],MY[Loop]);
           col(10,7);
           write(Medium);
          end;
    end; {case}
    CONTINUE:
    if random(7)=1 then Player_Move;
   end;
 end; { Move_Medium }

procedure Move_Fast;
  var Loop : integer;
  label Continue;
 begin
  if T[6]>0 then
    if FastPC then T[3] := 3
    else T[3]:=Null
  else
    if T[4]<1 then T[3]:=FTime
    else T[3]:=FTime*5;
  if FNum < 1 then exit;
  for Loop:=1 to FNum do
   begin
    if FX[Loop] = Null then goto Continue;
    if PF[FX[Loop],FY[Loop]] <> 3 then
     begin FX[Loop]:=Null;goto Continue;end;
    PF[FX[Loop],FY[Loop]]:=Null;
    gotoxy(FX[Loop],FY[Loop]);
    write(' ');
    XDir:=0;YDir:=0;
    if PX<FX[Loop] then begin FX[Loop]:=FX[Loop]-1;XDir:=1;end
    else if PX>FX[Loop] then begin FX[Loop]:=FX[Loop]+1;XDir:=-1;end;
    if PY<FY[Loop] then begin FY[Loop]:=FY[Loop]-1;YDir:=1;end
    else if PY>FY[Loop] then begin FY[Loop]:=FY[Loop]+1;YDir:=-1;end;
    gotoxy(FX[Loop],FY[Loop]);
    case PF[FX[Loop],FY[Loop]] of
     Null:begin
           col(9,7);
           write(Fast);
           sound(20);nosound;
           PF[FX[Loop],FY[Loop]]:=3;
          end;
     1..3,6,13,14,17,19..25,28..37,39,41,42,44..47,52..56,58..63:
          begin
           FX[Loop]:=FX[Loop]+XDir;
           FY[Loop]:=FY[Loop]+YDir;
           PF[FX[Loop],FY[Loop]]:=3;
           gotoxy(FX[Loop],FY[Loop]);
           col(9,7);
           write(Fast);
          end;
        4,38,43,64:begin
           PF[FX[Loop],FY[Loop]]:=Null;
           FX[Loop]:=Null;
           write(' ');
           Score:=Score+3;
           sound(800);delay(18);sound(400);delay(20);nosound;
          end;
       40:begin
           sound(800);delay(25);nosound;FX[loop]:=Null;
           Gems:=Gems-3;if Gems<0 then Dead(true);
           if Gems>9 then col(4,7) else col(20,23);bak(7,0);
           gotoxy(71,8);
           write('     ');
           str(Gems,StrVal);
           gotoxy(73-length(StrVal) div 2,8);
           write(StrVal);
           bak(0,0);
          end;
       5,7..12,15,16,18,26,27,48..51:
          begin
           col(9,7);
           write(Fast);
           PF[FX[Loop],FY[Loop]]:=3;
           GrabSound;
          end
     else begin
           FX[Loop]:=FX[Loop]+XDir;
           FY[Loop]:=FY[Loop]+YDir;
           PF[FX[Loop],FY[Loop]]:=3;
           gotoxy(FX[Loop],FY[Loop]);
           col(9,7);
           write(Fast);
          end;
    end; {case}
    CONTINUE:
    if random(6)=1 then Player_Move;
   end;
 end; { Move_Fast }

procedure Move_MBlock;
  var Loop : integer;
  label Continue;
 begin
  T[8]:=BTime;
  if BNum < 1 then exit;
  for Loop:=1 to BNum do
   begin
    if BX[Loop] = Null then goto Continue;
    if PF[BX[Loop],BY[Loop]] <> 38 then
     begin BX[Loop]:=Null;goto Continue;end;
    PF[BX[Loop],BY[Loop]]:=Null;
    XDir:=0;YDir:=0;
    if PX<BX[Loop] then begin BX[Loop]:=BX[Loop]-1;XDir:=1;end
    else if PX>BX[Loop] then begin BX[Loop]:=BX[Loop]+1;XDir:=-1;end;
    if PY<BY[Loop] then begin BY[Loop]:=BY[Loop]-1;YDir:=1;end
    else if PY>BY[Loop] then begin BY[Loop]:=BY[Loop]+1;YDir:=-1;end;
    case PF[BX[Loop],BY[Loop]] of
     Null:begin
           gotoxy(BX[Loop]+XDir,BY[Loop]+YDir);
           write(' ');
           gotoxy(BX[Loop],BY[Loop]);
           col(6,7);
           write(MBlock);
           sound(20);delay(1);nosound;
           PF[BX[Loop],BY[Loop]]:=38;
          end
     else begin
           BX[Loop]:=BX[Loop]+XDir;
           BY[Loop]:=BY[Loop]+YDir;
           PF[BX[Loop],BY[Loop]]:=38;
          end;
    end; {case}
    CONTINUE:
    if random(7)=1 then Player_Move;
   end;
 end; { Move_MBlock }
