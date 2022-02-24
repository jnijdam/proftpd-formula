{% from "proftpd/map.jinja" import proftpd with context %}

proftpd_fb_config:
  file.append:
    - name: {{ proftpd.config }}
    - text:
        - Include {{ proftpd.fb_config }}

proftpd_fb_config_file:
    file.managed:
        - name: {{ proftpd.fb_config }}
        - source: salt://proftpd/files/fb.conf
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - context:
          FB: {{ proftpd.FB }}
