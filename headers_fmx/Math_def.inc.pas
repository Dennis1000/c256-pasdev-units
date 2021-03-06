//////
////// Register address definitions for the math coprocessor
//////

// Unsigned Multiplier In A (16Bits), In B (16Bits), Answer (32Bits)
const
  UNSIGNED_MULT_A_LO  = $000100;
  UNSIGNED_MULT_A_HI  = $000101;
  UNSIGNED_MULT_B_LO  = $000102;
  UNSIGNED_MULT_B_HI  = $000103;
  UNSIGNED_MULT_AL_LO = $000104;
  UNSIGNED_MULT_AL_HI = $000105;
  UNSIGNED_MULT_AH_LO = $000106;
  UNSIGNED_MULT_AH_HI = $000107;

  // Unsigned Multiplier In A (16Bits), In B (16Bits), Answer (32Bits)
  SIGNED_MULT_A_LO    = $000108;
  SIGNED_MULT_A_HI    = $000109;
  SIGNED_MULT_B_LO    = $00010A;
  SIGNED_MULT_B_HI    = $00010B;
  SIGNED_MULT_AL_LO   = $00010C;
  SIGNED_MULT_AL_HI   = $00010D;
  SIGNED_MULT_AH_LO   = $00010E;
  SIGNED_MULT_AH_HI   = $00010F;

  // Unsigned Divide Denominator A (16Bits), Numerator B (16Bits),
  // Quotient (16Bits), Remainder (16Bits)
  UNSIGNED_DIV_DEM_LO = $000110;
  UNSIGNED_DIV_DEM_HI = $000111;
  UNSIGNED_DIV_NUM_LO = $000112;
  UNSIGNED_DIV_NUM_HI = $000113;
  UNSIGNED_DIV_QUO_LO = $000114;
  UNSIGNED_DIV_QUO_HI = $000115;
  UNSIGNED_DIV_REM_LO = $000116;
  UNSIGNED_DIV_REM_HI = $000117;

  //signed Divide Denominator A (16Bits), Numerator B (16Bits),
  // Quotient (16Bits), Remainder (16Bits)
  SIGNED_DIV_DEM_LO   = $000118;
  SIGNED_DIV_DEM_HI   = $000119;
  SIGNED_DIV_NUM_LO   = $00011A;
  SIGNED_DIV_NUM_HI   = $00011B;
  SIGNED_DIV_QUO_LO   = $00011C;
  SIGNED_DIV_QUO_HI   = $00011D;
  SIGNED_DIV_REM_LO   = $00011E;
  SIGNED_DIV_REM_HI   = $00011F;

  // 32Bit Adder
  ADDER32_A_LL        = $000120;
  ADDER32_A_LH        = $000121;
  ADDER32_A_HL        = $000122;
  ADDER32_A_HH        = $000123;
  ADDER32_B_LL        = $000124;
  ADDER32_B_LH        = $000125;
  ADDER32_B_HL        = $000126;
  ADDER32_B_HH        = $000127;

  ADDER32_R_LL        = $000128;
  ADDER32_R_LH        = $000129;
  ADDER32_R_HL        = $00012A;
  ADDER32_R_HH        = $00012B;
