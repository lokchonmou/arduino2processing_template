import processing.serial.*;
Serial myPort;

boolean firstContact = false;
boolean first_run = false;
boolean selected_port = false;

//int RED, GREEN, BLUE;

void setup() {
  size(600, 600);
  background(#E6E6E6);
  fill(#000000);
  textAlign(CENTER, CENTER);
  text("Choose the serial port from the list \n and then click anywhere to continue", width/2, 100); // display text to user

  int port_list_length = Serial.list().length;

  if (port_list_length==0) {
    println("There are no serial available.");
    exit();
  } else {
    for (int i=0; i< port_list_length; i++)
    {
      text(str(i+1)+". "+Serial.list()[i], width/2, 100+30*(i+1));  //Add each serial port found to the selection
    }
    frame.setResizable(true);
  }
}

void draw() {
  if (selected_port == true) { 
    if (first_run == false) {
      frame.setSize(200, 200);
      first_run = true;
    } else {
      //do something in here
    }
  }
}

void serialEvent(Serial myPort) {
  String myString = myPort.readStringUntil('\n');
 
  if (myString != null) {
     myString = trim(myString);
    println(myString);
    /*
  int data[] = int(split(myString, ','));
     
     for (int i = 0; i < data.length; i++) {
     print(data[i] + "     ");
     }
     println();
     if (data[0] == 0)  background(0);
     else if (data[0] == 1)  background(255);
     */
    myPort.write(65);
  }
}

void keyPressed() {
  if (selected_port == false) {
    myPort= new Serial(this, Serial.list()[int(str(key))-1], 115200);
    selected_port= true;
  } else {
    //do something in here
  }
}

