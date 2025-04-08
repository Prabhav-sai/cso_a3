.global peak

peak:   # %rdi , %rsi , %rdx , %rcx    (order of input)
    # (int) %edi = n , (short) %si = rooms
    # (int) %r8d = l , %r9d = r , %r10d = mid , (short) %r11w = temp
    
    cmp $1 , %edi
    je L5

    movw (%rsi) , %r11w
    cmp 2(%rsi) , %r11w      # ((%rsi) - 2(%rsi)) = (rooms[0] - rooms[1]) = rooms[0] >= rooms[1]
    jge L5

    movw -2(%rsi,%rdi,2) , %r11w
    cmp -4(%rsi,%rdi,2) , %r11w
    jge L6

    movl $0 , %r8d           # l = 0
    movl %edi , %r9d         # r = n
    decl %r9d                # r = n-1

L2:
    cmp %r8d , %r9d           # %r9 - %r8 = r - l <= 0
    jle L4

    movl %r9d , %r10d         # mid = r
    subl %r8d , %r10d         # mid = r - l
    sarl $1 , %r10d          # mid = (r-l)/2
    addl %r8d , %r10d         # mid = (r-l)/2 + l

    movw (%rsi,%r10,2) , %r11w
    cmp 2(%rsi,%r10,2) , %r11w        # (rooms[mid]-rooms[mid+1]) rooms[mid] < rooms[mid+1]
    jl L3

    movl %r10d , %r9d         # r = mid

    jmp L2

L3:
    movl %r10d , %r8d     # l = mid
    incl %r8d            # l = mid + 1

    jmp L2

L4:
    movw (%rsi,%r8,2) , %ax
    ret

L5:
    movw (%rsi) , %ax
    ret

L6:
    movw -2(%rsi,%rdi,2) , %ax
    ret
