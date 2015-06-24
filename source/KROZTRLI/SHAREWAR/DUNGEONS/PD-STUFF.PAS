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
  CK;
  gotoxy(20,25);col(0);
  write('Would you like game instructions (Y/N)?');
  repeat
   gotoxy(33,3);colran(random(16));write('DUNGEONS OF KROZ');delay(50);
  until keypressed;
  read(kbd,ch);
  if upcase(ch) = 'Y' then
   begin
    bak(0);
    bor(2);
    clrscr;
    gotoxy(32,1);col(14);writeln('DUNGEONS OF KROZ');
    gotoxy(34,2);col(11);writeln('INSTRUCTIONS');
    gotoxy(34,3);col(15);writeln('------------');
    writeln;
    col(9);
    write('  The Dungeons of Kroz is a game of exploration and survival.  Your journey will');
    write('take you through 30 very dangerous dungeon levels,  each riddled with diabolical');
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
    read(kbd,ch);CK;
    if upcase(ch)='R' then MixUp:=true else MixUp:=false;
   end
  else
   begin
    sound(150);delay(100);nosound;
    gotoxy(1,25);clreol;
    gotoxy(27,25);col(12);
    write('Press any key to continue.');
    repeat
     gotoxy(33,3);colran(random(16));write('DUNGEONS OF KROZ');delay(50);
    until keypressed; read(kbd,ch);
    if upcase(ch)='R' then MixUp:=true else MixUp:=false;
   end;

  bak(0);bor(4);clrscr;cur(3);col(11);
  gotoxy(1,1);
  writeln('Please note that DUNGEONS OF KROZ is a SHAREWARE product.');
  writeln;
  writeln('If you enjoy this game you are asked by the author to please send a check');
  writeln('of $5 (five dollars) to Scott Miller (author).  This minimal amount will');
  writeln('help compensate the many months of work that went into this game, and will');
  writeln('encourage the author to create more games.');
  writeln;
  writeln('Also, for an extra $12 you can order the two sequels to this game,');
  writeln('CAVERNS OF KROZ and KINGDOM OF KROZ.  These games feature 65 new levels');
  writeln('to explore, as well as unique goals.  Please send a DSDD disk and a SASE');
  writeln('when ordering.');
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
  delay(15000);
  CK;
  bak(4);
  gotoxy(1,25);
  insline;
  gotoxy(22,25);
  col(0);
  write('Press any key to begin your descent.');
  repeat until keypressed;

  CK;
  bak(0);bor(1);clrscr;cur(3);
