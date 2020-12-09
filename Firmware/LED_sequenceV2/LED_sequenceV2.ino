/*
  Feedback Hardware control
*/
////////////////////////// DWM1000 GLOBAL VARS /////////////////////////////
#include <SPI.h>
#include "DW1000Ranging.h"

// connection pins
const uint8_t PIN_RST = 9; // reset pin
const uint8_t PIN_IRQ = 2; // irq pin
const uint8_t PIN_SS = SS; // spi select pin
float rawRange;
////////////////////////// FEEDBACK GLOBAL VARS ////////////////////////////
bool T = true;
bool F = false;
int LEDcount;
int timer;
float DebugCounter;
int period;
  int BUTTON1 = 7;
  int BUTTON2 = 6;
  int R[] = {5,6,7,8};
  int G[] = {18,19,0,1};
  int B[] = {14,15,16,17};
bool LEDSequence[16][4] = {{F, F, F, F}, //pin 1
                           {F, T, F, F}, //pin 3
                           {F, F, T, F}, //5
                           {F, T, T, F}, //7
                           {F, F, F, T}, //9
                           {F, T, F, T}, //11
                           {F, F, T, T}, //13
                           {F, T, T, T}, //15
                           
                           {T, F, F, F}, //2
                           {T, T, F, F}, //4
                           {T, F, T, F}, //6
                           {T, T, T, F}, //8
                           {T, F, F, T}, //10
                           {T, T, F, T}, //12
                           {T, F, T, T}, //14
                           {T, T, T, T}  //16
};

int REDstatus[16] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int BLUEstatus[16] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int GREENstatus[16] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

int REDindex = 0;
int GREENindex = 0;
int BLUEindex = 0;

int numofREDs = 16;
int numofGREENs = 16;
int numofBLUEs = 16;

//////////////////////////////////// SETUP ////////////////////////////////////
void setup() {
  //////////////// DWM SETUP ///////////////////
  //Serial.begin(115200);
  delay(1000);
  //init the configuration
  DW1000Ranging.initCommunication(PIN_RST, PIN_SS, PIN_IRQ); //Reset, CS, IRQ pin
  //define the sketch as anchor. It will be great to dynamically change the type of module
  DW1000Ranging.attachNewRange(newRange);
  DW1000Ranging.attachNewDevice(newDevice);
  DW1000Ranging.attachInactiveDevice(inactiveDevice);
  //Enable the filter to smooth the distance
  //DW1000Ranging.useRangeFilter(true);
  
  //we start the module as a tag
  DW1000Ranging.startAsTag("7D:00:22:EA:82:60:3B:9C", DW1000.MODE_LONGDATA_RANGE_LOWPOWER);
  //////////////// LED pins SETUP ///////////////////

// setup control pins as outputs
  for(int i=0; i<4; i++)
  {pinMode(R[i], OUTPUT);
   pinMode(B[i], OUTPUT);
   pinMode(G[i], OUTPUT);
   pinMode(4, OUTPUT);
  }

  for(int i=0; i<4; i++)
  {
    digitalWrite(G[i], LOW);
  }
  
  digitalWrite(4,LOW); //ENABLE DECODER
}

////////////////////////////////// MAIN LOOP ////////////////////////////////////
void loop() {

for(int i=0; i<4; i++)
  {
    digitalWrite(G[i], LOW);
  }
  
  DW1000Ranging.loop(); /////// DWM LOOP ///////////////////////////
  for(int i=0; i<4; i++)
  {
    digitalWrite(G[i], LOW);
  }
  
  bool BUTTONPUSH1 = false;
  bool BUTTONPUSH2 = false;
    int val1 = analogRead(BUTTON1);
    if (val1 < 500){
      BUTTONPUSH1 = true;
      }
    else{
      BUTTONPUSH1 = false;
    }
    int val2 = analogRead(BUTTON2);
    if (val2 < 500){
      BUTTONPUSH2 = true;
      }
    else{
      BUTTONPUSH2 = false;
    }
  
  if((BUTTONPUSH1 || BUTTONPUSH2)){
    if(BUTTONPUSH1){
        LEDencode(R[0], R[1], R[2], R[3], 0,numofREDs);              // Output LED 4Bit combo
        LEDencode(G[0], G[1], G[2], G[3], 1,numofGREENs);
        LEDencode(B[0], B[1], B[2], B[3], 2,numofBLUEs);
    }
    if(BUTTONPUSH2){
        LEDencode(R[0], R[1], R[2], R[3], 0,numofREDs);              // Output LED 4Bit combo
        LEDencode(G[0], G[1], G[2], G[3], 15,numofGREENs);
        LEDencode(B[0], B[1], B[2], B[3], 14,numofBLUEs);
    }
    if(BUTTONPUSH2 & BUTTONPUSH1){
             float rotSpeed = 0.001;
             DebugCounter = 0;
      /**/while((int)DebugCounter < 16){
        LEDencode(R[0], R[1], R[2], R[3], (int)DebugCounter,numofREDs);
        DebugCounter += rotSpeed; 
      }
            DebugCounter = 0;
      while((int)DebugCounter < 16){
        LEDencode(G[0], G[1], G[2], G[3], (int)DebugCounter,numofGREENs);
        DebugCounter += rotSpeed; 
      }
            DebugCounter = 0;
      while((int)DebugCounter < 16){
        LEDencode(B[0], B[1], B[2], B[3], (int)DebugCounter,numofBLUEs);
        DebugCounter += rotSpeed; 
      }
    }
  }
   
   
   else{
///////////////////////// LED ROTATION ///////////////////////////
  float LEDfrequency = 60;
  period = (int)((1 / (LEDfrequency * 16)) * 1000);
  float maxDist = 15; // 0 to 30 meters //Mapping the distance and the range 
  float RawDist = rawRange; // 0 to 30 meters

    ////////////////////////// AUDIO CODE ///////////////////////////
  int highestFreq = 5000;
  int frequency = constrain(((1-(rawRange/maxDist))*highestFreq),40,highestFreq);  // the father the lower the fequency becomes
  if(rawRange>0){
      tone(3,frequency);
      //Serial.println(frequency);
  }

 
  float REDselect = (1 -(RawDist / maxDist)) * 16;
  LEDselect(REDselect,0, 0); // select LEDs up to the current distance index

  timer = millis();
  LEDcount =  (millis()) % (period + 1) ;                       // Count time

  BLUEindex = (BLUEindex+1)%16;
  BLUEindex = constrain(BLUEindex, (int)(REDselect-2), 15);
  
  LEDencode(R[0], R[1], R[2], R[3], REDindex,numofREDs);        // Output LED 4Bit combo
  //LEDencode(G[0], G[1], G[2], G[3], REDindex,numofGREENs);
  LEDencode(B[0], B[1], B[2], B[3], BLUEindex,numofBLUEs);

  // Switch to next 4 bit encode in the sequence based on mask
  REDindex = LEDswitch(REDindex   , REDstatus, numofREDs); // Output LED 4Bit combo
  //GREENindex = LEDswitch(GREENindex ,BLUEstatus, numofGREENs);
  //BLUEindex = LEDswitch(BLUEindex, BLUEstatus, numofBLUEs);
  tone(3,100);
  if ((millis() % 100 + 1) >= (100)) {
    numofREDs = 0;
    numofGREENs = 0;
    numofBLUEs = 0;
    for (int i = 0; i < 16; i++) {
      numofREDs = numofREDs + REDstatus[i];
      numofGREENs = numofGREENs + GREENstatus[i];
      numofBLUEs = numofBLUEs + BLUEstatus[i];
    }
  }
  }


}
///////////////////////////// LED SUPPORTING FUNCTIONS //////////////////////////////////////
void LEDencode(int A0, int A1, int A2, int A3, int index, int NofLeds) {
  digitalWrite(A0, LEDSequence[index][0]);    // apply the sequence value from the 1st colomn
  digitalWrite(A1, LEDSequence[index][1]);    // apply the sequence value from the 2nd colomn
  digitalWrite(A2, LEDSequence[index][2]);    // apply the sequence value from the 3rd colomn
  digitalWrite(A3, LEDSequence[index][3]);    // apply the sequence value from the 4th colomn
}
int LEDswitch(int index , int Status[], int NofLeds) {
  if (LEDcount >= (period)) {
    do {
      index = (index + 1) % NofLeds;
    } while (!(Status[index] == 1));

  }
  return index;
}
void LEDselect(float selR,float selG, float selB)
{
    for (int i = 1; i < 16; i++) {
      REDstatus[i] =  constrain(selR - i, 0, 1);
      GREENstatus[i] =  constrain(selG - i, 0, 1);
      BLUEstatus[i] =  constrain(selB - i, 0, 1);
    }
}

 ////////////////// DWM SUPPORTING FUNCTIONS //////////////////////////////
 void newRange() {
  //Serial.print("from: "); Serial.print(DW1000Ranging.getDistantDevice()->getShortAddress(), HEX); 
  rawRange = DW1000Ranging.getDistantDevice()->getRange(); // prints ranging data in meters
  //Serial.print("\t Range: "); Serial.print(DW1000Ranging.getDistantDevice()->getRange()); Serial.print(" m");
  //Serial.print("\t RX power: "); Serial.print(DW1000Ranging.getDistantDevice()->getRXPower()); Serial.println(" dBm");
}

void newDevice(DW1000Device* device) {
  //Serial.print("ranging init; 1 device added ! -> ");
  //Serial.print(" short:");
  //Serial.println(device->getShortAddress(), HEX);
}

void inactiveDevice(DW1000Device* device) {
  //Serial.print("delete inactive device: ");
  //Serial.println(device->getShortAddress(), HEX);
}
