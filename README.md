# rnog_gps

Code to enable and configure the SSR-M8T GPS board, which is mounted on the RNO-G Controller board. 
The RNO-G Beaglebone (BBB) SBC communicates with the SSR-M8T using UART4.

## Powering the GPS
The GPS can be turned on and off using GPIO 22 on the BBB. The scripts `gpsOn.sh` and `gpsOff.sh` are self-explanatory.

## Enabling gpsd and configuring the device
Here, we assume the SSR-M8T has been pre-configured in `pass-through mode', which enables more user functionality. 
The baud rate in this mode is 57600. Documentation for this will be added eventually.

First, the gpsd service daemon can be enabled using `enableGPSdRAW.sh`. 

The device state can be checked using (assuming a cold start):

```
>> gpsctl /dev/ttyO4
/dev/ttyO4 identified as a NMEA0183 at 57600 baud.
```
[Note, this may present a timeout error (`gpsctl:ERROR: timed out waiting for device`), but it should work on the 2nd or 3rd attempt for whatever reason]

Next, the device can be configured in binary mode using `setupUblox.sh`, which also enables the RAWX output and the TIM-TP message. 
Be warned, running this will spit a bunch of messages on the command line. 
Before running this, ensure that the `UBXOPTS` variable is defined [See `SETUP.sh`]. 

You can check the device configuration in several ways:

### Check enabled satellite consellations:
```
>> ubxtool -p CFG-GNSS
[...]
UBX-CFG-GNSS:
 msgVer 0  numTrkChHw 32 numTrkChUse 32 numConfigBlocks 7
  gnssId 0 TrkCh  8 maxTrCh 16 reserved 0 Flags x01010001
   GPS L1C/A enabled
  gnssId 1 TrkCh  1 maxTrCh  3 reserved 0 Flags x01010000
   SBAS L1C/A
  gnssId 2 TrkCh  4 maxTrCh  8 reserved 0 Flags x01010000
   Galileo E1
  gnssId 3 TrkCh  2 maxTrCh 16 reserved 0 Flags x01010000
   BeiDou B1I
  gnssId 4 TrkCh  0 maxTrCh 16 reserved 0 Flags x03010000
   IMES L1
  gnssId 5 TrkCh  0 maxTrCh  3 reserved 0 Flags x05050001
   QZSS L1C/A L2S enabled
  gnssId 6 TrkCh  8 maxTrCh 14 reserved 0 Flags x01010000
   GLONASS L1
[...]
```

### Check that the RAWX message is properly enabled:
```
>> ubxtool -w 4 | fgrep RAWX
UBX-RXM-RAWX:
UBX-RXM-RAWX:
```
[You may see between 1 and 4 lines of `UBX-RXM-RAWX:` here]

Note: RAWX messaging useful only for generating RINEX observation files, ancillary to primary RNO-G science. More on this later..

### Check that the TP message is properly enabled:
```
>> ubxtool -w 4 | fgrep TP
UBX-TIM-TP:
```
[You may see 1 or 2 lines of `UBX-TIM-TP:` here]

Note: TP message includes the qerr (quantization error) for the next PPS pulse. 
For some reason, the TP messaging may take 10-15 minutes to show up on the output after configuration. 
This probably has to do with obtaining a good gps lock.
