
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:072

00:00:082	
538.7732	
237.109Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/utils_1/imports/synth_1/TOP.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2^
\C:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/utils_1/imports/synth_1/TOP.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
e
Command: %s
53*	vivadotcl24
2synth_design -top SUPER_TOP -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7a100tcsg324-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
19028Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1406.059 ; gain = 448.773
h px� 
�
Uactual for formal port '%s' is neither a static name nor a globally static expression5370*oasys2
reset2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
648@Z8-9112h px� 
�
Uactual for formal port '%s' is neither a static name nor a globally static expression5370*oasys2

f_enable2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1138@Z8-9112h px� 
�
Uactual for formal port '%s' is neither a static name nor a globally static expression5370*oasys2
reset2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SUPER_TOP.vhd2
328@Z8-9112h px� 
�
Uactual for formal port '%s' is neither a static name nor a globally static expression5370*oasys2
reset2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SUPER_TOP.vhd2
518@Z8-9112h px� 
�
synthesizing module '%s'638*oasys2
	SUPER_TOP2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SUPER_TOP.vhd2
248@Z8-638h px� 
�
synthesizing module '%s'638*oasys2
TOP2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
228@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
FSM2T
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/FSM.vhd2
342
u_FSM2
FSM2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
958@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
FSM2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/FSM.vhd2
458@Z8-638h px� 
�
default block is never used226*oasys2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/FSM.vhd2
728@Z8-226h px� 
�
default block is never used226*oasys2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/FSM.vhd2
888@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
FSM2
02
12V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/FSM.vhd2
458@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DIGIT_FLASH2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
42
u_DIGIT_FLASH2
DIGIT_FLASH2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1078@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
DIGIT_FLASH2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
168@Z8-638h px� 
P
%s
*synth28
6	Parameter MODULE bound to: 40000000 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	f_divider2Z
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/f_divider.vhd2
82
f_divider_inst2
	f_divider2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
608@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	f_divider2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/f_divider.vhd2
218@Z8-638h px� 
P
%s
*synth28
6	Parameter MODULE bound to: 40000000 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	f_divider2
02
12\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/f_divider.vhd2
218@Z8-256h px� 
H
%s
*synth20
.	Parameter WIDHT bound to: 3 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
DECODER2X
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DECODER.vhd2
342
decoder_inst2	
DECODER2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
728@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
DECODER2Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DECODER.vhd2
448@Z8-638h px� 
H
%s
*synth20
.	Parameter WIDHT bound to: 3 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
DECODER2
02
12Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DECODER.vhd2
448@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
CHANEL2Y
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
388@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
CHANEL2
02
12Y
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
388@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CHANEL2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/CHANEL.vhd2
262
chanel_inst2
CHANEL2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
868@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
DIGIT_FLASH2
02
12^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/DIGIT_FLASH.vhd2
168@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

TIME_ADDER2[
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TIME_ADDER.vhd2
352
u_TIME_ADDER2

TIME_ADDER2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1198@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

TIME_ADDER2]
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TIME_ADDER.vhd2
468@Z8-638h px� 
�
default block is never used226*oasys2]
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TIME_ADDER.vhd2
828@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

TIME_ADDER2
02
12]
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TIME_ADDER.vhd2
468@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
42
u_SYNCHRNZR_U2
	SYNCHRNZR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1308@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	SYNCHRNZR2Y
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
118@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	SYNCHRNZR2
02
12Y
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
118@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
42
u_SYNCHRNZR_D2
	SYNCHRNZR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1378@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
42
u_SYNCHRNZR_L2
	SYNCHRNZR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1448@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
42
u_SYNCHRNZR_R2
	SYNCHRNZR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2W
UC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SINCRO.vhd2
42
u_SYNCHRNZR_START2
	SYNCHRNZR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1588@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2U
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
42
u_EDGEDTCTR_START2
	EDGEDTCTR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1668@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	EDGEDTCTR2W
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
128@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	EDGEDTCTR2
02
12W
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
128@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2U
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
42
u_EDGEDTCTR_R2
	EDGEDTCTR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1748@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2U
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
42
u_EDGEDTCTR_L2
	EDGEDTCTR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1818@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2U
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
42
u_EDGEDTCTR_U2
	EDGEDTCTR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1888@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	EDGEDTCTR2U
SC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/asdf.vhd2
42
u_EDGEDTCTR_D2
	EDGEDTCTR2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
1948@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
TOP2
02
12V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP.vhd2
228@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
TOP_display2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP_display.vhd2
348@Z8-638h px� 
�
synthesizing module '%s'638*oasys2
clock_divider2`
\C:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/clock_divider.vhd2
338@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
clock_divider2
02
12`
\C:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/clock_divider.vhd2
338@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
contador_0_a_72Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Counter.vhd2
338@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
contador_0_a_72
02
12Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Counter.vhd2
338@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
mux_32bit_4out2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/MUX.vhd2
338@Z8-638h px� 
�
default block is never used226*oasys2V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/MUX.vhd2
378@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
mux_32bit_4out2
02
12V
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/MUX.vhd2
338@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
bcd_to_7seg2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Dec_7_seg.vhd2
338@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
bcd_to_7seg2
02
12\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Dec_7_seg.vhd2
338@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
binary_3bit_decoder2Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Dec_3_8.vhd2
318@Z8-638h px� 
�
default block is never used226*oasys2Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Dec_3_8.vhd2
388@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
binary_3bit_decoder2
02
12Z
VC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/Dec_3_8.vhd2
318@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
TOP_display2
02
12^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/TOP_display.vhd2
348@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
	top_timer2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
448@Z8-638h px� 
O
%s
*synth27
5	Parameter module bound to: 1000000 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

fdivider2Y
WC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/fdivider.vhd2
342
Inst_fdivider2

fdivider2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1008@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

fdivider2[
WC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/fdivider.vhd2
468@Z8-638h px� 
O
%s
*synth27
5	Parameter module bound to: 1000000 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

fdivider2
02
12[
WC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/fdivider.vhd2
468@Z8-256h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 9 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
counter2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
62
Inst_counterums2	
counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1118@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
counter2^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
208@Z8-638h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 9 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
counter2
02
12^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
208@Z8-256h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 9 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
counter2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
62
Inst_counterdms2	
counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1248@Z8-3491h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 9 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
counter2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
62
Inst_counterus2	
counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1378@Z8-3491h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 5 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
counter2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
62
Inst_counterds2	
counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1508@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
counter__parameterized22^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
208@Z8-638h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 5 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
counter__parameterized22
02
12^
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
208@Z8-256h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 9 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
counter2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
62
Inst_counterumin2	
counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1638@Z8-3491h px� 
G
%s
*synth2/
-	Parameter SIZE bound to: 5 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
counter2\
ZC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/dms_counter.vhd2
62
Inst_counterdmin2	
counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1768@Z8-3491h px� 
H
%s
*synth20
.	Parameter SIZE bound to: 24 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
hour_counter2[
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/24_counter.vhd2
272
Inst_hour_counter2
hour_counter2\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
1898@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
hour_counter2]
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/24_counter.vhd2
408@Z8-638h px� 
H
%s
*synth20
.	Parameter SIZE bound to: 24 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
hour_counter2
02
12]
YC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/24_counter.vhd2
408@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	top_timer2
02
12\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/top_timer.vhd2
448@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	SUPER_TOP2
02
12\
XC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/sources_1/new/SUPER_TOP.vhd2
248@Z8-256h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
RESET2
DIGIT_FLASHZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1520.949 ; gain = 563.664
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1520.949 ; gain = 563.664
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1520.949 ; gain = 563.664
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0082

1520.9492
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2p
lC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/constrs_1/imports/Vivado/Nexys-4-DDR-Master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2p
lC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/constrs_1/imports/Vivado/Nexys-4-DDR-Master.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2n
lC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.srcs/constrs_1/imports/Vivado/Nexys-4-DDR-Master.xdc2
.Xil/SUPER_TOP_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1571.4882
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0032

1571.4882
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 20    
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 4     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 19    
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 16    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   8 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 96    
h p
x
� 
F
%s
*synth2.
,	   3 Input    4 Bit        Muxes := 14    
h p
x
� 
F
%s
*synth2.
,	   8 Input    4 Bit        Muxes := 16    
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 14    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:22 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:22 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!

Static Shift Register Report:
h p
x
� 
�
%s
*synth2�
�+------------+----------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|Module Name | RTL Name                         | Length | Width | Reset Signal | Pull out first Reg | Pull out last Reg | SRL16E | SRLC32E | 
h p
x
� 
�
%s
*synth2�
�+------------+----------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|SUPER_TOP   | U1/u_EDGEDTCTR_START/sreg_reg[0] | 4      | 1     | NO           | NO                 | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|SUPER_TOP   | U1/u_EDGEDTCTR_R/sreg_reg[0]     | 4      | 1     | NO           | YES                | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|SUPER_TOP   | U1/u_EDGEDTCTR_L/sreg_reg[0]     | 4      | 1     | NO           | YES                | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|SUPER_TOP   | U1/u_EDGEDTCTR_U/sreg_reg[0]     | 4      | 1     | NO           | YES                | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�|SUPER_TOP   | U1/u_EDGEDTCTR_D/sreg_reg[0]     | 4      | 1     | NO           | YES                | YES               | 1      | 0       | 
h p
x
� 
�
%s
*synth2�
�+------------+----------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |    20|
h px� 
2
%s*synth2
|3     |LUT1   |    12|
h px� 
2
%s*synth2
|4     |LUT2   |    55|
h px� 
2
%s*synth2
|5     |LUT3   |    30|
h px� 
2
%s*synth2
|6     |LUT4   |    87|
h px� 
2
%s*synth2
|7     |LUT5   |    95|
h px� 
2
%s*synth2
|8     |LUT6   |   207|
h px� 
2
%s*synth2
|9     |MUXF7  |     3|
h px� 
2
%s*synth2
|10    |SRL16E |     5|
h px� 
2
%s*synth2
|11    |FDCE   |    55|
h px� 
2
%s*synth2
|12    |FDPE   |    29|
h px� 
2
%s*synth2
|13    |FDRE   |   165|
h px� 
2
%s*synth2
|14    |IBUF   |     7|
h px� 
2
%s*synth2
|15    |OBUF   |    15|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 1571.488 ; gain = 563.664
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1571.488 ; gain = 614.203
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0122

1571.4882
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
23Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
1Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1571.4882
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

87febdb3Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1002
62
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:312

00:00:322

1571.4882

1027.531Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1571.4882
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2T
RC:/Users/tomeu/Desktop/C/github/SED_BAF/TRABAJO/TRABAJO.runs/synth_1/SUPER_TOP.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2]
[report_utilization -file SUPER_TOP_utilization_synth.rpt -pb SUPER_TOP_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Wed Dec 18 11:11:37 2024Z17-206h px� 


End Record