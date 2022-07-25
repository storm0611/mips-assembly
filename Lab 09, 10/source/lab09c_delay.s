$LC0:
        .ascii  "%d values copied\012\000"
main:
        lui     $2,%hi(source)
        lw      $4,%lo(source)($2)
        addiu   $sp,$sp,-32
        beq     $4,$0,$L4
        sw      $31,28($sp)

        lui     $3,%hi(dest)
        addiu   $3,$3,%lo(dest)
        addiu   $2,$2,%lo(source)
        move    $5,$0
$L3:
	# Here is the part assembly code for the loop that copies source values to destination values
	# $3: dest, $2: source
        sw      $4,0($3)
        lw      $4,4($2)
        addiu   $5,$5,1
        addiu   $3,$3,4
        bne     $4,$0,$L3
        addiu   $2,$2,4
        #

$L2:
        lui     $4,%hi($LC0)
        jal     printf
        addiu   $4,$4,%lo($LC0)

        lw      $31,28($sp)
        move    $2,$0
        j       $31
        addiu   $sp,$sp,32

$L4:
        b       $L2
        move    $5,$0

dest:
source:
        .word   3
        .word   1
        .word   4
        .word   1
        .word   5
        .word   9
        .word   0