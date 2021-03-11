set kernelpath='c:\projects\C256\github\Kernel\Kernel_FMX\master\src\'
set outputpath='headers_fmx'

@rem ********************
if exist includes.pas del includes.pas
if not exist %outputpath% mkdir %outputpath%
call defasm2pas.py %outputpath% %kernelpath%'\basic_inc'
call defasm2pas.py %outputpath% %kernelpath%'\ch376s_inc'
call defasm2pas.py %outputpath% %kernelpath%'\dram_inc'
call defasm2pas.py %outputpath% %kernelpath%'\fdc_inc'
call defasm2pas.py %outputpath% %kernelpath%'\GABE_Control_Registers_def'
call defasm2pas.py %outputpath% %kernelpath%'\interrupt_def'
call defasm2pas.py %outputpath% %kernelpath%'\io_def'
call defasm2pas.py %outputpath% %kernelpath%'\kernel_inc' 'KERNEL_'
call defasm2pas.py %outputpath% %kernelpath%'\keyboard_def'
call defasm2pas.py %outputpath% %kernelpath%'\Math_def'
call defasm2pas.py %outputpath% %kernelpath%'\Math_Float_def'
call defasm2pas.py %outputpath% %kernelpath%'\monitor_inc'
call defasm2pas.py %outputpath% %kernelpath%'\OPL3_def'
call defasm2pas.py %outputpath% %kernelpath%'\RTC_def'
call defasm2pas.py %outputpath% %kernelpath%'\SDCard_Controller_def'
call defasm2pas.py %outputpath% %kernelpath%'\sdos_fat_vars_fmx_inc'
call defasm2pas.py %outputpath% %kernelpath%'\sdos_fat_vars_user_inc'
call defasm2pas.py %outputpath% %kernelpath%'\SID_def'
call defasm2pas.py %outputpath% %kernelpath%'\super_io_def'
call defasm2pas.py %outputpath% %kernelpath%'\timer_def'
call defasm2pas.py %outputpath% %kernelpath%'\Trinity_CFP9301_def'
call defasm2pas.py %outputpath% %kernelpath%'\Unity_CFP9307_def'
call defasm2pas.py %outputpath% %kernelpath%'\vicky_ii_def'
call defasm2pas.py %outputpath% %kernelpath%'\VKYII_CFP9553_BITMAP_def'
call defasm2pas.py %outputpath% %kernelpath%'\VKYII_CFP9553_COLLISION_def'
call defasm2pas.py %outputpath% %kernelpath%'\VKYII_CFP9553_SDMA_def'
call defasm2pas.py %outputpath% %kernelpath%'\VKYII_CFP9553_SPRITE_def'
call defasm2pas.py %outputpath% %kernelpath%'\VKYII_CFP9553_TILEMAP_def'
call defasm2pas.py %outputpath% %kernelpath%'\VKYII_CFP9553_VDMA_def'




