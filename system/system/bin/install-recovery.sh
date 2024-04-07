#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:b3d2f5c2f2ec7e5891db5d1b01bfd64152ede514; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:74ce39d4b6644685624c078052035703745cc64e \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:b3d2f5c2f2ec7e5891db5d1b01bfd64152ede514 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
