

class Car {
  int positionX, positionY, speed;//x y position of the car
  int parkTime; //Random number, decides how long the car will stay in the lot, if it were to enter.
  Date leaveDate;//Date that the car will leave (Leave date is the current date + the number of hours generated from parkTime)
  boolean willPark, inLot, leftLot;//Indicators of what "Stage" the car is in. Mainly used to decide which drive function to use.
  String stallNumber;//Tracks the stall the car was in, (to reset it when it leaves)
  color c;//The colour of the car



  Car(int x, int y) {//Car constructor
    positionX=x;
    positionY=y;
    parkTime= int(random(1, 12));//Number of hours the car will stay in the lot (Between 4 and 9 hours)
    speed=3;
    if (int(random(1, 4))<=2)//If random number between 1 and 3 is either 1 or 2, then the car will park in the lot, if number is 3 then the car will not park in lot
      willPark=true;
    else willPark=false;
    c = color(int(random(0, 256)), int(random(0, 256)), int(random(0, 256)));
  }





  void driveCar() {//Main member function. This will be called from draw coninuously, must call all other functions
    strokeWeight(3);
    fill(c);

    if (willPark&& positionX==480 && !inLot && !leftLot&&enterGate.counter!=60) {//If parking car is at the top of the parking lot then it will turn in and drive in
      driveIn();
      if (willPark && positionX==480 && positionY==101) {//Once it is in the lot then the car will be hidden then it will choose its stall & set it to occupied

        inLot=true;//CAR IS IN LOT
        cP.customers++;
        hideCar();
        getLeaveDate(presentDate);
        enterGate.counter++;

        //SET STALL OCCUPIED
        int secR=int(random(0, 3));
        int secC=int(random(0, 2));
        int stallR=int(random(0, 2));
        int stallC= int(random(0, 5));

        while (pLot.section[secR][secC].stall[stallR][stallC].occupied==true) {
          //If the stall is already occupied, a new stall will be chosen
          //A new stall will be chosen every time until one that is free is identified.
          secR=int(random(0, 3));
          secC=int(random(0, 2));
          stallR=int(random(0, 2));
          stallC= int(random(0, 5));
        }
        if (pLot.section[secR][secC].stall[stallR][stallC].occupied==false) {
          //Once an empty stall is chosen, it will be set to occupied
          pLot.section[secR][secC].stall[stallR][stallC].setStatus(true, presentDate);
          stallNumber= Integer.toString(secR) + Integer.toString(secC) + Integer.toString(stallR) + Integer.toString(stallC);
        }
      }
    } else

      if (inLot&& dateEquals(leaveDate, presentDate)) {//Checks when it is time for the car to leave, if so following if statement will be activated & the car will leave the lot
        inLot=false;
        leftLot=true;
        enterGate.counter--;

        //SET STALL TO OPEN
        pLot.section[stallNumber.charAt(0)-'0'][stallNumber.charAt(1)-'0'].stall[stallNumber.charAt(2)-'0'][stallNumber.charAt(3)-'0'].occupied=false;
        positionX=480;//Puts the car at the exit of the lot
        positionY=600;
        Price_Calculator calculateFee= new Price_Calculator(presentDate);//Calculates price when car leaves. Rate is determined based on leaving day.
        exitGate.fee= calculateFee.total_price(parkTime);
        cP.revenue+=exitGate.fee;
      } else if (leftLot && positionY<680) {
        driveOut();//drives the car down the lot towards south street
      } else  if (!inLot)
        driveThrough();//Drives car to the left, on the street that it is currently on. (South street if they have just left the lot, or north street if they have not.)
  }



  void driveIn() {//Funtion to drive the car into the lot
    positionY+=speed;
    fill(c);
    rect(positionX, positionY, 20, 50);
  }




  void driveOut() {//function to drive a car out of the lot, down directly out of the lot
    positionY+=speed;
    fill(c);
    rect(positionX, positionY, 20, 50);
  }



  void driveThrough() {//function to drive a car driving left through the street, not entering the lot, or after it has exited the lot. (willPark has value where the car will not go in lot)
    if(!leftLot){
    positionY=50;
    }
    if(leftLot){
    positionY=700;
    }
    positionX+=speed;
    rect(positionX, positionY, 50, 20);
  }



  void hideCar() {//Set position off screen
    positionX=-100;
    positionY=-100;
  }


  void getLeaveDate(Date a) {//Activated when car enters lot
    leaveDate=new Date(a.today, a.hour, a.minute, a.before_noon);
    //Sets the leaving date for the time in future when the car is to leave the lot
    for (int i=0; i<parkTime; i++) {
      leaveDate.addHour();
    }
  }
}