#!/usr/bin/bash
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

# Set JAVA_HOME {
export JAVA_HOME=${PWD}/third_party/jdk-24.0.1
# }

if [ "$1" = "clean" ] ; then
  # Clean before build {
  rm -rf .gradle
  rm -rf build
  rm -rf app/build
  #rm -rf third_party/cmdline-tools/platform-tools/
  #rm -rf third_party/cmdline-tools/platforms/
  #rm -rf third_party/cmdline-tools/build-tools/
  #rm -rf third_party/cmdline-tools/emulator/
  #rm -rf third_party/cmdline-tools/system-images/
  rm -rf third_party/android-sdk
  # }
  
  # Install with sdkmanager {
  # Install one by one {2
  #./third_party/cmdline-tools/bin/sdkmanager \
  #  --install \
  #  "platform-tools" \
  #  "platforms;android-33" \
  #  "build-tools;33.0.0" \
  #  "system-images;android-33;google_apis;x86_64" \
  #  --sdk_root="third_party/cmdline-tools"
  
  # Install cmdline tools {2
  ./third_party/cmdline-tools/bin/sdkmanager \
      --sdk_root="$PWD/third_party/android-sdk" \
      "cmdline-tools;latest"
  
  # set ANDROID_SDK_ROOT {2
  export ANDROID_HOME=$PWD/third_party/android-sdk
  export ANDROID_SDK_ROOT=$ANDROID_HOME
  export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
  which sdkmanager
  
  # Install platform-tools {2
  sdkmanager \
      --sdk_root="$ANDROID_SDK_ROOT" \
      "platform-tools"
  
  # Install Android 33 platform {2
  sdkmanager \
      --sdk_root="$ANDROID_SDK_ROOT" \
      "platforms;android-33"
  
  # Install build tools {2
  sdkmanager \
      --sdk_root="$ANDROID_SDK_ROOT" \
      "build-tools;33.0.0"
  
  # Install system images {2
  sdkmanager \
      --sdk_root="$ANDROID_SDK_ROOT" \
      "system-images;android-33;google_apis;x86_64"
  
  # unused installs {2
  # Install gradle {3
  #sdkmanager \
  #  --install "gradle" \
  #  --sdk_root=third_party/cmdline-tools
  
  # List available system images {3
  #sdkmanager \
  #  --list \
  #  --sdk_root="third_party/cmdline-tools" \
  #  | grep system-images
  
  # Install a specific system image (example for API 33) {3
  #sdkmanager \
  #  "system-images;android-33;google_apis;x86_64" \
  #  --sdk_root="third_party/cmdline-tools"
  
  # Accept licences {2
  sdkmanager \
    --sdk_root="$ANDROID_SDK_ROOT" \
    --licenses
  
  # Verify installation {2
  sdkmanager \
    --sdk_root="$ANDROID_SDK_ROOT" \
    --list_installed
  
  # }1
else
  # set ANDROID_SDK_ROOT {
  export ANDROID_HOME=$PWD/third_party/android-sdk
  export ANDROID_SDK_ROOT=$ANDROID_HOME
  export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
  which sdkmanager
  which avdmanager
  # }
fi

# tools exports {
export PATH="${PATH}:${ANDROID_HOME}/emulator"
export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/tools/bin"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
# }

# Create local.properties {
echo "sdk.dir=$ANDROID_SDK_ROOT" > local.properties
# }

# Build {
#./third_party/gradle-8.14/bin/gradle build --stacktrace --info --scan --debug
./third_party/gradle-8.14/bin/gradle build
# }

# Create avd {

# Delete old avd {
# avdmanager location ./third_party/cmdline-tools/latest/bin/avdmanager
which avdmanager
avdmanager delete avd \
    -n "Pixel_API_33"
# }

# Create new avd {
avdmanager create avd \
    -n "Pixel_API_33" \
    -k "system-images;android-33;google_apis;x86_64" \
    -d "pixel" \
    -c 1000M \
    --force
# }

# old avd creation code {
#avdmanager create avd \
#  -n test \
#  -k "system-images;android-33;google_apis;x86" \
#  -c 1000M

#avdmanager create avd \
#    -n "Pixel_API_33" \
#    -k "system-images;android-33;google_apis;x86_64" \
#    -d "pixel" \
#    --force
# }

# }

# Start Emulator {

# List avd {
# emulator location ./third_party/android-sdk/emulator/emulator
which emulator
emulator -list-avds
# }

# Attach to avd {
emulator -avd "Pixel_API_33" -verbose
# }

# old emulation code {
#emulator -list-avds
#emulator -avd myapp_device
# }

adb install app/build/outputs/apk/debug/app-debug.apk

# }
