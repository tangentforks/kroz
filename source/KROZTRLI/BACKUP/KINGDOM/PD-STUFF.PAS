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
  bak(0);bor(4);clrscr;cur(3);col(11);
  gotoxy(1,1);
  writeln('Please note that KINGDOM OF KROZ is a SHAREWARE product.');
  writeln;
  writeln('If you enjoy this game you are asked by the author to please send a check');
  writeln('of $5 (five dollars) to Scott Miller (author).  This minimal amount will');
  writeln('help compensate the many months of work that went into this game, and will');
  writeln('encourage the author to create more games.');
  writeln;
  writeln('Also, for an extra $12 you can order the two sequels to this game,');
  writeln('CAVERNS OF KROZ and DUNDEONS OF KROZ.  These games feature 65 new levels');
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
  repeat until keypressed;