# Supplementary functions for snack
# by Akinori Ito, 2 May 2018
#
# Icon files by sozai.cman.jp

proc snack::createIcons {} {
  set libdir [file dirname [info library]]
  if {[file isdirectory $libdir/snack$snack::version]} {
    set snackdir $libdir/snack$snack::version
  } else {
    set snackdir [glob $libdir/snack*]
    if {[llength $snackdir] == 0} {
      error "Cannot find the snack directory"
    } elseif {[llength $snackdir] > 1} {
      set snackdir [lindex $snackdir 0]
    }
  }
  set icondir $snackdir/icons
  set iconfiles {
	{sozai_cman_jp_20180502175701.gif snackPlay} 
	{sozai_cman_jp_20180502175729.gif snackPause} 
	{sozai_cman_jp_20180502175805.gif snackFF} 
	{sozai_cman_jp_20180502180203.gif snackRew} 
	{sozai_cman_jp_20180502180318.gif snackNext} 
	{sozai_cman_jp_20180502180418.gif snackPrev} 
	{sozai_cman_jp_20180502180511.gif snackStop} 
	{sozai_cman_jp_20180502180640.gif snackRec} 
	{sozai_cman_jp_20180502180730.gif snackEject} 
	{sozai_cman_jp_20180502181415.gif snackOpen} 
	{sozai_cman_jp_20180502181415.gif snackSave} 
}

  for {set i 0} {$i < [llength $iconfiles]} {incr i} {
    image create photo [lindex $iconfiles $i 1] -file $icondir/[lindex $iconfiles $i 0] -format gif
  }
}

proc snack::fileDialog {dialogcmd args} {
  set types {
	{{MS Wave} {.wav}}
	{{MP3} {.mp3}}
	{{Raw file} {.raw}}
  }
  set opts [concat [list -defaultextension .wav -filetypes $types] $args]
  return [eval $dialogcmd $opts]
}

proc snack::getOpenFile args {
  return [eval snack::fileDialog tk_getOpenFile $args]
}

proc snack::getSaveFile args {
  return [eval snack::fileDialog tk_getSaveFile $args]
}
