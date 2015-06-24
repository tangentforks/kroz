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
procedure Title;
 begin
  nosound;
  bak(0);
  clrscr;cur(3);
  while keypressed do read(kbd,ch);
  bak(1);bor(9);
  clrscr;cur(3);
  gotoxy(26,6);col(15);
  write('An Apogee Software Production');
  gotoxy(26,7);col(15);
  for x:=1 to 29 do write(chr(196));
  gotoxy(1,9);col(11);
  writeln('  In your search for the priceless Amulet within the ancient Caverns of Kroz,');
  writeln('  you have stumbled upon a secret passage leading deep into the Earth.   With');
  writeln('  your worn lantern you descend into the misty depths,  sweat beading on your');
  writeln('  forehead as you realize the peril that awaits.   If this is really the path');
  writeln('  leading into the great underground caverns you''ll find unimaginable wealth.');
  gotoxy(23,wherey);writeln('But only if you can reach it alive!');
  gotoxy(1,17);col(10);
  write('         Use the cursor keys to move yourself (');
  col(14);bak(4);write(chr(1));col(10);bak(1);
  writeln(') through the caverns.');
  writeln('            Use your whip (press W) to destroy all nearby creatures.');
  writeln('       You are on your own to discover what other mysteries await--some');
  writeln('                           helpful, others deadly...');
  col(14);
  gotoxy(13,22);
  write('Are you a ');col(15);write('N');col(14);
  write('ovice, an ');col(15);write('E');col(14);
  write('xperienced or an ');col(15);write('A');col(14);
  write('dvanced player?');
  colran(28);write(chr(219));
  repeat
   repeat
    gotoxy(33,3);colran(random(16));write('CAVERNS OF KROZ');delay(50);
    x:=random(maxint);
   until keypressed;
   read(kbd,ch);
   sound(300);delay(100);nosound;
  until upcase(ch) in ['N',' ','E','A'];
  sound(700);delay(100);nosound;
  gotoxy(13,22);col(0);
  for x:=1 to 28 do write('  ');
  colran(30);
  case upcase(ch) of
   'N',' ':begin Difficulty:=8;gotoxy(37,22);write('NOVICE');end;
   'E':begin Difficulty:=5;gotoxy(34,22);write('EXPERIENCED');end;
   'A':begin Difficulty:=2;gotoxy(36,22);write('ADVANCED');end;
  end;

  while keypressed do read(kbd,ch);
  gotoxy(20,25);col(0);
  write('Would you like game instructions (Y/N)?');
  repeat
   gotoxy(33,3);colran(random(16));write('CAVERNS OF KROZ');delay(50);
   x:=random(maxint);
  until keypressed;
  read(kbd,ch);
  if upcase(ch) = 'Y' then
   begin
    bak(0);
    bor(2);
    clrscr;
    gotoxy(34,2);col(11);writeln('INSTRUCTIONS');
    gotoxy(34,3);col(15);writeln('------------');
    writeln;
    col(9);
    write('  The Caverns of Kroz is a game of exploration and survival.   Your journey will');
    write('take you through 40 very dangerous dungeon levels,  each riddled with diabolical');
    write('traps and hideous creatures.   Hidden in the deepest dungeon  lies the priceless');
    writeln('staff, your quest.');
    write('  The dungeons contain dozens of treasures,  spells,  traps and other mysteries.');
    write('Touching an object for the first time will reveal a little of its identity,  but');
    write('it will be left to you to decide how best to use it or avoid it.                ');
    write('  When a creature touches you it will vanish,  taking with it a few of your gems');
    write('that you have collected. If you have no gems then the creature will instead take');
    write('your life!  Whips can be used to kill nearby creatures, but they are better used');
    writeln('to smash through crumbled walls and forest terrain.');
    writeln('  PCjr players can use');
    writeln('the alternate cursor                 U I O      ( NW N NE )');
    writeln('pad instead of the cursor             J K       (   W E   )');
    writeln('keys to move your man, and           N M ,      ( SW S SE )');
    writeln('the four normal cursor keys.');
    write('  It''s a good idea to save your game at every new level,  therefore,  if you die');
    writeln('you can easily restore the game at that level and try again.');
    writeln('  Have fun and good-luck...');
    gotoxy(27,25);col(12);
    write('Press any key to continue.');
    read(kbd,ch);while keypressed do read(kbd,ch);
    if upcase(ch)='R' then MixUp:=true else MixUp:=false;
   end
  else
   begin
    sound(150);delay(100);nosound;
    gotoxy(1,25);clreol;
    gotoxy(27,25);col(12);
    write('Press any key to continue.');
    repeat
     gotoxy(33,3);colran(random(16));write('CAVERNS OF KROZ');delay(50);
     x:=random(maxint);
    until keypressed; read(kbd,ch);
    if upcase(ch)='R' then MixUp:=true else MixUp:=false;
   end;

  bak(0);bor(4);clrscr;cur(3);col(11);
  gotoxy(1,1);
  writeln('CAVERNS OF KROZ is a SHAREWARE product.');
  writeln;
  writeln('If you enjoy this game you are asked by the author to please send a check');
  writeln('of $5 (five dollars) to Scott Miller (author).  This minimal amount will');
  writeln('help compensate the many months of work that went into this game, and will');
  writeln('encourage the author to create more games.');
  writeln;
  writeln('Also, for an extra $15 you can order the two sequels to this game,');
  writeln('DUNGEONS OF KROZ and KINGDOM OF KROZ.  These games feature dozens of all');
  writeln('new levels to explore, as well as unique goals.  Please include an');
  writeln('extra $2 to cover postage and diskettes when ordering.');
  writeln;
  col(15);
  writeln('Please make checks payable to:');
  writeln;
  writeln('   Scott Miller');
  writeln('   4206 Mayflower Drive');
  writeln('   Garland, TX    75043');
  writeln;
  col(11);
  writeln('Also call (214) 240-0614 if you have any questions.');
  writeln;
  writeln('Enjoy the game...');
  writeln;
  writeln('Scott Miller');
  delay(10000);
  while keypressed do read(kbd,ch);
  bak(4);
  gotoxy(1,25);
  insline;
  gotoxy(22,25);
  col(0);
  write('Press any key to begin your descent.');
  repeat until keypressed;

  while keypressed do read(kbd,ch);
  bak(0);bor(1);clrscr;cur(3);

 end; { Title }
