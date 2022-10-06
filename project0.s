.data
id: .asciiz "@03060000\n"
.text
main:

# Output 1 should be 000@03060
# id holds address to @03060000

# First round of swaps
la $t0, id # load address of id in $t0
lb $t1, 6($t0) # t1 has 0
lb $t2, 0($t0) # t2 has @
sb $t1, 0($t0) # word is 003060000
lb $t1, 3($t0) # t1 has 0
sb $t2, 3($t0) # word is 003@60000
sb $t1, 6($t0) # word is 003@60000

#Second Round of Swaps
lb $t2, 7($t0) # t2 has 0
lb $t1, 1($t0) # t1 has 0
sb $t2, 1($t0) # word is 003@60000
lb $t2, 4($t0) # t2 has 6
sb $t1, 4($t0) # word is 003@00000
sb $t2, 7($t0) # word is 003@00060


# third round of swaps
lb $t1, 8($t0) # t1 has 0
lb $t2, 2($t0) # t2 has 3
sb $t1, 2($t0) # word is 000@00060
lb $t1, 5($t0) # t2 has 0
sb $t2, 5($t0) # word is 000@03060 
sb $t1, 8($t0) # word is 000@03060

li $v0, 4
la $a0, id
syscall

li $s1, 0 # start of the counter
li $s2, 8 # end of the counter

# offset each character by 1
lb $t1, 0($t0)  
lb $t2, 8($t0)  
sb $t1, 8($t0) 
lb $t1, 7($t0) 
sb $t2, 7($t0) 
lb $t2, 6($t0) 
sb $t1, 6($t0) 
lb $t1, 5($t0) 
sb $t2, 5($t0)
lb $t2, 4($t0) 
sb $t1, 4($t0) 
lb $t1, 3($t0) 
sb $t2, 3($t0) 
lb $t2, 2($t0) 
sb $t1, 2($t0)
lb $t1, 1($t0)
sb $t2, 1($t0) 
lb $t2, 0($t0) 
sb $t1, 0($t0) 
li $v0, 4
syscall

li $v0, 10
syscall


