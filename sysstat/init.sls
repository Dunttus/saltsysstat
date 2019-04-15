install_sysstat:
  pkg.installed:
    - pkgs:
      - sysstat

/etc/default/sysstat:
  file.managed:
    - source: salt://sysstat/config/default-sysstat

sysstatservice:
  service.running:
    - name: sysstat
    - watch:
      - file: /etc/default/sysstat

