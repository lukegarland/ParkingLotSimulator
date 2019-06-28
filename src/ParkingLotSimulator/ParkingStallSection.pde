class ParkingStallSection {

  ParkingStall [][]stall;
  int x, y, w, h;


  ParkingStallSection(int a, int b, int c, int d) 
  {
    x=a;
    y=b;
    w=c;
    h=d;
    stall=new ParkingStall[2][5];

    for (int i=0; i<2; i++) 
    {
      for (int j=0; j<5; j++) 
      {
        stall[i][j]= new ParkingStall(x,y,w,h);
        x+=w;
      }
      y+=h;
      x=a;
    }
  }
  void drawSection()
  {
  
  for (int i=0; i<2; i++) 
  {
      for (int j=0; j<5; j++) 
      {
        stall[i][j].drawStall();        
      }
    }
  }
}