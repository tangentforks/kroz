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
{*** DUNGEONS OF KROZ II player movement.  By Scott Miller 11/12/89 ***}

unit DUNGEON5;

interface 

procedure Tablet_Message(Level: integer);
procedure Next_Level;
procedure Move(XWay,YWay:integer; Human:boolean);
procedure Prayer;

implementation {--------------------------------------------------------------}

uses CRT, Turbo3, DOS, DUNGEON1, DUNGEON2, DUNGEON3, DUNGEON4;

procedure Prayer;
 begin
 end;

procedure Tablet_Message(Level: integer);
 begin
 end; { Tablet_Message }

procedure Next_Level;
 begin
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
  21:Level21;
  23:Level23;
  25:Level25;
  27:Level27;
  29:Level29;
  30:Level30
  else Create_PlayField;
  end;
 end; { Next_Level }

procedure Move(XWay,YWay:integer; Human:boolean);
  var Killed,
      RXWay,RYWay,
      TryCounter : integer;
      Spot,
      Original   : byte;
      NoGo       : boolean;
   label JUMP_END;
 begin
  if (Sideways)and(YWay=-1)and(Replacement<>75)and(not(PF[PX+XWay,PY+YWay]in [75..80]))then
    goto JUMP_END;
  if (PX+XWay<XBot) or (PX+XWay>XTop) or
     (PY+YWay<YBot) or (PY+YWay>YTop) then
       begin
        if Human then
         begin
          Static;
          AddScore(20);
          ClearKeys;
          if not(0 in FoundSet) then
           begin
            FoundSet:=FoundSet+[0];
            Flash(16,25,'An Electrified Wall blocks your way.');
           end;
         end;
        exit;
       end;

  case PF[PX+XWay,PY+YWay] of
   {Null}      0:Go(XWay,YWay,Human);
   {Monsters}  1..3:
                 begin
                  Gems:=Gems-PF[PX+XWay,PY+YWay];
                  if Gems<0 then DEAD(true);
                  AddScore(PF[PX+XWay,PY+YWay]);
                  sound(200+200*PF[PX+XWay,PY+YWay]);delay(25);nosound;
                  Go(XWay,YWay,Human);
                  if keypressed then
                   begin
                    read(kbd,ch);
                    if ch=#27 then read(kbd,ch);
                   end;
                 end;
   {Block}     4,43,64:if Human then begin
                  BlockSound; AddScore(4); ClearKeys;
                  if not(4 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[4];
                    Flash(17,25,'A Breakable Wall blocks your way.');
                  end;
                 end;
   {Whip}      5:begin
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
                  ClearKeys;

                  if Level=30 then End_Routine;

                  if MixUp then Level:=random(27)+2
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
                  FoundSet:=FoundSet-[0,8,15,17,19..21,22,26,28,36,66];
                  GenNum:=0;
                  TreeRate:=-1;
                  LavaFlow:=false;
                  EvapoRate:=0;
                  MagicEWalls:=false;
                  HideLevel:=false;
                  HideOpenWall:=false;
                  HideRock:=false;
                  HideStairs:=false;
                  HideGems:=false;
                  HideMBlock:=false;
                  HideTrap:=false;
                  HideCreate:=false;
                  GravOn:=false;
                  GravRate:=0;
                  GravCounter:=0;
                  Bonus:=0;
                  Sideways:=false;
                  Replacement:=Null;

                  Next_Level;

          { NOTE: The lines below are special conditions }


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
                  if Level=30 then
                   Flash(9,25,'You have finally reached the last dungeon of Kroz!');
                 end;
   {Chest}     7:begin
                  Go(XWay,YWay,Human);
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
                   gotoxy(11,25);
                   write('You found ',i,' gems and ',x,' whips inside the chest!');
                  until keypressed;
                  Restore_Border;
                 end;
   {SlowTime}  8:begin
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
                  Keys:=Keys+1;
                  GrabSound;
                  Update_Info;
                  if not(12 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[12];
                    Flash(22,25,'Use Keys to unlock doors.');
                   end;
                 end;
   {Door}     13:if Human then
                  begin
                   if Keys<1 then
                    begin
                     for x:=1 to 15 do
                      begin sound(random(99)+30);delay(15);nosound;delay(15);end;
                     Flash(18,25,'To pass the Door you need a Key.');
                    end
                   else
                    begin
                     Keys:=Keys-1;
                     AddScore(11);
                     for x:=10 to 90 do
                      begin sound(x);delay(15);end;
                     Go(XWay,YWay,Human);
                     ClearKeys;
                     if not(13 in FoundSet) then
                      begin
                       FoundSet:=FoundSet+[13];
                       Flash(12,25,'The Door opens!  (One of your Keys is used.)');
                      end else ClearKeys;
                     if (Level=75) and (PX=33) and (PY=14) then
                      Flash(13,25,'You unlock the door to the Sacred Temple!');
                    end;
                  end; 
   {Wall/River}14,17:if Human then begin
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
                  WhipPower:=WhipPower+1;
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
                  AddScore(15);
                  Flash(9,25,'A Power Ring--your whip is now a little stronger!');
                 end;
  {Forest/Tree} 19,20:if Human then
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
                  Go(XWay,YWay,Human);
                  xr:=0;xl:=0;yr:=0;yl:=0;
                  for i:=70 to 600 do begin sound(i*2);delay(3);end;bor(15);
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
                       if PF[x,y] in [Null..4,13,16,19,28..32,33,35,36..39,43,45,48..51,64,67,68..74,224..231] then
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
                        if PF[x,y] in [Null..4,13,16,19,28..32,33,35,36..39,43,45,48..51,64,67,68..74,224..231] then
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
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
                   begin
                    if i=8 then
                     begin
                      col(15,15);
                      bak(6,7);
                      gotoxy(38,12);
                      write('<--- HALF WAY!!!');
                      bak(0,0);col(14,15);
                     end else
                    if i=9 then
                     begin
                      bak(6,7);
                      gotoxy(38,12);
                      write('                ');
                      bak(0,0);col(14,15);
                     end;
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
                   end;  
                  gotoxy(34,24);
                  write('_');
                  for i:=8000 downto 20 do sound(random(i));nosound;
                  ClearKeys;
                  flash(29,1,'* SPLAT!! *');
                  Dead(false);
                 end;
   {Tome}     24:begin
                  Tome_Message;
                  for i:= 1 to 5 do Tome_Effects;
                  bak(0,0);
                  for x:=1 to 24 do
                   for y:=5 downto 1 do
                    begin
                     sound(x*45+y*10);delay(y*3);nosound;delay(40);
                     gotoxy(51,13);col(random(16),random(16));
                     write(Tome);
                    end;
                  gotoxy(51,13);
                  col(16,16);bak(2,7);
                  write(Stairs);bak(0,0);
                  PF[PX+XWay,PY+YWay]:=6;
                  Score:=Score+5000;
                  Update_Info;
                  ClearKeys;
                  Flash(5,25,'The Magical Staff of Kroz is finally yours--50,000 points!');
                  Flash(9,25,'Congratualtions, Adventurer, you finally did it!!!');
                 end;
   {Tunnel}   25:begin
                  PXOld:=PX;PYOld:=PY;
                  Go(XWay,YWay,Human);
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
                    if(PF[x+a,y+b] in [0,32,33,37,39,55..57,67,224..231]) and (Done=false)then
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
                  Go(XWay,YWay,Human);
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
                  Go(XWay,YWay,Human);
                  AddScore(27);
                  GrabSound;
                  if not(27 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[27];
                    Flash(15,25,'You found a Gold Nugget...500 points!');
                   end;
                 end;
   {Quake}    28:begin
                  Go(XWay,YWay,Human);
                  for i:=1 to ord(FastPC)*5500 + ord(not FastPC)*2500 do
                    sound(random(i));nosound;
                  for i:=1 to 50 do
                   begin
                    Done:=false;
                    repeat
                     x:=random(XSize)+XBot;
                     y:=random(YSize)+YBot;
                     if PF[x,y] in [0..3,5,7..11,15..16,26,32,33,37,39,67,224..231] then
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
   {Stop}     32:Go(XWay,YWay,Human);
   {Trap2}    33:begin
                  Go(XWay,YWay,Human);
                  for x := XBot to XTop do
                   for y := YBot to YTop do
                    if PF[x,y] = 33 then PF[x,y] := Null;
                 end

       else if Human then BlockSound;
  end;{case}
  JUMP_END:
  OneMove:=false;
 end; { Move }

 BEGIN
 END.