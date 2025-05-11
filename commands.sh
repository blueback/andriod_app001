#!/usr/bin/bash
export JAVA_HOME=jdk-24.0.1
source setup.sh
#cmdline-tools/bin/sdkmanager --install "platform-tools" "platforms;android-34" "build-tools;34.0.0" --sdk_root=cmdline-tools
#cmdline-tools/bin/sdkmanager --install "gradle" --sdk_root=cmdline-tools

#gradle-8.14/bin/gradle build --stacktrace --info --scan --debug
gradle-8.14/bin/gradle build

