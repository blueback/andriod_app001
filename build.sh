#!/usr/bin/bash
export JAVA_HOME=jdk-24.0.1
export ANDROID_HOME=cmdline-tools/
export PATH=${PATH}:${ANDROID_HOME}/enumlator
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#cmdline-tools/bin/sdkmanager --install "platform-tools" "platforms;android-34" "build-tools;34.0.0" --sdk_root=cmdline-tools
#cmdline-tools/bin/sdkmanager --install "gradle" --sdk_root=cmdline-tools

#gradle-8.14/bin/gradle build --stacktrace --info --scan --debug
gradle-8.14/bin/gradle build

