
int stallWidth=60; 
int stallHeight=40;
Street sstr = new Street(0, 675);
Street cstr = new Street(460, 0);
Street nstr = new Street(0, 0);
ParkingLot pLot =  new ParkingLot(150, 200, stallWidth, stallHeight);//100,100 is location of the first lot; 
Gate exitGate = new Gate(360, 595, "Exit");
Gate enterGate = new Gate(360, 105, "Entrance");
Date presentDate= new Date(0, 8, 0, true);
Car carArray[]=new Car[1];
ControlPanel cP= new ControlPanel();
int timeCounter=0;
boolean pause= false;
void settings() 
{
  size(1200, 800);
}

void setup() 
{
  frameRate(30);
  carArray[0]=new Car(0, 50);
}

void draw() 
{
  if(timeCounter%4==0)
  {
  presentDate.addMinute();
  cP.time++;
  }
  drawbackground();
timeCounter+=1;
  if (random(0, 30)<=2&& timeCounter>30) 
  {
    carArray=(Car[])append(carArray, new Car(0, 75));
    timeCounter=0;
  }
  for (int i=0; i<carArray.length; i++) 
  {
    carArray[i].driveCar();
  }
  cP.DrawControlPanel();
}

void drawbackground() 
{
  background(0, 100, 0);
  fill(255);
  rect(95, 135, 810, 500); 
  fill(78, 78, 78);
  stroke(255);

  rect(100, 140, 800, 490);

  cstr.DrawConnector();
  nstr.NorthdrawStreet();
  sstr.SouthdrawStreet();
  pLot.drawLot();
  enterGate.drawGate();
  exitGate.drawGate();
}

boolean dateEquals(Date a, Date b ) 
{//Compares two dates and returns true if they are the same time.
  if (a.today==b.today && a.hour==b.hour && a.minute==b.minute && a.before_noon==b.before_noon) 
  {
    return true;
  } else return false;
}

void mousePressed()
{
 if(!pause){
 noLoop();
 pause=true;
 }else{
 loop();
 pause=false;
 }
}
