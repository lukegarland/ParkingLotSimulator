class ControlPanel{
  int time;
  int customers;
  float revenue;
  
  
  void DrawControlPanel()
  {    
    fill(255);
    rect(1000,115,200,560);
    rect(1000,115,200,100);
    rect(1000,215,200,150);

    fill(0);
    text("Parking Rates:",1050,255);
    text("$3.00/hr  Monday-Saturday", 1010,280);
    text("$1.50/hr  Sunday", 1010,300);
    text("Current time:", 1050,155);
    text(presentDate.toString(),1010,180);
    text("Net Profit:",1050,400);
    text("$ "+revenue+"0",1010,425);
    text("Customers:", 1050, 475);
    text(customers,1010,500);
    text("Hours Elapsed:  ",1050,550);
    text(time/60,1010,575);
    
   
  }
  
  
  
  
}
