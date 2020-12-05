/*
  Feedback Hardware control
*/
bool T = true;
bool F = false;
int LEDcount;
int period;
bool LEDSequence[16][4] = {{F, F, F, F}, //1
                           {F, T, F, F}, //3
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

  float frequency = 1;

  period = (int)((1 / (frequency * 16)) * 1000);

  float maxDist = 30; // 0 to 30 meters
  float RawDist = 30; // 0 to 30 meters
  float REDselect = (RawDist / maxDist) * 16; 
  LEDselect( REDselect, 7,3); // select LEDs up to the current distance index

  LEDcount =  (millis()) % (period + 1) ;
  LEDencode(5, 6, 7, 8, REDindex,numofREDs);
  LEDencode(18, 19, 0, 2, GREENindex,numofGREENs);
  LEDencode(14, 15, 16, 17, BLUEindex,numofBLUEs);

  // Switch to next 4 bit encode in the sequence based on mask
  REDindex = LEDswitch(REDindex   , REDstatus, numofREDs);
  GREENindex = LEDswitch(GREENindex ,BLUEstatus, numofGREENs);
  BLUEindex = LEDswitch(BLUEindex  ,GREENstatus,numofBLUEs);
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

  //int mask = {(D)<(D-Dmax)  ,D-1 ,D-2 ,D-3 , D-N } // if D goes from 0 to N, each element is clamped 0-1
}

void LEDencode(int A0, int A1, int A2, int A3, int index, int NofLeds) {
  digitalWrite(A0, LEDSequence[index][0]);    // apply the sequence value from the 1st colomn
  digitalWrite(A1, LEDSequence[index][1]);    // apply the sequence value from the 2nd colomn
  digitalWrite(A2, LEDSequence[index][2]);    // apply the sequence value from the 3rd colomn
  digitalWrite(A3, LEDSequence[index][3]);    // apply the sequence value from the 4th colomn
  if (LEDcount >= (period)) {
    Serial.print("Pinout: "); Serial.print(A0); Serial.print(A1); Serial.print(A2); Serial.print(A3);
    Serial.print(" - activeLEDs: "); Serial.print(NofLeds);
    Serial.print(" - currentLED: "); Serial.println(index);
  }
}
int LEDswitch(int index , int Status[], int NofLeds) {
  if (LEDcount >= (period)) {
    do {
      index = (index + 1) % NofLeds;
    } while (!(Status[index] == 1));
    //Serial.print("num of LEDs: "); Serial.print(numofLEDs); Serial.print(" Next LED: "); Serial.println(index);
  }
  return index;
}
void LEDselect(float selR,float selG, float selB)
{
    for (int i = 0; i < 16; i++) {
      REDstatus[i] =  constrain(selR - i, 0, 1);
      GREENstatus[i] =  constrain(selG - i, 0, 1);
      BLUEstatus[i] =  constrain(selB - i, 0, 1);
    }
}
