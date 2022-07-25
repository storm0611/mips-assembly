$LC0:
        .ascii  "%d values copied\012\000"
main:
        lui     $2,%hi(source)    
        lw      $4,%lo(source)($2)  
        addiu   $sp,$sp,-32   
        sw      $31,28($sp)
        beq     $4,$0,$L4
        nop
        # load source
        addiu   $2,$2,%lo(source)     
        lw      $5,4($2)     
        # copy source to dest
        lui     $3,%hi(dest)       
        sw      $4,%lo(dest)($3)     
        # compare end point
        beq     $5,$0,$L5
        nop
        # load source
        lw      $4,8($2)    
        # copy source to dest
        addiu   $3,$3,%lo(dest)      
        sw      $5,4($3)     
        # compare end point
        beq     $4,$0,$L6
        nop
        # load
        lw      $5,12($2)    
        # copy to dest
        sw      $4,8($3)     
        # compare
        beq     $5,$0,$L7
        nop
        # load
        lw      $4,16($2)   
        # copy to dest
        sw      $5,12($3)    
        # compare
        beq     $4,$0,$L8
        nop
        # load
        lw      $2,20($2)    
        # copy to dest
        sw      $4,16($3)    
        # compare
        beq     $2,$0,$L9
        nop
        # copy to dest
        sw      $2,20($3)    
        li      $5,6                        
$L2:
        lui     $4,%hi($LC0)      
        addiu   $4,$4,%lo($LC0)       
        jal     printf
        nop
        lw      $31,28($sp)  
        move    $2,$0   
        addiu   $sp,$sp,32   
        j       $31
        nop
$L4:
        move    $5,$0   
        b       $L2
        nop
$L5:
        li      $5,1                    
        b       $L2
        nop
$L6:
        li      $5,2                       
        b       $L2
        nop
$L7:
        li      $5,3                     
        nop
$L8:
        li      $5,4                       
        b       $L2
        nop
$L9:
        li      $5,5                       
        b       $L2
        nop

source:
        .word   3
        .word   1
        .word   4
        .word   1
        .word   5
        .word   9
        .word   0
