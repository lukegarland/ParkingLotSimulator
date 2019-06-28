class ParkingLot {

  ParkingStallSection section[][];

  //LOT coordinates. (Spacing between each section)
  int lotx;
  int loty;


  ParkingLot(int a, int b, int c, int d) 
  {

    lotx=a;
    loty=b;

    section= new ParkingStallSection [3][2];


//Setting the coordinates of each section
    for (int i =0; i<3; i++) 
    {
      for (int j=0; j<2; j++) 
      {
        section[i][j]= new ParkingStallSection(lotx, loty, c, d);//50 are width and height of the stall
        lotx+=395;
      }
      loty+=150;
      lotx=a;
    }
  }
  void drawLot() 
  {
    for (int i=0; i<3; i++) 
    {
      for (int j=0; j<2; j++) 
      {
        section[i][j].drawSection();//draws each section
      }
    }
  }
}