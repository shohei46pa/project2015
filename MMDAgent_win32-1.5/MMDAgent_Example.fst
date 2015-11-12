# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2013  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #

# 1st field: state before transition
# 2nd field: state after transition
# 3rd field: event (input message)
# 4th field: command (output message)
#
# Model
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# Motion
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# Move and Rotate
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# Sound
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# Stage
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# Light
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# Camera
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# Speech recognition
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
#
# Speech synthesis
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# Variable
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# Plugin
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# Other events
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# Other commands
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)

# 0011-0020 Initialization

0    11   <eps>                               MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\sd_mei\sd_mei.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14   15   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\9423171.jpg
15   16   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
16   17   <eps>                               TIMER_START|bootscreen|1.5
17   2    TIMER_EVENT_STOP|bootscreen         MODEL_DELETE|bootscreen

# 0021-0030 Idle behavior

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0031-0040 Hello
 
1    31   RECOG_EVENT_STOP|こんにちは         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんにちわ         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|おはよう           SYNTH_START|mei|mei_voice_normal|おはようございます。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|メイと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|80
61   62   VALUE_EVENT_EVAL|random|LE|80|TRUE  SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|80|FALSE SYNTH_START|mei|mei_voice_bashful|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0090 Guide

1    71   RECOG_EVENT_STOP|図書館             MODEL_DELETE|menu
71   72   <eps>                               MODEL_ADD|panel|Accessory\map\map_library.pmd|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
72   73   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
73   74   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|図書館は、正面から見ると、右前の方向にあります。
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
76   77   <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
77   78   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
78   79   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
79   80   <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
80   81   SYNTH_EVENT_STOP|mei                MODEL_DELETE|panel
81   82   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
82   83   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
83   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   2    SYNTH_EVENT_STOP|mei                <eps>
ｆ
# 0101-0110 Browsing

1    101  RECOG_EVENT_STOP|ホームページ       EXECUTE|http://www.mmdagent.jp/
1    101  RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ   EXECUTE|http://www.mmdagent.jp/
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|ＭＭＤＡｇｅｎｔの、ホームページを表示します。
102  2    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112  2    SYNTH_EVENT_STOP|mei                <eps>

# 0121-0130 Guide

1    121  RECOG_EVENT_STOP|メイちゃん         SYNTH_START|mei|mei_voice_normal|用件は何ですか。
121  122    <eps>                               MOTION_ADD|mei|action|Motion\mei_guide\mei_guide_happy.vmd|PART|ONCE
122  131  SYNTH_EVENT_STOP|mei             　 <eps>

# 0131-0140 Idle behavior2

131  132   <eps>                               TIMER_START|idle1|20
132  133   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
133  134  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
134  135  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
135  135  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
135  135  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
135  135  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
135  131  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0141-0150 紹介

135  141  RECOG_EVENT_STOP|紹介               SYNTH_START|mei|mei_voice_normal|かしこまりました。
141  142  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
142  143  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どこを紹介しましょうか？
143  144  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
144  151  SYNTH_EVENT_STOP|mei                <eps>

# 0151-0160 紹介待機

151  152   <eps>                               TIMER_START|idle1|20
152  153   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
153  154  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
154  155  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
155  155  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
155  155  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
155  155  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
155  151  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE
　
# 0181-0200 2号館（紹介）

155  181  RECOG_EVENT_STOP|2号館              SYNTH_START|mei|mei_voice_normal|ここでは主に、生徒が講義を受けています。
181  182  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
182  183  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
183  184  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
184  151  SYNTH_EVENT_STOP|mei                <eps>

# 0201-0220 食堂（紹介）

155  201  RECOG_EVENT_STOP|食堂               SYNTH_START|mei|mei_voice_normal|お昼には、学生、教授のみなさんがここで食事をしています。
201  202  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
202  203  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
203  204  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
204  151  SYNTH_EVENT_STOP|mei                <eps>

# 0221-0240 小町（紹介）

155  221  RECOG_EVENT_STOP|小町               SYNTH_START|mei|mei_voice_normal|小町守准教授は、自然言語処理の分野で研究しています。
221  222  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
222  223  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
223  224  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
224  151  SYNTH_EVENT_STOP|mei                <eps>

# 0241-0260 システムデザイン論（紹介）

155  241  RECOG_EVENT_STOP|システムデザイン論 SYNTH_START|mei|mei_voice_normal|木曜3限に行われている講義です。
241  242  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
242  243  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
243  244  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
244  151  SYNTH_EVENT_STOP|mei                <eps>

# 0261-0280 15号館（紹介）

155  261  RECOG_EVENT_STOP|13号館             SYNTH_START|mei|mei_voice_normal|ここでは主に、研究が行われています。
261  262  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
262  263  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
263  264  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
264  151  SYNTH_EVENT_STOP|mei                <eps>

# 0281-0300 1号館（紹介）

155  281  RECOG_EVENT_STOP|1号館             SYNTH_START|mei|mei_voice_normal|ここには事務室があり、学生は様々な手続きができます。
281  282  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
282  283  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
283  284  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
284  151  SYNTH_EVENT_STOP|mei                <eps>

# 0301-0320 3号館（紹介）

155  301  RECOG_EVENT_STOP|3号館             SYNTH_START|mei|mei_voice_normal|ここは第一機械実験棟で、機械の実験が行われています。
301  302  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
302  303  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
303  304  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
304  151  SYNTH_EVENT_STOP|mei                <eps>

# 0321-0340 4号館、5号館（紹介）

155  321  RECOG_EVENT_STOP|4号館             SYNTH_START|mei|mei_voice_normal|ここは新実験棟で、たくさんの研究室があり、様々な研究が行われています。
155  321  RECOG_EVENT_STOP|5号館             SYNTH_START|mei|mei_voice_normal|ここは新実験棟で、たくさんの研究室があり、様々な研究が行われています。
321  322  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
322  323  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
323  324  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
324  151  SYNTH_EVENT_STOP|mei                <eps>

# 0341-0360 6号館（紹介）

155  341  RECOG_EVENT_STOP6号館               SYNTH_START|mei|mei_voice_normal|ここは電気電子実験棟で、電気電子の実験が行われています。
341  342  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
342  343  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
343  344  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
344  151  SYNTH_EVENT_STOP|mei                <eps>

# 0361-0380 7号館（紹介）

155  361  RECOG_EVENT_STOP|7号館              SYNTH_START|mei|mei_voice_normal|ここは第二機械実験棟で、機械の実験が行われています。
361  362  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
362  363  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
363  364  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
364  151  SYNTH_EVENT_STOP|mei                <eps>

# 0381-0400 8号館（紹介）

155  381  RECOG_EVENT_STOP|8号館              SYNTH_START|mei|mei_voice_normal|ここは原動機実験棟で、原動機の実験が行われています。
381  382  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
382  383  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
383  384  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
384  151  SYNTH_EVENT_STOP|mei                <eps>

# 0401-0420 9号館（紹介）

155  401  RECOG_EVENT_STOP|9号館              SYNTH_START|mei|mei_voice_normal|ここは航空宇宙力学実験棟で、航空宇宙力学の実験が行われています。
401  402  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
402  403  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
403  404  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
404  151  SYNTH_EVENT_STOP|mei                <eps>

# 0421-0440 10号館（紹介）

155  421  RECOG_EVENT_STOP|10号館             SYNTH_START|mei|mei_voice_normal|ここは貯油庫です。
421  422  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
422  423  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
423  424  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
424  151  SYNTH_EVENT_STOP|mei                <eps>

# 0441-0460 11号館（紹介）

155  441  RECOG_EVENT_STOP|11号館             SYNTH_START|mei|mei_voice_normal|ここは圧縮機室です。
441  442  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
442  443  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
443  444  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
444  151  SYNTH_EVENT_STOP|mei                <eps>

# 0461-0480 12号館（紹介）

155  461  RECOG_EVENT_STOP|12号館             SYNTH_START|mei|mei_voice_normal|ここは原動機運転実験棟で、原動機運転の実験が行われています。
461  462  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
462  463  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
463  464  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
464  151  SYNTH_EVENT_STOP|mei                <eps>

# 0481-0500 13号館（紹介）

155  481  RECOG_EVENT_STOP|13号館             SYNTH_START|mei|mei_voice_normal|ここは体育館で、サークルや部活動で運動などが行われています。
481  482  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
482  483  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
483  484  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
484  151  SYNTH_EVENT_STOP|mei                <eps>

# 0501-0520 14号館（紹介）

155  501  RECOG_EVENT_STOP|14号館             SYNTH_START|mei|mei_voice_normal|ここは食堂です。お昼には、学生、教授のみなさんがここで食事をしています。。
501  502  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
502  503  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
503  504  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
504  151  SYNTH_EVENT_STOP|mei                <eps>

# 0991-01000 紹介→案内

155  991  RECOG_EVENT_STOP|案内               SYNTH_START|mei|mei_voice_normal|かしこまりました。
991  992  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
992  993  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どこを案内しましょうか？
993  994  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
994  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01001-01010 案内開始
　
135   1001  RECOG_EVENT_STOP|案内               SYNTH_START|mei|mei_voice_normal|かしこまりました。
1001  1002  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1002  1003  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どちらに行きたいですか？
1003  1004  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
1004  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01011-01020 案内待機

1011  1012   <eps>                               TIMER_START|idle1|20
1012  1013   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
1013  1014  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
1014  1015  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1015  1015  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1015  1015  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1015  1015  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1015  1011  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 01021-01040 2号館（案内) 

1015  1021  RECOG_EVENT_STOP|2号館              STAGE|Stage\building3\floor.bmp,Stage\building3\eg.jpg
1021  1022  <eps>                               SYNTH_START|mei|mei_voice_normal|正門から入り右側にある建物が2号館です。
1022  1023  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1023  1024  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
1024  1025  <eps>                               MOTION_ADD|mei|action|Motion\mei_imagine\mei_imagine_left_normal.vmd|PART|ONCE
1025  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01041-01060 食堂（案内）

1015  1041  RECOG_EVENT_STOP|食堂               SYNTH_START|mei|mei_voice_normal|南門から入って左側に見える建物が食堂です。
1041  1042  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1042  1043  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
1043  1044  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
1044  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01061-01080 小町（案内）

1015  1061  RECOG_EVENT_STOP|小町               SYNTH_START|mei|mei_voice_normal|6号館の604号室にいます。
1061  1062  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1062  1063  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
1063  1064  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
1064  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01081-01100 システムデザイン論（案内）

1015  1081  RECOG_EVENT_STOP|システムデザイン論 SYNTH_START|mei|mei_voice_normal|木曜3限に2号館の大講義室で行われています。
1081  1082  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1082  1083  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
1083  1084  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
1084  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01101-01120 ゆっくりできる場所（案内）

1015  1101  RECOG_EVENT_STOP|ゆっくり           SYNTH_START|mei|mei_voice_normal|2号101号室が休憩スペースになっています。
1101  1102  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1102  1103  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
1103  1104  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
1104  1011  SYNTH_EVENT_STOP|mei                <eps>

# 01121-01140 案内→紹介

1015  1121  RECOG_EVENT_STOP|紹介               SYNTH_START|mei|mei_voice_normal|かしこまりました。
1121  1122  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
1122  1123  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どこを紹介しましょうか？
1123  1124  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
1124  151  SYNTH_EVENT_STOP|mei                <eps>
