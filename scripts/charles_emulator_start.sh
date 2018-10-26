
# Get local ip address
INET=`ifconfig | grep en0: -A 4 | grep "inet " | cut -d ' ' -f 2`

echo "Starting charles..."
open /Applications/Charles.app
read -n1 -r -p "Press any key when Charles is running..." key

# For proxy, use local ip address from ifconfig command
PROXY=${INET}:8888

~/Library/Android/sdk/tools/emulator -avd Charles_-_Pixel_API_25 -http-proxy $PROXY -no-snapshot &
