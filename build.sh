#!/usr/bin/bash
export JAVA_HOME=${PWD}/third_party/jdk-24.0.1
export ANDROID_HOME=${PWD}/third_party/cmdline-tools/
export PATH=${PATH}:${ANDROID_HOME}/enumlator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#./third_party/cmdline-tools/bin/sdkmanager --install "platform-tools" "platforms;android-34" "build-tools;34.0.0" --sdk_root=cmdline-tools
#./third_party/cmdline-tools/bin/sdkmanager --install "gradle" --sdk_root=cmdline-tools

rm -rf .gradle
rm -rf build
rm -rf app/build

#./third_party/gradle-8.14/bin/gradle build --stacktrace --info --scan --debug
./third_party/gradle-8.14/bin/gradle build

