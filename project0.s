.data
id: .asciiz "@03060000\n"
.text
main:

li $v0, 4
la $a0, id
syscall
