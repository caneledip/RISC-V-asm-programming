.data
a: .word 1, 2, 3, 4, 5
b: .word 6, 7, 8, 9, 10
newline: .string ""

.text
main:
# register not to be used x0 - x4, x10 - x17
# Reason :

    addi x5, x0, 5 # x5 = 5
    addi x6, x0, 0 # sop = 0
 
    addi x7, x0, 0 # i = 0
    la x8, a # load address of a to x8
    la x9, b # load address of b to x9
    
    
loop1:
    bge x7, x5, exit1
    lw x18, 0(x8)
    lw x19, 0(x9)   # x7 = &b[i]
    mul x20, x18, x19 # a[i] * b[i] 
    add x6, x6, x20  # Add to sop
    addi x7, x7, 1   # i++
    addi x8, x8, 4   # add address by 4
    addi x9, x9, 4   # add address by 4
    j loop1
    
exit1:
    # print_int
    addi a0, x0, 1
    add a1, x0, x6
    ecall
    
