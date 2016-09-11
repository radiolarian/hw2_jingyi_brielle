# Brielle
## IDD 2016 HW2: Text Entry Device

[![Brielle demo video](https://puu.sh/r7S4w/9a3f7b2d6b.png)](https://www.youtube.com/watch?v=FZajSLcXjGc "Brielle demo video")

*Brielle* is a simple 8-input text-entry device designed to help sighted users learn Braille. Brielle opens like your favorite notebook and conceals a laser-cut Braille guide in its fabric pockets: all while fitting in your palm. And with its responsive GUI, learning Braille with Brielle is a breeze.

![Brielle](pic.jpg?raw=true "Brielle book")

I chose this text entry technique because I wanted to keep the hardware simple, and spend more time considering the form of the device as well as getting familiar with programming GUIs. 

![GUI](gui.png?raw=true "GUI")

I adapted the Redbear Duo code from the debouncing interrupt example. Six state variables which correspond to if a button is pressed or not are handled in the ISR, and print their states to Serial. This is found in the braile folder. The Processing GUI then reads Serial and runs through a giant “if” statement to find the corresponding letter. This is found in the briellegui folder.

![Wiring diagram](brielle circuit_bb.png?raw=true "Wiring diagram")

The physical device was laser cut on 3mm plywood. Originally it had a kerf connecting both sides of the “book,” but after 2 tries of bending and breaking it, I switched to black Duct Tape. Taped to the front is a soldered Protoboard; I added the red fabric mainly because I was tired of pricking my hand against poorly cut wires. Each wood button has a pad of blue felt to hold it in place and press against its mechanical equivalent. The Braille guide insert, also laser cut, fits in the back fabric pocket. I wanted users to be able to carry a palm-sized, (mostly) self-contained Braille Buddy!

![The whole package.](board.jpg?raw=true "The whole package.")
