#!/bin/bash

cd console/evolution_console
dart pub get
cd ../../
cd console/evolution_console_runner 
dart pub get
cd ../../
cd console/evolution_console_runner_pseudo
dart pub get
cd ../../

cd cross_cutting
dart pub get
cd ../

cd evolution_engine
dart pub get
cd ../

cd evolution_mobile
flutter pub get
cd ../

cd evolution_srvr
dart pub get
cd ../

cd playground
dart pub get
cd ../../