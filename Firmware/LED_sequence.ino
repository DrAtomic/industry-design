/*
  Blink


  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Blink
*/
bool T = true;
bool F = false;
float LEDcount;
bool LEDSequence[16][4]={{F,F,F,F},
                           {T,F,F,F},
                           {F,T,F,F},
                           {T,T,F,F},
                          
                           {F,F,T,F},
                           {T,F,T,F},
                           {F,T,T,F},
                           {T,T,T,F},
                          
                           {F,F,F,T},
                           {T,F,F,T},
                           {F,T,F,T},
                           {T,T,F,T},
                          
                           {F,F,T,T},
                           {T,F,T,T},
                           {F,T,T,T},
                           {T,T,T,T}};
void setup() {
  Serial.begin(9600);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  int LEDindex = ((int)LEDcount)%16;
  digitalWrite(3, LEDSequence[LEDindex][0]);    // apply the sequence value from the 1st colomn
  digitalWrite(4, LEDSequence[LEDindex][1]);    // apply the sequence value from the 2nd colomn
  digitalWrite(5, LEDSequence[LEDindex][2]);    // apply the sequence value from the 3rd colomn
  digitalWrite(6, LEDSequence[LEDindex][3]);    // apply the sequence value from the 4th colomn
  LEDcount = LEDcount + 0.1;
  Serial.print("raw float:"); Serial.print(LEDcount);Serial.print("integer:");Serial.println((int)LEDcount);
}
