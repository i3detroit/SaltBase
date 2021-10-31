#!/usr/bin/env python3

import configparser
import os
import os.path
import sys

from pyfiglet import Figlet

if __name__ == '__main__':
    motd_path = sys.argv[1]
    config_path = os.path.abspath(os.path.join(
        os.path.dirname(__file__), '..', 'hosts.ini'))
    config = configparser.ConfigParser()
    config.read(config_path)
    fig = Figlet(font=config.get('figlet', 'font'))
    for section in config.sections():
        if '_domain' not in section:
            continue
        domain = section.replace('_domain', '')
        for hostname in config[section]:
            description = config[section][hostname]
            host_fig = fig.renderText(f'{hostname}.{domain}')
            center_w = max(map(len, host_fig.split('\n')))
            with open(os.path.join(motd_path, f'{hostname}.motd'), 'w') as f:
                f.write(f'{host_fig}{description.center(center_w)}\n\n')
