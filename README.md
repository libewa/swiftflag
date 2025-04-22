## Building
Build with a Swift Nightly toolchain and ESP-IDF only on ESP32C3.

```shellsession
$ . ~/esp/v5.4/esp-idf/export.sh
$ export TOOLCHAINS=$(plutil -extract CFBundleIdentifier raw ~/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-*.xctoolchain/Info.plist)
$ idf.py set-target esp32c3
$ idf.py build
```