class Street {
  String a;
  int b;
  int c;

Street(int x, int y, String s) {
  b = x;
  c = y;
  a = s; 

}

void NorthdrawStreet()
{
    noStroke();
    fill(78,78,78);
    rect(c, b, width, height/7);
    fill(255,255,255);
    textSize(20);
    text("North Street",530,30);
     
}
void SouthdrawStreet()
{
    noStroke();
    fill(78,78,78);
    rect(b, c , width, height/7);
    fill(255,255,255);
    text("South Street",530,760);
     
}
void DrawConnector()
{
    noStroke();
    fill(78,78,78);
    rect(460,c, 70, height);
   
   
     
}
}