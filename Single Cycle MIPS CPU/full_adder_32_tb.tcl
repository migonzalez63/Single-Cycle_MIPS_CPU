
set labelCount 3                                             
set uniqueLabel 198648576

############################Common TCL Procedures################################

proc IntegerToBinary  {intValue width} {
	set nextvaltmp ""
	set nextval ""
	for {set i $width} {$i > 0 } {set i [expr {$i - 1}]} {
		if {[expr {$intValue % 2}] == 0} { 
			append nextvaltmp "0"
		} else {
			append nextvaltmp "1" 
		}
		set intValue [expr {$intValue / 2}]
	}
	for {set i [expr {$width - 1}]} {$i >=  0 } {set i [expr {$i - 1}]} {
		append nextval [string range $nextvaltmp $i $i]
	}
	return $nextval
}
proc CreateRangeUpCounter {startValue loopCount step curTime period unit width driveType signal} {
     global uniqueLabel labelCount
     set absTime ""
     append absTime "@" $curTime 
     set value $startValue 
     set label $uniqueLabel 

     for {set i 0 } {$i <= $loopCount} {incr i} {
             set labelCount [expr {$labelCount + 1}]
             append label "_"
             append label $labelCount

             if {$absTime != "@0" && $::now != $curTime} {
                     when -label $label "\$now = $absTime $unit" " 
                             set whenArray($label) $label
                             noforce $signal
                             force -$driveType $signal [eval IntegerToBinary $value $width] 0 
                     "
             }
             if {$step < [expr pow(2, $width)]} {
             	set value [expr {$value + $step}]
             }
             set curTime [expr {$period + $curTime}] 
             set absTime ""
             append absTime "@" $curTime 
             set label $uniqueLabel
     }
}
proc CreateRangeDownCounter {startValue loopCount step curTime period unit width driveType signal} {
     global uniqueLabel labelCount
     set absTime ""
     append absTime "@" $curTime 
     set value $startValue 
     set label $uniqueLabel 

     for {set i 0 } {$i <= $loopCount} {incr i} {
             set labelCount [expr {$labelCount + 1}]
             append label "_"
             append label $labelCount

             if {$absTime != "@0" && $::now != $curTime} {
                     when -label $label "\$now = $absTime $unit" " 
                             set whenArray($label) $label
                             noforce $signal
                             force -$driveType $signal [eval IntegerToBinary $value $width] 0 
                     "
             }
             if {$step < [expr pow(2, $width)]} {
             set value [expr {$value - $step}]
             }
             set curTime [expr {$period + $curTime}] 
             set absTime ""
             append absTime "@" $curTime 
             set label $uniqueLabel
     }
}

#################################################################################


##Editing for Signal sim:/full_adder_32/a
# "Counter Pattern"(Range-Up) : step = 1 Range(00000000000000000000000000000000-11111111111111111111111111111111)
# Start Time = 0 ps, End Time = 1 ns, Period = 50 ps
#################################################################################

when -label 198648576_1 {$now = @1000 ps} {
        set whenArray(198648576_1) 198648576_1
        noforce sim:/full_adder_32/a
        force -freeze sim:/full_adder_32/a 00000000000000000000000000010011 0 ps
}


##Editing for Signal sim:/full_adder_32/cin
# "Constant Pattern"
# Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
#################################################################################

        noforce sim:/full_adder_32/cin
        force -freeze sim:/full_adder_32/cin 0 0 ps 

when -label 198648576_2 {$now = @1000 ps} {
        set whenArray(198648576_2) 198648576_2
        noforce sim:/full_adder_32/cin
        force -freeze sim:/full_adder_32/cin 0 0 ps
}


##Editing for Signal sim:/full_adder_32/b
# "Counter Pattern"(Range-Down) : step = 1 Range(01111111111111111111111111111111-00000000000000000000000000000000)
# Start Time = 0 ps, End Time = 1 ns, Period = 50 ps
#################################################################################
        noforce sim:/full_adder_32/b
        force -freeze sim:/full_adder_32/b [eval IntegerToBinary 2147483647 32] 0
        CreateRangeDownCounter 2147483646 18 1 50  50 ps 32 freeze {sim:/full_adder_32/b} 

when -label 198648576_3 {$now = @1000 ps} {
        set whenArray(198648576_3) 198648576_3
        noforce sim:/full_adder_32/b
        force -freeze sim:/full_adder_32/b 01111111111111111111111111101100 0 ps
}
