EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Electronic Hot and Cold Game - TRACKER"
Date "13 November 2020"
Rev "v.3"
Comp "TEAM 10 "
Comment1 "beep boop"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5650 750  0    50   ~ 0
TRACKER SCHEMATIC\n
$Comp
L pspice:CAP C3
U 1 1 5FB3BF1F
P 6900 2600
F 0 "C3" V 7215 2600 50  0000 C CNN
F 1 "68p" V 7124 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6900 2600 50  0001 C CNN
F 3 "~" H 6900 2600 50  0001 C CNN
	1    6900 2600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R4
U 1 1 5FB3E6A1
P 6900 3100
F 0 "R4" H 6968 3146 50  0000 L CNN
F 1 "100k" H 6968 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6940 3090 50  0001 C CNN
F 3 "~" H 6900 3100 50  0001 C CNN
	1    6900 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 2600 7250 3100
Wire Wire Line
	7150 2600 7250 2600
Wire Wire Line
	7050 3100 7250 3100
Wire Wire Line
	6750 3100 6650 3100
Wire Wire Line
	6650 3100 6650 2600
$Comp
L Device:R_US R5
U 1 1 5FB494C0
P 6650 3400
F 0 "R5" H 6718 3446 50  0000 L CNN
F 1 "10k" H 6718 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6690 3390 50  0001 C CNN
F 3 "~" H 6650 3400 50  0001 C CNN
	1    6650 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6650 3250 6650 3100
Wire Wire Line
	6650 3550 6650 3650
$Comp
L pspice:CAP C4
U 1 1 5FB4B015
P 6650 3900
F 0 "C4" H 6828 3946 50  0000 L CNN
F 1 "1u" H 6828 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6650 3900 50  0001 C CNN
F 3 "~" H 6650 3900 50  0001 C CNN
	1    6650 3900
	1    0    0    -1  
$EndComp
Connection ~ 6650 3100
$Comp
L power:GND #PWR?
U 1 1 5FB52EFF
P 6650 4200
F 0 "#PWR?" H 6650 3950 50  0001 C CNN
F 1 "GND" H 6655 4027 50  0000 C CNN
F 2 "" H 6650 4200 50  0001 C CNN
F 3 "" H 6650 4200 50  0001 C CNN
	1    6650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4200 6650 4150
Wire Wire Line
	7850 2000 8300 2000
Wire Wire Line
	8300 1650 8300 2000
Wire Wire Line
	8300 2000 8300 2350
Wire Wire Line
	8300 2350 8400 2350
Connection ~ 8300 2000
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5FB60BC9
P 8600 1650
F 0 "Q1" H 8790 1696 50  0000 L CNN
F 1 "2N3904" H 8790 1605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8800 1575 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 8600 1650 50  0001 L CNN
	1    8600 1650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3906 Q2
U 1 1 5FB6192A
P 8600 2350
F 0 "Q2" H 8790 2304 50  0000 L CNN
F 1 "2N3906" H 8790 2395 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8800 2275 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3906-D.PDF" H 8600 2350 50  0001 L CNN
	1    8600 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	8300 1650 8400 1650
Wire Wire Line
	8700 1850 8700 2000
Wire Wire Line
	8700 2550 8700 2700
$Comp
L power:GND #PWR?
U 1 1 5FB727B6
P 8700 2700
F 0 "#PWR?" H 8700 2450 50  0001 C CNN
F 1 "GND" H 8705 2527 50  0000 C CNN
F 2 "" H 8700 2700 50  0001 C CNN
F 3 "" H 8700 2700 50  0001 C CNN
	1    8700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1450 8700 1300
Text Label 8700 1300 0    50   ~ 0
Vcc
Wire Wire Line
	8700 2000 9100 2000
Connection ~ 8700 2000
Wire Wire Line
	8700 2000 8700 2150
Wire Wire Line
	7250 3100 9100 3100
Wire Wire Line
	9100 3100 9100 2000
Connection ~ 7250 3100
Connection ~ 9100 2000
Wire Wire Line
	9100 2000 9200 2000
$Comp
L pspice:INDUCTOR L2
U 1 1 5FB7A171
P 9450 2000
F 0 "L2" H 9450 2215 50  0000 C CNN
F 1 "1.5m" H 9450 2124 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 9450 2000 50  0001 C CNN
F 3 "~" H 9450 2000 50  0001 C CNN
	1    9450 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:Speaker S1
U 1 1 5FB911B6
P 10300 2300
F 0 "S1" H 10470 2296 50  0000 L CNN
F 1 "8" H 10470 2205 50  0000 L CNN
F 2 "" H 10300 2100 50  0001 C CNN
F 3 "~" H 10290 2250 50  0001 C CNN
	1    10300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2100 9700 2000
Wire Wire Line
	10100 2400 10100 2700
Wire Wire Line
	9700 2600 9700 2700
$Comp
L pspice:CAP C5
U 1 1 5FB911BC
P 9700 2350
F 0 "C5" V 10015 2350 50  0000 C CNN
F 1 "4.7u" V 9924 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9700 2350 50  0001 C CNN
F 3 "~" H 9700 2350 50  0001 C CNN
	1    9700 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBC154D
P 9700 2700
F 0 "#PWR?" H 9700 2450 50  0001 C CNN
F 1 "GND" H 9705 2527 50  0000 C CNN
F 2 "" H 9700 2700 50  0001 C CNN
F 3 "" H 9700 2700 50  0001 C CNN
	1    9700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBC3B5D
P 10100 2700
F 0 "#PWR?" H 10100 2450 50  0001 C CNN
F 1 "GND" H 10105 2527 50  0000 C CNN
F 2 "" H 10100 2700 50  0001 C CNN
F 3 "" H 10100 2700 50  0001 C CNN
	1    10100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2300 10100 2000
Wire Wire Line
	10100 2000 9700 2000
Connection ~ 9700 2000
$Comp
L RF_Module:DWM1000 DWM1
U 1 1 5FC54853
P 1950 2500
F 0 "DWM1" H 1950 3781 50  0000 C CNN
F 1 "DWM1000" H 1950 3690 50  0000 C CNN
F 2 "RF_Module:DWM1000" H 2650 1500 50  0001 C CNN
F 3 "https://www.decawave.com/sites/default/files/resources/dwm1000-datasheet-v1.3.pdf" H 4350 1400 50  0001 C CNN
	1    1950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1900 3100 1900
Text Label 3100 1900 0    50   ~ 0
MISO
Wire Wire Line
	1750 3650 1750 3600
Wire Wire Line
	1750 3650 1850 3650
Wire Wire Line
	2150 3650 2150 3600
Wire Wire Line
	2050 3650 2050 3600
Connection ~ 2050 3650
Wire Wire Line
	2050 3650 2150 3650
Wire Wire Line
	1950 3650 1950 3600
Connection ~ 1950 3650
Wire Wire Line
	1950 3650 2050 3650
Wire Wire Line
	1850 3650 1850 3600
Connection ~ 1850 3650
Wire Wire Line
	1850 3650 1950 3650
Wire Wire Line
	1950 3650 1950 3750
$Comp
L power:GND #PWR?
U 1 1 5FC9E14D
P 1950 3750
F 0 "#PWR?" H 1950 3500 50  0001 C CNN
F 1 "GND" H 1955 3577 50  0000 C CNN
F 2 "" H 1950 3750 50  0001 C CNN
F 3 "" H 1950 3750 50  0001 C CNN
	1    1950 3750
	1    0    0    -1  
$EndComp
Text Label 1600 1400 0    50   ~ 0
Vcc
Wire Wire Line
	1950 1400 1850 1400
Wire Wire Line
	1850 1400 1600 1400
Connection ~ 1850 1400
Wire Wire Line
	2050 1400 1950 1400
Connection ~ 1950 1400
Wire Wire Line
	2850 1800 3100 1800
Text Label 3100 1800 0    50   ~ 0
SPICLK
Wire Wire Line
	5150 2750 5350 2750
Text Label 5350 2750 0    50   ~ 0
SPICLK
Text Label 3100 2000 0    50   ~ 0
MOSI
Text Label 5350 2550 0    50   ~ 0
MOSI
Text Label 5350 2650 0    50   ~ 0
MISO
Wire Wire Line
	5350 2550 5150 2550
Wire Wire Line
	5350 2650 5150 2650
Wire Wire Line
	2850 2000 3100 2000
Wire Wire Line
	2850 2100 3100 2100
Text Label 3100 2100 0    50   ~ 0
CS
Text Label 3750 2750 0    50   ~ 0
CS
Text Label 3700 2250 0    50   ~ 0
TONE
Text Label 3700 2150 0    50   ~ 0
PWM
Text Label 5350 1850 0    50   ~ 0
Vcc
Wire Wire Line
	5150 1850 5350 1850
Wire Wire Line
	6450 1150 6200 1150
Text Label 6200 1150 0    50   ~ 0
PWM
Wire Wire Line
	7450 1150 7450 1300
Wire Wire Line
	7400 1150 7450 1150
Wire Wire Line
	6750 1150 6900 1150
$Comp
L pspice:CAP C2
U 1 1 5FB381F0
P 7450 1550
F 0 "C2" H 7628 1596 50  0000 L CNN
F 1 "680u" H 7628 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7450 1550 50  0001 C CNN
F 3 "~" H 7450 1550 50  0001 C CNN
	1    7450 1550
	1    0    0    -1  
$EndComp
$Comp
L pspice:INDUCTOR L1
U 1 1 5FB375A2
P 7150 1150
F 0 "L1" H 7150 1365 50  0000 C CNN
F 1 "15m" H 7150 1274 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric" H 7150 1150 50  0001 C CNN
F 3 "~" H 7150 1150 50  0001 C CNN
	1    7150 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 5FB300DB
P 6600 1150
F 0 "R3" H 6668 1196 50  0000 L CNN
F 1 "6.8" H 6668 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6640 1140 50  0001 C CNN
F 3 "~" H 6600 1150 50  0001 C CNN
	1    6600 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7450 2300 7450 2400
$Comp
L power:GND #PWR?
U 1 1 5FB526FD
P 7450 2400
F 0 "#PWR?" H 7450 2150 50  0001 C CNN
F 1 "GND" H 7455 2227 50  0000 C CNN
F 2 "" H 7450 2400 50  0001 C CNN
F 3 "" H 7450 2400 50  0001 C CNN
	1    7450 2400
	1    0    0    -1  
$EndComp
Text Label 6200 1900 0    50   ~ 0
TONE
Wire Wire Line
	6200 1900 7250 1900
Connection ~ 6650 2600
Wire Wire Line
	6650 2100 6650 2600
Wire Wire Line
	7250 2100 6650 2100
$Comp
L Amplifier_Operational:LM741 U3
U 1 1 5FB3AE8B
P 7550 2000
F 0 "U3" H 7894 2046 50  0000 L CNN
F 1 "LM741" H 7894 1955 50  0000 L CNN
F 2 "" H 7600 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm741.pdf" H 7700 2150 50  0001 C CNN
	1    7550 2000
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D2
U 1 1 5FB0D020
P 7400 4900
F 0 "D2" H 7400 4635 50  0000 C CNN
F 1 "DIODE" H 7400 4726 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 7400 4900 50  0001 C CNN
F 3 "~" H 7400 4900 50  0001 C CNN
	1    7400 4900
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D3
U 1 1 5FB120D5
P 6950 5000
F 0 "D3" H 6950 4735 50  0000 C CNN
F 1 "DIODE" H 6950 4826 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 6950 5000 50  0001 C CNN
F 3 "~" H 6950 5000 50  0001 C CNN
	1    6950 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 4800 8150 4800
Wire Wire Line
	8150 4900 7600 4900
$Comp
L pspice:DIODE D4
U 1 1 5FB18DF1
P 6550 5100
F 0 "D4" H 6550 4835 50  0000 C CNN
F 1 "DIODE" H 6550 4926 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 6550 5100 50  0001 C CNN
F 3 "~" H 6550 5100 50  0001 C CNN
	1    6550 5100
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D5
U 1 1 5FB1C045
P 7850 5200
F 0 "D5" H 7850 4935 50  0000 C CNN
F 1 "DIODE" H 7850 5026 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 7850 5200 50  0001 C CNN
F 3 "~" H 7850 5200 50  0001 C CNN
	1    7850 5200
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D6
U 1 1 5FB1DB1D
P 7400 5300
F 0 "D6" H 7400 5035 50  0000 C CNN
F 1 "DIODE" H 7400 5126 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 7400 5300 50  0001 C CNN
F 3 "~" H 7400 5300 50  0001 C CNN
	1    7400 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 5200 8150 5200
Wire Wire Line
	8150 5300 7600 5300
$Comp
L pspice:DIODE D7
U 1 1 5FB27E8B
P 6950 5400
F 0 "D7" H 6950 5135 50  0000 C CNN
F 1 "DIODE" H 6950 5226 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 6950 5400 50  0001 C CNN
F 3 "~" H 6950 5400 50  0001 C CNN
	1    6950 5400
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D8
U 1 1 5FB2A6C9
P 6550 5500
F 0 "D8" H 6550 5235 50  0000 C CNN
F 1 "DIODE" H 6550 5326 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 6550 5500 50  0001 C CNN
F 3 "~" H 6550 5500 50  0001 C CNN
	1    6550 5500
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D9
U 1 1 5FB2C141
P 7850 5600
F 0 "D9" H 7850 5335 50  0000 C CNN
F 1 "DIODE" H 7850 5426 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 7850 5600 50  0001 C CNN
F 3 "~" H 7850 5600 50  0001 C CNN
	1    7850 5600
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D10
U 1 1 5FB2DE5A
P 7400 5700
F 0 "D10" H 7400 5435 50  0000 C CNN
F 1 "DIODE" H 7400 5526 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 7400 5700 50  0001 C CNN
F 3 "~" H 7400 5700 50  0001 C CNN
	1    7400 5700
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D11
U 1 1 5FB2F8E4
P 6950 5800
F 0 "D11" H 6950 5535 50  0000 C CNN
F 1 "DIODE" H 6950 5626 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 6950 5800 50  0001 C CNN
F 3 "~" H 6950 5800 50  0001 C CNN
	1    6950 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 5100 8150 5100
Wire Wire Line
	7150 5000 8150 5000
Wire Wire Line
	8150 5400 7150 5400
Wire Wire Line
	8150 5500 6750 5500
Wire Wire Line
	8150 5600 8050 5600
Wire Wire Line
	8150 5700 7600 5700
Wire Wire Line
	8150 5800 7150 5800
Wire Wire Line
	9250 5900 9350 5900
$Comp
L pspice:DIODE D1
U 1 1 5FB7484F
P 7850 4800
F 0 "D1" H 7850 4535 50  0000 C CNN
F 1 "DIODE" H 7850 4626 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 7850 4800 50  0001 C CNN
F 3 "~" H 7850 4800 50  0001 C CNN
	1    7850 4800
	-1   0    0    1   
$EndComp
$Comp
L pspice:DIODE D12
U 1 1 5FB7761E
P 9550 5900
F 0 "D12" H 9550 6165 50  0000 C CNN
F 1 "DIODE" H 9550 6074 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 9550 5900 50  0001 C CNN
F 3 "~" H 9550 5900 50  0001 C CNN
	1    9550 5900
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D13
U 1 1 5FB797A1
P 9900 5800
F 0 "D13" H 9900 6065 50  0000 C CNN
F 1 "DIODE" H 9900 5974 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 9900 5800 50  0001 C CNN
F 3 "~" H 9900 5800 50  0001 C CNN
	1    9900 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 5700 9250 5700
Wire Wire Line
	9700 5800 9250 5800
$Comp
L pspice:DIODE D15
U 1 1 5FB92A11
P 10700 5600
F 0 "D15" H 10700 5865 50  0000 C CNN
F 1 "DIODE" H 10700 5774 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 10700 5600 50  0001 C CNN
F 3 "~" H 10700 5600 50  0001 C CNN
	1    10700 5600
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D14
U 1 1 5FB8D764
P 10300 5700
F 0 "D14" H 10300 5965 50  0000 C CNN
F 1 "DIODE" H 10300 5874 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 10300 5700 50  0001 C CNN
F 3 "~" H 10300 5700 50  0001 C CNN
	1    10300 5700
	1    0    0    -1  
$EndComp
$Comp
L 74HC154D_653:74HC154D,653 IC1
U 1 1 5FB099EC
P 8150 4800
F 0 "IC1" H 8700 5065 50  0000 C CNN
F 1 "74HC154D,653" H 8700 4974 50  0000 C CNN
F 2 "SOIC127P1032X265-24N" H 9100 4900 50  0001 L CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT154.pdf" H 9100 4800 50  0001 L CNN
F 4 "74HC(T)154 - 4-to-16 line decoder/demultiplexer@en-us" H 9100 4700 50  0001 L CNN "Description"
F 5 "2.65" H 9100 4600 50  0001 L CNN "Height"
F 6 "Nexperia" H 9100 4500 50  0001 L CNN "Manufacturer_Name"
F 7 "74HC154D,653" H 9100 4400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "74HC154D,653" H 9100 4300 50  0001 L CNN "Arrow Part Number"
F 9 "https://www.arrow.com/en/products/74hc154d653/nexperia" H 9100 4200 50  0001 L CNN "Arrow Price/Stock"
F 10 "771-74HC154D-T" H 9100 4100 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/Nexperia/74HC154D653?qs=P62ublwmbi8JyjUbQEyRZg%3D%3D" H 9100 4000 50  0001 L CNN "Mouser Price/Stock"
	1    8150 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5600 10500 5600
Wire Wire Line
	6350 5100 6350 5200
Connection ~ 6350 5500
Wire Wire Line
	6350 5500 6350 5600
Wire Wire Line
	6750 5800 6350 5800
Wire Wire Line
	7200 5700 6350 5700
Connection ~ 6350 5700
Wire Wire Line
	6350 5700 6350 5800
Wire Wire Line
	7650 5600 6350 5600
Connection ~ 6350 5600
Wire Wire Line
	6350 5600 6350 5700
Wire Wire Line
	6750 5400 6350 5400
Connection ~ 6350 5400
Wire Wire Line
	6350 5400 6350 5500
Wire Wire Line
	7200 5300 6350 5300
Connection ~ 6350 5300
Wire Wire Line
	6350 5300 6350 5400
Wire Wire Line
	7650 5200 6350 5200
Connection ~ 6350 5200
Wire Wire Line
	6350 5200 6350 5300
Wire Wire Line
	6750 5000 6350 5000
Wire Wire Line
	6350 5000 6350 5100
Connection ~ 6350 5100
Wire Wire Line
	7200 4900 6350 4900
Wire Wire Line
	6350 4900 6350 5000
Connection ~ 6350 5000
Wire Wire Line
	7650 4800 6350 4800
Wire Wire Line
	6350 4800 6350 4900
Connection ~ 6350 4900
Wire Wire Line
	10900 5900 9750 5900
Wire Wire Line
	10100 5800 10900 5800
Wire Wire Line
	10900 5600 10900 5700
Connection ~ 10900 5800
Wire Wire Line
	10900 5800 10900 5900
Wire Wire Line
	10500 5700 10900 5700
Connection ~ 10900 5700
Wire Wire Line
	10900 5700 10900 5800
Wire Wire Line
	10900 5900 10900 6000
Connection ~ 10900 5900
Wire Wire Line
	3950 2750 3750 2750
Wire Wire Line
	3700 2250 3950 2250
Wire Wire Line
	3700 2150 3950 2150
$Comp
L power:GND #PWR?
U 1 1 5FB4725D
P 5200 3800
F 0 "#PWR?" H 5200 3550 50  0001 C CNN
F 1 "GND" H 5205 3627 50  0000 C CNN
F 2 "" H 5200 3800 50  0001 C CNN
F 3 "" H 5200 3800 50  0001 C CNN
	1    5200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3750 5200 3800
Wire Wire Line
	5150 3750 5200 3750
$Comp
L ATMEGA328-AUR:ATMEGA328-AUR U1
U 1 1 5FAFF18D
P 4550 2750
F 0 "U1" H 4550 4017 50  0000 C CNN
F 1 "ATMEGA328-AUR" H 4550 3926 50  0000 C CNN
F 2 "QFP80P900X900X120-32N" H 4550 2750 50  0001 L BNN
F 3 "" H 4550 2750 50  0001 L BNN
F 4 "Atmel" H 4550 2750 50  0001 L BNN "MANUFACTURER"
	1    4550 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBDB857
P 10900 6000
F 0 "#PWR?" H 10900 5750 50  0001 C CNN
F 1 "GND" H 10905 5827 50  0000 C CNN
F 2 "" H 10900 6000 50  0001 C CNN
F 3 "" H 10900 6000 50  0001 C CNN
	1    10900 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FBD8464
P 6350 5800
F 0 "#PWR?" H 6350 5550 50  0001 C CNN
F 1 "GND" H 6355 5627 50  0000 C CNN
F 2 "" H 6350 5800 50  0001 C CNN
F 3 "" H 6350 5800 50  0001 C CNN
	1    6350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 5500 9250 5500
$Comp
L pspice:DIODE D16
U 1 1 5FBFE567
P 9550 5500
F 0 "D16" H 9550 5765 50  0000 C CNN
F 1 "DIODE" H 9550 5674 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 9550 5500 50  0001 C CNN
F 3 "~" H 9550 5500 50  0001 C CNN
	1    9550 5500
	1    0    0    -1  
$EndComp
Connection ~ 6350 5800
$Comp
L power:GND #PWR?
U 1 1 5FC0E4FB
P 7900 5900
F 0 "#PWR?" H 7900 5650 50  0001 C CNN
F 1 "GND" H 7905 5727 50  0000 C CNN
F 2 "" H 7900 5900 50  0001 C CNN
F 3 "" H 7900 5900 50  0001 C CNN
	1    7900 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5900 7900 5900
Wire Wire Line
	9250 4800 9400 4800
Wire Wire Line
	9400 4800 9400 4750
Text Label 9400 4750 0    50   ~ 0
Vcc
Wire Wire Line
	9750 5500 10900 5500
Wire Wire Line
	10900 5500 10900 5600
Connection ~ 10900 5600
$Comp
L Amplifier_Operational:LM741 U?
U 1 1 5FC2FBFB
P 10000 4150
F 0 "U?" H 10344 4196 50  0000 L CNN
F 1 "LM741" H 10344 4105 50  0000 L CNN
F 2 "" H 10050 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm741.pdf" H 10150 4300 50  0001 C CNN
	1    10000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4900 9400 4900
Wire Wire Line
	9250 5000 9400 5000
Wire Wire Line
	9250 5100 9400 5100
Wire Wire Line
	9250 5200 9400 5200
Text Label 9400 4900 0    50   ~ 0
A1
Text Label 9400 5000 0    50   ~ 0
A2
Text Label 9400 5100 0    50   ~ 0
A3
Text Label 9400 5200 0    50   ~ 0
A4
$EndSCHEMATC
