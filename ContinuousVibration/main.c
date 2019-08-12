#include <stdio.h>
#include <xc.h>         // A PROGRAM THAT MAKES F0 & F1 PINS OUTPUTS
                        // THEY ARE ALWAYS ON, UNLESS "USER" BUTTON IS BEING PRESSED

void delay(void);

int main(void) {
    TRISF = 0xFFFC;

    LATFbits.LATF0 = 0;   		   // Set pin 0 and 1 of port f to "on"
	LATFbits.LATF1 = 0;   		   // These pins sink current on the NU32,
								   // so "high" (1) = "off" and "low" (0) = "on"

	while(1) {

		delay();

		if(!PORTDbits.RD7){        // Pin D7 is the USER switch, low (FALSE) if pressed.
			LATFbits.LATF0 = 1;    // toggle LED1 and LED2; same as LATFINV = 0x3;
			LATFbits.LATF1 = 1;
			}
		else {
			LATFbits.LATF0 = 0;	   // if button not pressed, keep on
			LATFbits.LATF1 = 0;
			}
	}

    return 0;
}


void delay(void) {
  int j;
  for (j = 0; j < 10000; j++) { 	// number is 10 thousand
		;							// Empty, just a counter
    }
}

