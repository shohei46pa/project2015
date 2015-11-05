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
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\mei\mei.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14   15   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\background.bmp
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
 
1    31   RECOG_EVENT_STOP|����ɂ���         SYNTH_START|mei|mei_voice_normal|����ɂ��́B
1    31   RECOG_EVENT_STOP|����ɂ���         SYNTH_START|mei|mei_voice_normal|����ɂ��́B
1    31   RECOG_EVENT_STOP|���͂悤           SYNTH_START|mei|mei_voice_normal|���͂悤�������܂��B
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|���ȏЉ�           SYNTH_START|mei|mei_voice_normal|���C�ƌ����܂��B
1    41   RECOG_EVENT_STOP|���Ȃ�,�N          SYNTH_START|mei|mei_voice_normal|���C�ƌ����܂��B
1    41   RECOG_EVENT_STOP|�N,�N              SYNTH_START|mei|mei_voice_normal|���C�ƌ����܂��B
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|��낵�����肢���܂��B
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|���肪��           SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
1    51   RECOG_EVENT_STOP|���肪�Ƃ�         SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
1    51   RECOG_EVENT_STOP|�L�             SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
1    51   RECOG_EVENT_STOP|�L��           SYNTH_START|mei|mei_voice_normal|�ǂ��������܂��āB
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|���ł��A�b�������Ă��������ˁB
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|����             VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|���킢��           VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|�Y��               VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|���ꂢ             VALUE_EVAL|random|LE|80
61   62   VALUE_EVENT_EVAL|random|LE|80|TRUE  SYNTH_START|mei|mei_voice_bashful|�p���������ł��B
61   62   VALUE_EVENT_EVAL|random|LE|80|FALSE SYNTH_START|mei|mei_voice_bashful|���肪�Ƃ��B
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0090 Guide

1    71   RECOG_EVENT_STOP|�}����             MODEL_DELETE|menu
71   72   <eps>                               MODEL_ADD|panel|Accessory\test\test.pmd|0.0,1.4,2.5|45.0,0.0,0.0|ON|mei
72   73   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
73   74   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|�}���ق́A���ʂ��猩��ƁA�E�O�̕����ɂ���܂��B
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
76   77   <eps>                               SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
77   78   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
78   79   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
79   80   <eps>                               SYNTH_START|mei|mei_voice_normal|������ɂȂ�܂����H
80   81   SYNTH_EVENT_STOP|mei                MODEL_DELETE|panel
81   82   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
82   83   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
83   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|�o�C�o�C           SYNTH_START|mei|mei_voice_normal|���悤�Ȃ�B
1    91   RECOG_EVENT_STOP|���悤�Ȃ�         SYNTH_START|mei|mei_voice_normal|���悤�Ȃ�B
1    91   RECOG_EVENT_STOP|����Ȃ�           SYNTH_START|mei|mei_voice_normal|���悤�Ȃ�B
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   2    SYNTH_EVENT_STOP|mei                <eps>
��
# 0101-0110 Browsing

1    101  RECOG_EVENT_STOP|�z�[���y�[�W       EXECUTE|http://www.mmdagent.jp/
1    101  RECOG_EVENT_STOP|�l�l�c�`��������   EXECUTE|http://www.mmdagent.jp/
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|�l�l�c�`���������́A�z�[���y�[�W��\�����܂��B
102  2    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|�t���X�N���[��     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|�X�N���[���̐ݒ���A�ύX���܂����B
112  2    SYNTH_EVENT_STOP|mei                <eps>

# 0121-0130 Guide

1    121  RECOG_EVENT_STOP|���C�����         SYNTH_START|mei|mei_voice_normal|�p���͉��ł����B
121  122    <eps>                               MOTION_ADD|mei|action|Motion\mei_guide\mei_guide_happy.vmd|PART|ONCE
122  131  SYNTH_EVENT_STOP|mei             �@ <eps>

# 0131-0140 Idle behavior2

131  132   <eps>                               TIMER_START|idle1|20
132  133   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
133  134  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
134  135  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
135  135  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
135  135  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
135  135  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
135  131  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0141-0150 Pre

135  141  RECOG_EVENT_STOP|�Љ�               SYNTH_START|mei|mei_voice_normal|�������܂�܂����B
141  142  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
142  143  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|�ǂ����Љ�܂��傤���H
143  144  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
144  151  SYNTH_EVENT_STOP|mei                <eps>

# 0151-0160 �Љ�ҋ@

151  152   <eps>                               TIMER_START|idle1|20
152  153   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
153  154  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
154  155  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
155  155  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
155  155  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
155  155  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
155  151  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE
�@
# 0181-0190 2���فi�Љ�j

155  181  RECOG_EVENT_STOP|2����              SYNTH_START|mei|mei_voice_normal|�����ł͎�ɁA���k���u�`���󂯂Ă��܂��B
181  182  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
182  183  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
183  184  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
184  151  SYNTH_EVENT_STOP|mei                <eps>

# 0191-0200 �H���i�Љ�j

155  191  RECOG_EVENT_STOP|�H��               SYNTH_START|mei|mei_voice_normal|�����ɂ́A�w���A�����݂̂Ȃ��񂪂����ŐH�������Ă��܂��B
191  192  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
192  193  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
193  194  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
194  151  SYNTH_EVENT_STOP|mei                <eps>

# 0201-0210 �����i�Љ�j

155  201  RECOG_EVENT_STOP|����               SYNTH_START|mei|mei_voice_normal|������y�����́A���R���ꏈ���̕���Ō������Ă��܂��B
201  202  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
202  203  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
203  204  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
204  151  SYNTH_EVENT_STOP|mei                <eps>

# 0211-0220 �V�X�e���f�U�C���_�i�Љ�j

155  211  RECOG_EVENT_STOP|�V�X�e���f�U�C���_ SYNTH_START|mei|mei_voice_normal|�ؗj3���ɍs���Ă���u�`�ł��B
211  212  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
212  213  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
213  214  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
214  151  SYNTH_EVENT_STOP|mei                <eps>

# 0221-0230 13���فi�Љ�j

155  221  RECOG_EVENT_STOP|13����             SYNTH_START|mei|mei_voice_normal|�����ł͎�ɁA�������s���Ă��܂��B
221  222  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
222  223  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
223  224  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
224  151  SYNTH_EVENT_STOP|mei                <eps>

#�ē��J�n

135  161  RECOG_EVENT_STOP|�ē�               SYNTH_START|mei|mei_voice_normal|�������܂�܂����B
161  162  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
162  163  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|�ǂ���ɍs�������ł����H
163  164  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
164  171  SYNTH_EVENT_STOP|mei                <eps>

# 0171-0180 �ē��ҋ@

171  172   <eps>                               TIMER_START|idle1|20
172  173   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
173  174  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
174  175  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
175  175  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
175  175  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
175  175  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
175  171  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0271-0290 2���فi�ē�) 

175  271   RECOG_EVENT_STOP|�񍆊�             MODEL_DELETE|menu
271  272   <eps>                               MODEL_ADD|panel|Accessory\map\nigoukan.pmd|0.0,1.4,2.5|45.0,0.0,0.0|ON|mei
272  273   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
273  274   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
274  275   <eps>                               SYNTH_START|mei|mei_voice_normal|�񍆊ق́A���傩�����E���ɂ��錚���ł��B�A
275  276   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
276  277   <eps>                               SYNTH_START|mei|mei_voice_normal|�L�����p�X�}�b�v�ł́A������ɂȂ�܂��B
277  278   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
278  279   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
279  280   <eps>                               SYNTH_START|mei|mei_voice_normal|������ɂȂ�܂����H
280  281   SYNTH_EVENT_STOP|mei                MODEL_DELETE|panel
281  282   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
282  283   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
283  171    <eps>                              MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0231-0240 �H���i�ē��j

175  231  RECOG_EVENT_STOP|�H��               SYNTH_START|mei|mei_voice_normal|��傩������č����Ɍ����錚�����H���ł��B
231  232  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
232  233  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
233  234  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
234  171  SYNTH_EVENT_STOP|mei                <eps>

# 0241-0250 �����i�ē��j

175  241  RECOG_EVENT_STOP|����               SYNTH_START|mei|mei_voice_normal|6���ق�604�����ɂ��܂��B
241  242  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
242  243  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
243  244  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
244  171  SYNTH_EVENT_STOP|mei                <eps>

# 0251-0260 �V�X�e���f�U�C���_�i�ē��j

175  251  RECOG_EVENT_STOP|�V�X�e���f�U�C���_ SYNTH_START|mei|mei_voice_normal|�ؗj3����2���ق̑�u�`���ōs���Ă��܂��B
251  252  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
252  253  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
253  254  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
254  171  SYNTH_EVENT_STOP|mei                <eps>

# 0261-0270 �������ł���ꏊ�i�ē��j

175  261  RECOG_EVENT_STOP|�������           SYNTH_START|mei|mei_voice_normal|2��101�������x�e�X�y�[�X�ɂȂ��Ă��܂��B
261  262  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
262  263  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|������܂������H
263  264  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
264  171  SYNTH_EVENT_STOP|mei                <eps>

