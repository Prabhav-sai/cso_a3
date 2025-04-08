.global boyer_moore

boyer_moore: # %rdi, %rsi , %rdx , %rcx , %r8 , % r9 (order of input)
            # %r8 = count , %r9 = counted , %r10 = i
            # %rdi = n , %rsi = nums
        
        movq $0     , %r8       # count = 0
        movq (%rsi) , %r9       # counted = nums[0]
        movq $0     , %r10      # i = 0

L2:
    cmp %r10 , %rdi       # (%rdi - %r10) = ( n - i <= 0 ) = ( n <=i )
    jle L6

    cmp (%rsi,%r10,8) , %r9     # ( counted - nums[i] != 0)
    jne L3

    incq %r8        # count++

    jmp L4

L3:
    decq %r8        # count--

L4:
    cmp $0 , %r8    # (count - 0 != 0)
    jne L5

    incq %r8                    # count++
    movq (%rsi,%r10,8) , %r9    # counted = nums[i]

L5:
    incq %r10
    jmp L2

L6:
    movq %r9 , %rax     # return value = counted
    ret
