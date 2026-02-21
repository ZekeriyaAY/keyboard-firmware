# Own Keyboard Firmware

QMK firmware keyboard/keymap files I customized. Uses [QMK External Userspace](https://docs.qmk.fm/newbs_external_userspace) — no need to fork or copy files into `qmk_firmware`.

## Setup

```bash
# Clone this repo
git clone https://github.com/ZekeriyaAY/keyboard-firmware.git
cd keyboard-firmware

# Run setup (installs QMK CLI if needed, configures overlay)
./setup.sh

# Compile all keyboards
qmk userspace-compile
```

## Build & Flash

```bash
# Compile + flash
qmk flash -kb lily58/zl58 -km zl58 -c
```

## Keyboards

### Lily58 — zL58

![zL58/lily58_zl58.png](zL58-handwiring.png)

* **Hardware Supported:** Arduino Pro Micro (atmega32u4)

Enter the bootloader in 4 ways:

* **Bootmagic reset**: Hold down the key at (0,0) in the matrix (usually the top left key or Escape) and plug in the keyboard
* **Physical reset button**: Briefly press the button on the back of the PCB - some may have pads you must short instead
* **GND and RST**: Short the GND and RST pins on the Pro Micro
* **Keycode in layout**: Press the key mapped to `QK_BOOT` if it is available

### Keychron K11 Pro

* **Hardware Supported:** Keychron K11 Pro (69-key, ANSI, RGB, Rotary Encoder)
* **Firmware:** [Keychron QMK fork](https://github.com/Keychron/qmk_firmware) (does not compile with upstream QMK)
* **Keymap:** VIA — Mac/Win dual layer, Bluetooth (BT_HST1-3), RGB control, encoder (volume/RGB)

> **Note:** K11 Pro requires Keychron's own QMK fork. Use the [Keychron QMK Firmware](https://github.com/Keychron/qmk_firmware) repo to compile. Files in this repo are kept for reference and backup.
