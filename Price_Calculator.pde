class Price_Calculator {
  float rate;
  float price;
  Price_Calculator(Date a) 
  {
    if (a.today!=6) 
    {
      rate=3; //      $/hr
    } else {
      rate=1.5;
    }
  }
  float total_price(int num_of_hours) 
  { 
     //Each car will have a member variable determining how long it will stay in the lot.
     //This value is the itn inputted into this function.
    price = num_of_hours*rate;
    return price;
  }
}