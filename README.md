# Scrolllight

Some backlit keyboards have backlight control tied to the Scroll Lock indicator light.

This tool automatically finds and enables the Scroll Lock light in connected USB keyboards without enabling Scroll Lock itself.

It comes in three flavors: sudo and nosudo.
`scrolllight_sudo.sh` will ask for a password upon running, but does not require any external dependencies.
`scrolllight_nosudo.sh` will need `light` (http://haikarainen.github.io/light/) installed, but does not ask for a password.
`scrolllight.py` is a Python version with a more robust algorithm for detecting external keyboards. Requires `light` (http://haikarainen.github.io/light/) to be installed.
