
/*
HW2 code for the Braille GUI using Processing.
Adapated from Bjoern's graphing example for RedBear Duo
*/

import processing.serial.*;
 
Serial myPort;        // The serial port
PFont f;
PImage img;
String currString = "";
String currLetter ="space";
String[] buttons = {"n", "n", "n", "n", "n", "n"}; 
//n == off == fill(234)
//y == on == fill(146, 46, 97)

void resetField() { //resets curr letter to space (no selection)
  for (int i = 0; i < buttons.length; i++) { 
    buttons[i] = "n";
  }
  currLetter = "space";
}


void setup () {
  // set the window size:
  size(800, 600);        
 
  // List all the available serial ports
  println(Serial.list());
  // Open whatever port is the one you're using.
  myPort = new Serial(this, "/dev/cu.usbmodem1411", 9600);
  // don't generate a serialEvent() unless you get a newline character:
  //myPort.bufferUntil('\n');
  // set inital background:
  background(255);

  //set font
  f = createFont("Mongolian Baiti", 72, false);
  //add logo
  img = loadImage("logo.png");
  resetField();

}

void topbar() {
  //bar 
  rect(0, 0, 800, 80);  
  //logo
  image(img, 610, 18);
}


void drawCircles() {
 noStroke();
 for (int i = 0; i < buttons.length; i++) {
   if (buttons[i].equals("y")) fill(146, 46, 97);
   else fill(234);
   int x = 100;
   int y = 155;
   switch(i) { 
     case 0: break;
     case 1: y = 260; break;
     case 2: y = 365; break;
     case 3: x = 215; break;
     case 4: x = 215; y = 260; break;
     case 5: x = 215; y = 365; break;
     default: break;
   }
   ellipse(x, y, 60,60);
 }
}

void updateLetter() {
  //here comes a giant if statement
  //println("in update letter with array", buttons[0],buttons[1],buttons[2],buttons[3],buttons[4],buttons[5]);
  
   if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")  && buttons[5].equals("y")) currLetter = "y";
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[2].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")) currLetter = "q";
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[2].equals("y") && buttons[3].equals("y")) currLetter = "p";
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[2].equals("y") && buttons[4].equals("y")) currLetter = "r";
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[2].equals("y") && buttons[5].equals("y")) currLetter = "v";  
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")) currLetter = "g";
   else if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")) currLetter = "n";
   else if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[3].equals("y") && buttons[5].equals("y")) currLetter = "x";
   else if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[4].equals("y") && buttons[5].equals("y")) currLetter = "z";
   else if (buttons[1].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")  && buttons[5].equals("y")) currLetter = "w";
   else if (buttons[1].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")  && buttons[2].equals("y")) currLetter = "t";
  
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[2].equals("y")) currLetter = "l";
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[3].equals("y")) currLetter = "f";
   else if (buttons[0].equals("y") && buttons[1].equals("y") && buttons[4].equals("y")) currLetter = "h";
   else if (buttons[1].equals("y") && buttons[2].equals("y") && buttons[3].equals("y")) currLetter = "s";    
   else if (buttons[1].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")) currLetter = "j";
   else if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[3].equals("y")) currLetter = "m";
   else if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[4].equals("y")) currLetter = "o";
   else if (buttons[0].equals("y") && buttons[2].equals("y") && buttons[5].equals("y")) currLetter = "u";
   else if (buttons[0].equals("y") && buttons[3].equals("y") && buttons[4].equals("y")) currLetter = "d";
   else if (buttons[1].equals("y") && buttons[4].equals("y") && buttons[5].equals("y")) currLetter = ".";
   else if (buttons[1].equals("y") && buttons[2].equals("y") && buttons[5].equals("y")) currLetter = "?";
   else if (buttons[1].equals("y") && buttons[2].equals("y") && buttons[4].equals("y")) currLetter = "!";
  
   else if (buttons[0].equals("y") && buttons[1].equals("y")) currLetter = "b";
   else if (buttons[0].equals("y") && buttons[3].equals("y")) currLetter = "c";
   else if (buttons[0].equals("y") && buttons[4].equals("y")) currLetter = "e";
   else if (buttons[1].equals("y") && buttons[3].equals("y")) currLetter = "i";      
   else if (buttons[2].equals("y") && buttons[5].equals("y")) currLetter = "-";
   else if (buttons[1].equals("y") && buttons[2].equals("y")) currLetter = ";";
   else if (buttons[1].equals("y") && buttons[4].equals("y")) currLetter = ":";
   
   else if (buttons[1].equals("y")) currLetter =",";
   else if (buttons[0].equals("y")) currLetter = "a";
   else if (buttons[2].equals("y")) currLetter = "'";

   else currLetter = "space";
     
  
  textFont(f, 72);
  fill(56, 53, 54); 
  textAlign(CENTER);
  text(currLetter, 150, 480);
}

void draw () {
  // everything happens in the serialEvent()
  renderScreen();
}

void renderText() {
  textFont(f, 72);
  fill(56, 53, 54); 
  textAlign(CENTER);
  text(currString, 520, 290);
}

void updateText() {
  if (currLetter.equals("space")) currLetter = " ";
  currString += currLetter;
  resetField();
}

void deleteText() {
  if (!currString.equals("")) currString = currString.substring(0, currString.length()-1);
}

void renderScreen() {
 background(255);
 topbar();
 drawCircles();
 updateLetter();
 renderText();
}
 
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
 
  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    
    switch (inString) {
      case "1y": println("1y"); buttons[0] = "y"; break;
      case "1n": println("1n"); buttons[0] = "n"; break;
      case "2y": println("2y"); buttons[1] = "y"; break;
      case "2n": println("2n"); buttons[1] = "n"; break;
      case "3y": println("3y"); buttons[2] = "y"; break;
      case "3n": println("3n"); buttons[2] = "n"; break;
      case "4y": println("4y"); buttons[3] = "y"; break;
      case "4n": println("4n"); buttons[3] = "n"; break;
      case "5y": println("5y"); buttons[4] = "y"; break;
      case "5n": println("5n"); buttons[4] = "n"; break;
      case "6y": println("6y"); buttons[5] = "y"; break;
      case "6n": println("6n"); buttons[5] = "n"; break;
      case "enter": println("enter"); updateText(); break;
      case "del": println("del"); deleteText(); break;
      default: break;
  }

  }
}