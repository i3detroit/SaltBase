#!pyobjects

File.managed('/etc/motd', user='root', group='root',
             mode='0644', source=f'motds/{grains("host")}.motd')
