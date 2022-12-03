# Requires http://haikarainen.github.io/light/

import subprocess

def is_external(device):
    device_folder_name = device[device.find("input"):]
    device_path = "/sys/class/leds/" + device_folder_name + "/device/uevent"
    command = subprocess.Popen(['cat', device_path], stdout = subprocess.PIPE)
    output = str(command.communicate()[0]).split('\\n')

    if "usb" in output[2]:
        return True
    else:
        return False

def current_light_state(device):
    device_folder_name = device[device.find("input"):]
    device_path = "/sys/class/leds/" + device_folder_name + "/brightness"
    command = subprocess.Popen(['cat', device_path], stdout = subprocess.PIPE)
    output = str(command.communicate()[0]).split('\\n')
    
    return str(output[0])[2]

def toggle_light(device):
    if current_light_state(device) == '0':
        state = '1'
    else:
        state = '0'

    subprocess.Popen(['light', "-Srs", str(device), state])

if __name__ == '__main__':

    command = subprocess.Popen(['light', '-L'], stdout = subprocess.PIPE)
    devices = str(command.communicate()[0]).replace("\\t",'').split('\\n')

    for device in devices:
        if 'scroll' in device:
            if is_external(device):
                toggle_light(device)
