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
{*** CAVERNS OF KROZ II level layouts.  By Scott Miller 11/12/89 ***}

unit CAVERNS2;

interface

procedure Level2;
procedure Level4;
procedure Level7;
procedure Level9;
procedure Level11;
procedure Level12;
procedure Level14;
procedure Level16;
procedure Level18;
procedure Level20;
procedure Level21;
procedure Level23;
procedure Level25;
procedure Level27;
procedure Level29;
procedure Level31;
procedure Level33;
procedure Level35;
procedure Level37;
procedure Level39;
procedure Level40;


implementation { ---------------------------------------------------------- }

uses Turbo3, CRT, DOS, CAVERNS1;

procedure Level2;
 begin 
  FP[1]:= 'LXXX2    2     2        2   2  2  2   2    2 2    2  2    2    +';
  FP[2]:= '+XXX  2     2      2        2          2  2    2     2      XXX ';
  FP[3]:= ' XXX2   2      2       2  2     2   2       2      2  2  2  XTX ';
  FP[4]:= '+XXX          2  2           2         2  2     2   2       XXX ';
  FP[5]:= ' XXX   2   2         2   2     2    2      2  2        2     2  ';
  FP[6]:= '+XXX 2                                                          ';
  FP[7]:= ' XXX  2  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  2  2 ';
  FP[8]:= '+XXX2    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    2  ';
  FP[9]:= ' XXX  2  XXX2                    W                   2XXX 2     ';
  FP[10]:='+XXX   2 XXX  2                FFFFF               2  XXX   2 2 ';
  FP[11]:=' XXX2 2  XXX                   F111F                  XXX       ';
  FP[12]:='+XXX2    XXX+   3  3        W  F1P1F  W       3  3   +XXX  2    ';
  FP[13]:='XXXX   2 XXX                   F111F                  XXX 2    2';
  FP[14]:='WXXX 2   XXX  2                FFFFF               2  XXX   2   ';
  FP[15]:='WXXX2    XXX2                    W                   2XXX    2  ';
  FP[16]:='WXXX  2  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 2     ';
  FP[17]:='WXXX   2 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    2  ';
  FP[18]:='WXXX2                                                      2    ';
  FP[19]:='WXXX    2   2      2   2     2    2   2    2    2      2      2 ';
  FP[20]:='XXXX 2    2   2 2    2    2     2       2     2     2     2 XXX ';
  FP[21]:='XXXX2  2    2  2  2      2    2     2  2  2  2    2         XTX ';
  FP[22]:='XXXX 2   2 2    2   2  2    2   2       2       2   2   2   XXX ';
  FP[23]:='CXXX   2    2  2 2    2 2     2    2  2  2   2    2  2    2    +';
  Convert_Format;
 end; { Level2 }

procedure Level4;
 begin
  FP[1]:= 'WFP I        C3+3+3+3+3+3+3+2+2+2+2+2+2+2+2+1+1+1+1+1+1+1+1 W   ';
  FP[2]:= 'XX############################################################CC';
  FP[3]:= '             C3+3+3+3+3+3+3+2+2+2+2+2+2+2+2+1+1+1+1+1+1+1+1 W   ';
  FP[4]:= '  ##############################################################';
  FP[5]:= '  #     1        +              1     +                  X      ';
  FP[6]:= ' 1#I##################################################   #   #  ';
  FP[7]:= '  #X #XX    X    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#1  #   #+ ';
  FP[8]:= '  # X#XX XX X XX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#   # 1 #  ';
  FP[9]:= '+ #X #X +XX  +X  XXLX  W + + + + + T + + + + + W   XX#   #   # 1';
  FP[10]:='  # X#X XXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  X# 1 #+  #  ';
  FP[11]:='1 #X #X   X     +XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX X#   #   #  ';
  FP[12]:='  # X#XXX X ####################################### X#  +#1  #  ';
  FP[13]:='  #X #XXXIX     1   +    1   +   1  +               X#   #   #  ';
  FP[14]:='  # X#X   ###################################XXX######  1#   #  ';
  FP[15]:='  #X #X #####################################XXX######   #   #1 ';
  FP[16]:=' 1# X#X     1 +1 +1 +1 +1 +1++++                     #+  #  1#  ';
  FP[17]:='  #X ########################################XXX#### #   #   # +';
  FP[18]:='  # XXXXXXXXXXXCXXXXXXXXXCXXXXXXXXXCXXXXXXXXXWWWXXX# # 1 #  +#  ';
  FP[19]:='  # XXXXXXCXXXXXXXXXCXXXXXXXXXCXXXXXXXXXCXXXXXXXXXX#1#   #1  #  ';
  FP[20]:=' +# ################################################ #   #   # 1';
  FP[21]:='  #    1+++1            C           1+++1            #       #  ';
  FP[22]:='1 ############################################################  ';
  FP[23]:='         1       +            1         +               1       ';
  Convert_Format;
 end; { Level4 }

procedure Level7;
 begin
  FP[1]:= 'X3 3 3 3 3 X+X             XX  L  XX             X3X 3 3 3 3 3X ';
  FP[2]:= ' X+ + + + + X3XX           XX     XX           XX+X + + + + +X  ';
  FP[3]:= '  X3 3 3 3 3 X+XX     W    XX  3  XX    K     XX3X 3 3 3 3 3X   ';
  FP[4]:= '   X          X3XX         XX3 + 3XX         XX+X          X    ';
  FP[5]:= '+   X3 3 3 3 3 X+XX   3    XX  3  XX    3   XX3X 3 3 3 3 3X    +';
  FP[6]:= '#    X          X3XX       XX  +  XX       XX+X          X     #';
  FP[7]:= '##    X3 3 3 3 3 X+XX      XX  3  XX      XX3X 3 3 3 3 3X     ##';
  FP[8]:= 'C##    X          X3XX     XX3 + 3XX     XX+X          X     ##C';
  FP[9]:= '+###    X3 3 3 3 3 X+XX    XX  3  XX    XX3X 3 3 3 3 3X     ###+';
  FP[10]:=' ####    XI I I I I X3XX   XX  +  XX   XX+X I I I I IX     #### ';
  FP[11]:=' #####    X3 3 3 3 3 X+XX  XX  3  XX  XX3X 3 3 3 3 3X     ##### ';
  FP[12]:=' ######    X          X3XX XX  +  XX XX+X          X     ###### ';
  FP[13]:=' #######    X3 3 3 3 3 X+XXXX  X  XXXX3X 3 3 3 3 3X     ####### ';
  FP[14]:=' ########    X          X3XXX  C  XXX+X          X     ######## ';
  FP[15]:=' #########    X3 3 3 3 3 X+XX  F  XX3X 3 3 3 3 3X     ######### ';
  FP[16]:=' ##########    X+ + + + +3X3X3 T 3X+X3+ + + + +X     ########## ';
  FP[17]:=' ###########    X          X       X          X     ########### ';
  FP[18]:=' ###     ####    X      XXXXXXXXXXXXXXX      X     ###run#for## ';
  FP[19]:=' ### CCC #####    X     X      S      X     X     ####your##### ';
  FP[20]:=' ###     ######    X    X             X    X     #####life!#### ';
  FP[21]:=' ###############    X   X             X   X     ############### ';
  FP[22]:=' ################    X  X   XXXXXXX   X  X     ################ ';
  FP[23]:='33333333333333333  3  X+X + XXXPXXX + X+X  3   33333333333333333';
  Convert_Format;
 end; { Level7 }

procedure Level9;
 begin
  FP[1]:= 'XXXXX+++XX  XXXXXXXX2#XXXXXXXXX3XXXXXXXXXX2XXX XWXXX#######XXXXX';
  FP[2]:= 'XXXX+XXX+XXX XXXXX  X2#XXXXXXX# #XXXXXXX#2#XXXXXX X #+++++#XXXXX';
  FP[3]:= 'XXXX+XXX+XXXX XXXX XX#2#XXXXXX#3#XXXXXX#2#XXX XWXXXX#++T++#XXXXX';
  FP[4]:= 'XXXXX+++XXXXXXX    XXX#2#XXXXX# #XXXXX#2#XXXXXXXXX XD+W+W+#XXXXX';
  FP[5]:= 'XXXXXXXXXXXXXXXXXXXXXXX#2#XXXX#3#XXXX#2#XXXXXXXX XXX#++T++#XXXXX';
  FP[6]:= 'XXXXXXXXXXXXXXXXXXXXXXXX#2#XXX# #XXX#2#XXXXXXXXXXXXX#+++++#XXXXX';
  FP[7]:= 'XXXXXXXXXXXXXXXXXXXXXXXXX#2#XX#3#XX#2#XXXXXXXXCXXXXX#######XXXXX';
  FP[8]:= 'XXXWWWWWWWWWWXXXXXXXXXXXXX#2#X# #X#2#XXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[9]:= 'XXXXXXXXXXXXXXXXXXXXXXXXXXXX       XXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[10]:='XXXXXXXXXXXXXXXXXXXXXXXXXXX# XXXXX #XXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[11]:='############################ XIIIX #############################';
  FP[12]:='L1  +1   1   1   1   1   1   XIPIX  1   1   1   1   1    1+   1L';
  FP[13]:='############################ XIIIX #############################';
  FP[14]:='XXXXXXXXXXXXXXXXXXXXXXXXXXX# XXXXX #XXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[15]:='XXXXXXXXXXXXXXXXXXXXXXXXXXXX       XXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[16]:='XXXXXXXXXXXX##########XXXXXX### ###X XXX   XXXXXXXX   +  XXXXXXX';
  FP[17]:='XXXXXXXXXXXX##sm#was##XXXXXXXX#1#XXX XX XXX XXXX XX XXXXX XX XXX';
  FP[18]:='XXXXXXXXXXXX###here###XXXXXXXX# #XX XX XX I XX+ X X + XXX#X X XX';
  FP[19]:='XXXXXX XXXXX##########XXXXXXXX#1#XXX  XX XXXXX XX XXX XXX  XXX X';
  FP[20]:='XXXXXXXXXXXXXXXXXXXXXXXXXQXXXX# #XXXXXXX+XXXX XX XXX  XXXXXXXXX ';
  FP[21]:='XXXXXXXXXXXXX XXXXXXXXXXXXXXXX#1#XX      XX  XX XXXX XXX  XXXX X';
  FP[22]:='LXXXXXXXXXXXXXXXXXXXXXXXXXXXXX# #XX XXXXXX XXXXX X  XXX XX XXXX ';
  FP[23]:=' CCCCCXXXXXXXXXXXXXXXXXXXXXXXX#1#XXX   +  XXXXXX  XXXXC XXX    X';
  Convert_Format;
 end; { Level9 }

procedure Level11;
 begin
  FP[1]:= '3           3           3+ X +P   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1K';
  FP[2]:= '       3           3       X   ## # # # # # # # # # # # # # # ##';
  FP[3]:= '  3           3          + X   # # # # # # #C# # # #W# # # #+# #';
  FP[4]:= '         3           3     XFFF#################D###############';
  FP[5]:= '    3           3        + X    3  3  3  3  3XX#++++++++++++++++';
  FP[6]:= '           3           3   X                 XX#111111111111111C';
  FP[7]:= '      3           3      + X                 XX#111111111111111L';
  FP[8]:= ' 3           3             X                 XX#############D###';
  FP[9]:= '        3           3    + X          3      XXXXXXXXXXXXXXXXXXX';
  FP[10]:='   3           3           X                                    ';
  FP[11]:='          3           3  + X                                    ';
  FP[12]:='     3           3         X                       RRRRR        ';
  FP[13]:='3           3           3+ X                      RRRRRRRRR     ';
  FP[14]:='       3           3       X         3             RRRRRRTT.    ';
  FP[15]:='  3           3          + X                        RRRRRRRRR   ';
  FP[16]:='         3           3     X                           RRRRR    ';
  FP[17]:='    3           3        + X                                    ';
  FP[18]:='           3           3   X                         3          ';
  FP[19]:='      3           3      + X  3                                 ';
  FP[20]:=' 3           3             X                                    ';
  FP[21]:='        3           3    + X                  XXXXXXXXXXXXXXXXXX';
  FP[22]:='   3           3           X                  XIIIIIIIIIIIIIIIII';
  FP[23]:='          3           3  + X +  3   3   3     XI+ + + +WW+ + + +';
  Convert_Format;
 end; { Level11 }

procedure Level12;
 begin
  FP[1]:= '333          F    .        RRRRRRRRR       .              3 XXX ';
  FP[2]:= '3######D######            RRRRRRRRR     3                   XKX ';
  FP[3]:= '3#3.........3#    3      RRRRRRRRR.           3     .       XXX ';
  FP[4]:= ' #...........# .      .  RRRRRRRRRR       .                  .  ';
  FP[5]:= ' #....+L+....#          RRRRRRRRRRRR   3            .    3      ';
  FP[6]:= ' #3.........3#     .    RRRRRRRRRRRRR           .               ';
  FP[7]:= 'F#############         RRRRRRRRRRRRRRR       3               3  ';
  FP[8]:= '               3      RRRRRRRRRRRRRRRRR.                   .    ';
  FP[9]:= '    .              .RRRRRR########RRRRRRR            ##D##      ';
  FP[10]:='            .    RRRRRR#####  P  .##RRRRRR    .      ##1##      ';
  FP[11]:='   3             RRRRR##           ##RRRRRR          ##1##      ';
  FP[12]:=' .              RRRRR##  2   1  2  3##RRRRRR.  3     ##1##      ';
  FP[13]:='      .        RRRRR## 3  12  3   13 ##RRRRRR    ######I######  ';
  FP[14]:='3             .RRRR##3  23  31 2 3  2##RRRRRR    #+XXXXXXXXX+#  ';
  FP[15]:='         3    RRRRRR##12  3 2 2 3  1##RRRRRR     #XXXWXXXWXXX#  ';
  FP[16]:='              RRRRRRR###XXXXXXXXXXX##RRRRRR    . #XXXXXXXXXXX#  ';
  FP[17]:=' .         .   RRRRRRRR#######K+WT##RRRRRR       #XXXXXWXXXXX#  ';
  FP[18]:='                RRRRRRRRRRRR#######RRRRRR  .     #XXXXXXXXXXX#  ';
  FP[19]:='  3        3       .RRRRRRRRRRRRRRRRRRR         3#XXXXX.XXXXX#  ';
  FP[20]:='       .              RRRRRRRRRRRRRRR.      3    #XXXXXXXXXXX#  ';
  FP[21]:='               .        RRRRRRRRRRRRR         .  #+XXWC.CWXX+#  ';
  FP[22]:=' .          .      3      RRRRRRRRRRRRR    .     ############# +';
  FP[23]:='          3       .        .RRRRRRRRRRRRR                    + .';
  Convert_Format;
 end; { Level12 }

procedure Level14;
 begin
  FP[1]:= 'RRRRRRR.                   K                  .RRRRRRRRRRRRRRRRR';
  FP[2]:= 'RRRR+                                              +RRRRRRRRRRRR';
  FP[3]:= 'RR      2       2       2       2       2       2        RRRRRRR';
  FP[4]:= '.                                                              .';
  FP[5]:= '.                                                               ';
  FP[6]:= 'RRRRRRR+                                                        ';
  FP[7]:= 'RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR+                                .';
  FP[8]:= 'RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR';
  FP[9]:= '.  3                   .RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR';
  FP[10]:='                          RRRRR3 . . . . . . . . . . . . RRRRRRR';
  FP[11]:='                            RRRR. . . . . .K. . . . . . . . . .+';
  FP[12]:='.                           .RRRRR . . . . . . . . . . . . . . .';
  FP[13]:='#########################FFFFFRRRRR . . . . . . . . . . . ......';
  FP[14]:='#C+222222222#3333333333L#      RRRRRR. . . . . . . . .+. . .....';
  FP[15]:='#+2222222222#33333333333#         RRRRRR. . . . . . . . . .....C';
  FP[16]:='#22222222222#33333333333#            RRRRRRR+. . . . . . . .....';
  FP[17]:='#22222222222D33333333333#               RRRRRRR . . . . . ......';
  FP[18]:='#D#######################                  .RRRRR. . . . . . . .';
  FP[19]:='#11111111111D           X                     RRRRR . . . . . . ';
  FP[20]:='#11111111111#           X                      RRRRRRR . . . . .';
  FP[21]:='#+1111111111#S          X                         3RRRRR. . . . ';
  FP[22]:='#C+111111111#          PX                           RRRRRRR. .K.';
  FP[23]:='#########################                             .RRRRRR . ';
  Convert_Format;
 end; { Level14 }

procedure Level16;
 begin
  FP[1]:= '##################+++++++++##   ##########2   2######RRRRRRRRRRR';
  FP[2]:= '###C+TWK.FS+XXXXXX++++W++++# ### ######2    .     #####RRRRRRRRR';
  FP[3]:= '###############2##+++++++++#   ## #     ##2   2###2######RRR####';
  FP[4]:= '####WWW#########2#####D# # ### ### ################ #########W##';
  FP[5]:= '####WWWD  2    ##2#### ## # ## ######   # ##+C+####   WFDXX.XXDL';
  FP[6]:= '####WWW######## ##2###2###2#2# ##### ### # #+C+###33#########+##';
  FP[7]:= '################ ##2## #### ## #### ###### ##D###33########T####';
  FP[8]:= '##WI############# #### ### # ## ## #### # ###C##33##XXXXXX#+####';
  FP[9]:= '#KCIX3 3 3 3 3 3X      ###2## ##22#### # ###.##33##XXXXX#3#2####';
  FP[10]:='##WI##############F###########T###### #######D33##XXXXX##3#2####';
  FP[11]:='################## # ### ### ### ### 3333333333###++C++##3#X####';
  FP[12]:='##########        PI# # # # # # # # ##################### #X####';
  FP[13]:='#####      ########### ### ### ### # #################.......###';
  FP[14]:='#### RRRR ######3####################     2     2     .....WK###';
  FP[15]:='### RRXXRR ####3##                ####################.......###';
  FP[16]:='### RRX XRR ##3### ##############S##############################';
  FP[17]:='## RRXCCCXRR  #### ##             ###+W+K+W+####beware#####  X##';
  FP[18]:='##2RRXCCCXRRR2#### ## ##################.################# ##X##';
  FP[19]:='### RXX XRRR #        ##X#X#X#X#3#3#3#3#3#3#3#3#3#3#3#3#3 ###X##';
  FP[20]:='### RRRXXRR #########F# # # # # # # # # # # # # # # # # # #+#.#+';
  FP[21]:='#### RRRRR+##C 2  2   ## # # # # # # # # # # # # # # # # ##WTKTW';
  FP[22]:='#####+++W############ # # # # # # # # # # # # # # # # # # ######';
  FP[23]:='#####################                                  . . +++KC';
  Convert_Format;
 end; { Level16 }

procedure Level18;
 begin
  FP[1]:= 'L#  2   2  22 ##...  ...##WWWW###X3X3X3X3X3X3X3X3X3X3X3X3X3X3X3C';
  FP[2]:= '+#2 2  22  2 2+F . .. ..##      +3+3+3+3+3+3+3+3+3+3+3+3+3+3+3+3';
  FP[3]:= '+# 2    2 2   ##.+..  ..##    #####################C############';
  FP[4]:= '1# 2 2 2 2  2 ##...... .##    ###++X          2                S';
  FP[5]:= '1#2     2     ##..... ..##    #l#++X                    2      W';
  FP[6]:= '1###########+###....+...##    #e###W############################';
  FP[7]:= '1#            ##.... ...      #v#1               ##            S';
  FP[8]:= 'D#  33333333  ##++..  . ##1111#e#1               ##             ';
  FP[9]:= 'C#            ##++.... .##1111#l#1               WW   1         ';
  FP[10]:='1# ####################################################### #####';
  FP[11]:='1#  I        3               K#o#KXWX+XWX+XWX+XW               W';
  FP[12]:='1##############################f#############################X##';
  FP[13]:='1#S                           ###  1  33  2  1   33 2 1  33 2 1 ';
  FP[14]:='1# XXXXXXXXXXXXXXXXXXXXXXXXXX #p#   1   3    RRRRRRRR  2   2    ';
  FP[15]:='D# X                        X #e# 3  3  RRRRRRRRRRRRRRRR 1   1  ';
  FP[16]:='Q# X XXXXXXXXXXXXXXXXXXXXXX X #r#  3   1  +RRRRRRRRRRRRRRRRR    ';
  FP[17]:='1# X X  W                CX X #i# 1  3   +RRRRRRRRRRRRRRRRW 1   ';
  FP[18]:='1# X X XXXXXXXXXXXXXXXXXXXX X #l#     RRRRRRRRRRRRRRRRR++++ 2 2 ';
  FP[19]:='1# X X                      X ###  1 RRRRRRRRRRRRRRRRRRRR++1   W';
  FP[20]:='1# X XXXXXXXXXXXXXXXXXXXXXXXX ###     RRRRRRRRRRRRRRRRRRRRR   2 ';
  FP[21]:='1# X                          +++         RRRRRRRRRRRRRRRRRRRR  ';
  FP[22]:='D# XXXXXXXXXXXXXXXXXXXXXXXXXXX###    1  1  2 WRRRRRRRRRRRRR 1 2W';
  FP[23]:='..                           P### 2    2    +RRRRRRRRRRRRRRR  WK';
  Convert_Format;
 end; { Level18 }

procedure Level20;
 begin
  FP[1]:= '..LLLL..###+                            +  . .   .   .   .    C ';
  FP[2]:= '..LLLL.. D                 +                   .    .  .   .  . ';
  FP[3]:= '..LLLL..###3 3 3 3 3 3 3                    .    . .     .      ';
  FP[4]:= '#################################  #############################';
  FP[5]:= 'X  XX   X X X##CCCCC  X X X X X X X X X X X X X X X X X X X     ';
  FP[6]:= ' XX   XX X X+##3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#   ';
  FP[7]:= ' XXXXXXX XXXX## 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3   ';
  FP[8]:= 'X XX+XX XX  X#################################################  ';
  FP[9]:= 'X XX+XXX  XX  TD3I                      .         W      ++     ';
  FP[10]:='  ##############################################################';
  FP[11]:='      3     3    ##K                3                 I         ';
  FP[12]:='     3 3   3 3   #############################################  ';
  FP[13]:='    3   3 3   3 3##    3        3    3  33     3    3   3XXXXX  ';
  FP[14]:='   3     3     3 ##  3  3     3   3       3   3    3     #####  ';
  FP[15]:='XX#################3      33     3    3     3     3    3 ##+  3 ';
  FP[16]:='                             3      3      3    3    3  W##     ';
  FP[17]:='   XXXXXXXXXXXX       3  3  3  3   3   3     3   3    3WW##     ';
  FP[18]:='###############  ##########################################     ';
  FP[19]:='Q.X.X.X.X.X.X.X  F                     C     3  3       K##   33';
  FP[20]:='###########################################################  ###';
  FP[21]:=' +##   +##3    +     +##I  ##+   3+##+  ##+    3  +##W  +##3 XX ';
  FP[22]:='P       ##     ##     ##    3      ##   + 3   ##   ##    ##  XX ';
  FP[23]:=' +##    FF    3##+    3    ##+       3  ##   +## 3  +    +     3';
  Convert_Format;
 end; { Level20 }

procedure Level21;
 begin
  FP[1]:= '+ + + + + + + + + + + + + + + + +XXXRRRRRRRRR##K111111111111111C';
  FP[2]:= 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXRRRRRRRRR###111111111111111111';
  FP[3]:= 'XXXXXRRRRRXXXXXXXXXXXXWXXXXXXXXXRRRRRRRR###111111111111111111111';
  FP[4]:= 'XXRRRRRRRRRRRXWXXXXXXXXXXXXXXXRRRRRRRR###11111111111111111111111';
  FP[5]:= 'XXWRRRRRRRRRRRRRXXXXXXXXXXWXRRRRRRRR####1111111111B1111111111111';
  FP[6]:= 'XXRRRRRRRRRRRRXXXXXXXXXXXXRRRRRRRR####11111111111111111111111111';
  FP[7]:= 'XXXRRRRRRRRRRRRXXXXWXXXXXRRRRRRRRRRR###1111111111111111111111111';
  FP[8]:= 'XXXXXRRRRRRRRRRRRXXXXXXXXXCRRRRRRRRRRR###11111111111111111111111';
  FP[9]:= 'XXXXXXXXRRRRRRXXXXXXXXXXXXCRRRRRRRRRRRR###1111111111111111111111';
  FP[10]:='XXXXXXXXXXXXXXXXXXXXXX###########################XXXXXXXXXXXXXXX';
  FP[11]:='P      F               FI  .  I  .  I  .  I  . I               W';
  FP[12]:='X XXXXXXXXXXXXXXXXXXXX###########################XXXXXXXXXXXXXXX';
  FP[13]:='XFXXXXXXXXXX   F     XXXXXXXXXXXRRRRRRRRRRRRR###1111111111111111';
  FP[14]:='X XX   F   X XXXXXXX        XXXXXRRRRRRRRRRR###11111111111111111';
  FP[15]:='X XX XXXXX X XXXXXXXXXXXXXX   +XRRRRRRRRRRRRR###1111111111111111';
  FP[16]:='X    XXXXX X    +XXXXX      XXXRRRRRRRRRRRR###111111111111111111';
  FP[17]:='XXXXXXXXXX X XXXXXXXXX XXXXXXRRRRRRRRRRRR###11111111111111111111';
  FP[18]:='XXXXXXX+   X XXXX      XXXRRRRRRRRRRRRR###1111111111111111111111';
  FP[19]:='XX    XXXX   XXXX XXXXXRRRRRRRRRRRRR####111111111111111111#####X';
  FP[20]:='XX XX XXXXXXXXXXX XXXRRRRRRRRRRR######11111111111B11111111X+++++';
  FP[21]:='   XX             XRRRRRRRRRR#####111111111111111111111111#+++++';
  FP[22]:=' ################RRRRRRRRRR####111111111111111111111111111#+++++';
  FP[23]:='  1  1  1  1  CRRRRRRRRR#####LD111111111111111111111111111#+++++';
  Convert_Format;
 end; { Level21 }


procedure Level23;
 begin
  FP[1]:= 'W   2     K   +      VVV#XC  2        #VVVV2 + XVV+             ';
  FP[2]:= '  VVVVV#            2#VVVVVVV   T     VVVV     VVVVW       K## +';
  FP[3]:= ' +#VVVVV#      #VV   VVVVVV      VV#           WVVVV#2     ###  ';
  FP[4]:= ' VVVVV#  2    VVVVV    #VVV +    VVVV2  #VVV2  VVVVVVV   2VV##  ';
  FP[5]:= '      +       V+VVVV  W    VVV#   #V   VVVVV#     XX   #VVVV##2 ';
  FP[6]:= '          2    VVVW2     2VVVVVV  2 +  +VVVVVV#2#VVV  +VVVVV##  ';
  FP[7]:= '  ############################################################+ ';
  FP[8]:= '      XXXXXXXXX  ++++  XXXXXXXX T K T XXXXXXXXX  C  XXXXWWWW##  ';
  FP[9]:= 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX##  ';
  FP[10]:=' 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 IIIII## 2';
  FP[11]:='2222222222222222222222222222222222222222222222222222222IIIII##  ';
  FP[12]:='#############################D################################  ';
  FP[13]:='S2  2  2  2  2###+2222222K###   2               2           ## +';
  FP[14]:='              ###222222222### VVVV      2           VVVVVV  ##  ';
  FP[15]:='              ###2222222222DF  VVVVVVVVVVVVVV2  +VVVVVVVVVV ##  ';
  FP[16]:='              ###222222222### VVVVVVVVVVVVVVVVVVVVVVVVVVVV  ##2 ';
  FP[17]:='              ###2222B2222###  VVVVVVVVVVVVVVVVVVVVVVVVVV   ##  ';
  FP[18]:='              ###222222222###    .VVVVVVVVVVVVVVVVVVVVVVVVV ##+ ';
  FP[19]:='               D2222222222###  2VVVVVVVVVVcarefulVVVVVVVVVVV##  ';
  FP[20]:='              ###222222222### 2  VVVVVVVVVVVVVVVVVVVVVVVV+++## 2';
  FP[21]:='P            K###C2222222+###      TVVVVVVVVVVVVVVVVVVVKC+++##  ';
  FP[22]:='##############################################################  ';
  FP[23]:='LLD+D      2++++        .  2+++             2++             ID +';
  Convert_Format;
 end; { Level23 }

procedure Level25;
 begin
  FP[1]:= 'CCWXXVVVV11111111111111111RRRRRRRT                             P';
  FP[2]:= 'CCTXVVVVVV1111111111111111111RRRRRRR          3VVV3             ';
  FP[3]:= 'WTVVVVVV1                  1RRRRRRRT          3VVVVV3           ';
  FP[4]:= 'XXVVVVVVV1    3RRRR          1RRRRRRRR          3VVVVV3         ';
  FP[5]:= 'XXVVVVV1    3RRRRR3      3     1RRRRRRRRRW     3VVVVV3          ';
  FP[6]:= 'VVVVV1      RRRRRRRRR3            1RRRRRRRRRRW   3VVV3          ';
  FP[7]:= 'VVV1          3RRRRRRRRR3    3       1RRRRRRRRRR                ';
  FP[8]:= 'V1      3      3RRRRRRRRRRR         1RRRRRRRRRRRRR33333333333333';
  FP[9]:= '1                   3RRRRR3             1RRRRRRRRRRRR33333333333';
  FP[10]:='1                  RRRR3            3      1RRRRRRRRRR3333333333';
  FP[11]:='1   3                                          1RRRRRRRRRR333333';
  FP[12]:='1              #############D#############         1RRRRRRRRR333';
  FP[13]:='1              #B K  F  B  XKX  B  F  K B#            1RRRRRRRRK';
  FP[14]:='1          3   ###########################      3        1RRRRRR';
  FP[15]:='11                                                           1RR';
  FP[16]:='111                         3                                  1';
  FP[17]:='1111             3                                     3      11';
  FP[18]:='11111    3                             3                     111';
  FP[19]:='111111                                                      1111';
  FP[20]:='1111111111111111111111111111111111111111111111111111111111111111';
  FP[21]:='1111111111111111111111111111111111111111111111111111111111111111';
  FP[22]:='111111111111111111111111111111111111111111111111111111111#######';
  FP[23]:='+ . + . + . + . + . + . + . + . + . + . + . + . + . + . +DWD+DLL';
  Convert_Format;
 end; { Level25 }

procedure Level27;
 begin
  FP[1]:= 'IDK3 3 3 3 VK3 3 3 3 VK3 3 3 3 VK3 3 3 3 VK3 3 3 3 VK3 3 3 3 D  ';
  FP[2]:= 'F#3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V  ';
  FP[3]:= 'F# 3 3 3 3 D 3 3 3 3 V 3 3 3 3 V 3 3 3 3 V 3 3 3 3 V 3 3 3 3 V  ';
  FP[4]:= 'F#3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V  ';
  FP[5]:= 'F# 3 3B3 3 V 3 3B3 3 D 3 3B3 3 V 3 3B3 3 V 3 3B3 3 V 3 3B3 3 V  ';
  FP[6]:= 'F#3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V  ';
  FP[7]:= 'W# 3 3 3 3 V 3 3 3 3 V 3 3 3 3 D 3 3 3 3 V 3 3 3 3 V 3 3 3 3 V  ';
  FP[8]:= 'W#3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3V3 3 3 3 3D3 3 3 3 3V  ';
  FP[9]:= '+# 3 3 3 3 V 3 3 3 3 V 3 3 3 3 V 3 3 3 3 D 3 3 3 3 V 3 3 3 3 V  ';
  FP[10]:='+#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVDD';
  FP[11]:='+3##KK  3   3    3   XF V V V V VVV   VVVV                      ';
  FP[12]:='+#3##C 3 3      3    VVV V V V V VV V VVVV  VVVVVVVVVVVVVVVVVV  ';
  FP[13]:='+##3## 3  3  3     3 VVVVVVVVVVVV V V VVVV    3      3     3WV  ';
  FP[14]:='+3##3##    3    3    VVV    .  +  V V   VV      3      3    +V  ';
  FP[15]:='+#3##3## 3  3     3  VV VVVVVVVVVVV VVV VV  3  3    3       +V  ';
  FP[16]:='+##3##3##     3      V VVVVV    VVV V   VV                3 +V  ';
  FP[17]:='+3##3##3## 3   3 3   V V  VV VV  VV V VVVV   3   3    3     +V  ';
  FP[18]:='+#3##3##3##  3     3 V  V VV +VV  V V VV           3     3  +V  ';
  FP[19]:='+##3##3##3##3   3    V+VV    +VVV   V    V 3      3     3   WV  ';
  FP[20]:='+#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV  ';
  FP[21]:='+#   + 3   3   3  +    3     + 3 +  3 +3      3 +      + 3   3  ';
  FP[22]:='+#      + 3  +   +  3+   3+   3    +3    3 +   3 +  3 +   +     ';
  FP[23]:='L#P     3   +   3    3+    3  +  3   +      3 +    3     3  +   ';
  Convert_Format;
 end; { Level27 }

procedure Level29;
 begin
  FP[1]:= 'P W W W W W W W W W W W W W W W W W W W W W W W W W W W W W W#LL';
  FP[2]:= '/////////////////////////////////////////////////////////////#DD';
  FP[3]:= '/////////////////1/////////\\///////////1//////////////////\\#I1';
  FP[4]:= '//////////////////////////\\\\\/////////////////////////\\\\\#I1';
  FP[5]:= '//////\\\//////1////////\\\\\\///////////////1///////\\\\\\\\#1I';
  FP[6]:= '///\\\\\\\///////////////\\\\\\\///////////////////\\\\\\\\\\#I1';
  FP[7]:= '//\\\\\\\\\\///////////////\\\//////////////////\\\\\\\\\\\\\#I1';
  FP[8]:= '////\\\\\\////1///////////////////////////////\\\\\\\\\\\\\\\#1I';
  FP[9]:= '/////////////////////////////////RRR///////\\\\\\1\\\\\\\\\\\#1I';
  FP[10]:='///////#X#/////////////////////RRRRRRRR//\\\\\\\\\\\\\\\\\\\\#I1';
  FP[11]:='///////#+#///////////////////RRRRRRRRRRR\\\1\\\\\\\\\\\\\\\\\#I1';
  FP[12]:='///////#+#//////1//////////RRRRRRRRRRRR\\\\\\\\\\\\\\\\\\\\\\#1I';
  FP[13]:='///////#C#////////////////RRRRRRRRRR+X\\\\\\\\\\\#####\\\\\\\#I1';
  FP[14]:='///////#+#//////////////RRRRRRRRRK+++X\\1\\\\\\\\#CCC#\\\\\\\#I1';
  FP[15]:='///////#+#///////////\\\\RRRRRWWW++++X\\\\\\\\\\\#CCC#\\\\\\\#1I';
  FP[16]:='///////#X#//////\\\\\\\\\\\RRXXXXXXXXX\\\\\\\\1\\##D##\\\\\\\#I1';
  FP[17]:='////////\\\\\\1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\111\\\\\\\\#I1';
  FP[18]:='///\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\1\\\\\\\\\\\\\\\\\\\#I1';
  FP[19]:='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#1I';
  FP[20]:='\\\\\\\\\\\\\\\\\1\\\\\\\\\\\\\\\\\\\\\\\\\\1\\\\\\\\\\\\\\\\#1I';
  FP[21]:='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#II';
  FP[22]:=' 1 1   1 1   1    1 1   1   1   1   1 1    1 1   1  1  1  1 1 II';
  FP[23]:='K    1  1    1 1 11    1 1   1    1  11   1    1  1  11 1   1 IS';
  Convert_Format;
 end; { Level29 }

procedure Level31;
 begin
  FP[1]:= 'K 3 + 3 3+3  3 3+ 3  # 3  +3  +3 3 + 3 3 +3 3 +3  3VVVXXV3.3.3DL';
  FP[2]:= '3   3  3   3  3 3  3 #  3 3   3 3   3  3  3  3  3 VVVVXVVV33.3##';
  FP[3]:= '3 3   3  3  3   3  3 # 3   3  3  3  3   3  3   3 3 KVVVVVVVVD###';
  FP[4]:= ' 3  3    3 ///3   3  # 3     3 ==  3   3==W===   3VVXXVVVVV3.33.';
  FP[5]:= '3  3 3  3 //////3   3#3  3  3 === 3   3  ====  3 VVVVXXVV33.3.33';
  FP[6]:= ' 3  3  3///\\\/// 3  #  3 3  =====    ======3 3  3VVVVVVVV3.....';
  FP[7]:= '3  3  ///\\\\\\//  3 #3  3 ======== ======3  3  3VVVVVVVVVV3..3.';
  FP[8]:= '3 3  3////\C\\////  3# 3 ========++++=======3  3  VVVVVXVV3.....';
  FP[9]:= ' 3  3////\\C\\///33  #  3  ======++++======3  3  VVVVVXXVV3....3';
  FP[10]:='3 3/////\\\C\\\///  3#3   3 3=====++===== 3 3  3VVVVVVXVV3......';
  FP[11]:=' 3 3//////\\\///3 3  # 3 3 3  +=========== 3  3VVVVVVVVVV3...3..';
  FP[12]:='3 3  3///\\/// 3   3 #3  3   ======== 3 === 3  3VVVXVVVVVV3.....';
  FP[13]:=' 3 3  3///// 3  3  3 #3 3  3  3== 3  3 3  3 3  3+VVXXVVVVVV3..3.';
  FP[14]:='.....................#..........................VVXVVVVVXXVV3...';
  FP[15]:='###############################################VVVVXVVVXQXVV3..3';
  FP[16]:='............#......................#...........##VVVVVVVVVVV##..';
  FP[17]:='3 3   3  3  # 3 3  3 +RRRR+ 3  3   #3   33  3  ###############..';
  FP[18]:=' 3 3 3  3  3#3  3 3 +RRRRRRR+ 3  3 #  3   3   3F X W XD CCC3F...';
  FP[19]:='3 3  33   3 # 3  3  RRRRRRRRRRR3  3# 3  3 3  3 ###############3.';
  FP[20]:=' 3 3  3 33 3# 3   3  +RRRRRRRR3 3  #3  3  3 33 ##VVVXVVVVVVV##D#';
  FP[21]:='3 3 3  3  3 #3  3  3  3+RRRR3  3 3 #  3 3  3P3  VVVXVVVXVVVV3..3';
  FP[22]:=' 3  3 3 3  3# 3   3 3  3 3   3  3 3# 3   3 33  VVVVVVVVXXVVVV33+';
  FP[23]:='K3+3 +3 +3 +#+ 3+3 + 3  3+ 3  + 3 +#+  3+  3+ VVAVVVVVVVXVVVVVWC';
  Convert_Format;
 end; { Level31 }

procedure Level33;
 begin
  FP[1]:= 'K##########B1111111111111111111111111111111111111111B\\\\\\\\\\K';
  FP[2]:= ' #circle##11111111111111111111111111111111111111111111\\\\\\\\\ ';
  FP[3]:= '+#of#####11111111              B               11111111\\\\\\\\+';
  FP[4]:= ' #fate##11111111   RRRRRRRRRRRRRRRRRRRRRRRRRR   11111111\\\\\\\ ';
  FP[5]:= '+######11111111   RRRRRRRRRRRRRRRRRRRRRRRRRRRR   11111111\\\\\\+';
  FP[6]:= ' #####11111111   RRR###########L############RRR   11111111\\\\\ ';
  FP[7]:= '+####11111111   RRR#VV#1111111#D#11111111#VV#RRR   11111111\\\\+';
  FP[8]:= ' ###11111111   RRR#V1Q#111111111111111111#Q1V#RRR   11111111\\\ ';
  FP[9]:= '+##11111111   RRR#VVVVDVVVVVVVVDVVVVVVVVVDVVVV#RRR   11111111\\+';
  FP[10]:=' #111111111   RRR#++VV11++11++111++111++11VV++#RRR   111111111\ ';
  FP[11]:=' 11111==111   RRR#++VVVVVVVVVVVDVVVVVVVVVVVV++#RRR   111==11111 ';
  FP[12]:=' 1111====11  TRRR#C+XX11++11++111++111++11XX+C#RRRT  11====1111 ';
  FP[13]:=' 11111==111   RRR#++VVVVVVVVVVVVVVVVVVVVVVVV++#RRR   111==11111 ';
  FP[14]:=' =111111111   RRR#++XD++111111XPX1111111++DX++#RRR   111111111V ';
  FP[15]:='+==11111111   RRR#VVVVVVVVVVVVVDVVVVVVVVVVVVVV#RRR   11111111VV+';
  FP[16]:=' ===11111111   RRR#VV+11111111111111111111+VV#RRR   11111111VVV ';
  FP[17]:='+====11111111   RRR#KV11111111111111111111VK#RRR   11111111VVVV+';
  FP[18]:=' =====11111111   RRR###########T############RRR   11111111VVVVV ';
  FP[19]:='+======11111111   RRRRRRRRRRRR#+#RRRRRRRRRRRRR   11111111VVVVVV+';
  FP[20]:=' =======11111111   RRRRRRRRR###S###RRRRRRRRRR   11111111VVVVVVV ';
  FP[21]:='+========11111111                              11111111VVVVVVVV+';
  FP[22]:=' =========11111111111111111111111111111111111111111111VVVVVVVVV ';
  FP[23]:='K==========B1111111111111111111111111111111111111111BVVVVVVVVVVK';
  Convert_Format;
 end; { Level33 }

procedure Level35;
 begin
  FP[1]:= '2222222RK   .2 2  2 == 2      2     ==   22    /XXXXXQ#C#C#C#2D+';
  FP[2]:= '2222222R#########  ====2VV 2    VV ====2VV    2VVVVVVV#D#D#D#C#W';
  FP[3]:= '2222222RK/\/\/\WV  2== VVVV == VVVV == VVVV2==  2  2  2   2 #I#T';
  FP[4]:= '222P222R#########    2 2VV ====2VV  2   VV ====   2         DF#K';
  FP[5]:= '2222222RLDDDDDDDD2  2    2  ==     2        ==2  2   2     2#C##';
  FP[6]:= '2222222R##########################VVVVVVVVVVVVVVVVVVVVVVFVVVVVVV';
  FP[7]:= '222222KRC+   +   +  B  +   +   + #V+ ===  ====     =====  ==   V';
  FP[8]:= '   RRRRRRRRRRRRRRRRRRRRRRRRRRRR//#V =   == == =====    == = == V';
  FP[9]:= '   R2222222222222222222222222KR//#V ======= = ==K ===== == == =V';
  FP[10]:='   R22                      22R//#V ===   = ==   =    == === ==V';
  FP[11]:='   R22                      22R/2#V= == == =========== == === =V';
  FP[12]:='   R22                      22R//#V== = ====  ==  =  = = == == V';
  FP[13]:='   R22          \\\         22R//#V  ==     ==  == ==  ==  =  +V';
  FP[14]:='   R22          \C\         22R//#V VVVVVVVVVVVVVVVVVVVVVVVVVVVV';
  FP[15]:='   R22222       \\\         22R//#2 2 2 2B2 2 2 2 2 2 2 2 /222\K';
  FP[16]:='   R ===22                  22R//# 2 2 2 2 2 2 2 2 2 2 2 2/222\2';
  FP[17]:='   R +====22                22R2/#2 2 2 2 2 2 2 2 2 2 2 2 /222\2';
  FP[18]:='   R ======22               22R//# 2 2 2 2 2 2 2 2 2 2 2 2/222\2';
  FP[19]:='   R=K======222222222222222222R//#2 2 2 2 2 2 2 2 2 2 2 2 //////';
  FP[20]:=' C RRRRRRRRRRRRRRRRRRRRRRRRR  R//# 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2';
  FP[21]:='   R22222222222222222222222R  R/K#2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 ';
  FP[22]:='   R+++++++++++++++++++++++R  RXX# 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2';
  FP[23]:='222                                                           B ';
  Convert_Format;
 end; { Level35 }

procedure Level37;
 begin
  FP[1]:= '            W+T           XXXXXXXXX           T+W            D  ';
  FP[2]:= '                          XXXXBXXXX                          #  ';
  FP[3]:= '22############################X############################22#1+';
  FP[4]:= '22#22222222222X2X2X2X2X22/C###X###C/22X2X2X2X2X22222222222#22#  ';
  FP[5]:= '22#22#\/\#222#################X#################222#\/\#22#22# 1';
  FP[6]:= 'WW#22# B #222#            XXXXXXXXX            #222# B #22#WW#  ';
  FP[7]:= 'WW#22#   #222#    #########################    #222#   #22#WW#1 ';
  FP[8]:= 'WW#22#   #222#   2#K2222222222222222222222#2   #222#   #22#WW#  ';
  FP[9]:= '  #22# 2 #222#  22#22222222222222222222222#22  #222# 2 #22#  # 1';
  FP[10]:='  #  #   #+++#  22#22222222#######22222222#22  #+++#   #  #  #  ';
  FP[11]:='  #  # 2 #+++#  22#22222222##+K+##22222222#22  #+++# 2 #  #  #1+';
  FP[12]:='  #  #   #+++#  22V22B222222D+P+D222222B22V22  #+++#   #  #  #  ';
  FP[13]:='  #  # 2 #+++#  22#22222222##+++##22222222#22  #+++# 2 #  #  # 1';
  FP[14]:='  #  #   #   #  22#22222222#######22222222#22  #   #   #  #  #  ';
  FP[15]:='  #  # 2 #   #  22#22222222222222222222222#22  #   # 2 #  #  #1 ';
  FP[16]:='  #  #   #   #   2#2222222222222222222222C#2   #   #   #  #  #  ';
  FP[17]:='  #  #   # S #    ############D############    # S #   #  #  # 1';
  FP[18]:='  #  #   #   #             DK# #KD             #   #   #  #  #1+';
  FP[19]:='  #  #   #   ################# #################   #   #  #  #DD';
  FP[20]:='  #  #XXX#      ====   =         ==   ===    =     #XXX#  #  #DD';
  FP[21]:='  #  #       ==      =   ====VVV    =     ==   =       #  #  #LL';
  FP[22]:='  #  ########################VBV########################  #  #  ';
  FP[23]:='                  222222XXXXXXKXXXXXX222222                  #CC';
  Convert_Format;
 end; { Level37 }

procedure Level39;
 begin
  FP[1]:= 'C++RRR.2.2\  W   3   W   KD     W  B#///333333333333333\KK#     ';
  FP[2]:= '++RRRR2.2.#################X#########///333333333333333\\\#XX#3 ';
  FP[3]:= '+RRRR2.2.2#333333333333333#X#C\\\///////333333333333333333#VI#  ';
  FP[4]:= '+##R2.2.2.#333/////////333#X#\\\\///////333333333333333333#IV# 3';
  FP[5]:= '#+#2.2.2.2#333/C3223/K/333#X#\\\\///////333333333333333333#VI#  ';
  FP[6]:= '##2.2.2.2.#333/32332///333#.#XXXXXXXXXX/333333333333333333# V#3 ';
  FP[7]:= 'RR.2.2.2.2#333/22322///333#X#XXXXXXXXXX/333333333333333333#V2#  ';
  FP[8]:= 'R.2.2.2.2.#333/332B332/333#X#XXXXXXXXXX/333333333333333333# V# 3';
  FP[9]:= '+2.2.2.2.2#333/3233232/333#X#XXXXXXXXXX/################### V#  ';
  FP[10]:='++2.2.2.2.#333/3223322/333#X#XXXXXXXXXX/#K3..+.+.+===B....#VK#3 ';
  FP[11]:='+++2.2.2.2\333/2323233/333\XXXXXXXXXXXX/#####....====.....# V#  ';
  FP[12]:='##################\######################C/B#.....====....#VC# 3';
  FP[13]:='X222222222222222222222222222222222222222#//##....====.....# V#P ';
  FP[14]:='X==+++++++++====+++++++++++++++====+++++#22##.....==......#V #  ';
  FP[15]:='K===XXXXX=========XXXXXXX==XX========## #22##.............#V #DV';
  FP[16]:='======================================# #DD############## #2V#VD';
  FP[17]:='2 +=========  2  ============== 2 2==##S# 2#QXXXXXXX#W33  #V #VD';
  FP[18]:=' 2    2 ===C2===   +=====+ 2    ==   2    +########X##### # V#DV';
  FP[19]:='+B===    ======== 2   2===    ====+ ===  =====   ##X#W33  #V+#VD';
  FP[20]:='====+  2   ============   ==+2 ====  =2 2 =====  ##X##### # V#DV';
  FP[21]:='=K=====  2   +=====2   2 ====  +==     == 2  +2  ##X#W33  #V #DV';
  FP[22]:='   2====   ==    2   =   W==  =====  ==== =====  ##X##### #XX#VD';
  FP[23]:=' 2  2  2  =====+    === 2   2    2   +==2  +==            F  #LL';
  Convert_Format;
 end; { Level39 }

procedure Level40;
 begin
  FP[1]:= 'K++//33X33X33X33X33X33X33X33X+XFX+X33X33X33X33X33X33X33X333//++K';
  FP[2]:= '+B//333X33X33X33X33X33X33X33XSXPXSX33X33X33X33X33X33X33X3333//B+';
  FP[3]:= '+//3333XXXXXX==============VVVVDVVVV==============XXXXXX33333//+';
  FP[4]:= '//33==3333333D33X33X33X33/CVV.....VVC/33X33X33X33D3333333==333//';
  FP[5]:= '/33====3333//RRRRRRRRRRRRRRRRD#D#DRRRRRRRRRRRRRRRR//3333====333/';
  FP[6]:= '333====3333VCRRRCVVV2222222222#B#1111111111VVVCRRRCV3333====3333';
  FP[7]:= '3333==33333VVRRCVVV22222222222###11111111111VVVCRRVV33333==33333';
  FP[8]:= '333333333333VRRVVV2222###################1111VVVRRV3333333333333';
  FP[9]:= '3333333333333RRVV22222#s#///3//+//3///###11111VVRR33333333333333';
  FP[10]:='3333333333333RRV222222#a#3/RRRRDRRRR/3#t#111111VRR33333333333333';
  FP[11]:='\\33XXX333VVDRR2222222#c#//RRRVVVRRR//#e#1111111RRDVV333XXX333//';
  FP[12]:='C\33XBX333V+KVD222B222#r#DDRRRVAVRRRDD#m#111B111DVK+V333XBX333/C';
  FP[13]:='\\33XXX333V+KRR2222222#e#//RRRVVVRRR//#p#1111111RRK+V333XXX333//';
  FP[14]:='3333333333VV+RRV222222#d#W/RRRRRRRRR/+#l#111111VRR+VV33333333333';
  FP[15]:='33333333333VVRRVV22222###///W/DWD/+///#e#11111VVRRVV333333333333';
  FP[16]:='333333333333VRRVVV2222#########D#########1111VVVRRV3333333333333';
  FP[17]:='3333==3333333RRCVVV222222222\K#D#K\111111111VVVCRR3333333==33333';
  FP[18]:='333====333333RRRCVVV22222222\K#D#K\11111111VVVCRRR333333====3333';
  FP[19]:='/33====333333RRRRRRRRRRRRRRRRRRDRRRRRRRRRRRRRRRRRR333333====333/';
  FP[20]:='//33==33333333333333333BXXXXXXXSXXXXXXXB33333333333333333==333//';
  FP[21]:='+//33333333333333333333XXXXXXX+++XXXXXXX333333333333333333333//+';
  FP[22]:='+B//333333333333333333XXXXXXX+++++XXXXXXX3333333333333333333//B+';
  FP[23]:='K++//3333333333333333XXXXXXX+++++++XXXXXXX33333333333333333//++K';
  Convert_Format;
 end; { Level40 }

BEGIN
END. { Level Layouts }

