/*
 Feedback Hardware control
*/
bool T = true;
bool F = false;
float LEDcount;
bool LEDSequence[16][4] = {{F,F,F,F},
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
bool LEDstatus[16] = {T,T,T,T,T,T,T,T,T,T,T,T,T,T,T,T};    
int LEDindex = 0;
int numofLEDs = 16;
                        
void setup() {
  Serial.begin(115200);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  //int LEDindex = (int)LEDcount%16;
  
  float frequency = 10;

  int period = (int)((1/(frequency * numofLEDs))*1000);
  
  int LEDcount = (millis())% (period + 1);
  LEDselect(T,16,T);
  digitalWrite(3, LEDSequence[LEDindex][0]);    // apply the sequence value from the 1st colomn
  digitalWrite(4, LEDSequence[LEDindex][1]);    // apply the sequence value from the 2nd colomn
  digitalWrite(5, LEDSequence[LEDindex][2]);    // apply the sequence value from the 3rd colomn
  digitalWrite(6, LEDSequence[LEDindex][3]);    // apply the sequence value from the 4th colomn
  
   if(LEDcount >= (period)){
      do{
        LEDindex = (LEDindex + 1)%numofLEDs;
      }while(!LEDstatus[LEDindex]);
      Serial.print("num of LEDs: ");Serial.print(numofLEDs);Serial.print(" Next LED: ");Serial.println(LEDindex);
   }
   
   if((millis()%100 + 1)>=(100)){
    numofLEDs = 0;
   for(int i; i<16;i++){
    if(LEDstatus[i]){numofLEDs += 1;}
   }
   }
}

void LEDencode(int sequence,float count){
  
}
void LEDselect(bool onoff, float sel, bool mode)
{
  if(mode == true) // ring array mode
  {
    for(int i = 0; i < 16; i++){
    if(i<=sel){
      LEDstatus[i]= onoff; 
    }
    else{ LEDstatus[i]= !onoff;}
    }
    
  }
  else // specific LED mode
  {
    LEDstatus[(int)sel] = onoff;
  }

}
