.section INTERRUPT_VECTOR, "x"
.global _Reset
_Reset:
  B Reset_Handler
  B .
  B .
  B .
  B .
  B .
  B .
  B .

Reset_Handler:
  LDR sp, =stack_top
  BL c_entry
  B .
	