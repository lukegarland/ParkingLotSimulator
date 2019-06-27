# Parking Lot Simulator
This was the final project for Engineering 223, Computing for Engineers I, at the University of Calgary. The program was developed in [Processing 3](https://processing.org/).

## Summary
The main purpose is to simulate the behaviour of a paid parking lot.  If there is space in the lot, some cars driving along the top street will enter the lot and select an open parking space. Open parking spaces are green, and spaces that are currently occupied are red. After a random amount of time, the car will to leave the lot, and pay the required fee. Price calculations are rounded up to the next hour.

The total revenue that the lot generates is displayed on the right panel. The total number of customers, and hours elapsed since the start are also displayed.

When the lot is full, the entrance gate will close and display "LOT FULL". No more cars will park until cars leave, and space becomes available.

Pressing anywhere on the application will pause/resume the simulation.


## Releases

See the current [release](https://github.com/lukegarland/ParkingLotSimulator/releases) for executable files (Windows and Linux). Download the package and run ```ParkingLotSimulator``` from inside the application folder.

## Screenshots

###### Normal behaviour:
![Lot: Normal](https://i.imgur.com/rROzwy2.png)


###### Behaviour when the lot is full:
(In this case, the program was set so every car parks in the lot.)
![Lot: Full](https://i.imgur.com/h8Gwqfj.png)


## Authors
* **Luke Garland** - [Github](https://github.com/lukegarland) - [Email](mailto:luke.garland1@ucalgary.ca)
* **Michael Enright**

## License

This project is licensed under the GNU General Public License - see the [LICENSE.md](LICENSE.md) file for details
