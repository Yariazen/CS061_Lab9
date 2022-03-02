.orig x3000
;this stack lab computes the polish notation of a set of calls
LD      R6, STACK_ADDR

LD      R5, PUSH_VAL_ADDR
LD      R4, ADD_VAL_ADDR

AND     R3, R3, x0
;push_val(4) pushes the value 4 onto the stack [4]
ADD     R1, R3, 4
JSRR    R5

;push_val(3) pushes the value 3 onto the stack [4,3]
ADD     R1, R3, 3
JSRR    R5

;push_val(2) pushes the value 2 onto the stack [4,3,2]
ADD     R1, R3, 2
JSRR    R5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
JSRR    R4

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
JSRR    R4

;move the top value of the stack into r4
LDR     R4, R6, 0

HALT

PUSH_VAL_ADDR   .FILL   x3400
ADD_VAL_ADDR    .FILL   x3800

STACK_ADDR      .FILL   xFE00

.end

.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
ST      R7, BACKUP_R7_3400

ADD     R6, R6, -1
STR     R1, R6, 0

LD      R7, BACKUP_R7_3400
RET

BACKUP_R7_3400  .BLKW   1
.end

.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
ST      R7, BACKUP_R7_3800

LDR     R2, R6, 0
ADD     R6, R6, 1
LDR     R3, R6, 0
ADD     R6, R6, 1

ADD     R1, R2, R3
JSRR    R5

LD      R7, BACKUP_R7_3800
RET

BACKUP_R7_3800  .BLKW   1
.end

.orig x4200 ;;data you might need

.end