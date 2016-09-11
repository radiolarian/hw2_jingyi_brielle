/*
 HW2 code to run a Braille text input device.
 Adapted from Pushbutton interrupt example for RedBear Duo with internal pull-down resistor.

 Adapted from the Particle Photon documentation.
 modified 29 Aug 2016
 by Bjoern Hartmann for RedBear Duo
 modified 7 Sep 2016
 by Jingyi Li for IDD.
 
 */

// do not use the cloud functions - assume programming through Arduino IDE
#if defined(ARDUINO) 
SYSTEM_MODE(MANUAL); 
#endif

// note: Particle documentation states external interrupts
// DO NOT work on D0 and A5, so we choose D1 instead
const int b1 = D15;                      // button is connected to D1 and 3V3
const int b2 = D14;
const int b3 = D13;
const int b4 = D6;
const int b5 = D7;
const int b6 = D5;
const int enter = D4;
const int del = D10;

bool on1 = false;
bool on2 = false;
bool on3 = false;
bool on4 = false;
bool on5 = false;
bool on6 = false;

void toggle(void);
void isr(void);


long debounceDelay = 50;    // the debounce time in ms
volatile int state = LOW;

Timer timer(debounceDelay, toggle, true); // oneshot



void setup()
{
  pinMode(b1, INPUT_PULLDOWN);
  pinMode(b2, INPUT_PULLDOWN);
  pinMode(b3, INPUT_PULLDOWN);
  pinMode(b4, INPUT_PULLDOWN);
  pinMode(b5, INPUT_PULLDOWN);
  pinMode(b6, INPUT_PULLDOWN);
  pinMode(enter, INPUT_PULLDOWN);
  pinMode(del, INPUT_PULLDOWN);
  

  attachInterrupt(b1, isr, RISING); //CHANGE, RISING or FALLING
  attachInterrupt(b2, isr, RISING);
  attachInterrupt(b3, isr, RISING);
  attachInterrupt(b4, isr, RISING);
  attachInterrupt(b5, isr, RISING);
  attachInterrupt(b6, isr, RISING);
  attachInterrupt(enter, isr, RISING);
  attachInterrupt(del, isr, RISING);
    
  Serial.begin(9600); 
}

void loop()
{
  ;
}

void handle_button(bool * on, int b) {
  if (* on == true) {
    Serial.printf("%dn\n", b);
    * on = false;
    }
  else {
    Serial.printf("%dy\n", b);
    * on = true;
  }
}

void toggle() {
  if (digitalRead(b1)==HIGH) {
    state=!state;
    handle_button(&on1, 1);
  }
  else if (digitalRead(b2)==HIGH) {
    state=!state;
    handle_button(&on2, 2);
  }
  else if (digitalRead(b3)==HIGH) {
    state=!state;
    handle_button(&on3, 3);
  }
  else if (digitalRead(b4)==HIGH) {
    state=!state;
    handle_button(&on4, 4);
  }
  else if (digitalRead(b5)==HIGH) {
    state=!state;
    handle_button(&on5, 5);
  }
  else if (digitalRead(b6)==HIGH) {
    state=!state;
    handle_button(&on6, 6);
  }
 else if (digitalRead(enter)==HIGH) {
    state=!state;
    on1 = false;
    on2 = false;
    on3 = false;
    on4 = false;
    on5 = false;
    on6 = false;
    Serial.print("enter\n");
  }
  else if (digitalRead(del)==HIGH) {
    state=!state;
    Serial.print("del\n");
  } 
}

void isr()
{ 
  noInterrupts();
  if (digitalRead(b1)==HIGH || digitalRead(b2)==HIGH || digitalRead(b3)==HIGH ||
      digitalRead(b4)==HIGH || digitalRead(b5)==HIGH || digitalRead(b6)==HIGH ||
      digitalRead(del)==HIGH || digitalRead(enter)==HIGH) {
    timer.resetFromISR(); //start or reset timer on every rising edge
  } else {
    timer.stopFromISR(); //stop on falling edge
  } 
  interrupts();
 
}


