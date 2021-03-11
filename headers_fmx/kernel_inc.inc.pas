//Kernel_INC.asm
//Kernel ROM jump table

const
  KERNEL_BOOT             = $001000;  // Cold boot routine
  KERNEL_RESTORE          = $001004;  // Warm boot routine
  KERNEL_BREAK            = $001008;  // End program and return to command prompt
  KERNEL_READY            = $00100C;  // Print prompt and wait for keyboard input
  KERNEL_SCINIT           = $001010;  //
  KERNEL_IOINIT           = $001014;  //
  KERNEL_PUTC             = $001018;  // Print a character to the currently selected channel
  KERNEL_PUTS             = $00101C;  // Print a string to the currently selected channel
  KERNEL_PUTB             = $001020;  // Output a byte to the currently selected channel
  KERNEL_PUTBLOCK         = $001024;  // Ouput a binary block to the currently selected channel
  KERNEL_SETLFS           = $001028;  // Obsolete (done in OPEN)
  KERNEL_SETNAM           = $00102C;  // Obsolete (done in OPEN)
  KERNEL_OPEN             = $001030;  // Open a channel for reading and/or writing. Use SETLFS and SETNAM to set the channels and filename first.
  KERNEL_CLOSE            = $001034;  // Close a channel
  KERNEL_SETIN            = $001038;  // Set the current input channel
  KERNEL_SETOUT           = $00103C;  // Set the current output channel
  KERNEL_GETB             = $001040;  // Get a byte from input channel. Return 0 if no input. Carry is set if no input.
  KERNEL_GETBLOCK         = $001044;  // Get a X byes from input channel. If Carry is set, wait. If Carry is clear, do not wait.
  KERNEL_GETCH            = $001048;  // Get a character from the input channel. A=0 and Carry=1 if no data is wating
  KERNEL_GETCHW           = $00104C;  // Get a character from the input channel. Waits until data received. A=0 and Carry=1 if no data is wating
  KERNEL_GETCHE           = $001050;  // Get a character from the input channel and echo to the screen. Wait if data is not ready.
  KERNEL_GETS             = $001054;  // Get a string from the input channel. NULL terminates
  KERNEL_GETLINE          = $001058;  // Get a line of text from input channel. CR or NULL terminates.
  KERNEL_GETFIELD         = $00105C;  // Get a field from the input channel. Value in A, CR, or NULL terminates
  KERNEL_TRIM             = $001060;  // Removes spaces at beginning and end of string.
  KERNEL_PRINTC           = $001064;  // Print character to screen. Handles terminal commands
  KERNEL_PRINTS           = $001068;  // Print string to screen. Handles terminal commands
  KERNEL_PRINTCR          = $00106C;  // Print Carriage Return
  KERNEL_PRINTF           = $001070;  // Print a float value
  KERNEL_PRINTI           = $001074;  // Prints integer value in TEMP
  KERNEL_PRINTH           = $001078;  // Print Hex value in DP variable
  KERNEL_PRINTAI          = $00107C;  // Prints integer value in A
  KERNEL_PRINTAH          = $001080;  // Prints hex value in A. Printed value is 2 wide if M flag is 1, 4 wide if M=0
  KERNEL_LOCATE           = $001084;  //
  KERNEL_PUSHKEY          = $001088;  //
  KERNEL_PUSHKEYS         = $00108C;  //
  KERNEL_CSRRIGHT         = $001090;  //
  KERNEL_CSRLEFT          = $001094;  //
  KERNEL_CSRUP            = $001098;  //
  KERNEL_CSRDOWN          = $00109C;  //
  KERNEL_CSRHOME          = $0010A0;  //
  KERNEL_SCROLLUP         = $0010A4;  // Scroll the screen up one line. Creates an empty line at the bottom.
  // Undefined label for: SCRGETWORD       = %ADDR% // Read a current word on the screen. A word ends with a space, punctuation (except _), or any control character (value < 32). Loads the address into CMPTEXT_VAL and length into CMPTEXT_LEN variables.
  KERNEL_CLRSCREEN        = $0010A8;  // Clear the screen
  KERNEL_INITCHLUT        = $0010AC;  // Init character look-up table
  KERNEL_INITSUPERIO      = $0010B0;  // Init Super-IO chip
  KERNEL_INITKEYBOARD     = $0010B4;  // Init keyboard
  // Undefined label for: INITRTC          = %ADDR% // Init Real-Time Clock
  KERNEL_INITCURSOR       = $0010BC;  // Init the Cursors registers
  KERNEL_INITFONTSET      = $0010C0;  // Init the Internal FONT Memory
  KERNEL_INITGAMMATABLE   = $0010C4;  // Init the RGB GAMMA Look Up Table
  KERNEL_INITALLLUT       = $0010C8;  // Init the Graphic Engine (Bitmap/Tile/Sprites) LUT
  KERNEL_INITVKYTXTMODE   = $0010CC;  // Init the Text Mode @ Reset Time
  KERNEL_INITVKYGRPMODE   = $0010D0;  // Init the Basic Registers for the Graphic Mode
  KERNEL_SETSIZES         = $00112C;  // Set the text screen size variables based on the border and screen resolution.
  KERNEL_F_OPEN           = $0010F0;  // open a file for reading/writing/creating
  KERNEL_F_CREATE         = $0010F4;  // create a new file
  KERNEL_F_CLOSE          = $0010F8;  // close a file (make sure last cluster is written)
  KERNEL_F_WRITE          = $0010FC;  // write the current cluster to the file
  KERNEL_F_READ           = $001100;  // read the next cluster from the file
  KERNEL_F_DELETE         = $001104;  // delete a file / directory
  // Undefined label for: F_RENAME         = %ADDR% // rename a file
  KERNEL_F_DIROPEN        = $001108;  // open a directory and seek the first directory entry
  KERNEL_F_DIRNEXT        = $00110C;  // seek to the next directory of an open directory
  KERNEL_F_DIRREAD        = $001110;  // Read the directory entry for the specified file
  KERNEL_F_DIRWRITE       = $001114;  // Write any changes in the current directory cluster back to the drive
  KERNEL_F_LOAD           = $001118;  // load a binary file into memory, supports multiple file formats
  KERNEL_F_SAVE           = $00111C;  // Save memory to a binary file
  KERNEL_CMDBLOCK         = $001120;  // Send a command to a block device
  KERNEL_F_RUN            = $001124;  // Load and run an executable binary file
  KERNEL_F_MOUNT          = $001128;  // Mount the designated block device
  KERNEL_F_COPY           = $001130;  // Copy a file
  KERNEL_F_ALLOCFD        = $001134;  // Allocate a file descriptor
  KERNEL_F_FREEFD         = $001138;  // Free a file descriptor

  //
  // Interrupt Jump Table
  //

  KERNEL_VEC_INT00_SOF   = $001700;  // Interrupt routine for Start Of Frame interrupt
  KERNEL_VEC_INT01_SOL   = $001704;  // Interrupt routine for Start Of Line interrupt
  KERNEL_VEC_INT02_TMR0  = $001708;  // Interrupt routine for Timer0
  KERNEL_VEC_INT03_TMR1  = $00170C;  // Interrupt routine for Timer1
  KERNEL_VEC_INT04_TMR2  = $001710;  // Interrupt routine for Timer2
