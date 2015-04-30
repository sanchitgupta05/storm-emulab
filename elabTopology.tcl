set ns [new Simulator]
source tb_compat.tcl
set maxnodes 4
set lanstr ""

for {set i 1} {$i <= $maxnodes} {incr i} {
	set hosts($i) [$ns node]
	append lanstr "$hosts($i) "
	tb-set-node-os $hosts($i) UBUNTU14-64-STD
}

set big-lan [$ns make-lan "$lanstr" 100Mb 0ms]

$ns rtproto Static

#Go!
$ns run