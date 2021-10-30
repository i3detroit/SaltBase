# This is specific for debian, customize for your own uses
salt-repo:
  pkgrepo.managed:
    - name: 'deb https://repo.saltstack.com/py3/debian/{{grains['osmajorrelease']}}/{{grains['osarch']}}/3001 {{grains['oscodename']}} main'
    - key_url: https://repo.saltstack.com/py3/debian/{{grains['osmajorrelease']}}/{{grains['osarch']}}/3001/SALTSTACK-GPG-KEY.pub
    - file: /etc/apt/sources.list.d/salt.list

salt-minion:
  pkg.installed: []
  service.running:
    - enable: true

highstate:
  schedule.present:
    - function: state.highstate
    - hours: 12
    - splay: 7200
