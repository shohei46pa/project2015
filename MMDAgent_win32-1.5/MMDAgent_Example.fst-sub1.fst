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


# 0021-0030 Idle behavior

2    321   <eps>                               TIMER_START|idle1|20
321  322   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
322  323   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
323  1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE


#案内開始

1  161  RECOG_EVENT_STOP|案内               SYNTH_START|mei|mei_voice_normal|かしこまりました。
161  162  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
162  163  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|どちらに行きたいですか？
163  164  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
164  171  SYNTH_EVENT_STOP|mei                <eps>

# 0171-0180 案内待機

171  172   <eps>                               TIMER_START|idle1|20
172  173   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
173  174  TIMER_EVENT_START|idle2             TIMER_START|idle3|60
174  175  TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
175  175  RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
175  175  TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
175  175  TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
175  171  TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0271-0280 2号館（案内) 

175  271  RECOG_EVENT_STOP|2号館              STAGE|Stage\building3\floor.bmp,Stage\building3\eg.jpg
271  272  <eps>                               SYNTH_START|mei|mei_voice_normal|正門から入り右側にある建物が2号館です。
272  273  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
273  274  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
274  275  <eps>                               MOTION_ADD|mei|action|Motion\mei_imagine\mei_imagine_left_normal.vmd|PART|ONCE
275  171  SYNTH_EVENT_STOP|mei                <eps>

# 0231-0240 食堂（案内）

175  231  RECOG_EVENT_STOP|食堂               SYNTH_START|mei|mei_voice_normal|南門から入って左側に見える建物が食堂です。
231  232  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
232  233  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
233  234  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
234  171  SYNTH_EVENT_STOP|mei                <eps>

# 0241-0250 小町（案内）

175  241  RECOG_EVENT_STOP|小町               SYNTH_START|mei|mei_voice_normal|6号館の604号室にいます。
241  242  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
242  243  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
243  244  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
244  171  SYNTH_EVENT_STOP|mei                <eps>

# 0251-0260 システムデザイン論（案内）

175  251  RECOG_EVENT_STOP|システムデザイン論 SYNTH_START|mei|mei_voice_normal|木曜3限に2号館の大講義室で行われています。
251  252  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
252  253  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
253  254  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
254  171  SYNTH_EVENT_STOP|mei                <eps>

# 0261-0270 ゆっくりできる場所（案内）

175  261  RECOG_EVENT_STOP|ゆっくり           SYNTH_START|mei|mei_voice_normal|2号101号室が休憩スペースになっています。
261  262  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
262  263  SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|分かりましたか？
263  264  <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
264  171  SYNTH_EVENT_STOP|mei                <eps>

