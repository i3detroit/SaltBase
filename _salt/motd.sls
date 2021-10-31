#!pyobjects

File.managed('/etc/motd', user='root', group='root',
             mode='0644', source=f'salt://motds/{grains("host")}.motd')
