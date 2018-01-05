class Gate{
boolean status;
int xPos, yPos, counter;//counter counts how many cars are inside the parking lot
String name;
float fee;// The fee that each car owes--Determined by price calclulator

Gate(int x, int y, String s){//Gate constructor which sets the position of the gate
xPos=x;
yPos=y;
name=s;

}


void drawGate(){
  //Draws Gate
fill(255);
stroke(0);
strokeWeight(1);
rect(xPos,yPos,90,25);
fill(#87CEFA);
rect(xPos,yPos+25,90,25);
fill(0);
textSize(16);
text(name,xPos+4, yPos+20);
//Sets data fields for the possible types of gate
if(name.equals("Entrance")){
  if(counter>=60){
    fill(255,0,0);
    text("LOT FULL", xPos+4, yPos+40);

  }else{
    fill(0);
text("Spaces: "+ (60-counter), xPos+4, yPos+40);
  }
}else {
  textSize(13);
  fill(0);
text("Fee: $"+ fee+"0", xPos+4, yPos+40);//the fee will be displayed once a car leaves & the exitGate.fee variable is changed.

}

if(counter>=60){// Closes the gate once the lot is full.
closeGate();
}else openGate();

}

void openGate(){
strokeWeight(7);
line(xPos+90,yPos+20,xPos+90,yPos+80);
status = true;

}

void closeGate(){
  strokeWeight(7);
  line(xPos+90,yPos+20,xPos+150,yPos+20);
status = false;
}

}