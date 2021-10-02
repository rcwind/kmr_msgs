# Kmr Sensor Data Messages
#
# For more direct simple interactions (leds, gyro, motor velocity
# etc) use the other topics. This provides detailed information about the
# entire state package that is transmitted at 50Hz from the robot.
#


###### CONSTANTS ######
# vehicle type
uint8 VEHICLE_DIFF2  = 1
uint8 VEHICLE_DIFF4  = 2
uint8 VEHICLE_ACKERMAN1  = 3
uint8 VEHICLE_ACKERMAN2  = 4
uint8 VEHICLE_MECANUM  = 5
uint8 VEHICLE_DUALSTEE  = 6
uint8 VEHICLE_QUADSTEE  = 7

# Bumper states (states are combined, when multiple bumpers are pressed)
uint8 BUMPER_RIGHT  = 1
uint8 BUMPER_CENTRE = 2
uint8 BUMPER_LEFT   = 4

# Wheel drop sensor states (states are combined, when both wheel drop sensors are triggered)
uint8 WHEEL_DROP_RIGHT = 1
uint8 WHEEL_DROP_LEFT  = 2

# Cliff sensor states (states are combined, when multiple cliff sensors are triggered)
uint8 CLIFF_RIGHT  = 1
uint8 CLIFF_CENTRE = 2
uint8 CLIFF_LEFT   = 4

# Charger state is a combination of charging device (adapter, docking station)
# and state (charging, charged, discharging):
uint8 DISCHARGING      = 0
uint8 DOCKING_CHARGED  = 2
uint8 DOCKING_CHARGING = 6
uint8 ADAPTER_CHARGED  = 18
uint8 ADAPTER_CHARGING = 22

# Over current states
uint8 OVER_CURRENT_LEFT_WHEEL  = 1
uint8 OVER_CURRENT_RIGHT_WHEEL = 2
uint8 OVER_CURRENT_BOTH_WHEELS = 3

# Digital input states (states are combined, when multiple inputs are set at the same time)
# When connecting Yujin's test board, it acts as pull-up what inverts the behaviour:
# No input: 79, all inputs set (e.g. buttons pressed): 64
uint8 DIGITAL_INPUT0 = 1
uint8 DIGITAL_INPUT1 = 2
uint8 DIGITAL_INPUT2 = 4
uint8 DIGITAL_INPUT3 = 8
uint8 DB25_TEST_BOARD_CONNECTED = 64

###### MESSAGE ######

Header header

###################
# Core Packet
###################
uint16 time_stamp      # milliseconds starting when turning on Kmr (max. 65536, then starts from 0 again)
uint8  vehicle          # see vehicle type 
uint8  bumper          # see bumper states
uint8  wheel_drop      # see wheel drop sensor states
uint8  cliff           # see cliff sensor states
uint16 left_front_encoder    # accumulated ticks left wheel starting with turning on Kmr (max. 65535)
uint16 right_front_encoder   # accumulated ticks right wheel starting with turning on Kmr (max. 65535)
uint16 left_rear_encoder    # accumulated ticks left wheel starting with turning on Kmr (max. 65535)
uint16 right_rear_encoder   # accumulated ticks right wheel starting with turning on Kmr (max. 65535)
uint8  charger_status         # see charger_status states
int16  charger_current         # charger_status current, mA
uint16  battery         # battery voltage in 0.1V (ex. 16.1V -> 161)

###################
# Cliff Packet
###################
uint16[] bottom        # ADC output of the right, centre, left cliff PSD sensor (0 - 4095, distance measure is non-linear)

###################
# Input Packet
###################
uint16   digital_input # see digital input states; will show garbage when nothing is connected
uint16[] analog_input  # ADC values for the 4 analog inputs; 0 - 4095: 0.0 - 3.3V; will show garbage when nothing is connected
