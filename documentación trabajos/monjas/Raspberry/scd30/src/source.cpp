#include "Arduino.h"
#include "scd30_modbus.h"
#include <Wire.h>

#define ID 0x31

SCD30_Modbus scd30;

struct SCD30_DATA {
   float CO2;
   float temperature;
   float relative_humidity;
};

typedef union {
   float floatingPoint;
   byte binary[4];
} binaryFloat;

binaryFloat CO2; 
binaryFloat temperature; 
binaryFloat relative_humidity; 

SCD30_DATA data = { 0, 0, 0 };

unsigned long previousMillis = 0;
const long interval = 10000;        // 10s
// const long interval = 2000;        // 2s

char buffer[16];
int bufferLength = 0;

void i2cHandler();
void respond_with_data();
void scd30_configuration();
void scd30_read();
void print_data();

void setup(void) {
   Serial.begin(9600);

   Wire.begin(ID);
   Wire.onRequest(i2cHandler);

   scd30_configuration();
}

void loop() {
   scd30_read();
}

void i2cHandler(){
   Serial.println("*************");
   Serial.println("DATA REQUESTED!");

   while( Wire.available() ){
      Serial.print(Wire.read());
      Serial.print(" ");
   }
   Serial.println("");

   respond_with_data();

   Serial.println("*************");
   Serial.println("");

   return;
}

void respond_with_data() {
   CO2.floatingPoint = data.CO2;
   temperature.floatingPoint = data.temperature;
   relative_humidity.floatingPoint = data.relative_humidity;

   Serial.print("Sending data: ");

   Serial.print(CO2.binary[3], HEX);
   Serial.print(CO2.binary[2], HEX);
   Serial.print(CO2.binary[1], HEX);
   Serial.print(CO2.binary[0], HEX);

   Serial.print(temperature.binary[3], HEX);
   Serial.print(temperature.binary[2], HEX);
   Serial.print(temperature.binary[1], HEX);
   Serial.print(temperature.binary[0], HEX);

   Serial.print(relative_humidity.binary[3], HEX);
   Serial.print(relative_humidity.binary[2], HEX);
   Serial.print(relative_humidity.binary[1], HEX);
   Serial.println(relative_humidity.binary[0], HEX);

   Wire.write(CO2.binary[3]);
   Wire.write(CO2.binary[2]);
   Wire.write(CO2.binary[1]);
   Wire.write(CO2.binary[0]);

   Wire.write(temperature.binary[3]);
   Wire.write(temperature.binary[2]);
   Wire.write(temperature.binary[1]);
   Wire.write(temperature.binary[0]);

   Wire.write(relative_humidity.binary[3]);
   Wire.write(relative_humidity.binary[2]);
   Wire.write(relative_humidity.binary[1]);
   Wire.write(relative_humidity.binary[0]);
}

void scd30_configuration() {

   scd30.begin(&Serial1);

   // /*** Adjust the rate at which measurements are taken, from 2-1800 seconds */
   if (!scd30.setMeasurementInterval(2)){
      Serial.println("ERROR! Failed to set measurement interval");
      while(1){ delay(10);}
   }
   Serial.print("Measurement Interval: "); 
   Serial.print(scd30.getMeasurementInterval()); 
   Serial.println(" seconds");

   // /*** Restart continuous measurement with a pressure offset from 700 to 1400 millibar.
   //  * Giving no argument or setting the offset to 0 will disable offset correction
   //  */
   if (!scd30.startContinuousMeasurement(0)){
     Serial.println("ERROR! Failed to set ambient pressure offset");
     while(1){ delay(10);}
   }
   Serial.print("Ambient pressure offset: ");
   Serial.print(scd30.getAmbientPressureOffset());
   Serial.println(" mBar");

   // /*** Set an altitude offset in meters above sea level.
   //  * Offset value stored in non-volatile memory of SCD30.
   //  * Setting an altitude offset will override any pressure offset.
   //  */
   // if (!scd30.setAltitudeOffset(0)){
   //   Serial.println("ERROR! Failed to set measurement interval");
   //   while(1){ delay(10);}
   // }
   Serial.print("Altitude offset: ");
   Serial.print(scd30.getAltitudeOffset());
   Serial.println(" meters");

   // ** Set a temperature offset in hundredths of a degree celcius.
   //  * Offset value stored in non-volatile memory of SCD30.
   // if (!scd30.setTemperatureOffset(0)){ // 19.84 degrees celcius
   //    Serial.println("ERROR! Failed to set temperature offset");
   //    while(1){ delay(10);}
   // }
   Serial.print("Temperature offset: ");
   Serial.print((float)scd30.getTemperatureOffset()/100.0);
   Serial.println(" degrees C");

   // /*** Force the sensor to recalibrate with the given reference value
   //  * from 400-2000 ppm. Writing a recalibration reference will overwrite
   //  * any previous self calibration values.
   //  * Reference value stored in non-volatile memory of SCD30.
   //  */
   // if (!scd30.forceRecalibrationWithReference(400)){
   //    Serial.println("ERROR! Failed to force recalibration with reference");
   //    while(1){ delay(10);}
   // }
   Serial.print("Forced Recalibration reference: ");
   Serial.print(scd30.getForcedCalibrationReference());
   Serial.println(" ppm");

   // /*** Enable or disable automatic self calibration (ASC).
   //  * Parameter stored in non-volatile memory of SCD30.
   //  * Enabling self calibration will override any previously set
   //  * forced calibration value.
   //  * ASC needs continuous operation with at least 1 hour
   //  * 400ppm CO2 concentration daily.
   //  */
   // if (!scd30.selfCalibrationEnabled(true)){
   //    Serial.println("ERROR! Failed to enable or disable self calibration");
   //    while(1){ delay(10);}
   // }
   if (scd30.selfCalibrationEnabled()) {
      Serial.print("Self calibration enabled");
   } else {
      Serial.print("Self calibration disabled");
   }

   Serial.println("\n\n");
}

void scd30_read() {
   unsigned long currentMillis = millis();

   if (currentMillis - previousMillis >= interval) {
      previousMillis = currentMillis;

      if (scd30.dataReady()){
         if (!scd30.read()){ 
            Serial.println("Error reading sensor data"); 
            return; 
         }

         data.CO2 = scd30.CO2;
         data.temperature = scd30.temperature;
         data.relative_humidity = scd30.relative_humidity;

         Serial.println("Data available!");
         print_data();
      } else {
         Serial.println("Data not ready");
      }
   }
}

void print_data() {
   Serial.print("Temperature: ");
   Serial.print(data.temperature);
   Serial.println(" degrees C");

   Serial.print("Relative Humidity: ");
   Serial.print(data.relative_humidity);
   Serial.println(" %");

   Serial.print("CO2: ");
   Serial.print(data.CO2, 3);
   Serial.println(" ppm");
   Serial.println("");
}
