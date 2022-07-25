	.data
source:	.word   3, 1, 4, 1, 5, 9, 0
dest:		.word   0, 0, 0, 0, 0, 0, 0
countmsg:	.asciiz " values copied. "

	.text
		.globl  loop	# prerequisite for using loop as argument
main:					# to "breakpoint" command
	add	$s0,$0 $ra		# Save our return address
      la	$a0,source
      la	$a1,dest
loop: lw	$v1,0($a0)		# read next word from source
      addi	$v0,$v0,1		# increment count words copied
      sw	$v1,0($a1)		# write to destination
      addi	$a0,$a0,4		# advance pointer to next source
      addi	$a1,$a1,4		# advance pointer to next dest
      bne	$v1,$zero,loop	# loop if word copied not zero
loopend:
	move	$a0,$v0		# We want to print the count
	li	$v0,1
	syscall			# Print it
	la	$a0,countmsg	# We want to print the count message
	li	$v0,4
	syscall			# Print it
	li	$a0,0x0A		# We want to print '\n'
	li	$v0,11
	syscall			# Print it
	jr	$s0			# Return from main.  We stored $ra in $s0
