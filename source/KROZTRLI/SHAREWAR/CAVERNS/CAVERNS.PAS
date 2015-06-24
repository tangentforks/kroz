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
{*                            CAVERNS OF KROZ                              *}
{*                       Programmed by Scott Miller                        *}
{*                         Began December 1, 1985                          *}
{***************************************************************************}
{$C-,R-,V-,K-}
                        {**************************}
                        {* Last modified: 7/22/89 *}
                        {**************************}

const

   {0}  Null      = 0;    { empty    }  {************************}
   {1}  Slow      = 142;  { l. red   }  {*                      *}
   {2}  Medium    = 153;  { l. green }  {*    Cavern Objects    *}
   {3}  Fast      = 234;  { l. blue  }  {*                      *}
   {4}  Block     = 178;  { brown    }  {************************}
   {5}  Whip      = 244;  { white    }
   {6}  Stairs    = 240;  { grey     }
   {7}  Chest     = 15;   { yellow   }
   {8}  SlowTime  = 232;  { l. cyan  }
   {9}  Gem       = 4;    { random   }
   {10} Invisible = 9;    { d. green }
   {11} Teleport  = 24;   { magenta  }
   {12} Key       = 140;  { l. red   }
   {13} Door      = 236;  { d. cyan  }
   {14} Wall      = 219;  { brown    }
   {15} SpeedTime = 233;  { l. cyan  }
   {16} Trap      = 249;  { grey     }
   {17} River     = 176;  { l. blue  }
   {18} Power     = 2;    { l. blue  }
   {19} Forest    = 176;  { l. green }
   {20} Tree      = 177;  { l. green }
   {21} Bomb      = 157;  { white    }
   {22} Lava      = 178;  { l. red   }
   {23} Pit       = 176;  { grey     }
   {24} Amulet    = 12;   { white    }
   {31} Player    = 1;    { yellow   }

        Objects   = 23;           {*** Printable Objects ***}

        XTop      = 65;           {**** Play Field Size ****}
        YTop      = 24;
        XBot      = 2;
        YBot      = 2;
        XSize     = 64;
        YSize     = 23;


        Bottom    = 40;           {**** Number of Levels ***}

        TMax      = 6;            {**** Automatic Timer ****}

type
        Field     = string[69];
        Str80     = string[80];
        NameStr   = string[15];
        StrXSize  = string[XSize];
        Regs      = record AX,BX,CX,DX,BP,SI,DI,DS,ES,Flags: integer; end;
        HSType    = record
                     Name        : NameStr;
                     HighScore,
                     HighLevel   : integer;
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
                     S_PX, S_PY  : integer;
                     S_FoundSet  : set of 1..Objects;
                     S_MixUp     : boolean;
                    end;

var
        PF        : array [XBot..XTop,YBot..YTop] of byte;    { Play Field }
        DF        : array [1..Bottom]  of Field;
        Parsed    : array [1..Objects] of integer;
        FP        : array [1..YSize] of StrXSize;{ stores new floor plan }
        SX, SY,                                  { store monster's X, Y    }
        MX, MY,                                  { 1=alive, 0=dead         }
        FX, FY    : array [1..1000] of byte;
        T         : array [1..TMax] of integer; { 1=Slow, 2=Medium, 3=Fast }
        Score,                                  { 4=SlowTime, 5=invisible  }
        Gems,                                   { 6=SpeedTime              }
        Whips,
        Teleports,
        Keys,                    { used to open doors }
        Difficulty,              { regulates the number of gems in chests }
        Level,                   { current level or depth within caverns  }
        GemColor,                { each level has a different color gem   }
        WhipPower,               { effectiveness of whips against walls   }
        PX, PY,                  { player's X and Y coordinates }
        BC, BB,                  { current border color and background color }
        SkipTime,                { this counter slows down the timers }
        SNum,                    { stores number of monsters on level }
        MNum,
        FNum,
        STime,                   { stores the current speed of each monster }
        MTime,
        FTime,
        XDir,
        YDir,
        loop,
        width,
        C1,
        xl,xr,
        yl,yr,
        x,y,i     : integer;
        xb, yb    : byte;        { these variables used in sound loops }
        ch        : char;
        StrVal    : Field;
        Result    : Regs;
        MixUp,                   { true if levels appear randomly }
        FastPC,
        Restart   : boolean;
        FoundSet  : set of Null..Objects;
        I_Score,                 { These variables store the INITIAL values }
        I_Gems,                  { of their counterparts at the beginning   }
        I_Whips,                 { of each new level.  These are the values }
        I_Teleports,             { that are used by SAVE/RESTORE.           }
        I_Keys,
        I_WhipPower,
        I_Difficulty,
        I_PX, I_PY  : integer;
        I_FoundSet  : set of 1..Objects;
        SaveStuff   : SaveType;
        SaveFile    : file of SaveType;
        HSList      : array [1..15] of HSType;     { stores high score list  }
        HSFile      : file of HSType;

label   NewGame;

procedure Restore_Border;forward;

procedure Col(Num:byte);
 begin if C1=9 then textcolor(Num) else textcolor(7) end;

procedure ColRan(Num:byte);
 begin textcolor(Num) end;

procedure Bak(Num:byte);
 begin if C1=9 then textbackground(Num) else textbackground(0) end;

procedure Bor(Num:byte);
 begin
  if C1=9 then
   begin
    with Result do begin AX:=$B00;BX:=Num; end;
    intr($10,Result);
   end;
 end;

procedure Print(XPos,YPos:byte; Message:Str80);
 begin
  gotoxy(XPos,YPos);
  write(Message);
 end;

procedure PrintNum(YPos:byte; Num:integer);
 begin
  gotoxy(70,YPos);
  write('       ');
  str(Num,StrVal);
  if (YPos=2) and (Score>0) then StrVal:=StrVal+'0';
  if (YPos=11) and (WhipPower>3) then StrVal:='+'+StrVal;
  gotoxy(73-length(StrVal) div 2,YPos);
  write(StrVal);
 end;

procedure Flash(XPos,YPos:byte;Message:Str80);
 begin
  while keypressed do read(kbd,ch);
  repeat
   colran(random(16));
   print(XPos,YPos,Message);
  until keypressed;
  Restore_Border;
 end;

procedure Cur(Num:byte);
 begin
  with Result do
   begin
    AX:=$100;
    case Num of
     1:CX:=$707; { Underline   }
     2:CX:=$8;   { Solid Block }
     3:CX:=$2000;{ Invisible   }
    end;
   end;
   intr($10,Result);
 end; { Cur }

procedure FootStep;
  var x:integer;
 begin
  for x:=1 to 23 do sound(random(550)+350);
  nosound;delay(120);
  for x:=1 to 30 do sound(random(50)+150);
  nosound;
 end;

procedure GrabSound;
  var x:integer;
 begin
  for x:=1 to 65 do sound(random(1000)+1000);nosound
 end;

procedure BlockSound;
  var x:integer;
 begin
  for x:= 150 downto 35 do begin sound(x);delay(1);end;
  nosound;
 end;

procedure NoneSound;
  var x:integer;
 begin
  for x:=1 to 5 do
   begin
    sound(400);delay(10);nosound;delay(10);
    sound(700);delay(10);nosound;delay(10);
   end;
 end;

procedure Static;
  var x,y:integer;
 begin for x:= 1 to 15 do bor(random(16));bor(1);
  for x:=1 to 25 do
   case random(2) of
    0:for y:=1 to random(60)+10 do sound(random(4000)+3000);
    1:begin nosound;delay(random(30)); end;
   end; nosound;
 end; { Static }

procedure Play(Start,Stop,Speed:integer);
  var x:integer;
 begin
  if Start<=Stop then
   for x:=Start to Stop do begin sound(x);delay(Speed)end
  else
   for x:=Start downto Stop do begin sound(x);delay(Speed)end;
  nosound;
 end; { Play }

procedure Update_Info;
 begin
  bak(7);textcolor(4);
  printnum(2,Score);
  printnum(5,Level);
  if Gems> 9 then printnum(8,Gems)
  else begin textcolor(20);printnum(8,Gems);textcolor(4);end;
  printnum(11,Whips);
  printnum(14,Teleports);
  printnum(17,Keys);
  textbackground(0);
 end; { Update_Info }

procedure AddScore(What:integer);
 begin
  case What of
   {Monsters}  1..3:Score:=Score+What;
   {Block}     4,14:if Score > 2 then Score:=Score-2;
   {Whip}      5:Score:=Score+1;
   {Stairs}    6:Score:=Score+Level*5;
   {Chest}     7:Score:=Score+10+(Level div 2);
   {SlowTime}  8:Score:=Score+1;
   {Gem}       9:Score:=Score+(Level div 2)+1;
   {Invisible} 10:Score:=Score+25;
   {Teleport}  11:Score:=Score+2;
   {Key}       { no score }
   {Door}      13:Score:=Score+2;
   {SpeedTime} 15:Score:=Score+5;
   {Trap}      16:if Score>5 then Score:=Score-5;
   {River}     { no score }
   {Power}     18:Score:=Score+5;
   {Forest}    { no score }
   {Tree}      { no score }
   {Bomb}      21:Score:=Score+1;
   {Lava}      22:if Score>100 then Score:=Score+100;
   {Pit}       { death! }
   {Border}    20:if Score > (Level*1) then Score:=Score-(Level div 2);
  end;
  Update_Info;
 end; { AddScore }

procedure Screen;
 begin
  clrscr;
  cur(3);
  BB:=0;BC:=0;
  Flash(1,10,'Color or Monochrome (C/M)?');
  read(kbd,ch);
  if upcase(ch)='M' then
   begin
    textmode(BW80);
    C1:=15;
   end
  else
   C1:=9;
  clrscr;
  gotoxy(9,17);
  textcolor(7);
  write('If you have an older PC (like an XT model) choose "S" for Slow.');
  gotoxy(10,19);
  write('If you have a PC AT, 80386 chip, etc., choose "F" for Fast.');
  gotoxy(32,21);
  write('Default = Slow');
  Flash(29,14,'Slow or Fast PC (S/F)?');
  read(kbd,ch);
  if upcase(ch) = 'F' then FastPC := true else FastPC := false;
  clrscr;
 end;

{***************************************************************************}
{$ITITLE1.INC                                                              *}
{***************************************************************************}

procedure Border;
 begin
  gotoxy(1,24);
  BC:=random(8)+8;
  BB:=random(7)+1;
  col(BC);bak(BB);
  for i:=1 to 66 do
   begin gotoxy(i,25);write(chr(Block));gotoxy(i,1);write(chr(Block));end;
  for i:=2 to 24 do
   begin
    gotoxy(1,i);write(chr(Block));gotoxy(66,i);write(chr(Block));
   end;
  bak(0);
  end; { Border }

procedure Restore_Border;
 begin    { Restores the bottom line of the border }
  gotoxy(4,25);
  col(BC);bak(BB);
  for x:=1 to 28 do write(chr(Block),chr(Block));
  bak(0);
 end; { Restore_Border }

procedure Init_Screen;
 begin
  Restart  := false;
  Score    := 0;
  Level    := 1;   {1}
  Gems     := 10;  {10}
  Whips    := 10;  {10}
  Teleports:= 0;   {0}
  Keys     := 0;   {0}
  WhipPower:= 2;   {2}
  FoundSet := [];
  if MixUp then
   begin
    Level    :=5;
    Gems     :=30;
    Whips    :=15;
    Teleports:=8;
    FoundSet :=[0..Objects];
   end;
  PX       := random(XSize)+XBot;
  PY       := random(YSize)+YBot;
  SkipTime := 0;
  if FastPC then STime := 10 else STime := 3;
  if FastPC then MTime := 8  else MTime := 2;
  if FastPC then FTime := 6  else FTime := 1;
  for x:=1 to TMax do T[x]:=-1; {***** reset timers *****}
  T[1]     := 5;
  T[2]     := 6;
  T[3]     := 7;
  if C1=9 then
   begin
    window(67,1,80,25);
    bak(1);
    clrscr;
    window(1,1,80,25);
   end;
  col(14);
  print(71,1,'Score');
  print(71,4,'Level');
  print(71,7,'Gems');
  print(71,10,'Whips');
  print(69,13,'Teleports');
  print(71,16,'Keys');
  col(11);bak(4);
  print(70,19,'OPTIONS');
  bak(1);
  gotoxy(70,20);col(15);write('W');col(7);write('hip');
  gotoxy(70,21);col(15);write('T');col(7);write('eleport');
  gotoxy(70,22);col(15);write('P');col(7);write('ause');
  gotoxy(70,23);col(15);write('Q');col(7);write('uit');
  gotoxy(70,24);col(15);write('S');col(7);write('ave');
  gotoxy(70,25);col(15);write('R');col(7);write('estore');
 end; { Init_Screen }

procedure High_Score(PlayAgain:boolean);
  var x,
      Place : integer;
      Stop  : boolean;
 begin
  while keypressed do read(kbd,ch);
  window(2,2,XSize+1,YSize+1);
  textbackground(0);clrscr;
  window(1,1,80,25);
  border;cur(3);
  assign(HSFile,'CAVERNS.HS');
  {$I-}
  reset(HSFile);
  {$I+}
  if IOResult <> 0 then       { create a high score file on the disk! }
   begin
    close(HSFile);
    rewrite(HSFile);
    for x:=1 to 15 do
     with HSList[x] do
      begin
       case x of
        1:begin Name:='Scott Miller';HighScore:=8420;HighLevel:=22;end;
        2:begin Name:='Kroz';HighScore:=714;HighLevel:=6;end;
        3:begin Name:='The Thief';HighScore:=99;HighLevel:=2;end;
        4:begin Name:='Floyd';HighScore:=2;HighLevel:=1;end
        else begin Name:='-----';HighScore:=0;HighLevel:=0;end
       end;
       write(HSFile,HSList[x]);
      end;
    close(HSFile);
   end;
  col(9);
  gotoxy(26,3);
  write('CAVERNS OF KROZ');
  col(11);
  gotoxy(16,5);write('NAME');
  gotoxy(33,5);write('HIGH SCORE');
  gotoxy(49,5);write('LEVEL');
  reset(HSFile);
  for x:=1 to 15 do          { read in high score list }
   read(HSFile,HSList[x]);
  Place:=1;
  Stop:=false;
  repeat                     { find place that new score fits in }
   if Score>HSList[Place].HighScore then Stop:=true;
   Place:=Place+1;
   if not Stop and (Place>15) then Place:=100;
  until Stop or (Place>15);
  Place:=Place-1;
  if Place<16 then
   for x:=15 downto Place do { bump all other score down one place }
    HSList[x]:=HSList[x-1];
  with HSList[Place] do      { add new high score }
   begin
    Name:='';
    HighScore:=Score;
    HighLevel:=Level;
   end;
  for x:=1 to 15 do          { display high score list }
   begin
    if odd(x) then col(14) else col(10);
    with HSList[x] do
     begin
      gotoxy(13,x+6);write(x:2);
      gotoxy(16,x+6);write(Name);
      gotoxy(36,x+6);write(HighScore);if HighScore>0 then write('0');
      gotoxy(50,x+6);write(HighLevel);
     end;
   end;
  close(HSFile);
  while keypressed do read(kbd,ch);
  if Place<16 then            { let player enter their name }
   begin
    bak(4);
    gotoxy(16,Place+6);
    write('               ');
    col(4);bak(7);
    gotoxy(15,23);
    write('Enter your name then press <enter>.');
    col(15);
    bak(4);
    buflen:=15;
    gotoxy(16,Place+6);
    cur(2);
    readln(HSList[Place].Name);
    cur(3);
    rewrite(HSFile);
    for x:=1 to 15 do write(HSFile,HSList[x]);
    close(HSFile);
   end;
  bak(0);
  gotoxy(15,23);
  write('                                   ');
  for x:=1 to 999 do
   begin
    SX[x]:=0;SY[x]:=0;
    MX[x]:=0;MY[x]:=0;
    FX[x]:=0;FY[x]:=0;
   end;
  if PlayAgain then
   Flash(14,25,'Do you want to play another game (Y/N)?')
  else
   begin
    ch:='N';
    Flash(21,25,'Press any key to continue.');
   end;
   if PlayAgain then read(kbd,ch);
   if upcase(ch) <> 'N' then Restart:=true
   else
    begin
     bak(0);col(15);bor(0);cur(1);
     clrscr;
     if not PlayAgain then
      begin
       gotoxy(1,2);
       writeln('Congratulations for completing of CAVERNS OF KROZ!');
      end
     else
      begin
       gotoxy(15,2);
       writeln('CAVERNS OF KROZ');
      end;
     gotoxy(9,3);
     writeln('An Apogee Software Production');
     gotoxy(14,4);
     writeln('Have a nice day...');
     while keypressed do read(kbd,ch);
     HALT;
    end;
 end; { High_Score }

procedure Won;
 begin
  Border;
  while keypressed do read(kbd,ch);
  col(16);bak(BB);
  print(13,1,'YOUR QUEST FOR THE AMULET WAS SUCCESSFUL!');
  bak(0);
  High_Score(false);
 end; { Dead }

procedure Dead;
 begin
  if Gems>9 then textcolor(4)
  else
   begin Gems:=0;textcolor(20);end;
  bak(7);
  gotoxy(71,8);
  write('     ');
  str(Gems,StrVal);
  gotoxy(73-length(StrVal) div 2,8);
  write(StrVal);
  textbackground(0);
  for x:=150 downto 5 do
   begin
    gotoxy(PX,PY);
    textcolor(x);bak(random(8));
    write(chr(Player));
    sound(x*x);
   end; nosound;
  while keypressed do read(kbd,ch);
  col(16);bak(BB);
  print(26,1,'YOU HAVE DIED!!');
  bak(0);
  repeat
   colran(random(16));
   gotoxy(PX,PY);
   write('*');
   print(21,25,'Press any key to continue.');
  until keypressed;
  Border;
  High_Score(true);
 end; { Dead }

procedure New_Gem_Color;
 begin
  repeat
   GemColor:=random(15)+1;
   if (C1=15) and (GemColor in[1,9]) then GemColor:=11;
  until GemColor <> 8;
 end;

(****************************************************************************)
{$ILevels.Inc       Includes all defined levels                             *}
(****************************************************************************)

procedure Parse_Field;
  var Slot,
      Counter,
      test  : integer;
      Fetch : string[4];
 begin
  Slot:=1;
  Counter:=1;
  repeat
   Fetch:=copy(DF[Level],Slot,3);
   if Fetch[1] = ' ' then begin Fetch:=Fetch[2]+Fetch[3];end;
   if Fetch[1] = ' ' then Fetch:=Fetch[2];
   val(Fetch,Parsed[Counter],test);
   Slot:=Slot+3;
   Counter:=Counter+1;
  until Counter > Objects;
 end; { Parse_Field }

procedure Create_Playfield;
  var x,y,
      Obj,
      Loop,
      XSpot,
      YSpot : integer;
      Done  : boolean;
 begin
  SNum:=Null; MNum:=Null; FNum:=Null;
  for x:=1 to 999 do
   begin                        {* reset monster's X, Y *}
    SX[x]:=0;SY[x]:=0;
    MX[x]:=0;MY[x]:=0;
    FX[x]:=0;FY[x]:=0;
   end;
  New_Gem_Color;
  for x:=XBot to XTop do for y:=YBot to YTop do PF[x,y]:=Null;
  PF[PX,PY]:=31;
  Parse_Field;
  for Obj:=1 to Objects do
    if Parsed[Obj] > Null then
     for Loop:=1 to Parsed[Obj] do
      begin
       Done:=false;
        repeat
         XSpot:=random(XSize)+XBot;
         YSpot:=random(YSize)+YBot;
         if PF[XSpot,YSpot] = Null then
          begin
           PF[XSpot,YSpot]:=Obj;Done:=true;
           case obj of
            1:begin SNum:=SNum+1;SX[SNum]:=XSpot;SY[SNum]:=YSpot;end;
            2:begin MNum:=MNum+1;MX[MNum]:=XSpot;MY[MNum]:=YSpot;end;
            3:begin FNum:=FNum+1;FX[FNum]:=XSpot;FY[FNum]:=YSpot;end;
           end;
          end;
        until Done;
      end;
 end; { Create_Playfield }

procedure Display_Playfield;
  var XLoop,
      YLoop : integer;
 begin
  for XLoop:=XBot to XTop do
   for YLoop:=YBot to YTop do
    if PF[XLoop,YLoop] > Null then
     begin
      gotoxy(XLoop,YLoop);
      case PF[XLoop,YLoop] of
       {Slow}      1:begin textcolor(12);write(chr(Slow));end;
       {Medium}    2:begin textcolor(10);write(chr(Medium));end;
       {Fast}      3:begin textcolor(C1);write(chr(Fast));end;
       {Block}     4:begin textcolor(6);write(chr(Block));end;
       {Whip}      5:begin textcolor(15);write(chr(Whip));end;
       {Stairs}    6:begin textbackground(7);textcolor(16);write(chr(Stairs));bak(0);end;
       {Chest}     7:begin textcolor(14);bak(4);write(chr(Chest));bak(0);end;
       {SlowTime}  8:begin textcolor(11);write(chr(SlowTime));end;
       {Gem}       9:begin textcolor(GemColor);write(chr(Gem));end;
       {Invisible} 10:begin textcolor(2);write(chr(Invisible));end;
       {Teleport}  11:begin textcolor(13);write(chr(Teleport));end;
       {Key}       12:begin textcolor(12);write(chr(Key));end;
       {Door}      13:begin textbackground(5);textcolor(3);write(chr(Door));bak(0);end;
       {Wall}      14:begin textcolor(6);write(chr(Wall));end;
       {SpeedTime} 15:begin textcolor(11);write(chr(SpeedTime));end;
       {Trap}      16:begin textcolor(7);write(chr(Trap));end;
       {River}     17:begin textcolor(25);bak(1);write(chr(River));bak(0);end;
       {Power}     18:begin textcolor(C1);bak(4);write(chr(Power));bak(0);end;
       {Forest}    19:begin textcolor(6);bak(2);write(chr(Forest));bak(0);end;
       {Tree}      20:begin textcolor(6);bak(2);write(chr(Tree));bak(0);end;
       {Bomb}      21:begin textcolor(15);write(chr(Bomb));end;
       {Lava}      22:begin textcolor(28);bak(4);write(chr(Lava));bak(0);end;
       {Pit}       23:begin textcolor(7);write(chr(Pit));end;
       {Amulet}    24:begin col(15);textbackground(2);write(chr(Amulet));bak(0);end;
       {Player}    31:begin bak(7);col(16);write(chr(Stairs));bak(0);end
       {LETTERS} else begin col(GemColor);bak(6);if GemColor=6 then col(0);
                       write(chr(PF[XLoop,YLoop]));bak(0);
                      end;
      end;
     end;
 end; { Display_Playfield }

function GetKey:byte;
      procedure BadKeySound;
       begin
        sound(540);delay(40);
        for x:=1 to 4 do
         begin sound(100);delay(15);nosound;delay(15)end;
        nosound;
       end;
  var key:char;
 begin
  if keypressed then
   begin
    read(kbd,key);
    if key=#27 then
     if keypressed then { key must be an extended character }
      begin
       read(kbd,key);
       if key in [#72,#80,#77,#75,#71,#79,#73,#81] then
        GetKey:=ord(key)+100
       else begin BadKeySound;GetKey:=Null;end;
      end
     else GetKey:=81
    else { key must be an alpha character }
     case ord(key) of
      119,87:GetKey:=87;       { Whip     }
      116,84:GetKey:=84;       { Teleport }
      112,80:GetKey:=80;       { Pause    }
      113,81:GetKey:=81;       { Quit     }
      115,83:GetKey:=83;       { Save     }
      114,82:GetKey:=82;       { Restore  }
      117,85:GetKey:=171;      { U-NW     }
      105,73:GetKey:=172;      { I-North  }
      111,79:GetKey:=173;      { O-NE     }
      106,74:GetKey:=175;      { J-West   }
      107,75:GetKey:=177;      { K-East   }
      110,78:GetKey:=179;      { N-SW     }
      109,77:GetKey:=180;      { M-South  }
      44    :GetKey:=181       { ,-SE     }
      else begin BadKeySound;GetKey:=Null;end;
     end;
   end
  else GetKey:=Null;

 end; { GetKey }

procedure Hit(X, Y:integer;ch:char);
  var i,
      Thing : integer;
 begin
  Thing:=PF[x,y];
  for i:=1 to 30 do
   begin col(random(16));gotoxy(x,y);write(ch);end;
  gotoxy(x,y);
  case Thing of
   1..3: begin
          PF[x,y]:=Null;write(' ');Score:=Score+Thing;
          sound(400);delay(20);sound(90);
         end;
      4,19,20:
         begin
          case Thing of 4:Thing:=Block;19:Thing:=Forest;20:Thing:=Tree; end;
          if random(7)<WhipPower then
           begin write(' ');PF[x,y]:=Null;
            for i:=2600 downto 20 do sound(random(i));sound(90);
           end
          else
           begin
            sound(130);delay(25);sound(90);
            textcolor(6);
            if Thing in [Forest,Tree] then bak(2);
            write(chr(Thing));
            if Thing in [Forest,Tree] then bak(0);
           end;
         end;
      6: begin textcolor(16);textbackground(7);write(chr(Stairs));bak(0);end;
   10,15,16,18:
         begin
          PF[x,y]:=Null;write(' ');
          sound(400);delay(20);sound(70);
         end;
       5:begin textcolor(15);write(chr(Whip));end;
       7:begin textcolor(14);bak(4);write(chr(Chest));bak(0);end;
       8:begin textcolor(11);write(chr(SlowTime));end;
       9:begin textcolor(GemColor);write(chr(Gem));end;
      11:begin textcolor(13);write(chr(Teleport));end;
      12:begin textcolor(12);write(chr(Key));end;
      13:begin textcolor(3);textbackground(5);write(chr(Door));bak(0);end;
      14:begin textcolor(6);write(chr(Wall));end;
      17:begin textcolor(25);bak(1);write(chr(River));bak(0);end;
      21:begin textcolor(15);write(chr(Bomb));end;
      22:begin textcolor(28);bak(4);write(chr(Lava));bak(0);end;
      23:begin textcolor(7);write(chr(Pit));end;
      24:begin col(15);bak(5);write(chr(Amulet));bak(0);end
   else begin
         PF[x,y]:=Null;write(' ');
        end;
  end;
 end; { Hit }

procedure Move(XWay,YWay:integer);
   procedure Go;
    begin
     PF[PX,PY]:=Null;
     gotoxy(PX,PY);
     write(' ');
     PX:=PX+XWay;PY:=PY+YWay;
     PF[PX,PY]:=31;
     if T[5]<1 then
      begin
       gotoxy(PX,PY);textcolor(14);bak(4);
       write(chr(Player));textbackground(0);
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
        while keypressed do read(kbd,ch);
        if not(0 in FoundSet) then
         begin
          FoundSet:=FoundSet+[0];
          Flash(16,25,'An electrified Wall blocks your way.');
         end;
        exit;
       end;
  case PF[PX+XWay,PY+YWay] of
   {Null}      0:Go;
   {Slow}      1:begin
                  Go; Gems:=Gems-1;if Gems<0 then DEAD;
                  AddScore(1);
                  sound(600);delay(25);nosound;
                 end;
   {Medium}    2:begin
                  Go; Gems:=Gems-2;if Gems<0 then DEAD;
                  AddScore(2);
                  sound(800);delay(25);nosound;
                  end;
   {Fast}      3:begin
                  Go; Gems:=Gems-3;if Gems<0 then DEAD;
                  AddScore(3);
                  sound(800);delay(25);nosound;
                 end;
   {Block}     4:begin
                  BlockSound;AddScore(4);
                  while keypressed do read(kbd,ch);
                  if not(4 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[4];
                    Flash(18,25,'A crumbled Wall blocks your way.');
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
                  if Level=40 then
                   begin
                    FootStep;
                    delay(300);
                    FootStep;
                    delay(300);
                    FootStep;
                    col(14);
                    for x:=1 to 175 do
                     begin
                      sound(random(3000)+x);
                      gotoxy(PX,PY);
                      bak(random(8));
                      col(14);
                      write(chr(Player));
                      colran(random(16));
                      bak(0);
                      print(15,25,'Oh no, something strange is happening!');
                     end;
                    for i:=1200 downto 20 do sound(random(i));
                    col(14);bak(4);
                    for x:=1 to 650 do
                     begin
                      sound(x*25);
                      gotoxy(PX,PY);
                      write(chr(220+random(4)));
                     end;
                    nosound;
                    gotoxy(PX,PY);
                    col(16);
                    bak(2);
                    write(chr(Stairs));
                    Restore_Border;
                    Flash(6,25,
                     'You are magically transported from the Caverns of Kroz!!');
                    WON;
                   end;
                  if MixUp then Level:=random(38)+2
                  else Level:=Level+1;
                  AddScore(6);
                  if not(6 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[6];
                    Flash(14,25,'Stairs take you to the next lower level.');
                   end;
                  FootStep;
                  case level of
                   2: Level2;
                   4: Level4;
                   7: Level7;
                   9: Level9;
                   11:Level11;
                   12:Level12;
                   14:Level14;
                   16:Level16;
                   18:Level18;
                   20:Level20;
                   21:Level21;
                   23:Level23;
                   25:Level25;
                   27:Level27;
                   29:Level29;
                   31:Level31;
                   33:Level33;
                   35:Level35;
                   37:Level37;
                   39:Level39;
                   40:Level40
                   else Create_PlayField;
                  end;
                  FootStep;


                  if C1=9 then
                   begin
                    bak(GemColor);
                    for x:=1 to 30 do
                     begin
                      window(32-x,12-(x div 3),35+x,14+(x div 3));
                      clrscr;
                     end;
                    bak(0);
                    for x:=1 to 30 do
                     begin
                      window(32-x,12-(x div 3),35+x,14+(x div 3));
                      clrscr;
                     end;
                    window(1,1,80,25);cur(3);
                   end
                  else
                   begin
                    window(2,2,XSize+1,YSize+1);
                    gotoxy(1,22);
                    for i:=1 to 24 do writeln;
                   end;
                  window(1,1,80,25);cur(3);
                  Border;
                  T[1]:=5;T[2]:=6;T[3]:=7;
                  T[4]:=0;  { restore SlowTime   }
                  T[5]:=0;  { restore visibility }
                  T[6]:=0;  { restore SpeedTime  }
                  FootStep;
                  Display_PlayField;
                  FootStep;
                  for x:=1 to 600 do
                   begin
                    gotoxy(PX,PY);colran(random(16));bak(random(8));
                    write(chr(Player));sound(x div 2);
                   end;
                  gotoxy(PX,PY);col(14);bak(4);write(chr(Player));bak(0);
                  while keypressed do read(kbd,ch);nosound;
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
                  if Level=31 then
                   Flash(9,25,
                    'You see a wonderful vision floating above the lava!');
                  if Level=40 then
                   Flash(16,25,'You have found the Temple of Kroz!');
                 end;
   {Chest}     7:begin
                  Go;
                  for xb:=1 to 45 do for yb:=1 to 45 do
                   begin sound(xb*yb);delay(1);end; nosound;
                  x:=random(3)+2;          {Whips}
                  y:=2;                    {Teleports}
                  i:=random(Difficulty)+2; {Gems}
                  Whips:=Whips+x;
                  Teleports:=Teleports+y;
                  Gems:=Gems+i;
                  AddScore(7);
                  bak(0);
                  while keypressed do read(kbd,ch);
                  repeat
                   colran(random(16));
                   gotoxy(10,25);
                   write('You found ',x,' whips, ',y,' teleport spells and ',i,
                         ' gems!');
                  until keypressed;
                  Restore_Border;
                 end;
   {SlowTime}  8:begin
                  Go;
                  AddScore(8);
                  for x:=7 downto 1 do
                   begin sound(x*50+300);delay(x*10+40);end;nosound;
                  if FastPC then T[4] := 180 else T[4]:=60;
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
                  if FastPC then T[5] := 120 else T[5]:=50;
                  if not(10 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[10];
                    Flash(13,25,'You found an Invisibility ring--big points!');
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
                   while keypressed do read(kbd,ch);
                   if not(13 in FoundSet) then
                    begin
                     FoundSet:=FoundSet+[13];
                     Flash(18,25,'To pass the Door you need a Key.');
                    end;
                  end
                 else
                  begin
                   Keys:=Keys-1;
                   AddScore(13);
                   for x:=10 to 90 do
                    begin sound(x);delay(15);end;
                   while keypressed do read(kbd,ch);
                   Go;
                  end;
   {Wall/River}14,17:begin
                  if PF[PX+XWay,PY+YWay]=14 then BlockSound
                  else
                   begin
                    for x:=1 to 500 do sound(random(x*2+200)+x);nosound;
                   end;
                  AddScore(14);
                  while keypressed do read(kbd,ch);
                  if not(PF[PX+XWay,PY+YWay] in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[PF[PX+XWay,PY+YWay]];
                    case PF[PX+XWay,PY+YWay] of
                     14:Flash(20,25,'A solid Wall blocks your way.');
                     17:Flash(18,25,'You cannot travel through Water.');
                    end;
                   end;
                 end;
   {SpeedTime}15:begin
                  Go;
                  AddScore(15);
                  for x:=1 to 7 do
                   begin sound(x*50+300);delay(x*10+40);end;nosound;
                  if FastPC then t[6] := 140 else T[6]:=50;
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
                  if not(16 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[16];
                    Flash(19,25,'You activated a Teleport trap!');
                   end;
                  for x:=1 to 100 do
                   begin
                    gotoxy(PX,PY);colran(random(16));bak(random(8));
                    write(chr(Player));
                   end;
                  gotoxy(PX,PY);bak(0);colran(0);write(' ');
                  for yb:= 30 downto 1 do
                   for xb:= 350 downto 20 do sound(yb*xb);
                  nosound;
                  PF[PX,PY]:=Null;PX:=Null;
                  repeat
                   x:=random(XSize)+XBot;
                   y:=random(YSize)+YBot;
                   if PF[x,y] = Null then
                    begin
                     PX:=x; PY:=y; PF[PX,PY]:=31;
                    end;
                  until PX <> Null;
                  for xb:=1 to 500 do
                   begin
                    gotoxy(PX,PY);colran(random(16));bak(random(8));
                    write(chr(Player));
                   end;
                  if T[5]<1 then
                   begin
                    gotoxy(PX,PY);col(14);bak(4);write(chr(Player));bak(0);
                   end
                  else begin gotoxy(PX,PY);bak(0);write(' ');end;
                  while keypressed do read(kbd,ch);
                 end;
   {Power}    18:begin
                  Go;
                  WhipPower:=WhipPower+1;
                  AddScore(18);
                  for x:=3 to 35 do
                   for y:=45 to 52 do
                    begin
                     sound(x*y);delay(7);nosound;delay(15);
                     colran(random(8));
                     gotoxy(PX,PY);
                     write(chr(Player));
                    end;
                  bak(4);col(14);
                  gotoxy(PX,PY);
                  write(chr(Player));
                  bak(0);
                  Flash(24,25,'Increased whip power!');
                 end;
   {Forest/Tree}19,20:
                 begin
                  BlockSound;AddScore(4);
                  while keypressed do read(kbd,ch);
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
                  if not(21 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[21];
                    Flash(20,25,'You activated a Magic Bomb!');
                   end;
                  xr:=0;xl:=0;yr:=0;yl:=0;
                  for i:=70 to 600 do begin sound(i*2);delay(3);end;bor(4);
                  for i:=5000 downto 20 do sound(random(i));
                   for width:=1 to 4 do
                    begin
                     sound(30);
                     if PX-width>1 then xl:=width;
                     if PX+width<66 then xr:=width;
                     if PY-width>1 then yl:=width;
                     if PY+width<25 then yr:=width;
                     for x:=PX-xl to PX+xr do
                      for y:=PY-yl to PY+yr do
                       if PF[x,y] in [Null..4,13,16,19] then
                        begin
                         gotoxy(x,y);
                         textcolor(12);
                         write(chr(219));
                        end;
                    end;
                    for width:=1 to 4 do
                     begin
                      if PX-width>1 then xl:=width;
                      if PX+width<66 then xr:=width;
                      if PY-width>1 then yl:=width;
                      if PY+width<25 then yr:=width;
                      for x:=PX-xl to PX+xr do
                       for y:=PY-yl to PY+yr do
                        if PF[x,y] in [Null..4,13,16,19] then
                         begin
                          gotoxy(x,y);
                          textcolor(0);
                          write(' ');
                          if PF[x,y] in [1..3] then Score:=Score+1;
                          PF[x,y]:=Null;
                         end;
                     end;
                  nosound;
                  bor(1);
                  Update_Info;
                  while keypressed do read(kbd,ch);
                 end;
   {Lava}     22:begin
                  Go;
                   Gems:=Gems-10;
                  for x:=400 downto 20 do
                   for y:= 7 downto 2 do sound(random(y*x+100)+y*x);nosound;
                  if Gems<0 then
                   begin
                    Gems:=0;
                    AddScore(22);
                    Dead;
                   end
                  else
                   AddScore(22);
                  while keypressed do read(kbd,ch);
                  if not(22 in FoundSet) then
                   begin
                    FoundSet:=FoundSet+[22];
                    Flash(22,25,'Lava causes heavy damage!');
                   end;
                  if (Level=40) and (PX in[32..34]) and (PY=12) then
                   Flash(16,25,'Before you lies the Amulet of Wealth.');
                 end;
   {Pit}      23:begin
                  Go;
                  for x:=300 downto 30 do
                   begin
                    textcolor(x mod 16);
                    print(22,25,'Oh no, a Bottomless Pit!');
                    sound(x*8);
                    gotoxy(PX,PY);textcolor(14);
                    if x>250 then write(chr(Player)) else
                    if x>200 then write(chr(9)) else
                    if x>150 then write(chr(111)) else
                    if x>100 then write(chr(248)) else
                    if x>50 then write(chr(249)) else
                    if x>0 then write(chr(250));
                   end;
                  for i:=1000 downto 20 do sound(random(i));nosound;
                  Dead;
                 end;
   {Amulet}   24:if Level=40 then {* Player won the game! *}
                  begin
                   for x:=1 to 24 do
                    for y:=5 downto 1 do
                     begin
                      sound(x*45+y*10);delay(y*3);nosound;delay(40);
                      gotoxy(33,13);colran(random(16));
                      write(chr(Amulet));
                     end;
                   gotoxy(33,13);
                   col(16);bak(2);
                   write(chr(Stairs));bak(0);
                   PF[PX+XWay,PY+YWay]:=6;
                   Score:=Score+2500;
                   Update_Info;
                   Flash(15,25,'The priceless Amulet is finally yours!');
                  end
                 else             {* Player grabbed illusion *}
                  begin
                   for x:=24 downto 1 do
                    for y:=1 to 5 do
                     begin
                      sound(x*45+y*10);delay(y*3);nosound;delay(40);
                      gotoxy(50,24);colran(random(16));
                      write(chr(Amulet));
                     end;
                   gotoxy(50,24);write(' ');
                   PF[PX+XWay,PY+YWay]:=Null;
                   Flash(12,25,'The beautiful vision fades before your eyes!');
                  end;
  end;{case}
 end; { Move }

procedure Player_Move;
 begin
  case GetKey of
    Null:;

       { Pause }
    80:begin
        textbackground(0);
        play(500,500,100);play(200,100,2);
        repeat
         colran(random(16));
         print(19,25,'Press any key to resume game.');
        until keypressed;
        Restore_Border;
       end;

       { Quit }
    81:begin
        play(600,600,100);play(450,450,100);play(300,300,100);play(99,99,99);
        repeat
         colran(random(16));
         print(24,25,'Are you sure (Y/N)?');
        until keypressed;
        read(kbd,ch);
        if upcase(ch)='Y' then
         begin
          bak(0);col(15);bor(0);cur(1);
          clrscr;
          gotoxy(14,2);
          writeln('CAVERNS OF KROZ');
          gotoxy(7,3);
          writeln('An Apogee Software Production');
          gotoxy(14,4);
          writeln('Have a nice day...');
          while keypressed do read(kbd,ch);
          HALT;
         end
        else Restore_Border;
       end;

       { Restore }
    82:begin
        bak(0);col(15);
        print(26,25,'  Restoring...  ');
        assign(SaveFile,'CAVERNS.DAT');
        {$I-}
        reset(SaveFile);
        {$I+}
        if IOResult<>0 then
         begin
          close(SaveFile);
          Restore_Border;
          repeat
           colran(random(16));
           print(14,25,'A SAVE FILE does not exist on this disk.');
          until keypressed;
          Restore_Border;
         end
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
          case Level of
            2: Level2;
            4: Level4;
            7: Level7;
            9: Level9;
           11:Level11;
           12:Level12;
           14:Level14;
           16:Level16;
           18:Level18;
           20:Level20;
           21:Level21;
           23:Level23;
           25:Level25;
           27:Level27;
           29:Level29;
           31:Level31;
           33:Level33;
           35:Level35;
           37:Level37;
           39:Level39;
           40:Level40
           else Create_PlayField;
          end;
          window(2,2,XSize+1,YSize+1);
          textbackground(0);clrscr;cur(3);
          window(1,1,80,25);
          Border;
          T[1]:=5;T[2]:=6;T[3]:=7;
          T[4]:=0;  { restore SlowTime   }
          T[5]:=0;  { restore visibility }
          T[6]:=0;  { restore SpeedTime  }
          Display_PlayField;
          for x:=1 to 600 do
           begin
            gotoxy(PX,PY);colran(random(16));bak(random(8));
            write(chr(Player));sound(x div 2);
           end;
          gotoxy(PX,PY);col(14);bak(4);write(chr(Player));bak(0);
          while keypressed do read(kbd,ch);nosound;
         end;
        if Level=31 then
         Flash(9,25,'You see a wonderful vision floating above the lava!');
        if Level=40 then
         Flash(16,25,'You have found the Temple of Kroz!');
       end;

       { Save }
    83:begin
        bak(0);col(15);
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
        assign(SaveFile,'CAVERNS.DAT');
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
        for x:=1 to 100 do
        begin
         gotoxy(PX,PY);colran(random(16));bak(random(8));
         write(chr(Player));
        end;
        gotoxy(PX,PY);bak(0);colran(0);write(' ');
        while keypressed do read(kbd,ch);
        for yb:= 30 downto 1 do for xb:= 350 downto 20 do sound(yb*xb);
        nosound;
        PF[PX,PY]:=Null;PX:=Null;
        repeat
         x:=random(XSize)+XBot;
         y:=random(YSize)+YBot;
         if PF[x,y] = Null then
          begin
           PX:=x; PY:=y; PF[PX,PY]:=31;
          end;
        until PX <> Null;
        while keypressed do read(kbd,ch);
        for xb:=1 to 500 do
        begin
         gotoxy(PX,PY);colran(random(16));bak(random(8));
         write(chr(Player));
        end;
        if T[5]<1 then
         begin
          gotoxy(PX,PY);col(14);bak(4);write(chr(Player));bak(0);
         end
        else begin gotoxy(PX,PY);bak(0);write(' ');end;
       end;

       { Whip }
    87:begin
        if Whips < 1 then begin NoneSound;exit;end;
        Whips:=Whips-1;
        sound(70);
        if (PY>YBot) and (PX>XBot) then Hit(PX-1,PY-1,'\');
        if (PX>XBot) then Hit(PX-1,PY,chr(196));
        if (PY<YTop) and (PX>XBot) then Hit(PX-1,PY+1,'/');
        if (PY<YTop) then Hit(PX,PY+1,chr(179));
        if (PY<YTop) and (PX<XTop) then Hit(PX+1,PY+1,'\');
        if (PX<XTop) then Hit(PX+1,PY,chr(196));
        if (PY>YBot) and (PX<XTop) then Hit(PX+1,PY-1,'/');
        if (PY>YBot) then Hit(PX,PY-1,chr(179));
        nosound;
        Update_Info;
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

{***************************************************************************}
{$IMONSTERS.INC                                                            *}
{***************************************************************************}


BEGIN
Screen;
NewGame:
Title;
Border;
Init_Screen;
Update_Info;
Define_Levels;
Create_PlayField;
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
  gotoxy(PX,PY);colran(random(16));bak(random(8));
  write(chr(Player));sound(x div 2);
 end;
gotoxy(PX,PY);col(14);bak(4);write(chr(Player));nosound;bak(0);
while keypressed do read(kbd,ch);

repeat
 Player_Move;
 if keypressed then SkipTime:=801 else SkipTime:=SkipTime+1;
 if SkipTime>800 then
  begin
   for x:=1 to TMax do T[x]:=T[x]-1;
   if FastPC then SkipTime := -150 else SkipTime:=0;
   for x:=1 to 3 do
     case x of
      1:if T[x]<1 then Move_Slow;
      2:if T[x]<1 then Move_Medium;
      3:if T[x]<1 then Move_Fast;
     end;
     textcolor(4);bak(7);
     gotoxy(70,2);
     str(Score,StrVal);
     if Score>0 then StrVal:=StrVal+'0';
     gotoxy(73-length(StrVal) div 2,2);
     write(StrVal);
     if T[5]<1 then
      begin
       bak(4);textcolor(14);
       gotoxy(PX,PY);
       write(chr(Player));
      end;
     textbackground(0);
  end;
until Restart;
goto NewGame;

END. {*** CAVERNS OF KROZ ***}
