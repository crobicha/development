BUILD_TYPE=Lh
BUILD_VARIANT=Qa


# Ensure we are using app_root as working directory
cd $(dirname $0)/..


## checkStyle
java -jar ./styleguide/checkstyle-7.7-all.jar -c ./styleguide/rules/google_checks.xml app/src
if [ $? -ne 0 ]
then
  echo "\n--- checkStyle failed ---\n"
  exit 1
fi
echo "\n--- checkStyle passed ---\n"


## Unit Tests
./gradlew test${BUILD_TYPE}${BUILD_VARIANT}UnitTest
if [ $? -ne 0 ]
then
  echo "\n--- unit tests failed ---\n"
  exit 1
fi
echo "\n--- unit tests passed ---\n"
