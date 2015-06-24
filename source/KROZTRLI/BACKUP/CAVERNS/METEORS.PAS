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
{****************************************************************************}
{*                              M E T E O R S                               *}
{*                             by Scott Miller                              *}
{*                          began Febuary 7, 1986                           *}
{****************************************************************************}
{$C-,R-,V-,K-}

                        {***************************}
                        {* Last Modified:  2/13/86 *}
                        {***************************}

const
  Null          = 0;
  XSize         = 60;
  YSize         = 25;
  Ship          = 30;
  Crew          = 1;
  Can           = 233;
  Rocket        = 24;
  Strength      = 42;
  Missile       = 179;

type
  Str100        = string[100];
  Regs          = record AX,BX,CX,DX,BP,SI,DI,DS,ES,Flags:integer; end;

var
  Rocks,
  MColor,
  CrewSaved,
  CurrentSaved,
  CrewLost,
  Fuel,
  ShieldStrength,
  Bombs,
  Score,
  Level,
  ShipSpeed,
  PX, PY,
  SlowDown,
  x,y,i         : integer;
  xb, yb        : byte;
  S{pace}       : array[1..XSize,1..YSize] of byte;
  ch            : char;
  Result        : Regs;
  Fast,
  Color,
  Restart       : boolean;

label
  NEWGAME;

procedure Initialize_Variables;
 begin
  Rocks         := 250;
  CrewSaved     := 0;
  CurrentSaved  := 0;
  CrewLost      := 5;
  Fuel          := 1000;
  ShieldStrength:= 5;
  Bombs         := 10;
  Score         := 0;
  Level         := 1;
  ShipSpeed     := 1800;
  if Fast then ShipSpeed:=1650;
  Restart       := false;
  PX            := 31;
  PY            := 25;
  SlowDown      := 0;
 end;

procedure Col(Num1,Num2:byte);
 begin
  if Color then textcolor(Num1) else textcolor(Num2);
 end;

procedure Bak(Num1,Num2:byte);
 begin
  if Color then textbackground(Num1) else textbackground(Num2);
 end;

procedure Bor(Num:byte);
 begin
  with Result do begin AX:=$B00;BX:=Num;end;
  intr($10,Result);
 end;

procedure Cur(Num:byte);
 begin
  Result.AX:=$100;
  if Color then
   with Result do
    case Num of
     1:CX:=$707;   { Underline   }
     3:CX:=$2000;  { Invisible   }
    end
  else Result.CX:=$2000;
  intr($10,Result);
 end;

procedure Flash(XPos,YPos:integer;Message:Str100);
 begin
  while keypressed do read(kbd,ch);
  repeat
   col(random(16),random(16));
   gotoxy(XPos,YPos);
   write(Message);
  until keypressed;
 end; { Flash }

procedure Screen_Type;
 begin
  Color:=true;
  bak(0,0);
  clrscr;
  cur(3);
  flash(2,9,'Color or Monochrome (C/M)?');
  read(kbd,ch);
  if upcase(ch) = 'M' then Color:=false;
  gotoxy(2,9);
  col(0,0);
  write('                          ');
  while keypressed do read(kbd,ch);
  repeat
   gotoxy(2,12);
   textcolor(random(16));
   write('Difficulty Level:');
   gotoxy(2,13);
   write('Slow or Fast (S/F)?');
  until keypressed;
  read(kbd,ch);
  Fast:=false;
  if upcase(ch)='F' then Fast:=true;
 end;

procedure Print(Num1,Num2:byte;Msg:Str100);
 begin
  for x:=1 to length(Msg) do
   begin
    gotoxy(x,wherey);
    sound(60);delay(random(5));nosound;
    col(Num1,Num2);
    write(Msg[x]);col(13,15);write(chr(219));
    y:=wherey;
    gotoxy(32,2);
    col(random(16),9);
    write('M E T E O R S');
    gotoxy(x,y);
   end;
  gotoxy(x+1,y);
  textcolor(0);
  writeln(' ');
 end;

procedure Title;
  label SKIP_MESSAGE;
 begin
  while keypressed do read(kbd,ch);
  if Color then textmode(C80) else textmode(BW80);
  bak(1,0);
  clrscr;
  cur(3);
  bor(1);
  gotoxy(26,4);
  col(14,7);
  write('A Scott Miller Production');
  gotoxy(1,6);
  print(28,23,'ALERT...ALERT...');
  if keypressed then goto SKIP_MESSAGE;
  for i:=1 to 5 do
   begin
    sound(460);
    for x:=1 to 13 do
     begin
      col(random(16),9);
      y:=wherey;
      gotoxy(32,2);
      write('M E T E O R S');
      gotoxy(x,y);
     end;
    nosound;
    if keypressed then goto SKIP_MESSAGE;
    for x:=1 to 20 do
     begin
      col(random(16),9);
      y:=wherey;
      gotoxy(32,2);
      write('M E T E O R S');
      gotoxy(x,y);
     end;
   end;
  if keypressed then goto SKIP_MESSAGE;
  gotoxy(1,6);
  print(15,7,'                ');
  gotoxy(1,6);
  print(15,7,'PRIORITY ONE MESSAGE:');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'     ');
  print(15,7,'From:  Admiral Joseph Bronze, Sr.');
  print(15,7,'       United Space Fleet Command');
  print(15,7,'     ');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'To:    Captain of SPACE EAGLE --- License SM-0010E');
  print(15,7,'     ');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'A terrible catastrophe occurred only minutes ago...an urgent distress signal');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'from the USS Sagan, our largest scientific space station, stated that their');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'ship was being torn apart by an uncharted meteor storm.');
  print(15,7,'     ');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'We have charted your scout ship as the closest vessal in the region...we need');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'your help.  Please fly your ship to sector B32 and rescue as many victims as');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'possible.  It is reported that most of the crew were able to get into their');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'life suits, but their air supply will not last long.  Pick up undamaged fuel');
  if keypressed then goto SKIP_MESSAGE;
  print(15,7,'canisters for extra fuel if necessary.  Please hurry...');
  print(15,7,'     ');
  print(15,7,'END OF TRANSMISSION');
  col(10,7);
  gotoxy(26,25);
  write('Press any key to continue.');
  repeat
   col(random(16),9);
   gotoxy(32,2);
   write('M E T E O R S');
  until keypressed;
  while keypressed do read(kbd,ch);
  bak(1,0);
  gotoxy(1,5);
  for i:=1 to 20 do
   begin
    sound(100);delay(6);nosound;
    if keypressed then goto SKIP_MESSAGE;
    insline;
    for i:=1 to 5 do
     begin
      gotoxy(32,2);
      col(random(16),9);
      write('M E T E O R S');
      textcolor(0);
      gotoxy(1,5);
     end;
   end;
  col(11,7);
  writeln;writeln;
  print(15,7,'FILE 101-2-AA');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'     ');
  print(11,7,'SPACE EAGLE: MISSION "METEORS"');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'     ');
  print(11,7,'Use the left and right cursor keys to maneuver your ship as you fly through');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'the highly dangerous meteor storm.');
  print(11,7,'     ');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'Rescue the crew members by touching them with the Space Eagle.  To increase');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'your fuel supply pick up the floating fuel canisters.');
  print(11,7,'     ');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'Your ship''s shields can withstand five meteor hits, any more after that and');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'the Space Eagle''s outer hull could crack, killing all aboard her.');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'     ');
  print(11,7,'Your ship is equipped with 10 antimatter missles, which can be used as an');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'effective method to eliminate meteors.  Floating crew members are too small');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'a target to hit with a missile.  Use the hyperspace matter transferral device');
  if keypressed then goto SKIP_MESSAGE;
  print(11,7,'only as a last resort, since it consumes a large amount of the ship''s fuel.');
  col(10,7);
  gotoxy(22,25);
  write('Press any key to begin your mission.');
  repeat
   col(random(16),9);
   gotoxy(32,2);
   write('M E T E O R S');
  until keypressed;
  SKIP_MESSAGE:
  while keypressed do read(kbd,ch);
  for i:=4 to 50 do begin bor(i);sound(i*i);delay(20);end;nosound;bor(6);
  bak(0,0);
  clrscr;cur(3);
 end; { Title }

procedure Set_Up_Screen;
 begin
  bak(6,7);
  window(XSize+1,1,80,YSize);
  clrscr;
  bak(6,0);
  window(1,1,80,25);
  cur(3);
  gotoxy(68,1);col(14,9);write('METEORS');
  gotoxy(64,3);col(10,7);write('Score');
  gotoxy(64,6);write('Quadrant');
  gotoxy(64,9);write('Crew Rescued');
  gotoxy(64,12);write('Fuel Level');
  gotoxy(64,15);write('Shields');
  gotoxy(64,18);write('Missiles');
  gotoxy(64,21);col(9,7);bak(4,0);write('OPTIONS');
  gotoxy(64,22);col(15,15);bak(6,0);write('M');col(11,7);write('issile');
  gotoxy(64,23);col(15,15);write('H');col(11,7);write('yperspace');
  gotoxy(64,24);col(15,15);write('P');col(11,7);write('ause');
  gotoxy(64,25);col(15,15);write('Q');col(11,7);write('uit');
  bak(0,0);
 end; { Set_Up_Screen }

procedure New_Meteor_Color;
  var i:integer;
 begin
  MColor:=random(6)+1;
 end;

procedure Restore_Screen;
 begin
  y:=12;
  for x:=3 to XSize-3 do
   begin
    gotoxy(x,y);
    case S[x,y] of
     Null   :col(0,0);
     9,79,111,248,249:if random(2)=0 then col(MColor,7) else col(MColor+8,15);
     Crew   :col(15,31);
     Can    :col(28,31);
     Rocket :col(7,31);
     Strength:col(7,31);
    end;
    write(chr(S[x,y]));
   end;
 end; { Display_Space }

procedure PrintNum(YPos,Num:integer);
 begin
  gotoxy(64,YPos);
  write('       ');
  gotoxy(65,YPos);
  if (YPos=4)and(Score>0) then write(Num,'0') else write(Num);
 end;

procedure Update_Info;
 begin
  bak(7,0);
  col(4,7);
  printnum(4,Score);
  printnum(7,Level);
  printnum(10,CrewSaved);
  printnum(13,Fuel);
  printnum(16,ShieldStrength);
  printnum(19,Bombs);
  bak(0,0);
 end; { Update_Info }

procedure Create_Space;
  var x,y,i : integer;
      Done  : boolean;
 begin
  for x:=1 to XSize do for y:=1 to YSize do S[x,y]:=Null;
  i:=MColor;
  repeat
   New_Meteor_Color;
  until i<>MColor;
  for i:=1 to Rocks do
   begin
    Done:=false;
    repeat
     x:=random(XSize)+1;
     y:=random(YSize-1)+1;
     if S[x,y]=Null then
      begin
       Done:=true;
       case random(5) of
        0:S[x,y]:=249;
        1:S[x,y]:=79;
        2:S[x,y]:=9;
        3:S[x,y]:=111;
        4:S[x,y]:=248;
       end;
      end;
    until Done;
   end;
  for i:=1 to CrewLost+1 do
   begin
    Done:=false;
    repeat
     x:=random(XSize)+1;
     y:=random(YSize)+1;
     if S[x,y]=Null then
      begin
       Done:=true;
       S[x,y]:=Crew;
      end;
    until Done;
   end;
  Done:=false;
  repeat
   x:=random(XSize)+1;
   y:=random(YSize)+1;
   if S[x,y]=Null then
    begin
     Done:=true;
     S[x,y]:=Can;
    end;
  until Done;
  for i:=1 to random(3)+1 do
   begin
    Done:=false;
    repeat
     x:=random(XSize)+1;
     y:=random(YSize)+1;
     if S[x,y]=Null then
      begin
       Done:=true;
       S[x,y]:=Rocket;
      end;
    until Done;
   end;
  for i:=1 to random(3)+1 do
   begin
    Done:=false;
    repeat
     x:=random(XSize)+1;
     y:=random(YSize)+1;
     if S[x,y]=Null then
      begin
       Done:=true;
       S[x,y]:=Strength;
      end;
    until Done;
   end;
 end; { Create_Space }

procedure Display_Space;
 begin
  for x:=1 to XSize do
   begin
    sound(random(2500)+100);
    for y:=1 to YSize do
     if S[x,y]<>Null then
      begin
       gotoxy(x,y);
       case S[x,y] of
        9,79,111,248,249:if random(2)=0 then col(MColor,7) else col(MColor+8,15);
        Crew   :col(15,31);
        Can    :col(28,31);
        Rocket :col(7,31);
        Strength:col(7,31);
      end;
     write(chr(S[x,y]));
    end;
   end;
  nosound;
 end; { Display_Space }

procedure Warp_In_Ship;
  var i:integer;
 begin
  for i:=1 to 160 do
   begin
    gotoxy(PX,PY);
    bak(random(16),0);
    col(random(16),random(16));
    sound(20+i);
    write(chr(Ship));
   end;
  nosound;
  col(14,15);
  bak(0,0);
  gotoxy(PX,PY);
  write(chr(Ship));
  SlowDown:=-5000;
  while keypressed do read(kbd,ch);
 end; { Warp_In_Ship }

procedure Play_Again;
 begin
  nosound;
  Flash(10,12,'DO YOU WANT TO PLAY ANOTHER GAME (Y/N)?');
  Restore_Screen;
  read(kbd,ch);
  if upcase(ch)='N' then
   begin
    textmode(BW80);
    bak(0,0);col(7,7);bor(0);cur(1);
    clrscr;
    gotoxy(1,3);
    writeln('        METEORS');
    writeln('A Scott Miller Production');
    writeln('    Have a nice day...');
    while keypressed do read(kbd,ch);
    HALT;
   end
  else Restart:=true;
 end; { Play_Again }

procedure Move(XWay:integer);
   procedure Go;
    begin
     SlowDown:=Null;
     S[PX,PY]:=Null;
     textcolor(0);
     gotoxy(PX,PY);
     write(' ');
     if PX+XWay<1 then PX:=60
     else if PX+XWay>60 then PX:=1
     else PX:=PX+XWay;
     if PY=1 then PY:=25 else PY:=PY-1;
     col(14,15);
     S[PX,PY]:=Ship;
     gotoxy(PX,PY);
     write(chr(Ship));
     sound(55);
     if keypressed then
      begin
       read(kbd,ch);
       if ch=#27 then read(kbd,ch);
      end;
     Fuel:=Fuel-1;
     if Fuel<0 then
      begin
       Flash(15,12,'YOUR SHIP HAS RUN OUT OF FUEL!');
       while keypressed do read(kbd,ch);
       Restore_Screen;
       Play_Again;
      end;
     bak(7,0);
     col(4,7);
     printnum(13,Fuel);
     bak(0,0);
     nosound;
    end; { Go }
  var PXCheck,PYCheck :integer;
 begin
  if PX+XWay<1 then PXCheck:=60
  else if PX+XWay>60 then PXCheck:=1
  else PXCheck:=PX+XWay;
  if PY=1 then PYCheck:=25 else PYCheck:=PY-1;
  case S[PXCheck,PYCheck] of
   Null:Go;

   Crew:begin
         Go;
         for i:=20 to 1000 do sound(random(1000)+i);nosound;
         for i:=1 to 30 do
          begin
           col(0,0);
           bak(random(8),random(8));
           printnum(10,CrewSaved);
          end;
         CrewSaved:=CrewSaved+1;
         CurrentSaved:=CurrentSaved+1;
         Score:=Score+Level*5;
         Update_Info;
         if CurrentSaved=CrewLost then  { Next Level }
          begin
           Score:=Score+Level*25;
           Level:=Level+1;
           ShipSpeed:=ShipSpeed-35;if Fast then ShipSpeed:=ShipSpeed-18;
           if Fast then
            begin
             if ShipSpeed<1300 then ShipSpeed:=1300;
            end
           else if ShipSpeed<1580 then ShipSpeed:=1580;
           CrewLost:=CrewLost+2;if CrewLost>35 then CrewLost:=35;
           CurrentSaved:=0;
           Rocks:=Rocks+15;if Rocks>385 then Rocks:=385;
           col(0,0);
           delay(800);
           for x:=1 to XSize do
            for y:=1 to YSize do
             if S[x,y]<>Null then
              begin
               gotoxy(x,y);
               write(' ');
              end;
           Create_Space;
           Display_Space;
           Update_Info;
           col(14,15);
           S[PX,PY]:=Ship;
           if (S[PX,PY-1] in [9,79,111,248,249])and(PY-1>0) then
            begin
             S[PX,PY-1]:=Null;
             gotoxy(PX,PY-1);write(' ');
            end;
           Warp_In_Ship;
          end;
        end;

   Can :begin
         Go;
         Score:=Score+Level;
         Update_Info;
         for i:=1 to 100 do
          begin
           sound((i*2)+Fuel);
           bak(7,0);
           col(random(16),7);
           gotoxy(65,13);
           write(Fuel+(i*2));
           gotoxy(PX,PY);
           col(random(16),random(16));
           bak(0,0);
           write(chr(Ship));
           delay(30);
          end;
         nosound;
         bak(7,0);
         col(4,7);
         gotoxy(65,13);
         write(Fuel+(i*2));
         gotoxy(PX,PY);
         col(14,15);
         bak(0,0);
         write(chr(Ship));
         Fuel:=Fuel+200;
         bak(0,0);
         while keypressed do read(kbd,ch);
        end;

 Strength
       :begin
         Go;
         Score:=Score+Level;
         ShieldStrength:=ShieldStrength+1;
         for i:=3 to 30 do
          begin
           sound(i*i*i);
           col(0,0);
           bak(random(8),random(8));
           printnum(16,ShieldStrength);
          end;
         nosound;
         Update_Info;
        end;

 Rocket:begin
         Go;
         Score:=Score+Level;
         Bombs:=Bombs+1;
         for i:=1 to 20 do
          begin
           sound(300);
           col(0,0);
           bak(random(8),random(8));
           printnum(19,Bombs);
           delay(10);
           sound(500);
           col(0,0);
           bak(random(8),random(8));
           printnum(19,Bombs);
           delay(10);
          end;
         nosound;
         Update_Info;
        end;

    { Meteors }
   9,79,111,248,249
       :begin
         Go;
         for i:=5000 downto 20 do sound(random(i));nosound;
         ShieldStrength:=ShieldStrength-1;
         Score:=Score+1;
         if (ShieldStrength<0) and (random(2)=0) then   { ship survives! }
          begin
           ShieldStrength:=0;
           Flash(15,12,'THE OUTER HULL REMAINS INTACT!');
           Restore_Screen;
          end
         else
          if ShieldStrength<0 then                      { ship crashes! }
           begin
            Flash(12,12,'YOUR SHIP IS DESTROYED BY A METEOR!');
            Restore_Screen;
            while keypressed do read(kbd,ch);
            Play_Again;
           end
          else Update_Info;
        end;
  end;
 end; { Move }

function GetKey:byte;
   procedure BadKeySound;
    begin
     sound(540);delay(40);
     for x:=1 to 4 do
      begin sound(120);delay(15);nosound;delay(15);end;
    end;
  var key:char;
 begin
  if keypressed then
   begin
    read(kbd,key);
    if key=#27 then
     if keypressed then   { key must be an extended code }
      begin
       read(kbd,key);
       if key in [#72,#75,#77,#71,#73] then    { up, left, right, NW, NE }
        GetKey:=ord(key)+100
       else begin BadKeySound;GetKey:=Null;end;
      end
     else GetKey:=81
    else
     case ord(key) of
      81,113:GetKey:=81;        { Quit }
      80,112:GetKey:=80;        { Pause }
      77,109,45:GetKey:=77;     { Missile }
      72,104,32,43:GetKey:=72;  { Hyperspace }
      44    :GetKey:=175;       { Left }
      46    :GetKey:=177        { Right }
      else begin BadKeySound;GetKey:=Null;end
     end
   end
  else GetKey:=Null;
 end; { GetKey }

procedure Player_Move;
  var Done :boolean;
 begin
  case GetKey of
   Null:;

      { Hyperspace }
   72:begin
       if Fuel>100 then
        begin
         Fuel:=Fuel-100;
         sound(20);
         for i:=1 to 300 do
          begin
           gotoxy(PX,PY);
           textcolor(random(16));
           write(chr(random(4)+220));
          end;
         gotoxy(PX,PY);
         textcolor(0);
         write(' ');
         xb:=0;
         repeat
          xb:=xb+2;yb:=0;
          repeat yb:=yb+1;sound(xb*yb);until yb>200;
         until xb>70;
         sound(20);
         Done:=false;
         repeat
          PX:=random(XSize)+1;
          PY:=random(YSize)+1;
          if S[PX,PY]=Null then
           begin
            Done:=true;
            S[PX,PY]:=Ship;
           end;
         until Done;
         SlowDown:=-5000;
         for i:=1 to 300 do
          begin
           gotoxy(PX,PY);
           textcolor(random(16));
           write(chr(random(4)+220));
          end;
         gotoxy(PX,PY);
         col(14,15);
         write(chr(Ship));
         nosound;
         Update_Info;
        end
       else
        begin
         Flash(9,12,'YOU DON''T HAVE ENOUGH FUEL TO HYPERSPACE!');
         Restore_Screen;
        end;
      end;

      { Missile }
   77,172:
      begin
       if Bombs>0 then
        begin
         Bombs:=Bombs-1;
         if PY=1 then begin sound(100);delay(200);end
         else
          begin
           sound(100);
           i:=PY;
           Done:=false;
           repeat
            i:=i-1;
            if i>0 then
             if S[PX,i] in [9,79,111,248,249] then
              begin
               Done:=true;
               Score:=Score+1;
               S[PX,i]:=Null;
               for x:=1 to 100 do
                begin
                 gotoxy(PX,i);
                 textcolor(random(16));
                 write(copy(chr(4)+chr(15)+chr(216)+chr(206)+chr(254)+'*+XO',
                            random(9)+1,1));
                end;
               gotoxy(PX,i);
               col(0,0);
               write(' ');
               for x:=2300 downto 20 do sound(random(x));nosound;
              end
             else
              begin
               for x:=1 to 30 do
                begin
                 gotoxy(PX,i);
                 col(random(16),15);
                 write(chr(Missile));
                end;
               gotoxy(PX,i);
               if S[PX,i]=Can then col(28,31);
               if S[PX,i]=Crew then col(15,31);
               if S[PX,i]=Rocket then col(7,31);
               if S[PX,i]=Strength then col(7,31);
               if S[PX,i]=Null then col(0,0);
               write(chr(S[PX,i]));
              end
            else Done:=true;
           until Done;
          end;
        end
       else
        begin
         Flash(18,12,'YOU ARE OUT OF MISSILES!');
         Restore_Screen;
        end;
       nosound;
       Update_Info;
      end;

      { Pause }
   80:begin
       sound(800);delay(100);sound(400);delay(100);nosound;
       flash(13,12,'PRESS ANY KEY TO RESUME YOUR GAME.');
       Restore_Screen;
       Warp_In_Ship;
      end;

      { Quit }
   81:begin
       for x:=1600 downto 20 do begin sound(x);end;nosound;
       flash(12,12,'ARE YOU SURE YOU WANT TO QUIT (Y/N)');
       Restore_Screen;
       read(kbd,ch);
       if upcase(ch)='Y' then
        begin
         textmode(BW80);
         bak(0,0);col(7,7);bor(0);cur(1);
         clrscr;
         gotoxy(1,3);
         writeln('        METEORS');
         writeln('A Scott Miller Production');
         writeln('    Have a nice day...');
         while keypressed do read(kbd,ch);
         HALT;
        end;
       Warp_In_Ship;
      end;

      { Move Left }
  177,173:Move(1);

      { Move Right }
  175,171:Move(-1);

  end;
 end;


BEGIN
Screen_Type;
NEWGAME:
Initialize_Variables;
Title;
Set_Up_Screen;
Update_Info;
Create_Space;
Display_Space;
col(14,15);
while S[PX,PY]<>Null do PX:=PX+1;
S[PX,PY]:=Ship;
if S[PX,PY-1] in [9,79,111,248,249] then
 begin
  S[PX,PY-1]:=Null;
  gotoxy(PX,PY-1);write(' ');
 end;
delay(1000);
Warp_In_Ship;
repeat
 Player_Move;
 SlowDown:=SlowDown+1;
 if SlowDown>ShipSpeed then
  begin
   Move(0);
   SlowDown:=Null;
  end;
until Restart;
goto NEWGAME;
cur(1);
END. { Meteors }
