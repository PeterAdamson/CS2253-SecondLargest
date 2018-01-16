;Author: Peter Adamson
;This code returns the second largest integer from an array of integers

ENTRY
START
	MOV	R0,#0    	;initializes counter used for offset to 0
	LDR	R1,=ARRAY       ;loads memory location of ARRAY into R1
	LDR	R2,[R1,R0]      ;loads first element in ARRAY into R2
	ADD	R0,R0,#4	;increments the counter
	LDR	R3,[R1,R0]      ;loads the second element in ARRAY into R3
	CMP	R2,R3	        ;compares R2 and R3
	MOVLT	R4,R2	        ;if R2 is less than R3, stores R2 temporarily in R4
	MOVLT	R2,R3	        ;if R2 is less than R3, stores R3 in R2.  R2 now contains the larger of the two numbers (temp largest)
	MOVLT	R3,R4	        ;moves R4 into R3.  R3 now contains the smaller of the two numbers (temp second largest)
L1	ADD	R0,R0,#4	;increments the counter
	LDR	R4,[R1,R0]      ;loads the ith element in ARRAY into R4
	CMP	R4,#0	        ;checks to see if R4 is equal to 0
	BEQ	END	        ;if R4 is equal to 0, end the loop
	CMP	R4,R3	        ;compares R4 with R3
	BLT	L1      	;if R4 is less than R3, no action is necessary.  Loop back to L1
	CMP	R4,R2	        ;compares R4 with R2
	MOVLT	R3,R4   	;if R4 is less than R2, replace R3 with R4.  R3 is now updated with the second largest number
	MOVGT	R3,R2	        ;if R4 is greater than R2, move R2 into R3.  R3 is now updated with the second largest number
	MOVGT	R2,R4	        ;if R4 is greater than R2, move R4 into R2.  R2 is now updated with the largest number
	B	L1		;loop back to L1
END	STR	R3,secL	        ;once the loop has reached the end of ARRAY, store R3, which now contains the second largest number, in secL
STOP	B	STOP
ARRAY	DCD	12,5,-8,125,56,-60,2,0
secL	SPACE	4
