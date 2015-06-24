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
procedure Define_Levels;
 begin
{ Object:  1  2  3  B  W  L  C  S  +  I  T  K  D  #  F  .  R  Q  /  \  B  V  =  A  U  Z  *  E  ;  :  `  -  @}
{ Fields:  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3}
DF[1]:= '*';
DF[2]:= '160 20    20 25  2  1    65     5       20    20                                                   ';
DF[3]:= '*';
DF[4]:= '   320           4       57 50                                                                     ';
DF[5]:= '*';
DF[6]:= '         999 30  2  1    30  2  2              2                                     35            ';
DF[7]:= '*';
DF[8]:= '        1    10  1  1    10400  1            999                                                   ';
DF[9]:= '*';
DF[10]:='   600        5  1  1    55     5       25                                                   700   ';
DF[11]:='*';
DF[12]:='      750        2  2  2110     1              5                                                350';
DF[13]:='*';
DF[14]:='150150130999  5  1  1     8     2                                                                  ';
DF[15]:='*';
DF[16]:='   170    50     3  1    20 75  2       50    25               650        3    10             50 50';
DF[17]:='*';
{ Object:  1  2  3  B  W  L  C  S  +  I  T  K  D  #  F  .  R  Q  /  \  B  V  =  A  U  Z  *  E  ;  :  `  -  @}
{ Fields:  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3}
DF[18]:='300 50 50     5  2  3  1 30 25  1   678        5              1           2  1                     ';
DF[19]:='*';
DF[20]:='   250  5     5  2  1  1  5 20              1         100     5   450     4  1 20  2 10         420';
DF[21]:='*';
DF[22]:='175150125     5  1  1    20                    1      450450 12                20                  ';
DF[23]:='*';
DF[24]:='      950     5  1 10  2        1          20                 5          20   120    20         250';
DF[25]:='*';
 end; { Define_Levels }

procedure Convert_Format;
  var XLoop,
      YLoop  : integer;
 begin
  SNum:=Null; MNum:=Null; FNum:=Null;
  for x:=1 to 999 do
   begin                        {* reset monster's X, Y *}
    SX[x]:=0;SY[x]:=0;
    MX[x]:=0;MY[x]:=0;
    FX[x]:=0;FY[x]:=0;
   end;
  New_Gem_Color;
  for YLoop:=1 to YSize do
   for XLoop:=1 to XSize do
    case copy(FP[YLoop],XLoop,1) of
     ' ':PF[XLoop+1,YLoop+1]:=Null;
     '1':begin
          SNum:=SNum+1;SX[SNum]:=XLoop+1;SY[SNum]:=YLoop+1;
          PF[XLoop+1,YLoop+1]:=1;
         end;
     '2':begin
          MNum:=MNum+1;MX[MNum]:=XLoop+1;MY[MNum]:=YLoop+1;
          PF[XLoop+1,YLoop+1]:=2;
         end;
     '3':begin
          FNum:=FNum+1;FX[FNum]:=XLoop+1;FY[FNum]:=YLoop+1;
          PF[XLoop+1,YLoop+1]:=3;
         end;
     'X':PF[XLoop+1,YLoop+1]:=4;
     'W':PF[XLoop+1,YLoop+1]:=5;
     'L':PF[XLoop+1,YLoop+1]:=6;
     'C':PF[XLoop+1,YLoop+1]:=7;
     'S':PF[XLoop+1,YLoop+1]:=8;
     '+':PF[XLoop+1,YLoop+1]:=9;
     'I':PF[XLoop+1,YLoop+1]:=10;
     'T':PF[XLoop+1,YLoop+1]:=11;
     'K':PF[XLoop+1,YLoop+1]:=12;
     'D':PF[XLoop+1,YLoop+1]:=13;
     '#':PF[XLoop+1,YLoop+1]:=14;
     'F':PF[XLoop+1,YLoop+1]:=15;
     '.':PF[XLoop+1,YLoop+1]:=16;
     'R':PF[XLoop+1,YLoop+1]:=17;
     'Q':PF[XLoop+1,YLoop+1]:=18;
     '/':PF[XLoop+1,YLoop+1]:=19;
     '\':PF[XLoop+1,YLoop+1]:=20;
     'B':PF[XLoop+1,YLoop+1]:=21;
     'V':PF[XLoop+1,YLoop+1]:=22;
     '=':PF[XLoop+1,YLoop+1]:=23;
     'A':PF[XLoop+1,YLoop+1]:=24;
     'U':PF[XLoop+1,YLoop+1]:=25;
     'Z':PF[XLoop+1,YLoop+1]:=26;
     '*':PF[XLoop+1,YLoop+1]:=27;
     'E':PF[XLoop+1,YLoop+1]:=28;
     ';':PF[XLoop+1,YLoop+1]:=29;
     ':':PF[XLoop+1,YLoop+1]:=30;
     '`':PF[XLoop+1,YLoop+1]:=31;
     '-':PF[XLoop+1,YLoop+1]:=32;
     '@':PF[XLoop+1,YLoop+1]:=33;
     'P':begin PF[XLoop+1,YLoop+1]:=40;PX:=XLoop+1;PY:=YLoop+1;end
     else PF[XLoop+1,YLoop+1]:=ord(copy(FP[YLoop],XLoop,1))
    end;
 end; { Convert_Format }

overlay procedure Level1;
 begin
  FP[1]:= 'W W W W             2 2 2 2 2  C  2 2 2 2 2              W W W W';
  FP[2]:= 'XXXXXXXXXXXXXXXXXXX###########   ###########XXXXXXXXXXXXXXXXXXXX';
  FP[3]:= ' 1           1                               1                  ';
  FP[4]:= '                                    1            XX         1   ';
  FP[5]:= '       1            1                           XXXX            ';
  FP[6]:= '#        XX                    +                 XX            #';
  FP[7]:= '##      XXXX  1                +          1          1        ##';
  FP[8]:= 'T##      XX               2    +    2                        ##T';
  FP[9]:= 'T1##                       W   +   W                        ##1T';
  FP[10]:='T########X                 WX     XW             1    X########T';
  FP[11]:='.        X                2WX  P  XW2                 X        .';
  FP[12]:='T########X         1       WX     XW                  X########T';
  FP[13]:='T1##                       W   +   W         1              ##1T';
  FP[14]:='T##                       2    +    2                        ##T';
  FP[15]:='##   1                         +                      XX      ##';
  FP[16]:='#       XX      1              +                 1   XXXX     1#';
  FP[17]:='       XXXX                 ##   ##                   XX        ';
  FP[18]:='1       XX                 ##     ##     1        1           1 ';
  FP[19]:='                    1#######       ########                     ';
  FP[20]:='    1         ########11111  +++++  111111########              ';
  FP[21]:='WW     ########+++++        #######         WWWWW########1    WW';
  FP[22]:='########                     2 2 2                      ########';
  FP[23]:='L2  +  X                                                X  +  2L';
  Convert_Format;
 end; { Level1 }

overlay procedure Level3;
 begin
  FP[1]:= '                                                            .   ';
  FP[2]:= '  2#############################K############################   ';
  FP[3]:= '   ##   2    2   2 2    2   2  ###  2  2   2    2    2    2##   ';
  FP[4]:= '  2##+#2   2   2    2  2 2   2  2 2  2   2 2   2   2    2  ##   ';
  FP[5]:= '   ##+#   2  2    2   2   2   2    2    2  2    2    2   2 ##   ';
  FP[6]:= '  2##+# 2    2  2   2  2 2 2 2  2 2  2 2 2   2    2   2   2##   ';
  FP[7]:= '   ##+#2   2  2   2                            2   2   2   ## W ';
  FP[8]:= '  2##+#  2   2   2   XXXXXXXXXXXXXXXXXXXXXXX  2    2  2   2##@@@';
  FP[9]:= '   ##+#2   2  2   2  XXXXXXXXXXXXXXXXXXXXXXX    2   2  2   ##   ';
  FP[10]:='  2##+# 2   2  2 2   XXXXXXXXXXXXXXXXXXXXXXX   2  2   2  2 ##   ';
  FP[11]:='   ##+#   2 2 2   2  XXXXXX    -+-    XXXXXX  2 2    2  2  ##   ';
  FP[12]:='  2##+#2   2   2 2   XXXXXX1   -P-   1XXXXXX  2  2 2   2 2 ##   ';
  FP[13]:='   ##+#  2  2  2  2  XXXXXX    -+-    XXXXXX   2  2 2     2##   ';
  FP[14]:='  2##+# 2 2  2  2    XXXXXXXXXXXXXXXXXXXXXXX  2   2   2 2  ##   ';
  FP[15]:='   ##+#2 2    2   2  XXXXXXXXXXXXXXXXXXXXXXX    2  2   2 2 ##   ';
  FP[16]:='  2##+# 2  2  2  2   XXXXXXXXXXXXXXXXXXXXXXX   2    2 2 2  ##   ';
  FP[17]:='   ##+#  2  2 2   2                           2  2   2   2 ##   ';
  FP[18]:='  2##+#2   2    2   2 2  2  2  2 2  2 2  2  2   2   2  2  2##   ';
  FP[19]:='   ##+# 2    2  2  2 2  2   2   2   2  2  2    2    2   2  ##   ';
  FP[20]:='  2##3#   2   2   2   2   2   2   2   2 2    2    2   2   2##@@@';
  FP[21]:='   ##T#2   2     2  2  2 2   2 ###   2   2 2  2    2   2   ##222';
  FP[22]:='   #############################S#######################XXX##@@@';
  FP[23]:='                                                          I##LLL';
  Convert_Format;
 end; { Level3 }

overlay procedure Level5;
 begin
  FP[1]:= '@3@3@3@3@3@3@3@    S     XXX   @P@   XXX    S    @3@3@3@3@3@3@3@';
  FP[2]:= '@#############@         X3XX   @@@   XX3X        @#############@';
  FP[3]:= ' ##run#for###          X3XXXXXXXXXXXXXXX3X         ####sm#was## ';
  FP[4]:= ' ##your#####          X3X3XIIIIISIIIIIX3X3X         ###here#### ';
  FP[5]:= ' ##life####          X3X3XIIITIIIIITIIIX3X3X         ########## ';
  FP[6]:= ' #########----------X3X3XIIIIIII-IIIIIIIX3X3X---------######### ';
  FP[7]:= ' ########          X3X3X3X3X#   3   #X3X3X3X3X         ######## ';
  FP[8]:= ' #######          X3X3X3X3X #   +   # X3X3X3X3X         ####### ';
  FP[9]:= ' ######          X3X3X3X3X  #   3   #  X3X3X3X3X         ###### ';
  FP[10]:=' #####          X3X3X3X3X   #   +   #   X3X3X3X3X         ##### ';
  FP[11]:=' ####          X3X+++X3X    #   3   #    X3X+++X3X         #### ';
  FP[12]:='I###          X3X+++X3X     #   +   #     X3X+++X3X         ###I';
  FP[13]:='C##          X3X+++X3X      #   3   #      X3X+++X3X         ##C';
  FP[14]:='##          X3X+++X3X       #   +   #       X3X+++X3X         ##';
  FP[15]:='#          X3X+++X3X        #   3   #        X3X+++X3X         #';
  FP[16]:='  WWWW    X3X3X3X3X         #   +   #         X3X3X3X3X   ++++  ';
  FP[17]:='  WWW    X3X3X3X3X          #   3   #          X3X3X3X3X   +++  ';
  FP[18]:='  WW    X3X3X3X3X      \\\  #   +   #    //     X3X3X3X3X   ++  ';
  FP[19]:='  W    X3X3X3X3X     \\\\   #   3   #    ///     X3X3X3X3X   +  ';
  FP[20]:='      X3X3X3X3X     \\T\\\  #   +   #   //T//     X3X3X3X3X     ';
  FP[21]:='     X3X3X3X3X       \\\    #   3   #    ////      X3X3X3X3X    ';
  FP[22]:='II  X3X3X3X3X          \    ####D####     //        X3X3X3X3X II';
  FP[23]:='SI X+X+X+X+X                ##L+++L##                X+X+X+X+XIS';
  Convert_Format;
 end; { Level5 }

overlay procedure Level7;
 begin
  FP[1]:= '-..............................3#1#2#3##---;-----;-----;-----;--';
  FP[2]:= '-##############################-##1#2#3#-######################-';
  FP[3]:= '-#.....----......- I#S###### ##K###1#2#3-#///////1///////////1//';
  FP[4]:= '-#.-..-....-....-.# # I####1# ######1#2#-#\1\\\\\\\\\\\\\1\\\\\\';
  FP[5]:= '-#-.-..-..-.....-.# # # ### ## ##1###1#2-#/////1////////////////';
  FP[6]:= '-#-.-.-..-..---..-# # ## # ##1## # ###1#-#CCC\\\\\\\\\1\\\\\\1\\';
  FP[7]:= '-#-.-..-.-.-..-..-# # ### ####  ### K##1-#CCC/////1//////1/////K';
  FP[8]:= '-#-..--...-....--.# # ##################-#######################';
  FP[9]:= '-#-################                                             ';
  FP[10]:='---3333333333\CC### #F######################XXXXXXXX###/#######+';
  FP[11]:='################## ###-------------------###############2######+';
  FP[12]:='big#######     ## ####22222222222222222#-##----   ----###2#####K';
  FP[13]:='trouble## RRRRR  #######################-##-####U####-####2####+';
  FP[14]:='######## RRRKRRRR #########-;      3-T##-##----   ----#####2###3';
  FP[15]:='+++++### RR 2 2 RR ####Z###-############-############-##Q###2###';
  FP[16]:='++T++## RR 2 P  2RR ### # U--------------###TT.TT####----####2##';
  FP[17]:='+++++## RR2   2 RR ####1#-####################;###############2#';
  FP[18]:='#X#X#### RR 2  2RR #3## #C####3#3#3#3#3#3#3#3#3#3#3#3#3#3#3#3##2';
  FP[19]:='#X#X##### RRR2CRR ##3## # ###@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@###D';
  FP[20]:='#X#X###### RRRRRR ##3## #3##@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@##K#D';
  FP[21]:='-----D #### RRR  ### ## ###@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#D';
  FP[22]:='-----# #####   # ##W W# ##@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@##@#D';
  FP[23]:='22222#      #####       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#L';
  Convert_Format;
 end; { Level7 }

overlay procedure Level9;
 begin
  FP[1]:= '+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+///VVVVVVVVV##XXXXXXXXXXXXXXXX-';
  FP[2]:= '////////\//////////\///////\\/////VVVVVVVVV###XXXXXXXXXXXXXXXX#-';
  FP[3]:= '/\///RRRRR///\////////\1///////\VVVVXVVV####111111111111111111#-';
  FP[4]:= '//RRRRRRRRRRR//////\//////\///VVVVVVVV###IID11111111111---1111#-';
  FP[5]:= '//CRRRRRRRRRRRRR/\/////\/1//VVVXVVVV####III#11111111111-C-1111#B';
  FP[6]:= '/\RRRRRRRRRRRR///////\////VVVVVVVV####KIIII#11111111111---1111#-';
  FP[7]:= '///RRRRRRRRRRRR/\//////\/VVVVVVVVXVV###IIIB#111111111111111111#-';
  FP[8]:= '///\/RRRRRRRRRRRR//\//////CVVVXVVVVVVV###II#111111111111111111#-';
  FP[9]:= '/\//////RRRRRR//\////\\////VVVVVVVVVVVV###I#111111111111111111#-';
  FP[10]:='XXXXXXXXXXXXXXXXXXXXXX############################111111111111#-';
  FP[11]:='ZP                               ;       K      CC111111B11111--';
  FP[12]:='XXXXXXXXXXXXXXXXXXXXXX############################111111111111#-';
  FP[13]:='--##########################VVVVVVVVVVVVVVVVV###11111111111111#-';
  FP[14]:='--1111111111111111111111111VV++++VVXVVVVVVVV###111111111111111#-';
  FP[15]:='--111111111111111111111111VV+WW+VVVVVVVXVVVVV###11111111111111#-';
  FP[16]:='-------------------------VV+WW+VVVVVVVVVVVV###1111111111111111#-';
  FP[17]:='--1111111111111111111111VV++++VVVVVVXVVVV###111111111111111111#-';
  FP[18]:='--1111111111111111111111VVVVVVVXVVVVVVV###111111---11111111111#-';
  FP[19]:='--111111111111111111111VVVVVVVVVVVVV####11111111-C-11111111111#B';
  FP[20]:='--XXXXXXXXXXXXXXXXXXXVVVVVVVXVVV######1111111111---11111111111#-';
  FP[21]:='--SXXXXXXXXXXXXXXXXVVVVVXVVVV#####1111111111111111111111111111#-';
  FP[22]:='--XX--XX--XX--XXKVVVXVVVVVV####11#XXXXXXXXXXXXXXXXXXXXXXXXXXXX#-';
  FP[23]:='XX--XX--XX--XX--VVVVVVVV#####L;--DXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-';
  Convert_Format;
 end; { Level9 }

overlay procedure Level11;
 begin
  FP[1]:= '----------W+T-------------XXXXXXXXX----------------T+W-------D--';
  FP[2]:= '--------------------------XXXXBXXXX--------------------------#--';
  FP[3]:= '22RRRRRRRRRRRRRRRRRRRRRRRRRRRRXRRRRRRRRRRRRRRRRRRRRRRRRRRRR22R1+';
  FP[4]:= '22R22222222222X2X2X2X2X22/C@URXRU@C/22X2X2X2X2X22222222222R22R--';
  FP[5]:= '22R22R\/\R222RRRRRRRRRRRRRRRRRXRRRRRRRRRRRRRRRRR222R\/\R22R22R--';
  FP[6]:= '@@R22R@B@R222R@@@@@@@@@@@@XXXXXXXXX@@@@@@@@@@@@R222R@B@R22R@@R-1';
  FP[7]:= 'WWR22R@@@R222R@@@@#########################@@@@R222R@@@R22RWWR--';
  FP[8]:= 'WWR22R@@@R@22R@@@2#C222222222222222222222C#2@@@R22@R@@@R22RWWR1-';
  FP[9]:= '--R22R@2@R@@2R@@22#22222222222222222222222#22@@R2@@R@2@R22R--R--';
  FP[10]:='--R@@R@@@R@@@R@@22#22222222#######22222222#22@@R@@@R@@@R@@R--R-1';
  FP[11]:='--R@@R@2@R+++R@@22#22222222##+K+##22222222#22@@R+++R@2@R@@R--R--';
  FP[12]:='--R@@R@@@R+++R@@22D2222B222D++P++D222B2222D22@@R+++R@@@R@@R--R1-';
  FP[13]:='--R@@R@2@R+++R@@22#22222222##+++##22222222#22@@R+++R@2@R@@R--R--';
  FP[14]:='--R@@R@@@R---R@@22#22222222###D###22222222#22@@R---R@@@R@@R--R-1';
  FP[15]:='--R@@R@2@R---R@@22#22222222222222222222222#22@@R---R@2@R@@R--R--';
  FP[16]:='--R@@R@@@R---R@@@2#C222222222222222222222C#2@@@R---R@@@R@@R--R1+';
  FP[17]:='--R@@R@@@R---R@@@@############-############@@@@R---R@@@R@@R--R--';
  FP[18]:='--R@@R@@@R---R@@@@@@@@@@@@@DK#-#KD@@@@@@@@@@@@@R---R@@@R@@R--R-1';
  FP[19]:='--R@@R@@@R---RRRRRRRRRRRRRRRR#-#RRRRRRRRRRRRRRRR---R@@@R@@R--R--';
  FP[20]:='--R@@RXXXR----VV-----V--VV--V-S-V----V--VV---VV----RXXXR@@R--RDD';
  FP[21]:='--R@@R-------V---VV-V-V---V--VVV---VV-VV---V---V-------R@@R--RDD';
  FP[22]:='--R@@RRRRRRRRRRRRRRRRRRRRRRRRRBRRRRRRRRRRRRRRRRRRRRRRRRR@@R--R;;';
  FP[23]:='@@@@@@@@@@@@@@@@@@222222XXXXXXKXXXXXX222222@@@@@@@@@@@@@@@@@@RLL';
  Convert_Format;
 end; { Level11 }

overlay procedure Level13;
 begin
  FP[1]:= '===3333@@+@@@@         ##33333##                           ##333';
  FP[2]:= '======33@@@@+@@@@       ##333##          ====             ##33##';
  FP[3]:= '=======3333@@@@+@@@@@    ## ##       =====K1===              ## ';
  FP[4]:= '++========3333@@@@@+@                ====11 =====               ';
  FP[5]:= '++++=========33333@@+@@              ======U====                ';
  FP[6]:= '+++++++==========33@@@+@@@@            ======                   ';
  FP[7]:= 'DDDDDDDDDD========333@@@@+@@@@                       ########## ';
  FP[8]:= '         ===========3333@@@@+@@@@                    ##333333##I';
  FP[9]:= '##         ============3333@@@@+@@                #####------##+';
  FP[10]:='3##            ===========3333@@+@@               DFI+.XWXWXL##T';
  FP[11]:='33##             ============33@@+@@@@            #####------##+';
  FP[12]:='33                  =========333@@@@+@@@@@@          ##333333##I';
  FP[13]:='33##                 ==========3333@@@@@@+@@@@       ########## ';
  FP[14]:='3##                     ==========333333@@@@+@@                 ';
  FP[15]:='##VVVVVV       P           ============3333@@+@@                ';
  FP[16]:='VVVVVTVVVV                   =============33@@+@@@@            Z';
  FP[17]:='VVVVWWWVVVV                 ============33333@@@@+@@@@@@        ';
  FP[18]:='VVVVV+++VVVV       ::::::       ==========333333@@@@@@+@@@@     ';
  FP[19]:='CVVVVVVUVVVV       :WWWW:          ============333333@@@@+@@@@@ ';
  FP[20]:='--VVVVVVVVVV       :WWWW`              =============3333@@@@@+@@';
  FP[21]:='3333VVVVVVV        :WWWW:   ## ##           ===========33333@@@+';
  FP[22]:='                   ::::::  ##333##            XK===========333@@';
  FP[23]:='                          ##33333##           X==============333';
  Convert_Format;
 end; { Level13 }

overlay procedure Level15;
 begin
  FP[1]:= 'P                                                              1';
  FP[2]:= ' #####U###################### ####################@#@#@#@#@#@##I';
  FP[3]:= ' @+:-#  #C-2-------WWWWWWWWW#I======I==#K--------##@#@#@#@#@#@# ';
  FP[4]:= ' @2;-#=-#--2------#WWWWWWWWW#=I===II=I=#---------#@#@#@#@#@#@## ';
  FP[5]:= ' @+:-#-=#222------#WWWWWWWWW#I===I===I=#---------##@#@#@#@#@#@# ';
  FP[6]:= ' @2;-#=-#---------#WWWWWWWWW#=III=====I#---------#@#@#@#@#@#@## ';
  FP[7]:= ' @+:-#-=#########-#-##################-#########-##@#@#@#@#@#@# ';
  FP[8]:= ' @2;-#=-#111111111#+++++++++#VV-V1VVV-V#\\\\\\\\\#@#@#@#@#@#@## ';
  FP[9]:= ' @+:-#=-#111111111#+++++++++#V-V-VV-VV-#\\\\\\\\\##@#@#@#@#@#@# ';
  FP[10]:=' @2;-#-=#111111111#+++++++++#V-V-V-V-V-#\\\\\\\\\#@#@#@#@#@#@## ';
  FP[11]:=' @+:-#=-#111111111#+++++++++--VVV-VVV-V#\\\\\\\\\##@#@#@#@#@#@# ';
  FP[12]:='Z@2;-#-=#-##############################-#########@#@#@#@#@#@## ';
  FP[13]:=' @+:-#=-#---------###########CC;;;;;;;;#111111111##@#@#@#@#@#@# ';
  FP[14]:=' @2;-#=-#---------##crazy####CC;;;;;;;;#111111111#@#@#@#Q#@#@## ';
  FP[15]:=' @+:-#-=#---XXX---##cubicals#;;;;;;;;;;#111111111##@#@#@#@#@#@# ';
  FP[16]:=' @2;-#-=#---XBX---###########;;;;;;;;;;#111111111#@#@#@#@#@#@## ';
  FP[17]:=' @+:-#=-#########-####################-#########-##@#@#@#@#@#@# ';
  FP[18]:=' @2;-#-=#/////////#2--2--2---.....C....#XXXXXXXXX#333333333333# ';
  FP[19]:=' @+:-#=-#/////////#-2--2--2-#-.........#XXXXXXXXXVVVVVVV####### ';
  FP[20]:=' @2;-#DD#/////////#--2--2--2#..-.....-.#XXXXXXXXXVVVVVVV333333- ';
  FP[21]:=' @+:-#DD#/////////#2--2--2--#......-...#XXXXXXX**VV333VV------- ';
  FP[22]:='    K#LL#/////////--2--2--2-#....-....--XXXXXXX**VV33UVV        ';
  FP[23]:='###################################################XXX##:;::::::';
  Convert_Format;
 end; { Level15 }

overlay procedure Level17;
 begin
  FP[1]:= 'K@333333333333333333333333333333333333333333333333333333333333@K';
  FP[2]:= '@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @';
  FP[3]:= '3@                                                            @3';
  FP[4]:= '3@   TVV                        E                       //B   @3';
  FP[5]:= '3@   VVVV                      ELE                     ////   @3';
  FP[6]:= '3@    VV                        E                       //    @3';
  FP[7]:= '3@                                                            @3';
  FP[8]:= '3@                                                            @3';
  FP[9]:= '3@            @              IIIIIII             @            @3';
  FP[10]:='3@           @*@             I-----I            @+@           @3';
  FP[11]:='3@    E     @***@            I-333-I           @+++@     E    @3';
  FP[12]:='3@   ELE   @*****@           I-3P3-I          @+++++@   ELE   @3';
  FP[13]:='3@    E     @***@            I-333-I           @+++@     E    @3';
  FP[14]:='3@           @*@             I-----I            @+@           @3';
  FP[15]:='3@            @              IIIIIII             @            @3';
  FP[16]:='3@                                                            @3';
  FP[17]:='3@                                                            @3';
  FP[18]:='3@    ==                        E                       RR    @3';
  FP[19]:='3@   ====                      ELE                     RRRR   @3';
  FP[20]:='3@   W==                        E                       RRS   @3';
  FP[21]:='3@                                                            @3';
  FP[22]:='@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @';
  FP[23]:='K@333333333333333333333333333333333333333333333333333333333333@K';
  Convert_Format;
 end; { Level17 }

overlay procedure Level19;
 begin
  FP[1]:= '   RRRRRRRRRRRRRRRRRCRRR+++++++@+++++++RRRCRRRRRRRRRR --------- ';
  FP[2]:= ' RR          ----  RR2RRRRR  RR RR  RRRRR2RRRRRRRRRRR R1R1R1R1R ';
  FP[3]:= ' RR-======**==11== RRR2RRRRRTRR RRTRRRRR2RRRRRRRRRRRR RRRRRRRRR ';
  FP[4]:= ' RR-11====**======-RRRR2RRRR3RR RR3RRRR2RRR                RRRR ';
  FP[5]:= ' RR-============11-RRRRR2RRRRRR RRRRRR2RRRR RRRRXXXXXXXXXXXRRRR ';
  FP[6]:= ' RR-11============-RRRRRR2RRRRR RRRRR2RRR   RRRR-----------RRRR ';
  FP[7]:= ' RR-======**====11-RRRRRRR2RRRR RRRR2RRRRZRRRRRR33333333333RRRR ';
  FP[8]:= ' RR ==11==**======-RRRRRRRR2RRR RRR2RRRRRRRRRRRR-----------RRRR ';
  FP[9]:= ' RR  ----          RRC URRRR2RR RR2RRRRU QRRRRRR+++++C+++++RRRR ';
  FP[10]:=' RRRRRRRRRRRRRRRRRRRRRRRRRRRR2RIR2RRRRRRRRRRRRRRRRRRRRRRRRRRRRR ';
  FP[11]:=' RRRRRRRRRRRRRRRRRRRRRRRRRRRRR@ @RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR ';
  FP[12]:='@                              P                               @';
  FP[13]:=' RRRRRRRRRRRRRRRRRRRRRRRRRRRRR@ @RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR ';
  FP[14]:=' RRRRRRRRRRRRRRRRRRRRRRRRRRRR2RIR2RRRRRRRRRRRRRRRRRRRRRRRRRRRRR ';
  FP[15]:=' RR-----------VVV-V-URRRRRRR2RR RR2RRRRRRRRRRRRRL````-:--::RRRR ';
  FP[16]:=' RR-V1111VVVV-VV-V-RRRRRRRR2RRR RRR2RRRRRU KRRRR::::::-::-:RRRR ';
  FP[17]:=' RR-VVVVVVV--VVV-VVRRRRRRR2RRRR RRRR2RRRRRRRRRRR::---:::-::RRRR ';
  FP[18]:=' RRV---VVV-VVV-VV-VRRRRRR2RRRRR RRRRR2RRRRRRRRRR:-:::-:::--RRRR ';
  FP[19]:=' RRVVVV-VV-V--V-VV-RRRRR2RRRRRR RRRRRR2RRRRRRRRR-::-::-:::-RRRR ';
  FP[20]:=' RRVVV-VV-VV-VV-VV-RRRR2RRRR3RR RR3RRRR2RRRRRRRR:--:-::---:RRRR ';
  FP[21]:=' RRV-VV-V-VV-V V-V-RRR2RRRRRTRR RRTRRRRR2RRRRRRRRRRRRDRRRRRRRRR ';
  FP[22]:=' RR-V--VV---VVV V-VRR2RRRRR  RR RR  RRRRR2RRRRRRRRRRR R1R1R1R1R ';
  FP[23]:='   RRRRRRRRRRRRRRRRRCRRRWWWWWWW@WWWWWWWRRRCRRRRRRRRRR --------- ';
  Convert_Format;
 end; { Level19 }

overlay procedure Level21;
 begin
  FP[1]:= 'C++RRR@2@2\  W   3   W   KD     W  B#///333333333333333\KK#     ';
  FP[2]:= '++RRRR2@2@#################.#########///333333333333333\\\#XX#3 ';
  FP[3]:= '+RRRR2@2@2#333333333333333#X#C\\\///////333333333333333333#VI#  ';
  FP[4]:= '+##R2@2@2@#333/////////333#.#\\\\///////333333333333333333# V# 3';
  FP[5]:= '#+#2@2@2@2#333/C3223/K/333#X#\\\\///////333333333333333333#V #  ';
  FP[6]:= '##2@2@2@2@#333/32332///333#.#XXXXXXXXXX/333333333333333333# V#3 ';
  FP[7]:= 'RR@2@2@2@2#333/2232232/333#X#XXXXXXXXXX/333333333333333333#V #  ';
  FP[8]:= 'R@2@2@2@2@#333/332B332/333#.#XXXXXXXXXX/333333333333333333# V# 3';
  FP[9]:= '+2@2@2@2@2#333/3223322/333#X#XXXXXXXXXX/################### V#  ';
  FP[10]:='++2@2@2@2@#333/2323233/333#.#XXXXXXXXXX/#K3..+.+.+===B....#VK#3 ';
  FP[11]:='C++2@2@2@2\333/2323233/333\XXXXXXXXXXXX/#####....====.....# V#  ';
  FP[12]:='##################\######################C/B#.....====....#VC#--';
  FP[13]:='X222222222222222222222222222222222222222#//##....====.....# V# P';
  FP[14]:='X==+++++++++====+++++++++++++++====+++++#22##.....==......#V #  ';
  FP[15]:='K===XXXXX=========XXXXXXX==XX========## #22##.............#V #DV';
  FP[16]:='======================================# #DD############## #2V#VD';
  FP[17]:='2 +=========  2  ============== 2 2==##S# 2#QXXXXXXX#W33  #V #VD';
  FP[18]:=' 2    3 ===C2===   +=====+ 2    ==   2    +#######XX##### # V#DV';
  FP[19]:='+B===    ======== 2   2===    ====+ ===  =====   #XX#W33  #V+#VD';
  FP[20]:='====+  2   ============   ==+2 ====  =2 2 =====  #XX##### # V#DV';
  FP[21]:='=K=====  2   +=====2   2 ====  +==     == 2  +2  #XX#W33  #V #DV';
  FP[22]:='   2====   ==    2   =   W==  =====  ==== =====  #XX##### #XX#VD';
  FP[23]:=' 2  2  2  =====+    === 2   2    2   +==2  +==+           F  #LL';
  Convert_Format;
 end; { Level21 }

overlay procedure Level23;
 begin
  FP[1]:= '22##----------------------------------C   3 DDDDDDDDDDDDDDD+L==3';
  FP[2]:= '22##--=========================================================K';
  FP[3]:= 'CC##    222  *   222         222       *    222             K## ';
  FP[4]:= '  ##*  ;;;;;    ;;;;; 222 * ;;;;;   222    ;;;;;  * 222      ## ';
  FP[5]:= '  ## 222      222    ;;;;;         ;;;;;           ;;;;;  222## ';
  FP[6]:= '  ##;;;;;    ;;;;;            222 *           222        ;;;;##;';
  FP[7]:= '  ##       222        *  222 ;;;;;    222    ;;;;;    222  * ## ';
  FP[8]:= '  ##EEEEEE#####* 222    ;;;;;        ;;;;;*        * ;;;;;   ## ';
  FP[9]:= '  ##111111##3## ;;;;; 222       222               222        ## ';
  FP[10]:='  ##EEEEEE##C##      ;;;;;     ;;;;;    222     ############### ';
  FP[11]:='  ##******##C##   222      * 222       ;;;;;            Z       ';
  FP[12]:='  ##**CC**##C#############################--------------########';
  FP[13]:='  ##******#QC............................I      ++++2222##KKKKK*';
  FP[14]:='  ########################################------##########******';
  FP[15]:='                           K333333333333333333333333333333333333';
  FP[16]:='  ########################################################@@@@@@';
  FP[17]:='   Z-----I-----------------------.-----------------------@@@@@@@';
  FP[18]:='  ##############################################################';
  FP[19]:='  X-K-X-K-X-K-X-K-X-K-X-K-X-WW-X-WW-X-WW-X-CC-X-WW-X-WW-X-WW-X  ';
  FP[20]:='--------------------------####################################  ';
  FP[21]:='33333333333333333333333333##V+V IVV V VV1 V+VK1VVI1VV V IV+V1V  ';
  FP[22]:='############################ V1VV1+VIV+V V V  VV V+V V1V  V IV  ';
  FP[23]:='PU 3 U 3 U 3 U 3 U 3 U 3 U  V  V V V1VV V 1VIV+ VV  V+VV 1V+V   ';
  Convert_Format;
 end; { Level13 }

overlay procedure Level25;
 begin
  FP[1]:= 'K     -+++++++++++++++++++++++++Q++++++++++++++++++++++++-     K';
  FP[2]:= ' VVVVVV11111111111111111111111111111111111111111111111111\\\\\\ ';
  FP[3]:= ' VVVV;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;//// ';
  FP[4]:= ' VV1111111111;:::-:::WWWWWWWWW#####+++++++++::-:::::111111111\\ ';
  FP[5]:= ' V11         :-:-:-::WWWWWWWW###A###++++++++:-:-:--:        11/ ';
  FP[6]:= 'X 1          ::-:::B:WWWWWWWWRR#`#RR++++++++:B::-::;         1 X';
  FP[7]:= 'X  22####F####-------------RRRR#`#RRRR-------------####F####22 X';
  FP[8]:= 'X  22##3@-@3##;3;3;3;3;3;3RRRRR#`#RRRRR3;3;3;3;3;3;##3-.-3##22 X';
  FP[9]:= 'X  22##3@-@3##3;3;3;3;3;3RR1-C##D##C-1RR3;3;3;3;3;3##3-.-3##22 X';
  FP[10]:='X  22##3@-@3##;3;3;3;3;3RR11-C##D##C-11RR3;3;3;3;3;##3-.-3##22 X';
  FP[11]:='X--####3@-@3####3;3;3;3RR11#####D#####11RR3;3;3;3####3-.-3####-X';
  FP[12]:='X   U##3@-@3##U ;3;3;3RRB11-+T1   1T+-11BRR3;3;3; U##3-.-3##U  X';
  FP[13]:='X--####3@-@3####3;3;3;3RR11#####P#####11RR3;3;3;3####3-.-3####-X';
  FP[14]:='X  22##3@-@3##;3;3;3;3;3RR1111##U##1111RR3;3;3;3;3;##3-.-3##22 X';
  FP[15]:='X  22##3@@@3##3;3;3;3;3;3RR111#####111RR3;3;3;3;3;3##3-.-3##22 X';
  FP[16]:='X  22##3@K@3##;3;3;3;3;3;3RR111---111RR3;3;3;3;3;3;##3-K-3##22 X';
  FP[17]:='X  22#########-----B-------RRRR-C-RRRR-------B-----#########22 X';
  FP[18]:='X 1                           RRRRR                          1 X';
  FP[19]:=' R11          11111111111111:-------:11111111111111         11= ';
  FP[20]:=' RR111       11-VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV-11      111== ';
  FP[21]:=' RRRR111    11-V V V-V V V-2-V*VCV*V-2-V V-V-V V V-11   111==== ';
  FP[22]:=' RRRRRR111111-V V V-2-V V V-V*V*V*V*V-V V V-2-V V V-11111====== ';
  FP[23]:='K            V V V V V V V V*V*V*V*V*V V V V V V V V           K';
  Convert_Format;
 end; { Level25 }

