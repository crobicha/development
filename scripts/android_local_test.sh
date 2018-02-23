APP_ROOT=~/repos/itriage/aetnaboost-android

## Run local build, confirm it compiles


## Lint check


## Unit tests


## Functional tests
cd $APP_ROOT/test

# Start appium in separate process
bundle exec cucumber features/procedure.feature --tag @smoke
