source SETUP.`hostname`.sh

export ZEDF9P=/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if00-port0 
export ZEDF9P_PROTO="-P 27.12"
export ZEDF9T=/dev/serial/by-id/usb-Silicon_Labs_CP2105_Dual_USB_to_UART_Bridge_Controller_$CP2105_SERIAL-if01-port0 
export ZEDF9T_PROTO="-P 27.20"

alias ubxz9p="ubxtool ::$ZEDF9P $ZEDF9P_PROTO"
alias ubxz9t="ubxtool ::$ZEDF9T $ZEDF9T_PROTO"
