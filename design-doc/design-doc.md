# Poky Pow Design Document

Working document for the Poky Pow project.

## Use case:

PC or server owners plug that pcb in their USB2.0 header, connect power, resest and power led.
With that, they can control their PC with Home Assistant.

# Software

Everything is done via ESPHome.


# Requirements:

Brain is the ESP32-C3-MINI-1U.
- for its external antenna
- Has Bluetooth and WiFi (both needed for [Made for ESPHome](https://esphome.io/guides/made_for_esphome.html) approval)
- Supported by ESPHome
  - esp32, esp32s2, esp32s3, esp32c3 and esp32h2
  - Source: https://esphome.io/components/esp32.html#configuration-variables
- Docs here: https://www.espressif.com/sites/default/files/documentation/esp32-c3-mini-1_datasheet_en.pdf


- ESP32 (No bluetooth)
- ESP32-S2 not possible (No bluetooth), no serial usb
- ESP32-S3 (bluetooth, usb, but more expensice?)
- ESP32-C2 (No ESPHome Support? riscV,
- Esp32c3 (more memory, same as c2 with risc V), usb serial
- Esp32h2 (thread, zigbee, riscV, no wifi)


## USB-C Connector

- for flashing and debugging
- for power
- Connected via the CH340C

## USB2.0 9 Pin Plug

- for plugging into the motherboard
- for power
- will be wired with data from USB, but not used in ESPHome from the start
- connected via the internal serial of the ESP32-C3-MINI-1U

## Motherboard And PC Case Pins

Motherboard and PC Case pins must be seperated.
That way we use the PC Case pins as an input and can do any action with them in the software.


- Power LED (Needs to be able to detect if the LED is on/off)
- Reset Button (Needs to short the connection for a certain amount of time in order to reset the PC)
- Power Button (Needs to short the connection for a certain amount of time in order to power on, power off or hard reset the PC)

- PC case pins:
  - power: GPIO21
  - reset: GPIO20
  - power LED: GPIO18
- Motherboard pins:
  - power: ?
  - reset: ?
  - power LED: ?

Other pins:

- RGB LED: GPIO19


## Testpoints

- As many as needed

## Extra GPIO

- when space is not issue lets expose as many as possible


## Antenna

The ESP32-C3-MINI-1U has an external antenna connector and NO onboard antenna.
Hence we need to use an external antenna.

I found this one:

[Adafruit Accessories WiFi Antenna with w.FL / MHF3 / IPEX3 Connector](https://eu.mouser.com/ProductDetail/Adafruit/5445?qs=vvQtp7zwQdMvbE1TBlHDrA%3D%3D)


## Power

There are 2 potential power sources:
- USB-C connector
- 9 Pin Plug

Both could be connected and we need to make sure to damage the PCB or the mainboard.

## PCB size and form

- 3 holes for 3D printed base/case
- measurements (roughly, taken form the Silverstone ES03-WIFI):
   - width: 25.2mm (most critical, since there might be other header, etc on the mainboard)
   - height: 8mm 
   - depth: 45.6mm

## Buttons

- power and reset button if needed

## LED

We need a LED compatible with ESPHome:
https://esphome.io/components/light/
