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
{***************************************************************************}
{*                          DUNGEONS OF KROZ II                            *}
{*                      Programmed by Scott Miller                         *}
{*                        Non-Shareware Version                            *}
{*        This is a revamped version of Dungeons of Kroz, using the        *}
{*                       KINGDOM OF KROZ II module!                        *}
{*                      Compiled with Turbo Pascal 5.                      *}
{*          Version: 2.0    Levels: 40    Goal: Priceless Amulet           *}
{*                           Began June 20, 1990                           *}
{***************************************************************************}
{$V-,R-,F+}
                       {***************************}
                       {* Last modified:  6/21/90 *}
                       {***************************}

program Dungeons_Of_Kroz_II;

uses Turbo3, Crt, DOS, DUNGEON1, DUNGEON2, DUNGEON3, DUNGEON4, DUNGEON5;

label   NewGame;


procedure Player_Move;
  label ABORT_SAVE, ABORT_RESTORE;
 begin
  case GetKey of
    Null:;

       { Pause }
    80:begin
        bak(0,0);
        play(500,500,100);play(200,100,2);
        ClearKeys;
        flash(18,25,' Press any key to resume game. ');
        Restore_Border;
       end;

       { Quit }
    81:begin
        play(600,600,100);play(450,450,100);play(300,300,100);play(99,99,99);
        ClearKeys;
        flash(15,25,' Are you sure you want to quit (Y/N)? ');
        read(kbd,ch);
        if upcase(ch)='Y' then Sign_Off
        else Restore_Border;
       end;

       { Restore }
    82:begin
        Flash(14,25,' Are you sure you want to RESTORE (Y/N)? ');
        Restore_Border;
        read(kbd,ch);
        if upcase(ch)='N' then exit;
        bak(0,0);col(15,15);
        ClearKeys;
        print(8,25,' Pick which letter to RESTORE from: A, B or C?  A  ');
        cur(2);gotoxy(56,25);
        read(kbd,ch);cur(3);
        Restore_Border;
        col(15,15);bak(0,0);
        case upcase(ch) of
             #27:goto ABORT_RESTORE;
         'B','C': begin ch:=upcase(ch); end
         else    begin ch:='A'; end;
        end;
        print(20,25,'  Restoring from file '+ch+'...  ');
        {$I-}
        assign(SaveFile,'DUNGEON'+ch+'.SAV');
        reset(SaveFile);
        if IOResult<>0 then
         begin
          Restore_Border;
          sound(300);delay(250);nosound;
          flash(14,25,' The SAVE file "'+ch+'" is not on this disk. ');
         end
        {$I+}
        else
         begin
          reset(SaveFile);
          read(SaveFile,SaveStuff);
          close(SaveFile);
          with SaveStuff do
           begin
            Level     := S_Level;
            Score     := S_Score;
            Gems      := S_Gems;
            Whips     := S_Whips;
            Teleports := S_Teleports;
            Keys      := S_Keys;
            WhipPower := S_WhipPower;
            Difficulty:= S_Difficulty;
            PX        := S_PX;
            PY        := S_PY;
            FoundSet  := S_FoundSet;
            MixUp     := S_MixUp;
           end;
          I_Score     := Score;   { SAVE/RESTORE VARIABLES }
          I_Gems      := Gems;
          I_Whips     := Whips;
          I_Teleports := Teleports;
          I_Keys      := Keys;
          I_WhipPower := WhipPower;
          I_Difficulty:= Difficulty;
          I_PX        := PX;
          I_PY        := PY;
          I_FoundSet  := FoundSet;
          Update_Info;
          delay(1000);
          SideWays:=false;
          EvapoRate:=0;
          GenNum:=Null;
          HideLevel:=false;
          HideCreate:=false;
          HideStairs:=false;
          HideTrap:=false;
          HideRock:=false;
          HideGems:=false;
          HideMBlock:=false;
          HideOpenWall:=false;
          Bonus :=0;
          GravOn := false;
          GravCounter := 0;
          TreeRate:=-1;
          T[1]:=5;T[2]:=6;T[3]:=7;T[8]:=7;
          T[4]:=0;  { restore SlowTime   }
          T[5]:=0;  { restore visibility }
          T[6]:=0;  { restore SpeedTime  }
          Replacement:=Null;

          Next_Level;

  { NOTE: The lines below are special conditions }

          window(2,2,XSize+1,YSize+1);
          bak(0,0);clrscr;cur(3);
          window(1,1,80,25);
          Border;
          Display_PlayField;
          for x:=1 to 600 do
           begin
            gotoxy(PX,PY);
            col(random(16),random(16));bak(random(8),0);
            write(Player);sound(x div 2);
           end;
          nosound;
          gotoxy(PX,PY);col(14,15);bak(0,0);write(Player);bak(0,0);
         end;
        Flash(17,25,'Press any key to begin this level.');
        ABORT_RESTORE:
        Restore_Border;
       end;

       { Save }
    83:begin
        Flash(15,25,' Are you sure you want to SAVE (Y/N)? ');
        Restore_Border;
        read(kbd,ch);
        if upcase(ch)='N' then exit;
        bak(0,0);col(15,15);
        ClearKeys;
        print(11,25,' Pick which letter to SAVE to: A, B or C?  A  ');
        cur(2);gotoxy(54,25);
        read(kbd,ch); cur(3);
        Restore_Border;
        col(15,15);bak(0,0);
        case upcase(ch) of
             #27:goto ABORT_SAVE;
         'B','C': begin ch:=upcase(ch); end
         else    begin ch:='A'; end;
        end;
        with SaveStuff do
         begin
          S_Level     := Level;
          S_Score     := I_Score;
          S_Gems      := I_Gems;
          S_Whips     := I_Whips;
          S_Teleports := I_Teleports;
          S_Keys      := I_Keys;
          S_WhipPower := I_WhipPower;
          S_Difficulty:= I_Difficulty;
          S_PX        := I_PX;
          S_PY        := I_PY;
          S_FoundSet  := I_FoundSet;
          S_MixUp     := MixUp;
         end;
        print(22,25,'  Saving to file '+ch+'...  ');
        assign(SaveFile,'DUNGEON'+ch+'.SAV');
        rewrite(SaveFile);
        write(SaveFile,SaveStuff);
        close(SaveFile);
        delay(1000);
        ABORT_SAVE:
        Restore_Border;
       end;

       { Teleport }
    84:begin
        if Teleports < 1 then begin NoneSound;exit;end;
        Teleports:=Teleports-1;
        Update_Info;
        for x:=1 to 250 do
        begin
         gotoxy(PX,PY);
         col(random(16),random(16));bak(random(8),random(8));
         write(Player);
        end;
        gotoxy(PX,PY);
        if Replacement = 75 then
         begin bak(0,0); col(7,7); write(Rope); end
        else
         begin bak(0,0); col(0,0); write(' '); end;
        i:=0;
        col(14,15);
        sound(20);
        repeat
         inc(i);
         x:=random(XSize)+XBot;
         y:=random(YSize)+YBot;
         if PF[x,y] in [0,32,33,37,39,41,44,47,55..57,61..63,67,68..74,224..231] then
          begin
           gotoxy(x,y);
           write(#1);
           delay(3);
           gotoxy(x,y);
           write(' ');
          end;
        until i>700;
        xb:=0;
        repeat
         xb:=xb+2;yb:=0;
         repeat yb:=yb+1;sound(xb*yb) until yb>220;
        until xb>90;
        nosound;
        PF[PX,PY]:=Replacement;PX:=Null;
        repeat
         x:=random(XSize)+XBot;
         y:=random(YSize)+YBot;
         if PF[x,y] = Null then
          begin
           PX:=x; PY:=y; PF[PX,PY]:=40;
          end;
        until PX <> Null;
        Replacement:=Null;
        ClearKeys;
        for x:=1 to ord(FastPC)*3000 + ord(not FastPC)*500 do
        begin
         gotoxy(PX,PY);
         col(random(16),random(16));bak(random(8),random(8));
         write(Player);
        end;
        if T[5]<1 then
         begin
          gotoxy(PX,PY);col(14,15);bak(0,0);write(Player);
         end
        else begin gotoxy(PX,PY);bak(0,0);col(0,0);write(' ');end;
       end;

       { Whip }
    87:begin
        if Whips < 1 then begin NoneSound; exit; end;
        Whips:=Whips-1;
        sound(70);
        if (PY>YBot) and (PX>XBot) then Hit(PX-1,PY-1,'\');
        if (PX>XBot) then Hit(PX-1,PY,'Ä');
        if (PY<YTop) and (PX>XBot) then Hit(PX-1,PY+1,'/');
        if (PY<YTop) then Hit(PX,PY+1,'³');
        if (PY<YTop) and (PX<XTop) then Hit(PX+1,PY+1,'\');
        if (PX<XTop) then Hit(PX+1,PY,'Ä');
        if (PY>YBot) and (PX<XTop) then Hit(PX+1,PY-1,'/');
        if (PY>YBot) then Hit(PX,PY-1,'³');
        nosound;
        Update_Info;
        ClearKeys;
       end;

       { North }
   172:move(0,-1,PMove);

       { South }
   180:move(0,1,PMove);

       { East }
   177:move(1,0,PMove);

       { West }
   175:move(-1,0,PMove);

       { Northwest }
   171:move(-1,-1,PMove);

       { Northeast }
   173:move(1,-1,PMove);

       { Southwest }
   179:move(-1,1,PMove);

       { Southeast }
   181:move(1,1,PMove);

  end;
 end; { Player_Move }

procedure Move_Slow;
  var Loop : integer;
  label Continue;
 begin

{  if Slow   = #142 then Slow   := #143 else Slow   := #142;}

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
    if not Sideways then
     if PY<SY[Loop] then begin SY[Loop]:=SY[Loop]-1;YDir:=1;end
     else if PY>SY[Loop] then begin SY[Loop]:=SY[Loop]+1;YDir:=-1;end;
    gotoxy(SX[Loop],SY[Loop]);
    case PF[SX[Loop],SY[Loop]] of
     Null,68..74:begin
           col(12,7);
           if random(2)=0 then Slow:=#142 else Slow:=#65;
           write(Slow);
           sound(20);nosound;
           PF[SX[Loop],SY[Loop]]:=1;
          end;
     1..3,6,13,14,17,19..25,28..37,39,41,42,44..47,52..56,58..63,
     65,66,67,75..80,224..231:
          begin
           SX[Loop]:=SX[Loop]+XDir;
           SY[Loop]:=SY[Loop]+YDir;
           PF[SX[Loop],SY[Loop]]:=1;
           gotoxy(SX[Loop],SY[Loop]);
           col(12,7);
           if random(2)=0 then Slow:=#142 else Slow:=#65;
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
       5,7..12,15,16,18,26,27,48..51,82,83:
          begin
           col(12,7);
           if random(2)=0 then Slow:=#142 else Slow:=#65;
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
           if random(2)=0 then Slow:=#142 else Slow:=#65;
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

{  if Medium = #153 then Medium := #148 else Medium := #153;}

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
    if not Sideways then
     if PY<MY[Loop] then begin MY[Loop]:=MY[Loop]-1;YDir:=1;end
     else if PY>MY[Loop] then begin MY[Loop]:=MY[Loop]+1;YDir:=-1;end;
    gotoxy(MX[Loop],MY[Loop]);
    case PF[MX[Loop],MY[Loop]] of
     Null,68..74:begin
           col(10,7);
           if random(2)=0 then Medium:=#148 else Medium:=#153;
           write(Medium);
           sound(20);nosound;
           PF[MX[Loop],MY[Loop]]:=2;
          end;
     1..3,6,13,14,17,19..25,28..37,39,41,42,44..47,52..56,58..63,65,
     66,67,75..80,224..231:
          begin
           MX[Loop]:=MX[Loop]+XDir;
           MY[Loop]:=MY[Loop]+YDir;
           PF[MX[Loop],MY[Loop]]:=2;
           gotoxy(MX[Loop],MY[Loop]);
           col(10,7);
           if random(2)=0 then Medium:=#148 else Medium:=#153;
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
       5,7..12,15,16,18,26,27,48..51,82,83:
          begin
           col(10,7);
           if random(2)=0 then Medium:=#148 else Medium:=#153;
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
           if random(2)=0 then Medium:=#148 else Medium:=#153;
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
    if not Sideways then
     if PY<FY[Loop] then begin FY[Loop]:=FY[Loop]-1;YDir:=1;end
     else if PY>FY[Loop] then begin FY[Loop]:=FY[Loop]+1;YDir:=-1;end;
    gotoxy(FX[Loop],FY[Loop]);
    case PF[FX[Loop],FY[Loop]] of
     Null,68..74:begin
           col(9,7);
           write(Fast);
           sound(20);nosound;
           PF[FX[Loop],FY[Loop]]:=3;
          end;
     1..3,6,13,14,17,19..25,28..37,39,41,42,44..47,52..56,58..63,65,
     66,67,75..80,224..231:
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
       5,7..12,15,16,18,26,27,48..51,82,83:
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
 begin
 end; { Move_MBlock }


BEGIN
Screen;
NewGame:
Title;
Border;
Init_Screen;
Update_Info;
Define_Levels;
LEVEL1;
Display_PlayField;
I_Score     := Score;   { SAVE/RESTORE VARIABLES }
I_Gems      := Gems;
I_Whips     := Whips;
I_Teleports := Teleports;
I_Keys      := Keys;
I_WhipPower := WhipPower;
I_Difficulty:= Difficulty;
I_PX        := PX;
I_PY        := PY;
I_FoundSet  := FoundSet;
for x:=1 to 800 do
 begin
  gotoxy(PX,PY);
  col(random(16),random(16));bak(random(8),0);
  write(Player);sound(x div 2);
 end;
gotoxy(PX,PY);col(14,15);bak(0,0);write(Player);nosound;bak(0,0);
ClearKeys;
Flash(17,25,'Press any key to begin this level.');
repeat
 Player_Move;
 if keypressed then SkipTime:=801 else SkipTime:=SkipTime+1;
 if SkipTime>800 then
  begin
   for x:=1 to TMax do T[x]:=T[x]-1;
   if SkipTime>3000 then for x:=1 to TMax do T[x]:=T[x]-5;
   if FastPC then SkipTime := -150 else SkipTime:=0;
   if T[7]<1 then
    begin
     if T[1]<1 then Move_Slow;
     if T[2]<1 then Move_Medium;
     if T[3]<1 then Move_Fast;
    end;
  end;
until Restart;
goto NewGame;

END. {*** DUNGEONS OF KROZ II ***}
