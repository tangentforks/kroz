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
{*                             RETURN TO KROZ                              *}
{*                       Programmed by Scott Miller                        *}
{*                            Shareware Version                            *}
{*      This is the first of the Super Kroz Trilogies, designed to be      *}
{*                      compiled with Turbo Pascal 5.                      *}
{*                Version: 1.2    Levels: 20    Goal: Crown                *}
{*                   The other two Super Kroz games are:                   *}
{*               Temple of Kroz and The Last Crusade of Kroz               *}
{*                           Began July 26, 1989                           *}
{***************************************************************************}
{$V-,R-,F+}
                       {***************************}
                       {* Last modified: 11/18/89 *}
                       {***************************}

program Return_To_Kroz;

uses Turbo3, Crt, DOS, Return;

const

   {0}  Null      = 0;
   {4}  Block     = #178;  
   {5}  Whip      = #244;  
   {6}  Stairs    = #240;  
   {7}  Chest     = #67;   
   {8}  SlowTime  = #232;  
   {9}  Gem       = #4;    
   {10} Invisible = #173;   
   {11} Teleport  = #24;   
   {12} Key       = #140; 
   {13} Door      = #236;  
   {14} Wall      = #219;  
   {15} SpeedTime = #233; 
   {16} Trap      = #249;  
   {17} River     = #247;   {178}
   {18} Power     = #9;    
   {19} Forest    = #176; 
   {20} Tree      = #177; 
   {21} Bomb      = #157;  
   {22} Lava      = #178;  
   {23} Pit       = #176;
   {24} Crown     = #5;   
   {25} Tunnel    = #239;  
   {26} Freeze    = #159; 
   {27} Nugget    = #15;   
   {28} Quake     = #0;
   {29} IBlock    = #30;
   {30} IWall     = #0;
   {31} IDoor     = #0;
   {32} Stop      = #0;
   {33} Trap2     = #0;
   {34} Zap       = #30;  
   {35} Create    = #31;
   {36} Generator = #6; 
   {37} Trap3     = #0;   
   {38} MBlock    = #178; 
   {39} Trap4     = #0;  
   {40} Player    = #2;  
   {41} ShowGems  = #0;
   {42} Tablet    = #254;
   {43} ZBlock    = #178;
   {44} BlockSpell= #0;
   {45} Chance    = #63;
   {46} Statue    = #1;
   {47} WallVanish= #0;
   {48}  { K }
   {49}  { R }
   {50}  { O }
   {51}  { Z }
   {52} OWall1    =#219;
   {53} OWall2    =#219;
   {54} OWall3    =#219;  { grey }
   {55} CWall1    =#0;
   {56} CWall2    =#0;
   {57} CWall3    =#0;
   {58} OSpell1   =#127;
   {59} OSpell2   =#127;
   {60} OSpell3   =#127;
   {61} CSpell1   =#0;
   {62} CSpell2   =#0;
   {63} CSpell3   =#0;
   {64} GBlock    =#178;

        TotObjects= 64;

type
        Str80     = string[80];
        NameStr   = string[15];
        HSType    = record
                     Name        : NameStr;
                     HighScore,
                     HighLevel   : longint;
                    end;
        SaveType  = record
                     S_Level,
                     S_Score,
                     S_Gems,
                     S_Whips,
                     S_Teleports,
                     S_Keys,
                     S_WhipPower,
                     S_Difficulty,
                     S_PX, S_PY  : longint;
                     S_FoundSet  : set of 1..ToTObjects;
                     S_MixUp     : boolean;
                    end;

var
        Parsed    : array [1..ToTObjects] of integer;
        Score     : longint;
        Gems,
        Whips,
        Teleports,
        Keys,
        Difficulty,
        Level,
        WhipPower,
        PXOld, PYOld,
        BC, BB,
        SkipTime,
        BTime,
        STime,
        MTime,
        FTime,
        XDir,
        YDir,
        loop,
        width,
        xl,xr,
        yl,yr,
        Replacement,
        Bonus,
        GenFactor,
        x,y,i,a,b : integer;
        xb, yb    : byte;
        StrVal    : Field;
        Result    : Registers;
        MixUp,
        Done,
        Restart   : boolean;
        FoundSet  : set of 0..ToTObjects;
        I_Score,
        I_Gems,
        I_Whips,
        I_Teleports,
        I_Keys,
        I_WhipPower,
        I_Difficulty,
        I_PX, I_PY  : longint;
        I_FoundSet  : set of 1..ToTObjects;
        SaveStuff   : SaveType;
        SaveFile    : file of SaveType;
        HSList      : array [1..15] of HSType;
        HSFile      : file of HSType;
        FileName    : file;

label   NewGame;

procedure Restore_Border;forward;

 {$I A:\RETURN.TIT * }

procedure Move(XWay,YWay:integer);
  var Killed,
      TryCounter : integer;
      Spot,
      Original   : byte;
   procedure Go;
    begin
     PF[PX,PY]:=Replacement;
     gotoxy(PX,PY);
     write(' ');
     PX:=PX+XWay;PY:=PY+YWay;
     if PF[PX,PY] in [55..57] then Replacement:=PF[PX,PY]
     else                          Replacement:=Null;
     PF[PX,PY]:=40;
     if T[5]<1 then
      begin
       gotoxy(PX,PY);col(14,15);bak(0,0);
       write(Player);
      end
     else begin gotoxy(PX,PY);write(' ');end;
     FootStep;
    if keypressed then
     begin
      read(kbd,ch);
      if ch=#27 then read(kbd,ch);
     end;
    end; { Go }
 begin
  if (PX+XWay<XBot) or (PX+XWay>XTop) or
     (PY+YWay<YBot) or (PY+YWay>YTop) then
       begin
        Static;
        AddScore(20);
        ClearKeys;
        if not(0 in FoundSet) then
         begin
          FoundSet:=FoundSet+[0];
          Flash(16,25,'An electrified Wall blocks your way.');
         end;
        exit;
       end;
  case PF[PX+XWay,PY+YWay] of
   {Null}      0:Go;
   {Monsters}  1..3:
                 begin
                  Gems:=Gems-PF[PX+XWay,PY+YWay];
                  if Gems<0 then DEAD(true);
                  AddScore(PF[PX+XWay,PY+YWay]);
                  sound(200+200*PF[PX+XWay,PY+YWay]);delay(25);nosound;
                  Go;
                  if keypressed then
                   begin
                    read(kbd,ch);
                    if ch=#27 then read(kbd,ch);
                   end;
                 end;
   {Block}     4,43,64:begin
                  BlockSound;AddScore(4);
                  ClearKeys;
                  if not(4 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[4];
                    Flash(18,25,'A Crumbled Wall blocks your way.');
                  end;
                 end;
   {Whip}      5:begin
                  Go;
                  GrabSound;
                  Whips:=Whips+1;
                  AddScore(5);
                  if not(5 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[5];
                    Flash(26,25,'You found a Whip.');
                   end;
                 end;
   {Stairs}    6:begin
                  Go;
                  ClearKeys;
                  if Level=20 then
                   begin
                    FootStep;
                    delay(300);
                    FootStep;
                    delay(300);
                    FootStep;
                    for x:=1 to ord(FastPC)*2650+ord(not FastPC)*250 do
                     begin
                      sound(random(3000)+x);
                      gotoxy(PX,PY);
                      bak(random(8),0);
                      col(14,15);
                      write(Player);
                      col(random(16),random(16));
                      bak(0,0);
                      print(15,25,'Oh no, something strange is happening!');
                     end;
                    for i:=ord(FastPC)*9000+ord(FastPC)*2200 downto 20 do
                     sound(random(i));
                    col(14,15);bak(0,0);
                    for x:=1 to ord(FastPC)*3500+ord(not FastPC)*650 do
                     begin
                      sound(x*3);
                      gotoxy(PX,PY);
                      write(chr(220+random(4)));
                     end;
                    nosound;
                    gotoxy(PX,PY);
                    col(16,16);
                    bak(2,7);
                    write(Stairs);
                    Restore_Border;
                    Flash(14,25,'You are magically transported from Kroz!');
                    ClearKeys;
                    col(15,15);bak(0,0);
                    print(15,25,'Your Gems are worth 100 points each...');
                    for i:=1 to Gems do
                     begin
                      sound(i*8+100); Score:=Score+10; Update_Info; delay(20);
                     end; nosound; 
                    read(kbd,ch);
                    Restore_Border;
                    ClearKeys;
                    col(15,15);bak(0,0);
                    print(15,25,'Your Whips are worth 100 points each...');
                    for i:=1 to Whips do
                     begin
                      sound(i*10+200); Score:=Score+10; Update_Info; delay(20);
                     end; nosound; 
                    read(kbd,ch);
                    Restore_Border;
                    ClearKeys;
                    col(15,15);bak(0,0);
                    print(9,25,'Your Teleport Scrolls are worth 200 points each...');
                    for i:=1 to Teleports do
                     begin
                      sound(i*12+300); Score:=Score+20; Update_Info; delay(30);
                     end; nosound; 
                    read(kbd,ch);
                    Restore_Border;
                    ClearKeys;
                    col(15,15);bak(0,0);
                    print(14,25,'Your Keys are worth 10,000 points each...');
                    for i:=1 to Keys do
                     begin
                      sound(i*30+100); Score:=Score+1000; Update_Info; delay(50);
                     end; nosound; 
                    read(kbd,ch);
                    Restore_Border;
                    ClearKeys;
                    WON;
                   end;
                  if MixUp then Level:=random(17)+2
                  else Level:=Level+1;
                  if Level = 12 then  { remind player of registration fee }
                   begin 
                    bak(1,0);
                    window(2,2,65,24);
                    clrscr;cur(3);
                    col(14,9);
                    gotoxy(26,2);
                    write('RETURN TO KROZ');
                    col(11,7);
                    gotoxy(1,4);
                    writeln('  This is Volume I of a set of three games that explore the');
                    writeln('  depths of Kroz, an underground kingdom so vast and perilous');
                    writeln('  that no one but you dares venture in its chambers.');
                    writeln;
                    writeln('  The other two games that continue this adventure are:');
                    writeln;
                    writeln('          þ Temple of Kroz');
                    writeln('          þ The Final Crusade of Kroz');
                    writeln;
                    writeln('  Also available are three more Kroz games that took place');
                    writeln('  in a time before Return to Kroz:');
                    writeln;
                    writeln('          þ Kingdom of Kroz  (a national contest winner)');
                    writeln('          þ Caverns of Kroz');
                    writeln('          þ Dungeons of Kroz');
                    writeln;
                    writeln('  Registered players receive a hint sheet and "Domain" map.');
                    col(15,15);
                    writeln;
                    write('  Please hit any key to continue your journey, Adventurer.');
                    repeat
                     x:=random(maxint);
                    until keypressed;
                    window(1,1,80,25);cur(3);
                   end;
                  AddScore(6);
                  if not(6 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[6];
                    Flash(14,25,'Stairs take you to the next lower level.');
                    ClearKeys;
                   end;
                  FootStep;
                  T[1]:=5;T[2]:=6;T[3]:=7;T[8]:=7;
                  T[4]:=0;  { restore SlowTime   }
                  T[5]:=0;  { restore visibility }
                  T[6]:=0;  { restore SpeedTime  }
                  FoundSet:=FoundSet-[8,13,15,17,19..21,22,26,28,36];
                  GenNum:=0;
                  LavaFlow:=false;
                  Bonus := 0;
                  case level of
                   1:Level1;
                   3:Level3;
                   5:Level5;
                   7:Level7;
                   9:Level9;
                   11:Level11;
                   13:Level13;
                   15:Level15;
                   17:Level17;
                   19:Level19;
                   20:Level20
                   else Create_PlayField;
                  end;
                  FootStep;
                  bak(GemColor,7);
                  for x:=1 to 30 do
                   begin
                    window(32-x,12-(x div 3),35+x,14+(x div 3));
                    clrscr;
                   end;
                  bak(0,0);
                  for x:=1 to 30 do
                   begin
                    window(32-x,12-(x div 3),35+x,14+(x div 3));
                    clrscr;
                    sound(x*45);
                   end; nosound;
                  window(1,1,80,25);cur(3);
                  window(2,2,65,24);
                  clrscr;
                  window(1,1,80,25);cur(3);
                  Border;
                  FootStep;
                  Display_PlayField;
                  FootStep;
                  for x:=1 to 600 do
                   begin
                    gotoxy(PX,PY);
                    col(random(16),random(16));bak(random(8),0);
                    write(Player);sound(x div 2);
                   end;
                  gotoxy(PX,PY);col(14,15);bak(0,0);
                  write(Player);
                  nosound;
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
                  if Level=20 then
                   Flash(10,25,'You''ve finally reached the deepest level of Kroz!') 
                  else Flash(16,25,'Press any key to begin this level.'); 
                 end;
   {Chest}     7:begin
                  Go;
                  for xb:=3 to 42 do for yb:=3 to 42 do
                   begin sound(xb*yb);delay(1);end; nosound;
                  x:=random(3)+2;          {Whips}
                  i:=random(Difficulty)+2; {Gems}
                  Whips:=Whips+x;
                  Gems:=Gems+i;
                  AddScore(7);
                  bak(0,0);
                  ClearKeys;
                  repeat
                   col(random(2)+14,15);
                   gotoxy(10,25);
                   write('You found ',i,' gems and ',x,' whips inside the chest!');
                  until keypressed;
                  Restore_Border;
                 end;
   {SlowTime}  8:begin
                  Go;
                  AddScore(5);
                  for x:=7 downto 1 do
                   begin sound(x*50+300);delay(x*10+40);end;nosound;
                  if FastPC then T[4] := 100 else T[4]:=70;
                  T[6]:=0;
                  if not(8 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[8];
                    Flash(16,25,'You activated a Slow Creature spell.');
                   end;
                 end;
   {Gem}       9:begin
                  Go;
                  GrabSound;
                  Gems:=Gems+1;
                  AddScore(9);
                  if not(9 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[9];
                    Flash(15,25,'Gems give you both points and strength.');
                   end;
                 end;
   {Invisible}10:begin
                  Go;
                  AddScore(10);
                  for x:=1 to 4 do
                   begin sound(600);delay(50);nosound;delay(50);end;nosound;
                  gotoxy(PX,PY);write(' ');
                  if FastPC then T[5] := 120 else T[5]:=35;
                  if not(10 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[10];
                    Flash(16,25,'Oh no, a temporary Blindness Potion!');
                   end;
                 end;
   {Teleport} 11:begin
                  Go;
                  GrabSound;
                  Teleports:=Teleports+1;
                  AddScore(11);
                  if not(11 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[11];
                    Flash(20,25,'You found a Teleport scroll.');
                   end;
                 end;
   {Key}      12:begin
                  Go;
                  Keys:=Keys+1;
                  GrabSound;
                  Update_Info;
                  if not(12 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[12];
                    Flash(22,25,'Use Keys to unlock doors.');
                   end;
                 end;
   {Door}     13:if Keys<1 then
                  begin
                   for x:=1 to 15 do
                    begin sound(random(99)+30);delay(15);nosound;delay(15);end;
                   ClearKeys;
                   if not(13 in FoundSet) then
                    begin
                     FoundSet:=FoundSet+[13];
                     Flash(18,25,'To pass the Door you need a Key.');
                    end;
                  end
                 else
                  begin
                   Keys:=Keys-1;
                   AddScore(11);
                   for x:=10 to 90 do
                    begin sound(x);delay(15);end;
                   ClearKeys;
                   Go;
                   if(Level=30)and(PX=53)and(PY=13)then
                    Flash(17,25,'You have found the magical Staff!');
                  end;
   {Wall/River}14,17:begin
                  if PF[PX+XWay,PY+YWay]=14 then BlockSound
                  else
                   begin
                    for x:=1 to ord(FastPC)*2000+ord(not FastPC)*500 do sound(random(x*2+200)+x);nosound;
                   end;
                  AddScore(14);
                  ClearKeys;
                  if not(PF[PX+XWay,PY+YWay] in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[PF[PX+XWay,PY+YWay]];
                    case PF[PX+XWay,PY+YWay] of
                     14:Flash(20,25,'A Solid Wall blocks your way.');
                     17:Flash(18,25,'You cannot travel through Water.');
                    end;
                   end;
                 end;
   {SpeedTime}15:begin
                  Go;
                  AddScore(15);
                  for x:=1 to 7 do
                   begin sound(x*50+300);delay(x*10+40);end;nosound;
                  if FastPC then T[6] := 80 else T[6]:=50;
                  T[4]:=0;
                  if not(15 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[15];
                    Flash(16,25,'You activated a Speed Creature spell.');
                   end;
                 end;
   {Trap}     16:begin
                  Go;
                  AddScore(16);
                  for x:=1 to 500 do
                   begin
                    gotoxy(PX,PY);
                    col(random(16),random(16));bak(random(8),random(8));
                    write(Player);
                   end;
                  gotoxy(PX,PY);bak(0,0);col(0,0);write(' ');
                  for yb:= 60 downto 1 do
                   for x:= 550 downto 20 do sound(yb*x); nosound;
                  PF[PX,PY]:=Null;PX:=Null;
                  repeat
                   x:=random(XSize)+XBot;
                   y:=random(YSize)+YBot;
                   if PF[x,y] = Null then
                    begin
                     PX:=x; PY:=y; PF[PX,PY]:=40;
                    end;
                  until PX <> Null;
                  for x:=1 to ord(FastPC)*3000 + ord(not FastPC)*500 do
                   begin
                    gotoxy(PX,PY);
                    col(random(16),random(16));bak(random(8),random(8));
                    write(Player);
                   end;
                  if T[5]<1 then
                   begin
                    gotoxy(PX,PY);col(14,15);bak(0,0);
                    write(Player);bak(0,0);
                   end
                  else begin gotoxy(PX,PY);bak(0,0);write(' ');end;
                  ClearKeys;
                  if not(16 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[16];
                    Flash(19,25,'You activated a Teleport trap!');
                   end;
                 end;
   {Power}    18:begin
                  Go;
                  WhipPower:=WhipPower+1;
                  AddScore(15);
                  for x:=3 to 35 do
                   for y:=45 to 52 do
                    begin
                     sound(x*y);delay(7);nosound;delay(15);
                     col(random(8),random(8));
                     gotoxy(PX,PY);
                     write(Player);
                    end;
                  bak(0,0);col(14,15);
                  gotoxy(PX,PY);
                  write(Player);
                  bak(0,0);
                  Flash(22,25,'An increase Whip Power Ring!');
                 end;
  {Forest/Tree} 19,20:
                 begin
                  BlockSound;AddScore(4);
                  ClearKeys;
                  if not(PF[PX+XWay,PY+YWay] in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[PF[PX+XWay,PY+YWay]];
                    case PF[PX+XWay,PY+YWay] of
                     19:Flash(14,25,'You cannot travel through forest terrain.');
                     20:Flash(24,25,'A tree blocks your way.');
                    end;
                   end;
                 end;
   {Bomb}     21:begin
                  Go;
                  xr:=0;xl:=0;yr:=0;yl:=0;
                  for i:=70 to 600 do begin sound(i*2);delay(3);end;bor(14);
                  for i:=ord(FastPC)*8230+ord(not FastPC)*5000 downto 20 do
                   sound(random(i));
                   for width:=1 to 4 do
                    begin
                     sound(30);
                     if PX-width>1 then xl:=width;
                     if PX+width<66 then xr:=width;
                     if PY-width>1 then yl:=width;
                     if PY+width<25 then yr:=width;
                     for x:=PX-xl to PX+xr do
                      for y:=PY-yl to PY+yr do
                       if PF[x,y] in [Null..4,13,16,19,28..32,35,36..39,42,43,45,48..51,64] then
                        begin
                         gotoxy(x,y);
                         col(12,15);
                         write(#219);
                        end;
                    end;
                    delay(100);
                    for width:=1 to 4 do
                     begin
                      if PX-width>1 then xl:=width;
                      if PX+width<66 then xr:=width;
                      if PY-width>1 then yl:=width;
                      if PY+width<25 then yr:=width;
                      for x:=PX-xl to PX+xr do
                       for y:=PY-yl to PY+yr do
                        if PF[x,y] in [Null..4,13,16,19,28..32,35,36..39,43] then
                         begin
                          gotoxy(x,y);
                          col(0,0);
                          write(' ');
                          if PF[x,y] in [1..3] then Score:=Score+PF[x,y];
                          PF[x,y]:=Null;
                         end;
                     end;
                  nosound;
                  bor(4);
                  Update_Info;
                  ClearKeys;
                  if not(21 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[21];
                    Flash(20,25,'You activated a Magic Bomb!');
                   end;
                 end;
   {Lava}     22:begin
                  Go;
                  Gems:=Gems-10;
                  for x:=ord(FastPC)*2000+ord(not FastPC)*1400 downto 20 do
                   for y:= 9 downto 2 do sound(random(y*x+100)+y*x);nosound;
                  if Gems<0 then
                   begin
                    Gems:=0;
                    AddScore(22);
                    Dead(true);
                   end
                  else
                   AddScore(22);
                  ClearKeys;
                  if not(22 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[22];
                    Flash(8,25,'Oooooooooooooooooooh!  Lava hurts!  (Lose 10 Gems.)');
                   end;
                 end;
   {Pit}      23:begin
                  Go;
                  ClearKeys;
                  Flash(22,25,'Oh no, a Bottomless Pit!');
                  bak(6,7);
                  window(2,2,65,24);
                  clrscr;
                  bak(0,0);
                  window(32,2,36,24);
                  clrscr;
                  window(1,1,80,25);
                  cur(3);
                  x:=3000;
                  col(14,15);
                  for i:=1 to 16 do
                   for y:=2 to 24 do
                    begin
                     x:=x-8;
                     sound(x);
                     gotoxy(34,y);
                     write(Player);
                     delay(52-(3*i));
                     gotoxy(34,y);
                     write(' ');
                    end; nosound;
                  gotoxy(34,24);
                  write('_');
                  for i:=8000 downto 20 do sound(random(i));nosound;
                  ClearKeys;
                  flash(29,1,'* SPLAT! *');
                  Dead(false);
                 end;
   {Crown}    24:begin
                  for x:=1 to 24 do
                   for y:=5 downto 1 do
                    begin
                     sound(x*45+y*10);delay(y*3);nosound;delay(40);
                     gotoxy(18,8);col(random(16),random(16));
                     write(Crown);
                    end;
                   gotoxy(18,8);
                   col(16,16);bak(4,7);
                   write(Stairs);bak(0,0);
                   PF[PX+XWay,PY+YWay]:=6;
                   Score:=Score+2500;
                   Update_Info;
                   ClearKeys;
                   Flash(13,25,'The Crown is finally yours--25,000 points!');
                  end;
   {Tunnel}   25:begin
                  PXOld:=PX;PYOld:=PY;
                  Go;
                  delay(350);FootStep;delay(500);FootStep;
                  PF[PX,PY]:=25;
                  gotoxy(PX,PY);
                  col(15,7);
                  write(Tunnel);
                  repeat
                   sound(random(3000)+100);
                   x:=random(XSize)+XBot;
                   y:=random(YSize)+YBot;
                  until (PF[x,y]=25)and((PXOld+XWay<>x)or(PYOld+YWay<>y));
                  Done:=false;
                  for i:=1 to 100 do
                   begin
                    sound(random(3000)+100);
                    a:=random(3)-1;
                    b:=random(3)-1;
                    if(PF[x+a,y+b] in [0,32,55..57]) and (Done=false)then
                     begin
                      if not((x+a<XBot)or(x+a>XTop)or(y+b<YBot)or(y+b>YTop)) then
                       begin
                        Done:=true;
                        x:=x+a;
                        y:=y+b;
                       end;
                     end;
                   end;
                  nosound;
                  if Done=false then
                   begin
                    x:=PXOld;
                    y:=PYOld;
                   end;
                  PX:=x;PY:=y;
                  if PF[PX,PY] in [55..57] then Replacement:=PF[PX,PY]
                  else                          Replacement:=Null;
                  PF[PX,PY]:=40;
                  for x:=1 to ord(FastPC)*2100+ord(not FastPC)*400 do
                   begin
                    sound(random(1000));
                    gotoxy(PX,PY);
                    col(random(16),random(16));bak(random(8),0);
                    write(Player);
                   end;nosound;
                  if T[5]<1 then
                   begin
                    gotoxy(PX,PY);col(14,15);bak(0,0);
                    write(Player);
                   end
                  else begin gotoxy(PX,PY);bak(0,0);col(0,0);write(' ');end;
                  ClearKeys;
                  if not(25 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[25];
                    Flash(16,25,'You passed through a secret Tunnel!');
                   end;
                 end;
   {Freeze}   26:begin
                  Go;
                  AddScore(11);
                  GrabSound;
                  for x:=1 to ord(FastPC)*8000+ord(not FastPC)*5000 do 
                   sound(random(1000)+x+200);nosound;
                  if FastPC then T[7]:=60 else T[7]:=55;
                  if not(26 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[26];
                    Flash(13,25,'You have activated a Freeze Creature spell!');
                   end;
                 end;
   {Nugget}   27:begin
                  Go;
                  AddScore(27);
                  GrabSound;
                  if not(27 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[27];
                    Flash(15,25,'You found a Gold Nugget...500 points!');
                   end;
                 end;
   {Quake}    28:begin
                  Go;
                  for i:=1 to ord(FastPC)*5500 + ord(not FastPC)*2500 do
                    sound(random(i));nosound;
                  for i:=1 to 50 do
                   begin
                    Done:=false;
                    repeat
                     x:=random(XSize)+XBot;
                     y:=random(YSize)+YBot;
                     if PF[x,y] in [0..3,5,7..11,15..16,26,32] then
                      begin
                       Done:=true;
                       PF[x,y]:=4;
                       gotoxy(x,y);
                       col(6,7);
                       write(Block);
                      end;
                    until (random(100)=0) or Done;
                    for x:=1 to ord(FastPC)*700 + ord(not FastPC)*400 do
                     sound(random(200));nosound;
                   end;
                  for i:=2500 downto 20 do sound(random(i));nosound;
                  if not(28 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[28];
                    ClearKeys;
                    Flash(15,25,'Oh no, you set off an Earthquake trap!');
                   end;
                 end;
   {IBlock}   29:begin
                  gotoxy(PX+XWay,PY+YWay);
                  col(6,7);
                  write(Block);
                  PF[PX+XWay,PY+YWay]:=4;
                  BlockSound;
                  ClearKeys;
                  if not(29 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[29];
                    Flash(13,25,'An Invisible Crumbled Wall blocks your way.');
                   end;
                 end;
   {IWall}    30:begin
                  gotoxy(PX+XWay,PY+YWay);
                  col(6,7);
                  write(Wall);
                  PF[PX+XWay,PY+YWay]:=14;
                  BlockSound;
                  ClearKeys;
                  if not(30 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[30];
                    Flash(17,25,'An Invisible Wall blocks your way.');
                   end;
                 end;
   {IDoor}    31:begin
                  gotoxy(PX+XWay,PY+YWay);
                  col(3,0);bak(5,7);
                  write(Door);
                  bak(0,0);
                  PF[PX+XWay,PY+YWay]:=13;
                  BlockSound;
                  ClearKeys;
                  if not(31 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[31];
                    Flash(17,25,'An Invisible Door blocks your way.');
                   end;
                 end;
   {Stop}     32:Go;
   {Trap2}    33:begin
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 33 then PF[x,y] := Null;
                 end;
   {Zap}      34:begin
                  Go;
                  GrabSound;
                  Killed := 0;
                  TryCounter := 0;
                  repeat
                   TryCounter:=TryCounter+1;
                    case random(3)+1 of
                    1:if SNum>1 then
                       begin
                        i:=random(SNum)+1;
                        if SX[i]<>Null then
                         begin
                          Killed:=Killed+1;
                          for x:=ord(FastPC)*230+ord(not FastPC)*80 downto 3 do
                           begin
                            sound(x*5);
                            gotoxy(SX[i],SY[i]);col(random(16),15);
                            write(Slow);
                           end; nosound;
                          col(0,0);gotoxy(SX[i],SY[i]);write(' ');
                          PF[SX[i],SY[i]]:=Null;
                          SX[i]:=Null;
                         end;
                       end;
                    2:if MNum>1 then
                       begin
                        i:=random(MNum)+1;
                        if MX[i]<>Null then
                         begin
                          Killed:=Killed+1;
                          for x:=ord(FastPC)*230+ord(not FastPC)*80 downto 3 do
                           begin
                            sound(x*5);
                            gotoxy(MX[i],MY[i]);col(random(16),15);
                            write(Medium);
                           end; nosound;
                          col(0,0);gotoxy(MX[i],MY[i]);write(' ');
                          PF[MX[i],MY[i]]:=Null;
                          MX[i]:=Null;
                         end;
                       end;
                    3:if FNum>1 then
                       begin
                        i:=random(FNum)+1;
                        if FX[i]<>Null then
                         begin
                          Killed:=Killed+1;
                          for x:=ord(FastPC)*230+ord(not FastPC)*80 downto 3 do
                           begin
                            sound(x*5);
                            gotoxy(FX[i],FY[i]);col(random(16),15);
                            write(Fast);
                           end; nosound;
                          col(0,0);gotoxy(FX[i],FY[i]);write(' ');
                          PF[FX[i],FY[i]]:=Null;
                          FX[i]:=Null;
                         end;
                       end;
                    end;
                  until (Killed=40) or (TryCounter=500);
                  ClearKeys;
                  Score:=Score+(Killed div 3)+2;
                  Update_Info;
                  if not(34 in FoundSet) then
                   begin
                    ClearKeys;
                    Flash(25,25,'A Creature Zap Spell!');
                    FoundSet:=FoundSet+[34];
                   end;
                 end;
   {Create}   35:begin
                  Go;
                  if SNum < 945 then
                   for i:=1 to 45 do
                    begin
                     Done:=false;
                     repeat
                      x:=random(XSize)+XBot;
                      y:=random(YSize)+YBot;
                      if PF[x,y] = Null then
                       begin
                        Done:=true;
                        PF[x,y]:=1;
                        gotoxy(x,y);
                        col(12,7);
                        write(Slow);
                        SNum:=SNum+1;
                        SX[SNum]:=x;
                        SY[SNum]:=y;
                        for x:=5 to 100 do
                         begin sound(x*8);delay(1);end;nosound;
                       end;
                     until (random(120)=0) or Done;
                    end;
                  AddScore(35);
                  ClearKeys;
                  if not(35 in FoundSet) then
                   begin
                    Flash(21,25,'A Creature Creation Trap!');
                    FoundSet:=FoundSet+[35];
                   end;
                 end;
  {Generator} 36:begin
                  BlockSound;
                  if not(36 in FoundSet) then
                   begin
                    Flash(14,25,'You have discovered a Creature Generator!');
                    FoundSet:=FoundSet+[36];
                   end;
                  end;
   {Trap3}    37:begin
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 37 then PF[x,y] := Null;
                 end;
   {MBlock}   38:begin
                  BlockSound;AddScore(4);
                  ClearKeys;
                  if not(38 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[38];
                    Flash(19,25,'A Moving Wall blocks your way.');
                   end;
                  end;
   {Trap4}    39:begin
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 39 then PF[x,y] := Null;
                 end;
   {ShowGems} 41:begin
                  Go;
                  GrabSound;
                  for i:=1 to ord(FastPC)*120+ord(not FastPC)*70 do
                    for x:=7 downto 1 do sound(i*x);nosound;
                  for i:=1 to (Difficulty*2)+5 do
                   begin
                    Done:=false;
                    repeat
                     x:=random(XSize)+XBot;
                     y:=random(YSize)+YBot;
                     if PF[x,y]=Null then
                      begin
                       sound(random(1200)+110);
                       Done:=true;
                       PF[x,y]:=9;
                       gotoxy(x,y);
                       col(GemColor,7);
                       write(Gem);
                       delay(7);nosound;delay(99);
                      end;
                    until (random(100)=0) or Done;
                   end;
                  ClearKeys;
                  Flash(8,25,'Yah Hoo! You discovered a hidden Reveal Gems Scroll!');
                 end;                   
   {Tablet}   42:begin
                  Go;
                  GrabSound;
                  Score:=Score+Level+100;
                  Update_Info;
                  if not(42 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[42];
                    Flash(4,25,'You found an ancient Tablet with writing on it...huge points!');
                   end;ClearKeys;
                  case Level of
                   1: Flash(6,25,'Remember to experiment with every new object on a level.');
                   3: Flash(5,25,'Only use your valuable Teleports for last chance escapes!');
                   5: Flash(6,25,'You''re right in the middle of a Lava Flow!  Run for it!');
                   7: Flash(10,25,'You''ll need the two keys from the previous level!');
                   9: Flash(5,25,'The two chests can be yours if you find the hidden spell!');
                   11:Flash(17,25,'You learn from successful failures.');
                   13:Flash(4,25,'A Creature Generator exists within this chamber--destroy it!');
                   15:Flash(9,25,'By throwing dirt at someone you only lose ground.');
                   17:Flash(6,25,'The Bubble Creatures knock off three Gems when touched!');
                   19:Flash(3,25,'Be vigilant Adventurer, the Crown is near, but well protected.');
                   20:Flash(8,25,'You''ve survived so far, Adventurer.  Can you succeed?');
                  end;
                 end;
  {BlockSpell}44:begin
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 43 then
                     begin
                      sound(200);
                      PF[x,y] := Null;
                      for i:=1 to 20 do
                       begin
                        gotoxy(x,y);
                        col(random(16),15);
                        write(Block);
                        delay(3);
                       end;
                      gotoxy(x,y);
                      col(0,0);
                      write(' ');
                      nosound;
                     end;
                  ClearKeys;
                  Flash(19,25,'You''ve triggered a secret area.');
                 end;
    {Chance}  45:begin
                  Go;
                  GrabSound;
                  Score:=Score+100;
                  Gems:=Gems+25;
                  Update_Info; 
                  ClearKeys;
                  Flash(15,25,'You found a Pouch containing 25 Gems!');
                 end; 
    {Statue}  46:begin
                   BlockSound;
                   ClearKeys;
                   Flash(9,25,'Statues are very dangerous...they drain your Gems!');
                 end;
  {WallVanish}47:begin
                  Go;
                  for i:=1 to 75 do
                   begin
                    Done:=false;
                    repeat
                     x:=random(XSize)+XBot;
                     y:=random(YSize)+YBot;
                     if PF[x,y] in [4,14] then
                      begin
                       sound(random(2500)+999);
                       Done:=true;
                       case PF[x,y] of
                        4:begin
                           gotoxy(x,y);
                           col(0,0);
                           write(' ');
                           PF[x,y] := 29;
                          end;
                       14:begin
                           gotoxy(x,y);
                           col(0,0);
                           write(' ');
                           PF[x,y] := 30;
                          end;
                       end; delay(5);nosound;   
                      end;
                    until (random(200)=0) or Done;
                   end;
                  ClearKeys;
                  Flash(5,25,'Yikes!  A trap has made many of the wall sections invisible!');
                 end;
      { K }   48:begin
                  Go;
                  GrabSound;
                  if Bonus = 0 then Bonus:=1;
                 end; 
      { R }   49:begin
                  Go;
                  GrabSound;
                  if Bonus = 1 then Bonus:=2;
                 end; 
      { O }   50:begin
                  Go;
                  GrabSound;
                  if Bonus = 2 then Bonus:=3;
                 end; 
      { Z }   51:begin
                  Go;
                  GrabSound;
                  if Bonus = 3 then
                   begin
                    ClearKeys;
                    for x:=10 to 45 do
                     for y:=1 to 13 do
                      begin sound(x*x*y);delay(y+1);end; nosound;
                    Score:=Score+1000;
                    Update_Info; 
                    Flash(17,25,'Super Kroz Bonus -- 10,000 points!');
                   end; 
                 end; 
   {OWalls}52..54:begin
                  BlockSound;
                  AddScore(14);
                  ClearKeys;
                  if not(14 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[14];
                    Flash(20,25,'A Solid Wall blocks your way.');
                   end;
                 end;
    {CWalls}  55..57:Go;
    {OSpells} 58..60:begin
                  Original := PF[PX+XWay,PY+YWay];
                  case Original of
                   58:Spot:=52;
                   59:Spot:=53;
                   60:Spot:=54;
                  end; 
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = Spot then
                     begin
                      PF[x,y] :=Null;
                      for i:=1 to 30 do
                       begin
                        gotoxy(x,y);
                        col(random(15),15);
                        write(chr(220+random(4)));
                       end;
                      for a:=60 downto 1 do
                       begin sound(a*40);delay(1);end;nosound; 
                      col(15,15);
                      gotoxy(x,y);
                      write(Wall);
                      delay(8);
                      gotoxy(x,y);
                      col(0,0);
                      write(' ');
                     end;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = Original then
                     begin
                      PF[x,y] :=Null;
                      gotoxy(x,y);
                      write(' ');
                     end; 
                  ClearKeys;
                  Flash(16,25,'Magic has been released is this chamber!');
                 end;
    {CSpells} 61..63:begin
                  Original := PF[PX+XWay,PY+YWay];
                  case Original of
                   61:Spot:=55;
                   62:Spot:=56;
                   63:Spot:=57;
                  end; 
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = Spot then
                     begin
                      PF[x,y]:=14;
                      for i:=1 to 30 do
                       begin
                        gotoxy(x,y);
                        col(random(15),15);
                        write(chr(220+random(4)));
                       end;
                      for a:=20 to 80 do
                       begin sound(a*50);delay(1);end;nosound; 
                      col(15,15);
                      gotoxy(x,y);
                      write(Wall);
                      delay(8); 
                      gotoxy(x,y);
                      col(6,7);
                      write(Wall);
                     end;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = Original then
                     begin
                      PF[x,y] :=Null;
                      gotoxy(x,y);
                      write(' ');
                     end; 
                  ClearKeys;
                  Flash(14,25,'Oh no, new Walls have magically appeared!');
                 end
       else BlockSound;
  end;{case}
 end; { Move }

procedure Player_Move;
 begin
  case GetKey of
    Null:;

       { Pause }
    80:begin
        bak(0,0);
        play(500,500,100);play(200,100,2);
        ClearKeys;
        flash(19,25,'Press any key to resume game.');
        Restore_Border;
       end;

       { Quit }
    81:begin
        play(600,600,100);play(450,450,100);play(300,300,100);play(99,99,99);
        ClearKeys;
        flash(16,25,'Are you sure you want to quit (Y/N)?');
        read(kbd,ch);
        if upcase(ch)='Y' then Sign_Off
        else Restore_Border;
       end;

       { Restore }
    82:begin
        Flash(15,25,'Are you sure you want to RESTORE (Y/N)?');
        Restore_Border;
        read(kbd,ch);
        if upcase(ch)='N' then exit;
        bak(0,0);col(15,15);
        ClearKeys;
        print(26,25,'  Restoring...  ');
        {$I-}
        assign(SaveFile,'RETURN.SAV');
        reset(SaveFile);
        if IOResult<>0 then
         begin
          Restore_Border;
          sound(300);delay(250);nosound;
          flash(14,25,'A SAVE FILE does not exist on this disk.');
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
          GenNum:=Null;
          Bonus :=0;
          T[1]:=5;T[2]:=6;T[3]:=7;T[8]:=7;
          T[4]:=0;  { restore SlowTime   }
          T[5]:=0;  { restore visibility }
          T[6]:=0;  { restore SpeedTime  }
          case Level of
           1:Level1;
           3:Level3;
           5:Level5;
           7:Level7;
           9:Level9;
           11:Level11;
           13:Level13;
           15:Level15;
           17:Level17;
           19:Level19;
           20:Level20
           else Create_PlayField;
          end;
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
        if Level=20 then
         Flash(10,25,'You''ve finally reached the deepest level of Kroz!') 
        else Flash(16,25,'Press any key to begin this level.'); 
       end;

       { Save }
    83:begin
        Flash(16,25,'Are you sure you want to SAVE (Y/N)?');
        Restore_Border;
        read(kbd,ch);
        if upcase(ch)='N' then exit;
        bak(0,0);col(15,15);
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
        print(28,25,'  Saving...  ');
        assign(SaveFile,'RETURN.SAV');
        rewrite(SaveFile);
        write(SaveFile,SaveStuff);
        close(SaveFile);
        delay(1000);
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
        gotoxy(PX,PY);bak(0,0);col(0,0);write(' ');
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
   172:move(0,-1);

       { South }
   180:move(0,1);

       { East }
   177:move(1,0);

       { West }
   175:move(-1,0);

       { Northwest }
   171:move(-1,-1);

       { Northeast }
   173:move(1,-1);

       { Southwest }
   179:move(-1,1);

       { Southeast }
   181:move(1,1);

  end;
 end; { Player_Move }

{$I A:\RETURN.MON * }

BEGIN
Screen;
NewGame:
Title;
Border;
Init_Screen;
Update_Info;
Define_Levels;
Level1;
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
Flash(16,25,'Press any key to begin this level.');
repeat
 Player_Move;
 if keypressed then SkipTime:=801 else SkipTime:=SkipTime+1;
 if SkipTime>800 then
  begin
   for x:=1 to TMax do T[x]:=T[x]-1;
   if FastPC then SkipTime := -150 else SkipTime:=0;
   if T[7]<1 then
    begin
     if T[1]<1 then Move_Slow;
     if T[2]<1 then Move_Medium;
     if T[3]<1 then Move_Fast;
    end;
   if T[8]<1 then Move_MBlock;
   if (T[9]>0) and (random(18)=0) then  { delete gem from player! }
    begin 
     Gems:=Gems-1;
     if Gems<0 then Dead(true);
     sound(3800);delay(20);nosound;
     bak(7,0);col(20,7);
     printnum(8,Gems);
    end;
   col(4,7);bak(7,0);
   gotoxy(70,2);
   str(Score,StrVal);
   if Score>0 then StrVal:=StrVal+'0';
   gotoxy(73-length(StrVal) div 2,2);
   write(StrVal);
   if T[5]<1 then
    begin
     bak(0,0);col(14,15);
     gotoxy(PX,PY);
     write(Player);
    end;
   bak(0,0);
   if (GenNum>0) and (SNum < 995) and (random(GenFactor)=0) then
    begin
     Done:=false;
     repeat
      x:=random(XSize)+XBot;
      y:=random(YSize)+YBot;
      if PF[x,y] = Null then
       begin
        Done:=true;
        PF[x,y]:=1;
        gotoxy(x,y);
        col(15,15);
        write(Slow);
        SNum:=SNum+1;
        SX[SNum]:=x;
        SY[SNum]:=y;
        for x:=5 to 70 do
         begin sound(x*8);delay(1);end;nosound;
       end;
     until (random(50)=0) or Done;
    end;
   if LavaFlow and (random(10)=0) then
    for i:=1 to LavaRate do
     begin
      Done:=false;
      x:=random(XSize)+XBot;
      y:=random(YSize)+YBot;
      if PF[x,y] in [0..4,5,7..11,15,16,18..21,26..28,32..35,37..39,41,42..44,45,47..51,57,60,64] then
       begin
        if PF[x+1,y]=22 then Done:=true else
        if PF[x-1,y]=22 then Done:=true else
        if PF[x,y+1]=22 then Done:=true else
        if PF[x,y-1]=22 then Done:=true;
        if Done then
         begin
          PF[x,y]:=22;
          gotoxy(x,y);
          col(12,16);bak(4,7);
          write(Lava);
          bak(0,0);
         end;
       end;
   end;
  end;
until Restart;
goto NewGame;

END. {*** RETURN TO KROZ ***}
