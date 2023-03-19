mkdir libs && cd libs

wget http://apt.bingner.com/debs/1443.00/libimobiledevice6_1.3.1-1_iphoneos-arm.deb
wget http://apt.bingner.com/debs/1443.00/libirecovery3_1.0.1-1_iphoneos-arm.deb
wget http://apt.bingner.com/debs/1443.00/libusb-1.0-0_1.0.23-1_iphoneos-arm.deb
wget http://apt.bingner.com/debs/1443.00/libusbmuxd6_2.0.3-1_iphoneos-arm.deb

for file in *.deb; do
  if [[ -f "$file" ]]; then
    ar -x "$file"
    rm -rf control.tar.gz
    rm -rf debian-binary
    tar --lzma -xvf data.tar.lzma
    mv usr/lib/* .
  fi
done

rm -rf data.tar.lzma usr *.deb
