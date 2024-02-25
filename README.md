# Own Keyboard Firmware

QMK firmware keyboard/keymap files I customized

## Lily58

![lily58/zl58](imgur.com image replace me!)

* **Hardware Supported:** Arduino Pro Micro(atmega32u4)
* **Hardware Availability:** *Links to where you can find this hardware*

Make example for this keyboard (after setting up your build environment):

    make lily58/zl58:zL58

Flashing example for this keyboard:

    make lily58/zl58:zL58:flash

### Flash zL58 QMK Firmware

1. Install QMK Firmware on your system
<https://docs.qmk.fm/#/newbs_getting_started>

2. Add zL58 files to QMK Firmware directory

```bash
~/qmk_firmware/keyboards/lily58/
    |- zl58/
        |- info.json
        |- readme.md
        |- rules.mk
    |- keymaps/
        |- zL58/
            |- config.h
            |- keymap.c
            |- rules.mk
```

3. Compile and flash the firmware

```bash
qmk flash -kb lily58/zl58 -km zL58 -c
```

Enter the bootloader in 4 ways:

* **Bootmagic reset**: Hold down the key at (0,0) in the matrix (usually the top left key or Escape) and plug in the keyboard
* **Physical reset button**: Briefly press the button on the back of the PCB - some may have pads you must short instead
* **GND and RST**: Short the GND and RST pins on the Pro Micro
* **Keycode in layout**: Press the key mapped to `QK_BOOT` if it is available
