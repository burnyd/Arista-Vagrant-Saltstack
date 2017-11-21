ntp_config_example:
  netconfig.managed:
    - template_name: salt://ntptest.jinja
    - peers: {{ pillar.get('ntp.peers', []) | json }}
    - servers: {{ pillar.get('ntp.servers', []) | json }}
