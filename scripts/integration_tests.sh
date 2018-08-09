echo "\n--- Starting integration tests ---\n"
echo "Start appium in a separate window: appium --command-timeout='7600'"
#read -p "Press enter to continue"

cd ../test
bundle exec cucumber features/digital_coaching.feature --tag @smoke
