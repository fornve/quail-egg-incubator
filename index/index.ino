// Base ESP8266
#include <ESP8266WiFi.h>
#include <Servo.h> 
#include <DHT.h>


#define DHTPIN 0          // D3
#define DHTTYPE DHT11     // DHT 11

#define SERVOPIN 2          // D4
#define HEATINGPIN 5          // D5
#define FANPIN 4          // D6

// Temperature control
float Setpoint, Input;
const int numReadings = 10;
float readings[numReadings];      // the readings from the analog input
int readIndex = 0;              // the index of the current reading
float total = 0;                  // the running total
float average = 0;                // the average

unsigned long previousMillis = 0;        // will store last time LED was updated
const long interval = 1000*60*60*2;           // interval at which to blink (milliseconds)
int left = LOW;


WiFiClient WIFI_CLIENT;

Servo myservo; //initialize a servo object
int angle = 0; 

DHT dht(DHTPIN, DHTTYPE);

// This function runs once on startup
void setup() {
  pinMode(HEATINGPIN, OUTPUT);
  pinMode(FANPIN, OUTPUT);
  Setpoint = 37.1;

  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  }

  // Initialize the serial port
  Serial.begin(115200);
  Serial.println('Hello world');

  digitalWrite (HEATINGPIN, HIGH);
  digitalWrite (FANPIN, LOW);

  myservo.attach(SERVOPIN);
  myservo.write(55); 

  // Attempt to connect to a specific access point
  WiFi.begin("ssid", "password");

  dht.begin();

  // Keep checking the connection status until it is connected
  while (WiFi.status() != WL_CONNECTED) {
      delay(500);
  }

  // Print the IP address of your module
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  rotate();
}

float readDht() {
  float h = dht.readHumidity();
  float t = dht.readTemperature(); // or dht.readTemperature(true) for Fahrenheit
  
  // subtract the last reading:
  total = total - readings[readIndex];
  // read from the sensor:
  readings[readIndex] = t;
  // add the reading to the total:
  total = total + readings[readIndex];
  // advance to the next position in the array:
  readIndex = readIndex + 1;

  // if we're at the end of the array...
  if (readIndex >= numReadings) {
    // ...wrap around to the beginning:
    readIndex = 0;
  }

  // calculate the average:
  average = total / numReadings;

  Serial.print("Read average, temperature, humidity: ");
  Serial.print(average);
  Serial.print(" C, ");
  Serial.print(t);
  Serial.print(" C, ");
  Serial.print(h);
  Serial.println("%");
  return average;
}

void rotate() {
  
      if(left) {
        // set the LED with the ledState of the variable:
        for(angle = 10; angle < 100; angle += 1) 
        { 
          myservo.write(angle); 
          delay(30); 
        } 
      } else {
    
        // move from 180 to 0 degrees with a negative angle of 5 
        for(angle = 100; angle>=10; angle-=1) 
        {                                
          myservo.write(angle);
          delay(30);                       
        } 
      }
}

void loop() {
    //Serial.println("IP address: ");
    //Serial.println(WiFi.localIP());
    Input = readDht();

    if (Setpoint <= Input) {
      digitalWrite(HEATINGPIN, HIGH);
    }
    else {
      digitalWrite(HEATINGPIN, LOW);
    }

    unsigned long currentMillis = millis();
  
    if (currentMillis - previousMillis >= interval) {
      // save the last time you blinked the LED
      previousMillis = currentMillis;
  
      // if the LED is off turn it on and vice-versa:
      if (left == LOW) {
        left = HIGH;
      } else {
        left = LOW;
      }

      rotate();
    }

    Serial.print("Next turn in: ");
    Serial.println((interval - currentMillis + previousMillis) / 1000);

    delay(2000);
}
