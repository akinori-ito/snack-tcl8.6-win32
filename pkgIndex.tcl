package ifneeded snack 2.2 "[list load [file join $dir libsnack.dll]]; [list source [file join $dir snack_create_icons.tcl]]"
package ifneeded sound 2.2 [list load [file join $dir libsound.dll]]
