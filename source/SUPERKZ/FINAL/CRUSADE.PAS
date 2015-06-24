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
{*                       THE FINAL CRUSADE OF KROZ                         *}
{*                       Programmed by Scott Miller                        *}
{*                            Shareware Version                            *}
{*      This is the third of the Super Kroz Trilogies, designed to be      *}
{*                      Compiled with Turbo Pascal 5.                      *}
{*          Version: 1.0    Levels: 25    Goal: Fountain of Youth          *}
{*                   The other two Super Kroz games are:                   *}
{*                    Return to Kroz and Temple of Kroz                    *}
{*                        Began September 17, 1989                         *}
{***************************************************************************}
{$V-,R-,F+}
                       {***************************}
                       {* Last modified: 10/21/89 *}
                       {***************************}

program Crusade_Of_Kroz;

uses Turbo3, Crt, DOS, Crusade;

const

     {0}  Null      = 0;
{X}  {4}  Block     = #178;  
{W}  {5}  Whip      = #244;  
{L}  {6}  Stairs    = #240;  
{C}  {7}  Chest     = #67;   
{S}  {8}  SlowTime  = #232;  
{+}  {9}  Gem       = #4;    
{I}  {10} Invisible = #173;   
{T}  {11} Teleport  = #24;   
{K}  {12} Key       = #140; 
{D}  {13} Door      = #236;  
{#}  {14} Wall      = #219;  
{F}  {15} SpeedTime = #233; 
{.}  {16} Trap      = #249;  
{R}  {17} River     = #247;
{Q}  {18} Power     = #9;    
{/}  {19} Forest    = #176; 
{\}  {20} Tree      = #177; 
{B}  {21} Bomb      = #157;  
{V}  {22} Lava      = #178;  
{=}  {23} Pit       = #176;
{A}  {24} Youth     = #3;
{U}  {25} Tunnel    = #239;
{Z}  {26} Freeze    = #159;
{*}  {27} Nugget    = #15;
{E}  {28} Quake     = #0;
{;}  {29} IBlock    = #30;
{:}  {30} IWall     = #0;
{`}  {31} IDoor     = #0;
{-}  {32} Stop      = #0;
{@}  {33} Trap2     = #0;
{%}  {34} Zap       = #30;  
{]}  {35} Create    = #31;
{G}  {36} Generator = #6; 
{)}  {37} Trap3     = #0;   
{M}  {38} MBlock    = #178; 
{(}  {39} Trap4     = #0;  
{P}  {40} Player    = #2;  
{&}  {41} ShowGems  = #0;
{!}  {42} Tablet    = #254;
{O}  {43} ZBlock    = #178;
{H}  {44} BlockSpell= #0;
{?}  {45} Chance    = #63;
{>}  {46} Statue    = #1;
{N}  {47} WallVanish= #0;
{<}  {48}  { K }
{[}  {49}  { R }
{|}  {50}  { O }
{"}  {51}  { Z }
{4}  {52} OWall1    = #219;
{5}  {53} OWall2    = #219;
{6}  {54} OWall3    = #219; { grey }
{7}  {55} CWall1    = #0;
{8}  {56} CWall2    = #0;
{9}  {57} CWall3    = #0;
{ñ}  {58} OSpell1   = #127; {ALT-241}
{ò}  {59} OSpell2   = #127; {ALT-242}
{ó}  {60} OSpell3   = #127; {ALT-243}
{ô}  {61} CSpell1   = #0;   {ALT-244}
{õ}  {62} CSpell2   = #0;   {ALT-245}
{ö}  {63} CSpell3   = #0;   {ALT-246}
{Y}  {64} GBlock    = #178;
{0}  {65} Rock      = #79;
{~}  {66} EWall     = #88;
{ }  {67} Trap5     = #0;

          TotObjects= 67;
 
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
                     S_FoundSet  : set of 0..ToTObjects;
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

 {$I A:\CRUSADE.TIT * }

procedure Tablet_Message(Level: integer);
 begin
  case Level of
   1: Flash(12,25,'Search carefully the room below, Adventurer!');
   3: Flash(7,25,'Use the "Boulder", Luke!  (Creatures don''t like them!)');
   5: Flash(7,25,'Be wary, Adventurer, for not all creatures can be seen!');
   7: Flash(10,25,'Adventurer, sometimes Gems can be crystal clear!');
   9: Flash(9,25,'Ah ha, Adventurer, you fell for the obvious trap!');
   11:Flash(7,25,'You''ve done well..so far.  But you shall not succeed!');
   13:Flash(8,25,'Invisible creatures patrol this area...stay guarded!');
   15:Flash(9,25,'Cross the lava if you dare:  you''ll lose 20 Gems!');
   17:Flash(7,25,'Things are never as they appear--look for the hidden.');
   19:Flash(7,25,'Stay on the trail, Adventurer, if you wish to succeed!');
   20:Flash(9,25,'You''ve finally discovered "The Fountain of Youth!"');
   21:Flash(7,25,'Follow the secret passage, Adventurer--or die trying!');
   22:Flash(7,25,'Are you sure you kwow where you''re going, Adventurer?');
   24:Flash(11,25,'Act quickly, or be forever trapped in Lava!!!');
   25:Flash(6,25,'So close, Adventurer.  (The top, left corner might help.)');
  end;
 end; { Tablet_Maessage }

procedure Move(XWay,YWay:integer);
  var Killed,
      RX,RY,
      RXWay,RYWay,
      TryCounter : integer;
      Spot,
      Original   : byte;
      NoGo       : boolean;
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
   procedure MoveRock;
    begin
     for i:=1 to ord(FastPC)*500+ord(not FastPC)*330 do
      begin sound(random(100)+20);delay(1);end; nosound;
     gotoxy(PX+XWay,PY+YWay);
     col(0,0);
     write(' ');
     gotoxy(RX,RY);
     col(7,7);
     write(Rock);
     PF[RX,RY]:=65;
     Go;
     SKipTime:=3001;
    end;
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
                  if Level=25 then
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
                    bak(1,0);window(2,2,65,24);
                    clrscr;
                    col(14,9);
                    gotoxy(25,2);
                    writeln('THE END OF KROZ?');
                    gotoxy(25,3);
                    writeln('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
                    writeln;
                    col(15,7);
                    writeln('   As you were magically lifted from the lower depths of Kroz');
                    writeln(' you noticed a possible new tunnel.  You make a mental note');
                    writeln(' to look into this matter at a later time.  You realize');
                    writeln(' no one else could survive the kingdom of Kroz--which means');
                    writeln(' it''s up to you!  (It''s a tough job, but it''s a living.)');
                    writeln;
                    writeln('   Meanwhile, you drink from the the cup of water you collected');
                    writeln(' from the magical Fountain.  Health is restored to your beaten');
                    writeln(' body.  You feel young again.  Vibrant and charged with energy');
                    writeln(' you head back to your village hut to examine the findings from');
                    writeln(' this latest expedition--and to plot out your next journey into');
                    writeln(' the vast underground of Kroz.');
                    writeln;
                    writeln('   Afterall, you can''t keep a good adventurer down! (Or up?)');
                    writeln;
                    writeln; col(11,15);
                    writeln('   Coming by January 1, 1990:  THE LOST ADVENTURES OF KROZ');
                    writeln('                               75 all-new levels, $20 + $2');
                    writeln;
                    write('   Thank you for exploring my games.   -- Scott Miller');                  
                    ClearKeys;
                    window(1,1,80,25);bak(0,0);
                    Flash(21,25,'Press any key, Adventurer.');
                    WON;
                   end;
                  if MixUp then Level:=random(17)+2
                  else Level:=Level+1;
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
                  FoundSet:=FoundSet-[0,8,13,15,17,19..21,22,26,28,36,66];
                  GenNum:=0;
                  LavaFlow:=false;
                  HideLevel:=false;
                  HideOpenWall:=false;
                  HideRock:=false;
                  HideStairs:=false;
                  HideGems:=false;
                  HideMBlock:=false;
                  HideTrap:=false;
                  HideCreate:=false;
                  Bonus:=0;
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
                   20:Level20;
                   21:Level21;
                   22:Level22;
                   23:Level23;
                   24:Level24;
                   25:Level25
                   else Create_PlayField;
                  end;
          { NOTE: The lines below are special conditions }
                  if Level=2 then HideTrap:=true;
                  if Level=6 then Slow:=#142;
                  if Level=8 then HideLevel:=true;
                  if Level=10 then begin LavaFlow:=true; LavaRate:=50; end;

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
                  if (Level=20) or (Level=25) then
                   Flash(9,25,'You''ve finally reached the deepest chamber of Kroz!') 
                  else Flash(17,25,'Press any key to begin this level.'); 
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
                    Flash(18,25,'You activated a Slow Time spell.');
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
                    Flash(18,25,'You activated a Speed Time spell.');
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
                       if PF[x,y] in [Null..4,13,16,19,28..32,35,36..39,43,45,48..51,64] then
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
                        if PF[x,y] in [Null..4,13,16,19,28..32,35,36..39,43,45,48..51,64] then
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
   {Youth}    24:begin
                  if Level=20 then  { illusion found }
                   begin
                    for x:=1 to 24 do
                     for y:=5 downto 1 do
                      begin
                       sound(x*45+y*10);delay(y*3);nosound;delay(40);
                       gotoxy(62,3);col(random(16),random(16));
                       bak(random(8),random(8));write(Stairs);
                      end;
                    gotoxy(1,1);
                    col(16,16);bak(7,7);
                    gotoxy(62,3);
                    PF[62,3]:=6;
                    write(Stairs);
                    ClearKeys;bak(0,0);
                    Flash(4,25,'Oh no, it was only an illusion! Where is the real Fountain?');
                    ClearKeys;
                    Flash(7,25,'Your quest for the Fountain of Youth must continue...!');
                   end
                  else
                   begin
                    bak(0,0);
                    for x:=1 to 24 do
                     for y:=5 downto 1 do
                      begin
                       sound(x*45+y*10);delay(y*3);nosound;delay(40);
                       gotoxy(33,23);col(random(16),random(16));
                       write(Youth);
                      end;
                    gotoxy(33,23);
                    col(16,16);bak(2,7);
                    write(Stairs);bak(0,0);
                    PF[PX+XWay,PY+YWay]:=6;
                    Score:=Score+5000;
                    Update_Info;
                    ClearKeys;
                    Flash(10,25,'You found the Fountain of Youth--50,000 points!');
                   end; 
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
                    Flash(15,25,'You have activated a Freeze Time spell!');
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
                       PF[x,y]:=65;
                       gotoxy(x,y);
                       col(7,7);
                       write(Rock);
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
                  Tablet_Message(Level);
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
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 44 then PF[x,y] := Null;
                  ClearKeys;
                  Flash(20,25,'You''ve triggered Exploding Walls!');
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
                  Flash(14,25,'Magic has been released is this chamber!');
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
                 end;
      {rock}  65:begin
                  RXWay:=0; RYWay:=0; NoGo:=false;
                  if XWay= 1 then RXWay:= 2;
                  if XWay=-1 then RXWay:=-2;
                  if YWay= 1 then RYWay:= 2;
                  if YWay=-1 then RYWay:=-2;
                  RX:=PX+RXWay; RY:=PY+RYWay;
                  if (XWay= 1) and (RX>65) then NoGo:=true;
                  if (XWay=-1) and (RX<2)  then NoGo:=true;
                  if (YWay= 1) and (RY>24) then NoGo:=true;
                  if (YWay=-1) and (RY<2)  then NoGo:=true;
                  ClearKeys;
                  if not NoGo then
                   case PF[RX,RY] of
                    0,32,33,37,39,41,44,47,52..57,61..63:MoveRock;
                    1..3:begin
                        Score:=Score+PF[RX,RY]; MoveRock;
                        sound(600);delay(20);nosound;
                       end;
                    4,13,14,17,19,20,22,24,25,29..31,36,38,43,46,64,65:begin
                        BlockSound;
                       end;
                    5,7..12,16,18,21,26,27,34,35,42,45,48..51,58..60:begin
                        MoveRock; GrabSound;
                       end;
                    66:begin
                        MoveRock;
                        PF[RX,RY]:=Null;
                        sound(90);
                        ClearKeys;
                        for i:=1 to 20 do
                         begin
                          gotoxy(RX,RY);
                          col(random(15)+1,15); bak(random(8),0); write(EWall);
                          bor(random(15)+1);
                         end;
                        bor(4); bak(0,0);
                        gotoxy(RX,RY);col(0,0);write(' ');
                        for i:=30000 downto 20 do sound(random(i));nosound;
                        if not(0 in FoundSet) then
                         begin
                          FoundSet:=FoundSet+[0];
                          ClearKeys;
                          Flash(21,25,'The Boulder is vaporized!');
                         end;
                       end;
                    6,23:begin
                        for i:=1 to ord(FastPC)*500+ord(not FastPC)*330 do
                         begin sound(random(100)+20);delay(1);end; nosound;
                        gotoxy(PX+XWay,PY+YWay);
                        col(0,0);
                        write(' ');
                        Go;
                        for i:= 130 downto 5 do
                         begin sound(i*8);delay(3);end; nosound;
                       end;
                   end
                  else BlockSound;
                  if not(65 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[65];
                    ClearKeys;
                    Flash(21,25,'You pushed a big Boulder!');
                   end;
                 end;
      {EWall} 66:begin
                  Gems:=Gems-1;
                  if Gems<0 then DEAD(true);
                  AddScore(20);
                  Static;
                  if not(66 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[66];
                    ClearKeys;
                    Flash(11,25,'You hit a Electrified Wall!  You lose one Gem.');
                   end else ClearKeys;
                 end;
   {Trap5}    67:begin
                  Go;
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 67 then PF[x,y] := Null;
                 end
       else BlockSound;
  end;{case}
 end; { Move }

{$I A:\CRUSADE.MON * }

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
   if SkipTime>3000 then for x:=1 to TMax do T[x]:=T[x]-5;
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
     if Gems<0 then DEAD(true);
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

END. {*** THE FINAL CRUSADE OF KROZ ***}
