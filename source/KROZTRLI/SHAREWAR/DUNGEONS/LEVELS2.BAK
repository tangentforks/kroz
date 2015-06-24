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
{ Object:  1  2  3  B  W  L  C  S  +  I  T  K  D  #  F  .  R  Q  /  \  B  V  =  A  U  Z  *  E  ;  :  `  -}
{ Fields:  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2}
DF[1]:= '*';
DF[2]:= '200  5   100     2  1  1 40        1    50     5                                                ';
DF[3]:= '*';
DF[4]:= '   200       38  2                                                                              ';
DF[5]:= '*';
DF[6]:= '      180 50     2       75                                                                     ';
DF[7]:= '*';
DF[8]:= '             20  2  1    40 35  2              5         990              3                     ';
DF[9]:= '*';
DF[10]:='   400           1       20                 1                                     35            ';
DF[11]:='*';
DF[12]:='100 75 50100 10  1  1  1 30     1  1                          5                     100         ';
DF[13]:='*';
DF[14]:='      170     5  1  1    25500  1       50 50 50     1        1          28        1            ';
DF[15]:='*';
DF[16]:='    60           1     6 30 20              1                  550        4     5  2            ';
DF[17]:='*';
{ Object:  1  2  3  B  W  L  C  S  +  I  T  K  D  #  F  .  R  Q  /  \  B  V  =  A  U  Z  *  E  ;  :  `  -}
{ Fields:  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2}
DF[18]:='100           3  1  1    20     2              5              1           4    20   850         ';
DF[19]:='*';
DF[20]:='   550   650  5  1  1     5     1  1           1              1                20  8            ';
DF[21]:='*';
DF[22]:='      300        1         300            150150              1               300               ';
DF[23]:='*';
DF[24]:='   305        5  1  1     5     1           1                             2     5            999';
DF[25]:='*';
DF[26]:='   100 20    10  2  1  2 20  1  2             10     1        5   800    10    15               ';
DF[27]:='*';
DF[28]:='333333333        1  1    30420  1  1                                           10  5            ';
DF[29]:='*';
DF[30]:='*';
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
     'P':begin PF[XLoop+1,YLoop+1]:=40;PX:=XLoop+1;PY:=YLoop+1;end
     else PF[XLoop+1,YLoop+1]:=ord(copy(FP[YLoop],XLoop,1))
    end;
 end; { Convert_Format }

overlay procedure Level1;
 begin
  FP[1]:= '        1    1     1  1     1     1   1      1        1         ';
  FP[2]:= '   ---#######   1        1     1          1      1#######---   1';
  FP[3]:= '   #        #1      1     1        1    1      1  #+ + + + #    ';
  FP[4]:= '1  #   TT   #     1   1      1   1          1     # + + + +#1   ';
  FP[5]:= '   #        #  1        1       1     1         1 #+ + + + #    ';
  FP[6]:= '   ##########       1     1         1     1   1   ##########  1 ';
  FP[7]:= '1   1       1     1    1      1         1       1      1       1';
  FP[8]:= '  1      1      1                         1       1     1    1  ';
  FP[9]:= '   1    1   1      1   XXXXXXXXXXXXXXX     1   1     1        1 ';
  FP[10]:='      1      1   1     XXXXX  I  XXXXX   1      1   1    1      ';
  FP[11]:='1   1    1    1    1   XXXX       XXXX    1   1       1        1';
  FP[12]:=' 1      1  1    1      XXXX+  P  +XXXX   1      1      1    1   ';
  FP[13]:='    1     1  1     1   XXXX       XXXX     1      1  1    1    1';
  FP[14]:=' 1   1     1     1     XXXXX  S  XXXXX   1    1       1      1  ';
  FP[15]:='1      1 1    1        XXXXXXXXXXXXXXX      1   1       1     1 ';
  FP[16]:='  1     1  1      1                      1     1    1      1    ';
  FP[17]:='    1       1    1     1     1     1    1     1       1 1      1';
  FP[18]:='1  ##########1    1   1    1    1     1      1   1########## 1  ';
  FP[19]:=' 1 # W W W W# 1        1    1     1      1 1      #        #    ';
  FP[20]:='1  #W W W W #   1   1    1     1     1         1  #   LL   #  1 ';
  FP[21]:='   # W W W W#1       1    1        1   1     1    #        #    ';
  FP[22]:='1  ---#######    1     1    1 1     1     1     1 #######---    ';
  FP[23]:='        1    1     1            1  1     1     1        1      1';
  Convert_Format;
 end; { Level1 }


overlay procedure Level3;
 begin
  FP[1]:= '+++##############RRRRRRR###         ##sm######TVVVVT##K-        ';
  FP[2]:= '+C+D            K#RRRRRRR##    C    ##was#### VVVVVV ###      # ';
  FP[3]:= '+++######## ####1#RRRRRRR##         ##here## VVV++VVV ##333333# ';
  FP[4]:= '########### #####1#RRRRRRR#####T########### VVV++++VVV1######## ';
  FP[5]:= '         +# #2####1#RRRRRRR######+# #K# #3#1VVV++++VVV       2KC';
  FP[6]:= ' # ######## ##+####1#RRRRRRR###....# # # ### VVV++VVVV #X###### ';
  FP[7]:= '3# #######  ###+#####RRRRRRR## ############## VVVVVVV ##X##C### ';
  FP[8]:= ' # ###### # ####+#####RRRRRRR##  ##+:   :+#### VVVVV ###X##X### ';
  FP[9]:= '.# #T### ## #####+####XRRRRRRRX## #   :  :#####     ###TTT#X### ';
  FP[10]:='.# # ##+### ######+###XXXXXXXXX# ## ::::: ####### # #######X### ';
  FP[11]:='.# # # ###                          : K :         # #XXXXXXX### ';
  FP[12]:='.# # C###   P  ###### ###XXXXXXXXX# ::;:: ####### # #XXXXXX####D';
  FP[13]:='.# #3#### ////####### ###XRRRRRRRX#:: :   ###VW## # #XXXXX##WWWW';
  FP[14]:='.# ###////\\\//###### ####RRRRRRR##+ :  :+###TV## # #XXXX##KWWWW';
  FP[15]:='.# ##//\\\\C\//////## ##T##RRRRRRR###########V+## #     ####WWWW';
  FP[16]:='.# ##///\\\1\////###+ #+-+##RRRRRRR##cavern## V## ###///########';
  FP[17]:=' # ###///\\\//#####+# #---###RRRRRRR##of#####V ## #222222222\###';
  FP[18]:=' #  Q###//// #####+## #-C-#Z#RRRRRRR#tunnels# V## #222222222\1 #';
  FP[19]:=' ########### ####+### #---#3##RRRRRRR########V ## #222222222\#D#';
  FP[20]:='          I  ###2#### #2-2# ##RRRRRRR####  ## V## #222222222##D#';
  FP[21]:='##################### ##/## ###RRRRRRR## ## #V ## #222222222##D#';
  FP[22]:='22222222222222222222#       ####RRRRRRR# ###X V## #222222222##D#';
  FP[23]:='K                     ###########RRRRRRR#++##V    \---------##L#';
  Convert_Format;
 end; { Level3 }

overlay procedure Level5;
 begin
  FP[1]:= '//1////////\\\\\\\\\\\1\\\\11111\C\1111111\\\\\\\\\\\\\\\\\/////';
  FP[2]:= '/////////1//\\\\1\\\\\\\\\\\\111\\\111111\\XXX\\\1\\\\\\\/1/////';
  FP[3]:= '///RRR///////\\\\\\\\\\\\\\Z\\111111111\\\\XLX\\\\\\\\\\////////';
  FP[4]:= '//RRRRRR//////\\\\\\U\\\\1\\\\\\11111\\\\\\XXX\\\\\/////////////';
  FP[5]:= '///RRRR///////\\\1\   \\\\\\\\\\\\\\\\\\\\\\\\\//////1//////////';
  FP[6]:= '/1//RR//XXXX/1//\\\\\\\\\\\\1\\\\\\\\\\//1/////////////////1////';
  FP[7]:= '////////XCCX1//1////\\\\\\\\\\\\///////////////1////////////////';
  FP[8]:= '////////XXXX/////////////////1////////////////////////XXXXXXXXXX';
  FP[9]:= 'XXXX///////////////1///////////////XXXXXXXXXXXXXXXXXXXX=========';
  FP[10]:='===XXXXXXXXXXX/////////XXXXXXXXXXXXX============================';
  FP[11]:='=============XXXXXXXXXXX========================================';
  FP[12]:='======================================================  1     ; ';
  FP[13]:='K11 111===============================W       1  W        W   : ';
  FP[14]:='1 1111 11 1    1       W        1         RR                  : ';
  FP[15]:='111 1111 11 1              W            RRRRR       W         : ';
  FP[16]:='1 1111 1111       1               W      +RRRRR               : ';
  FP[17]:='111 1111 1   1            1              RRRRRRRR1         W  : ';
  FP[18]:='1 1111 1111   B         W                 +RRRRRRR           1: ';
  FP[19]:='111 1111 111 1                      W     RRRRRRR    W        : ';
  FP[20]:='11 11 1111       1          W        1   RRRRRR         1     : ';
  FP[21]:=' 111111 1    1      W                     RRR1           W    : ';
  FP[22]:='111 11 111 1    1         P                      W            :`';
  FP[23]:='1 11111 111  1       W            W                   W      I:U';
  Convert_Format;
 end; { Level5}

overlay procedure Level7;
 begin
  FP[1]:= ' I                3              3              3              3';
  FP[2]:= 'PI                3+             3+             3+             3';
  FP[3]:= ' I                3              3              3              3';
  FP[4]:= '############################################################### ';
  FP[5]:= '+      ;K ##33333 33333##2 222 22222##111111 1111##..  ..     . ';
  FP[6]:= ';;; ;; ;; ##3 33333 333##222222 2222##1 111111 11##  .. .....   ';
  FP[7]:= 'U;;  ;  ; ##33 33U333 3## 2222U22 22##11111U1111 ## ....########';
  FP[8]:= '  ;; ;; ; ##3333 333333##222 2222222##11 1111 111##. .. U    3..';
  FP[9]:= '; I  ;;   ##3 3333333 3## 2222222 22##1 11 111111##.    #     .C';
  FP[10]:=' ###############################################################';
  FP[11]:='                     W;33333333333333333333333333333333333333333';
  FP[12]:='  ###########################################W         K       +';
  FP[13]:='Z                                T                             1';
  FP[14]:='  ##############################################################';
  FP[15]:='    # # # #1# # # #1# # #E# # # #1# # #1# #;# #1# # # # # #;# ##';
  FP[16]:='  ## # #E# # #1# # # #;# # # # # # #E# # #1# # #;# #1# #1#E# #T#';
  FP[17]:='  # # # #;# # # #1# # #1# # #1# # # # #1# # # # # #E# # # #;#Q##';
  FP[18]:='  ## #1# # # # # #E# # # #1#;# # # # #;# # #1#E# # # #;# # #E#T#';
  FP[19]:='    # # # # #1# # # #1# # # # # # #1# # #E# # #1# #1# # #1# # ##';
  FP[20]:='  ##############################################################';
  FP[21]:='  ###K     ;      3    +:    3     :+3       +: 3    :+     +  3';
  FP[22]:='  ##########  ##   :+  3  +    :+      :+     3  +:+     3  ::::';
  FP[23]:='              ##3         3 +:    3 +   3  :+      3   :+  :D`DL';
  Convert_Format;
 end; { Level7 }

overlay procedure Level9;
 begin
  FP[1]:= 'K            3-      33333VVVVVVVVVVVV    .         .       .  Z';
  FP[2]:= '     3-     ---     33VVVVVVVVVVVVVVZ          .                ';
  FP[3]:= '3-  ---           333VVVVVVVVVVVVVVVVVV  .        U   .      .  ';
  FP[4]:= '--              333VVVVVVVVVVVVVVVVVVVVVW    .           .      ';
  FP[5]:= '          3-   33VVVVVVVV\\\\\\\\VVVVVVVVVV         .        VVV';
  FP[6]:= '   3-    ---  33VVVVVVV\\++++W+++\\VVVVVVVVVV   .    ZVVVVVVVVVV';
  FP[7]:= '  ---        33VVVVVVV\++\\RRRR\\+++\\VVVVVVVVVVVVVVVVVVVVVVVVVV';
  FP[8]:= '3-       U  33VVVVVV\\+\\RRRRRRRRRR\++\\VVVVVVVVVVVVVVVVVVVVVVVC';
  FP[9]:= '--         33VVVVVV\\+\RRRRRR////RRRR\+\\\VVVVVVVVVVVVVVV1111111';
  FP[10]:='      333333VVVVVV\\+\RRRR////11///RRR\++\\VVVVVVVVV111111111111';
  FP[11]:='  33333VVVVVVVVVV\\+\\RRR///111111//RRRR\+\\VVVV1111111111111111';
  FP[12]:='333VVVVVVVVVVVVV\\\W\RRR//11111P111//RRR\W\\\VVV1111111---111111';
  FP[13]:='VVVVVVVVVVVVVVVVV\\\+\RRR//11111111//RRR\+\\VVVV1111111-B-111111';
  FP[14]:='VVVVVVVVVVVVVVVVVV\\\+\RRR//111U11//RRR\\+\VVVVVV111111---111111';
  FP[15]:='VVVVV3 .  3  VVVVVVV\\+\RRR////////RRRR\+\\VVVVV1111111111111111';
  FP[16]:='3-.     -- .  VVVVVV\\\+RRRR//////RRRR\+\\VVVVV11111111111111---';
  FP[17]:='--   - .3- --- VVVVVVV\\+\RRRRRRRRRRR\+\\VVVVV111111111111111- U';
  FP[18]:='  - 3-  --.-3-. VVVVVVVV\++\RRRRRR\\++\VVVVVV1111111111111111---';
  FP[19]:=' 3.        ---   VVVVVVVVV\++++W++++\\VVVVVV111111---11111111111';
  FP[20]:='       U  3   3-  .VVVVVVVV\\\\\\\\VVVVVVVV1111111-B-11111111111';
  FP[21]:='.  --.      - --.  - VVVVVVVVVVVVVVVVVVVVV11111111---11111111111';
  FP[22]:='   3 --    3   -- 3-  ##VVVVVVVVVVVVVVVVV11111111111111111111111';
  FP[23]:=' .   3  .    . 3-   . D+DLVVVVVVVVVVVVC111111111111111111111111K';
  Convert_Format;
 end; { Level9 }

overlay procedure Level11;
 begin
  FP[1]:= '                                                              3S';
  FP[2]:= 'U################# #################################`###########';
  FP[3]:= ' :3; \3+#3 W    K#3  #  W  W  W  W  W  W  W  W  W  #   3     3  ';
  FP[4]:= 'Z:+: \3+# 3      #3  #  /////////////////////////  #      3     ';
  FP[5]:= ' :3; \3+#    3   #3  #  /+//////+/////T///////+//  #            ';
  FP[6]:= ' :+: \3+#        #3  #  ////T/////////////+////// 3#  3 ::;:  3 ';
  FP[7]:= ' :3; \3+# 3  3   #3  # 3//////////W//////////////  #    :CC:    ';
  FP[8]:= ' :+: \3+# W      #3  #  //+//////////////////+///  #    ;:::    ';
  FP[9]:= ' :3; \3+#      3 #3  #  ///////+///////+/////////3 #3         3 ';
  FP[10]:=' :+: \3+#3       #3  #3 /////////////////////////  #       3    ';
  FP[11]:=' :3; \3+#W   3   #3  #  ///+//////XXXXX////W/////  #  3       3 ';
  FP[12]:='P:C: \3K#       3#3  #  ////////+/XXKXX+/////////  #############';
  FP[13]:=' :3; \3+# 3      #3  #  //////////XXXXX////////+/ 3#3           ';
  FP[14]:=' :+: \3+#     3  #3  # 3/+////////+///////T//////  #3+          ';
  FP[15]:=' :3; \3+#  3W    #3  #  /////////////////////////  #3+          ';
  FP[16]:=' :+: \3+#        #3  #  /////T//////+////////+///  #3+      ::::';
  FP[17]:=' :3; \3+# 3    3 #3  #3 /////////////////////////3 #3+      ```L';
  FP[18]:=' :+: \3+#        #3  #  //W//////////////+///////  #3+      ::::';
  FP[19]:=' :3; \3+#W   3   #3  #  /////+////+///////////+//  #3+          ';
  FP[20]:='S:+: \3+#3       #3  #  /////////////////////////  #3+          ';
  FP[21]:=' :3; \3+#        #3 K#                             #3           ';
  FP[22]:='U### ####I########################## ###############E###########';
  FP[23]:='                                                              3S';
  Convert_Format;
 end; { Level11 }

overlay procedure Level13;
 begin
  FP[1]:= 'KKKKDE EI .  I  E    2  I   E  RRCC211///////// ////////////T//K';
  FP[2]:= 'VVVVVE     2    I    .     .   RR22211//////// / ///////////2// ';
  FP[3]:= '  E  I .    E  .     E  .    2 RR11111///   / ///      /////2// ';
  FP[4]:= '2  . 2  E .     E2  . I    I   RR//////// // ////////// ////2// ';
  FP[5]:= '  I   .    I   I .        .    RR//////// /////222////// ///2// ';
  FP[6]:= 'E .   I E  .2  E    E .    E   RR/////T// /////2P2/   /// //2// ';
  FP[7]:= ' 2   E  . I    .   I   I .    ERRC/////// /////222/ // /// / // ';
  FP[8]:= 'I   .    2 E.  E     .      I  RR//////// ////// // // ////  // ';
  FP[9]:= '.E I    .    I    2   E     .2 RR//////// ///////  ///I///// // ';
  FP[10]:='   . 2     .      . I          RR//      1/ ////////// ////// / ';
  FP[11]:='2I   . E   I  2.I  E      I.  \\\\ /////// /           ///////  ';
  FP[12]:='RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR\ZZ\RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR';
  FP[13]:='22--2-2--2--2-+--22----2-2---2\\\\VVVVVVVVVVVTVVV W VVVVVVTVVVVV';
  FP[14]:='--2-2--2-2-2---2---2-2-+2---2--RR   .VVVVVVVVV + VVVTVVVV V VVVV';
  FP[15]:='+2-2--2---2-2---22---2---2----2RRV     . VVVVVVVVVVVV VV VVV   V';
  FP[16]:='2--+-2--2--+--22---2--+-2---2-+RRVV.  .     .VVVVVVVV V VVVVVV V';
  FP[17]:='-2--2-2--2---2-+-22----2--2----RRVVVV    .       .VVVV  VVVV TVV';
  FP[18]:='2-2--2--2-+2--B-2---2-+-2--+-2-RRVVVVVV  .   .      VVVVVVV VVVV';
  FP[19]:='2+-2---2--2--2-2--2---2--2-----RRVVVVVVVV         .   .VVVVV VVV';
  FP[20]:='-22-+-2--2-2---22--+-2--2-2-2--RRVVVVVVVVVV .            .V VVVV';
  FP[21]:='2---2---2-2--2-+-2----2----2--+RRVVVVLDVVVVVV  .    .     . VVVV';
  FP[22]:='VVVV2--2-+-2-2----2--2-2-2-2---RRCCVVVVDVDDVD                VVV';
  FP[23]:='KKKD-2---2-2--2-2---2-+-2--2--2RRCCVVVVVDVVDVV222222222222222DKK';
  Convert_Format;
 end; { Level13 }

overlay procedure Level15;
 begin
  FP[1]:= '+*****#3#L#+ \    2    \ 2   2   W#CCCC#=C;=====    ====        ';
  FP[2]:= '+**Q**# #D#     \/  2 \\     //   ##33##=;;===== === == ======= ';
  FP[3]:= '+*****# #D#\\  //\/   \     \\// 2#\33\#===I=.  === ==== ===== =';
  FP[4]:= '2###### #X#2  2 ///     2    //   #\33\#====  .=== ====== === ==';
  FP[5]:= '2D33V  ##X#\\       2   \/     2  #\33\#===. .=== ======= == ===';
  FP[6]:= '2#33#C##X##\/\  2 /\     2   /\   #\33\#==.  ==== ==  S  == ====';
  FP[7]:= '2#33#.##X#W\/\\      2  \\\   //  #\;;\#== ====== == ======11111';
  FP[8]:= '2#33#.##X#/\B      \/  \\/   2  2 #\  \#== ====== === =====11111';
  FP[9]:= '2#33#.###X\///  ///   2 \\        #X  X#=== ===== ==== ====11111';
  FP[10]:='2#33#.#####+\//2/\//         \\ 2 #X  X#=    ==== ===== =======;';
  FP[11]:='2#33#.##X##++\////   2\  \  //\\  #X  X#= ======= W  : ======= =';
  FP[12]:='2#33#.##XX##         \/\ 2   \\2  #X  X#== ====== 2    ====== ==';
  FP[13]:='2#XX#.##XXX######## 2          ---#X  X#= ================ W ===';
  FP[14]:='2#XX#.##XRRRRRRRRR##########2  - U#X  X# ====    ===1==== ======';
  FP[15]:=';#XX#.##XRRRRRRRRRRRRRRRRRR########X  X#= == ==== == ==== ======';
  FP[16]:=' #XX#.##XXRRRRRRRRRRRRRRRRRRRRRRRR#X  X#=K==    ==   =====   ===';
  FP[17]:=' #XX#.##X##11RRRRRRRRRRRRRRRRRRRRR##  ########== ==== ======= ==';
  FP[18]:='Z#XX#.####11111111111111RRRRRRRRR##  ##RRRRRR###= ==== ======= =';
  FP[19]:=' #XX#.###11111111111111111111RRR##  ##RRRRRRRRR#== === ======== ';
  FP[20]:=' #XX#.##11111111111111111111111##  ##RRRRRRRRRR##== == ======== ';
  FP[21]:=' #CK#.##11111111B111111111B11111111##RRRRRRRRRRR#   == ======= =';
  FP[22]:='P####X##111111111111111111111111111111RRRRRRRRRRU#====   ==== ==';
  FP[23]:='       /-------------C----------------URRRRRRRRRRR#======      T';
  Convert_Format;
 end; { Level15 }

overlay procedure Level17;
 begin
  FP[1]:= '     2    KRR++                P RRRRRRRRRRRR                   ';
  FP[2]:= ' RRRRRRRRRRRRRRRRRRRRRRRRRRRRRR      -         RRRRRRRRRRRRRRR  ';
  FP[3]:= '                    ++++++C 3RR  RRRRR1 RRRRR  RRCE             ';
  FP[4]:= ' RRRRRRRRRRRRRRRRRRRRRRRRRR  RR  RRC1RRRR 1RR  RRRRRRRRRRRRRRRRR';
  FP[5]:= '2222222222           ZRRTRRRRRR  RR  -     -       XXXXXXXXXXXKR';
  FP[6]:= '--RRRR--RRRRRRRRRRRRRRRR     RR33RRRRRRRRRRRR  RR  RRRRRRRRRRRRR';
  FP[7]:= '  RR-----------..*****RRRRR    **         +RR  RR             RR';
  FP[8]:= '  RR--RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR--RRRRRRRRRRRRR  RR';
  FP[9]:= '  RR--RR11111111----------D+DWD+DWD+DWLLRR333          2CBRR  RR';
  FP[10]:='  RR--RR11111111RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR  RR';
  FP[11]:='  RR--RR--RRRRRRRR  DT+*W*+TCRRZ1                             RR';
  FP[12]:='  RR--RR--RRII.KRR  RRRRRRRRRRRRRRRRRRRR  RRRRRRRRRRRRRRRRRRRRRR';
  FP[13]:='  RR--RR--RRIIRRRR                        RRU1-------XXXXXXXXX  ';
  FP[14]:='  RR--RR--RRIIRRRRRRRRRRRRRRRRRRRRRR  RR  RRRRRRRRRRRRRRRRRRRR  ';
  FP[15]:='  RR--RR--RR..RR 1RR 1RR 1RRR         RR                        ';
  FP[16]:='  RR--RR--RRIIRR  -   -   -    RRRRRRRRR  RRRRRRRRRRRRRRRRRRRRRR';
  FP[17]:='  RR------RRIIRR  RRRRRRRRRRR  RR  ;W;W;           22222222CRRK ';
  FP[18]:='  RRRRRRRRRRIIRR         2KRRWWRR  RRRRRRRRRRRRRRRRRRRRRRRRRRR--';
  FP[19]:='         -    RRRRRRRRRRRRRRRRRRR  RRXXXXXXXXXXXXXC3333333333333';
  FP[20]:='  RRRRR 1RRR          1            RR--RRRRRRRRRRRRRRRRRRRRRRR- ';
  FP[21]:='  X  RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR--URRCCRRCCRRXXXXXX333333  ';
  FP[22]:='--RR              RRRRRRRR    2   KRR- RRR..RR..RR**RR**RR**RR  ';
  FP[23]:='33RRRRRRRRRRRRRR   *    *   RRRRRRRRR--E.E******RRK*RR**RR**RR  ';
  Convert_Format;
 end; { Level17 }


overlay procedure Level19;
 begin
  FP[1]:= '1  C  1      +   1   +        +  1      +     + 1 RRR++++++RRRRL';
  FP[2]:= '--   ---  1     ---        1    ---  1         ---RRRR++++++RRRD';
  FP[3]:= ' 1       ---RRRRRR    1   ---       ---    W      RRRR;;;;;;RRR1';
  FP[4]:= '---  *  1 RRRRRRRRRR1---       1       1       1  RRRR111111RRR1';
  FP[5]:= '1      RRRRR#####RRRRRR 1     ---     ---   1 ---RRRRR111111RRR1';
  FP[6]:= '--1   RRRRRR#U K#RRRRR ---  1      T       ---  RRRRRR11111RRRR1';
  FP[7]:= ' ---   RRRRR#####RRR       ---           1    #RRRRRR#11111RRRR1';
  FP[8]:= '    1    RRRRRRRRRR  1           1      ---   ########11111RRRR1';
  FP[9]:= ' * ---    RRRRRRRR  ---         ---   1       D--Z---`11B11RRRR1';
  FP[10]:='      1    RRRRR            W        ---      ########111111RRR1';
  FP[11]:='     ---                                      #RRRRRR#111111RRR1';
  FP[12]:='               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FFRRRRRR1111111RRR1';
  FP[13]:='#############################################;;;RRRRR11111111RR1';
  FP[14]:='    #++#W3#* #  # *##::::::+::::K:::::::::::#1111RRRRR1111111RR1';
  FP[15]:=' #  #3 #3 #        ##:3::::::::-::::::3:::::#11111RRRRR111111RR1';
  FP[16]:='P#  #  #  #3 #  #  ##:::::::::-:::3:::::::::#11111RRRRR111111RR1';
  FP[17]:=' #3 #  K  #  #  #3 ##::::::::-::::::::::::::#11111RRRRR11B111RR1';
  FP[18]:='I#  #  #  #  # 3#  ##:::3:::-:::::::::::3:::#11111RRRRR11111RRR1';
  FP[19]:=' #  #  #  #  #  #  ##::::::;::::::::*:::::::#1111RRRRRR11111RRR1';
  FP[20]:='Z#  #  # 3# 3#  #  ##///////////////////////#1111RRRRR11111RRRR1';
  FP[21]:=' #     #  #  #3 #                           #EEERRRRRR11111RRRR1';
  FP[22]:='C# 3#  #  #  #**#  ##\\\\\\\\\\\\\\\\\\\\\\\#+++RRRRR;;;;;;RRRR ';
  FP[23]:='3#+ #3*#3    #**#+3##33333333333333333333333#CCRRRRRRR*-U-*RRRRU';
  Convert_Format;
 end; { Level19 }

overlay procedure Level21;
 begin
  FP[1]:= 'LVVVVVVVVVVVVVVVVVVVVVV333333333333333333VVVVVVVVVVVVVVVVVVVVVVK';
  FP[2]:= 'DVVVVVVVVVVVVVVVVVVVV333                333VVVVVVVVVVVVVVVVVVVVI';
  FP[3]:= '.VVVVVVVVVVVVVVVVVV333         ***        333VVVVVVVVVVVVVVVVVV-';
  FP[4]:= 'DVVVVVVVVVVVVVVVV333         *******        333VVVVVVVVVVVVVVVV-';
  FP[5]:= '.VV+VVVVVVVVVVV333          ****F****         333VVVVVVVVVVV+VV-';
  FP[6]:= 'DVQ+VVVVVVVVV333   +         *******         +  333VVVVVVVVV+CV-';
  FP[7]:= '-VV+VVVVVVV333        +        ***        +       333VVVVVVV+VV-';
  FP[8]:= '-VVVVVVVV333             +             +            333VVVVVVVV-';
  FP[9]:= '-VVVVVV333      Z                              T      333VVVVVV-';
  FP[10]:='-VVVV333                     -------                    333VVVV-';
  FP[11]:='-VV333                      ---------                     333VV-';
  FP[12]:='E33C3         +    +    +  -----P-----  +    +    +        3C33E';
  FP[13]:='-VV333                      ---------                     333VV-';
  FP[14]:='-VVVV333                     -------                    333VVVV-';
  FP[15]:='-VVVVVV333      T                              Z      333VVVVVV-';
  FP[16]:='-VVVVVVVV333             +             +            333VVVVVVVV-';
  FP[17]:='-VV+VVVVVVV333        +        ***        +       333VVVVVVV+VV-';
  FP[18]:='-VC+VVVVVVVVV333   +         *******         +  333VVVVVVVVV+CV-';
  FP[19]:='-VV+VVVVVVVVVVV333          ****F****         333VVVVVVVVVVV+VV-';
  FP[20]:='-VVVVVVVVVVVVVVVV333         *******        333VVVVhelp!VVVVVVV-';
  FP[21]:='-VVVVVVVVVVVVVVVVVV333         ***        333VVVVVVVVVVVVVVVVVV-';
  FP[22]:='.VVVVVVVVVVVVVVVVVVVV333                333VVVVVVVVVVVVVVVVVVVVF';
  FP[23]:='KVVVVVVVVVVVVVVVVVVVVVV333333333333333333VVVVVVVVVVVVVVVVVVVVVVK';
  Convert_Format;
 end; { Level21 }

overlay procedure Level23;
 begin
  FP[1]:= 'L UD*D*D*D*D------------------------;;;;;;;;;;;;;;;;;;;;;;;;;;;;';
  FP[2]:= '############-----------------##-####                           S';
  FP[3]:= '22222K22222#11111111111111111##-22X# XXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[4]:= '22222222222#-----------------##-22X# XXXXXXXXXXXXXXXXXXXXXXXXXXX';
  FP[5]:= '22222222222#22222222222222222##-2XX#                            ';
  FP[6]:= '2/////////2#-----------------##-2XK#----------------------------';
  FP[7]:= '2/W--W--W/2#33333333333333333##-22X#2222222222222222222222222222';
  FP[8]:= '2/-------/2#-----------------##-22X#2222222222222222222222222222';
  FP[9]:= '2/---P---/2#22222222222222222##-2XX#2222222222222222222222222222';
  FP[10]:='2/---B---/2#-----------------##-2X+#----------------------------';
  FP[11]:='2/-------/2#1111111-K-1111111##-22X#3333333333333333333333333---';
  FP[12]:='2/-------/2####################-22X#333333333333333333333333----';
  FP[13]:='2/W--W--W/2#--1111111111111-+##-2XX#3333------33333-------------';
  FP[14]:='2/////////2#Q-------------------2X+#333--------333----------I--3';
  FP[15]:='2222#Z#2222################# ##-22X#33----------3--------------3';
  FP[16]:='2222#-#2222#=------======K==-##-22X#3-----33---------33333333333';
  FP[17]:='#####-######*-=====-====-=-=-##-2XX#3----3333-------333333333333';
  FP[18]:='C222/-/2222#==----==--==-==--##-2X+#3---333333-----3333333333333';
  FP[19]:='2222/-/////#=====-====-=-====##-22X#3---3333333333333333--------';
  FP[20]:='2222/-;;;;;;-==---==--==-=---##-22X#3---333333333333333--*+*+*+K';
  FP[21]:='///////////#=-=-===-=====-==-##-2XX#---------------------#######';
  FP[22]:='C2222222222#W---====-----===S##-2XC#+--------------------##22222';
  FP[23]:='####################################:::::::::::::;:::::::##X222U';
  Convert_Format;
 end; { Level23 }

overlay procedure Level25;
 begin
  FP[1]:= 'VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV VVVVVVVVVVVVVVVVVVVVVVVCC';
  FP[2]:= 'VRRRRRVVVVVVVVV VVVVV VVVVVVVVVVVVVVV V VVV**VVVVVV*****VVVVVVCC';
  FP[3]:= 'VRU KRVVV**VVV V VVV VIVVV*****VVVVV VVV V**VVVVVV V*****VVVVVVV';
  FP[4]:= 'VRRRRRVVVV**V VVV V VVV V*****V VVV VVVVV VVVVVVV VVV*****VVVVVV';
  FP[5]:= 'VVVVVVVVVVVV VVVVV VVVVV*****VVV V VVVVVVV V V V VVV VVVVVVVVVVV';
  FP[6]:= 'VVVVVVVVVVV VVVVVVV**VVVVVVVVVVVV VVVVVVVVV V3V VVV VVVVVVVVVVVV';
  FP[7]:= 'VVVV VVVVV VVVVVVVVV**VVVVVVVVVVVVVVVVVVVVVVVVVVVVVV VVRRRRRVVVV';
  FP[8]:= 'VVV V VVV3V VVV VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV VVVRU KRVVVV';
  FP[9]:= '***VVV V VVV V V VVVV##########XX##########VVVVVVV VVVVRRRRRVVVV';
  FP[10]:='V***VVV VVVVV VVV VVVl#IIIIIIIIIIIIIIIIII##VVVVVV V**VVVVVVVV**V';
  FP[11]:='VVVVVVTVVVV**VVVVV VVa#I#####IIIIII#####I#pVVVVV VVV**VVVV V**VV';
  FP[12]:='VVVVV VVVV**VVVVV VVVv#I#LD+DIIIIIID-PU#I#iVVVV VVVVVVVVV V VVVV';
  FP[13]:='VVVVVV VVVVVVVVV VVVVa#I#####IIIIII#####I#tV***VVVVVVVVVTVVV VVV';
  FP[14]:='VVVVVVV VVVV*****VVVV##IIIIIIIIIIIIIIIIII#!VV***VVVVVVV VVVVV VV';
  FP[15]:='VVVVVV VVVVVV*****VVV##########XX##########VVV***VVVVV VVVVVVV V';
  FP[16]:='VVVVV VVVVVVVV*****VVVVVVVVVVVVVVVVVVVVVVVVVVVV***VVV VVV VVVVV ';
  FP[17]:='VVVVVV****VVVV VVVVVVVVVVVVVVVVVVVVVVVVVV VVVVVVVV V VVV V VVV V';
  FP[18]:='VVVVV****VVVV VVVVVVVV***VVV V V V VVVVV V VVVVVVVV VVV VVV V VV';
  FP[19]:='VVVV****VVVVVV3VVVVVVVV***V V V V V VVVIVVV3VVVVVVVVVV VVVVV VVV';
  FP[20]:='VVVVVVVVVVVVVVV V VVVVV VV VVVRRRRRV V VVVVV VVVVVVVV VVVV**VVVV';
  FP[21]:='VVVVVVVVVVVVVVVV V VVV VVVVVVVRU KRVV VVVVVVV VVV****VVVV**VVVVV';
  FP[22]:='VVVVVVVVVVVVVV**VVV V VVVVVVVVRRRRRVVV**VVVVVV V****VVVVVVVVVVVC';
  FP[23]:='CCCCVVVVVVVVV**VVVVV VVVVVVVVVVVVVVVVVV**VVVVVV****VVVVVVVVVVVCC';
  Convert_Format;
 end; { Level25 }

overlay procedure Level27;
 begin
  FP[1]:= '3     +=     =+=    =  1=  =+=  =     -   -2   -    -2    -  Z-2';
  FP[2]:= '3 P =   =   =   1==  =    =   = 1=    -2  -    -2   -    K-2  - ';
  FP[3]:= '##################################   ###########################';
  FP[4]:= '3 3 3 3 3**********************K##   ##LVSDCD++D*D++D##D1****DDC';
  FP[5]:= '   K C############################   ##VV+DCD########**######D#D';
  FP[6]:= '          V V  V  V V V   VV   V V   ##ITFD##---D*DID###**DCD*D-';
  FP[7]:= 'VXVVVVVVVVS  VV V    V V V  V V V    ##ZW*.+D-2-D*###WWD**DCD*D-';
  FP[8]:= 'V+VVV   +VVVVVVVVVVVVVVVVVVVVVVVVVV  ##########################D';
  FP[9]:= 'VV  +VVV VVCCXXXXXXXKXXXXXXCXXXXXXV  #K    3C/////////////3 ZX  ';
  FP[10]:='VVVVVVVV+VVXXXX+XXXXXXXXXXXXXXXXXXV  #########################  ';
  FP[11]:='+  V +  VVVXXXXXXXXXXXXXXXXXXXXX+XV  R2 ==+ ==C/1111111/+ 2== 1 ';
  FP[12]:='V V+VVVVVVVXXXXXXXXXXXXX+XXXXXXXXXV  R  +==. ==/1111111/ ==+  . ';
  FP[13]:='+VVVV + VVVXXXXXXX+XXXXXXXXXXXXXXXV  R ===== 2=/111B111/1 ====  ';
  FP[14]:='V  + VVV+VV+XXXXXXXXXXXXXXXXXXX+XXV  R  ==  ===/1111111/   ==   ';
  FP[15]:='VVVVVVV-VVVXXXXXXXXXXXXXXXXXXXXXXXV  R 1   == ./1111111/       1';
  FP[16]:='111111-11V#WWW---=   ===   =-------  R===    1 /1111111/  1  ==+';
  FP[17]:='11111-111V#WWW-3-= = =B= = =222222;  R+= .  =  /////////    ====';
  FP[18]:='1111-1111V#-----3= = = = = =222222;  R  2  ===   .  +== .=   == ';
  FP[19]:='111-11111B#3-3-3-= = = = = =222222;  R ==   == 2   ====  ===2  1';
  FP[20]:='11-111111V#-3-3-3= = = = = =222222;  R ===  1+==   === 2 +===   ';
  FP[21]:='1-1111111V#----3-= = = = = =222222;  RK ===  ==== 1   .    1    ';
  FP[22]:='-11111111V#+++--3= =+   += =222222;  RRRRRRRRRRRRRRRRRRRRRRRRR-X';
  FP[23]:='T-------KV#+++-3-- =======I ------- ZU2 U2 U2 U2 UK U2 U2 U2 U2X';
  Convert_Format;
 end; { Level27 }

overlay procedure Level29;
 begin
  FP[1]:= 'P-----------:333333333333333:---------:C:::::::::::K:-----------';
  FP[2]:= '-:-:-::;:::-:---------------;-:::-:::-:1-1-1-1-1-1-1:-:::::::::-';
  FP[3]:= '-:-:--:2:C;-:-:#############:-:U:-:U:-:-1-1-1-1-1-1-:-:   E   :-';
  FP[4]:= '-:-::::2:X:-:-2#invisimaze!#2-: :3:-:-:1-1-1-1-1-::::-:::::::::-';
  FP[5]:= '-:---B:2:X:-:-:#############:-:-:-:-:-:::::-::::::---------::-:-';
  FP[6]:= '-::::::2:X:-:-:.K-----------:-:-:Z:-:-:S----;------:::::::-::-:-';
  FP[7]:= '-:K-2222:X:-:-:::::::::::::-:-:-:::-:-:::::-::::::::-----:----:-';
  FP[8]:= '-::::::::X:-:+++++++++++++++:-:K::--:-:---:-:---:----:::-::::::-';
  FP[9]:= '-XXXXXXXXX:-:::::::::::::::::-::::-::-:-:-:-:-:-:-::::::--------';
  FP[10]:=':::::::::::---------W---------::---::-:-:---:-:-:-::---:-:::::::';
  FP[11]:='--------::::::::::::::::::::::::-:-::-:-:::::-:-:-:C-:-:-::-----';
  FP[12]:='-::::::-------------W------------:----:-------:-:-::::-:-::-:::-';
  FP[13]:='--:::::::::::::::::::::::::::::::::::::::::::-:-:----:-:-::---:-';
  FP[14]:=':-:-----33333333333----------+----------------:-::::-:-:-::::-:-';
  FP[15]:='--:-::::;;;;;;;;;;;::::::::::::::::::::::-:::-:----:-:-:-3::3-:-';
  FP[16]:='-::K::::----------------------------------:Z;-:-::-:-:---::::-:-';
  FP[17]:='--::::::::::::::::::::::::::1:1:1:1:1:1:1::-:-:-::-:-:::::3:3-:-';
  FP[18]:=':-:W:----------------------::::::::::::::::-:-:-::-:-------::-:`';
  FP[19]:='--:-:-:11111111:Z:;:::::::-:K-XXXXXXX3333333:1:-::-:::::::-:3-:`';
  FP[20]:='-::-:-::::::::::::*******:-::::::::::::::::-:-:W::-------:-::-:`';
  FP[21]:='--:-:-:CI`-------:*******:-:::EWWWWW--------:T::::::::::-:-:3-:`';
  FP[22]:=':-:-:-::::::::::-:::::::::---::::::::::::::::::3333333:--:-::-:`';
  FP[23]:='------------------+:Z-----------------------------------::----:L';
  Convert_Format;
 end; { Level29 }

overlay procedure Level30;
 begin
  FP[1]:= 'K1VXXXXXXXXXXXXXXXX3333333333333K#333##Q...\2-2-2-2-2-2-2-2-2-:R';
  FP[2]:= '-1V  +++++++++++++3333333333333333333#######-2-2-2-2-2-2-2-2-2;R';
  FP[3]:= '-1V  #########################------+##-2-2-2-2-2-2-2-2-2-2-2-:R';
  FP[4]:= '-1V  F-----------------------I-------##2-2-2-2---2-2-2-2-2-2-2RR';
  FP[5]:= '-1V--##################################-2-2-2--C--2-2-2-2-2-2ZRR';
  FP[6]:= '-1V2-2-2-2VV++K++VV2-2-2-2-2-2-2-2-2-2-2-2-2-2---2-2-2-2-2-RRRRR';
  FP[7]:= '-1V-2-2-2-VV++S++VV-2-2-2-2-2-----2-2-2-2-2-2-2-2-2-2RRRRRRRRRRR';
  FP[8]:= '-1V2-2-2-2VVDVVVDVV2-2-2-2-2-2-K-2-2-2-2-2-2-2-2-RRRRRRRRRRRRRRR';
  FP[9]:= '-1V-2-2-2-2-2-2-2-2-2-2-2-2-2-----2-2-2-2-2-2-RRRRRRRRRRRRRRRRRR';
  FP[10]:='-1V///////-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-RRRRR##333333333XXR';
  FP[11]:='--XXXXXX//2-VVVVV-2-2-2==================-2-RRRRRE##3333333333XR';
  FP[12]:='P X 33ZX//-2V+B+V2-2-2C==UDCDXDXDXDXDXDCD2-2RRRREAED3333B33333UR';
  FP[13]:='--XXXXXX//2-VVVVV-2-2-2==================-2-RRRRRE##3333333333XR';
  FP[14]:='-1V///////-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-RRRRR##333333333XXR';
  FP[15]:='-1V-2-2-2-2-2-2-2-2-2-2-2-2-2-----2-2-2-2-2-2-RRRRRRRRRRRRRRRRRR';
  FP[16]:='-1V2-2-2-2VVDVVVDVV2-2-2-2-2-2-K-2-2-2-2-2-2-2-2-RRRRRRRRRRRRRRR';
  FP[17]:='-1V-2-2-2-VV++S++VV-2-2-2-2-2-----2-2-2-2-2-2-2-2-2-2RRRRRRRRRRR';
  FP[18]:='-1V2-2-2-2VV++K++VV2-2-2-2-2-2-2-2-2-2-2-2-2-2---2-2-2-2-2-RRRRR';
  FP[19]:='-1V;##################2-2-2-2-2-2-2-2-2-2-2-2--C--2-2-2-2-2-2ZRR';
  FP[20]:='-1V1EEEEE1EEEEEE11EE###################2-2-2-2---2-2-2-2-2-2-2RR';
  FP[21]:='-1V1EEEE1E1EEEE1EE1E##C+++++++3KKD***##-2-2-2-2-2-2-2-2-2-2-2-:R';
  FP[22]:='-1VE1E11+EE11E1EEEE1##############***##2-2-2-2-2-2-2-2-2-2-2-2;R';
  FP[23]:='K1V+E1EEEEEEE1E+EEEE+*W*+C+*W*+K##S-----2-2-2-2-2-2-2-2-2-2-2-:R';
  Convert_Format;
 end; { Level30 }
