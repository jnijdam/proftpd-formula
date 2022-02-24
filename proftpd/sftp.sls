{% from "proftpd/map.jinja" import proftpd with context %}

proftpd_sftp_config:
  file.append:
    - name: {{ proftpd.config }}
    - text:
      - Include {{ proftpd.sftp_config }}

proftpd_sftp_config_file:
    file.managed:
        - name: {{ proftpd.sftp_config }}
        - source: salt://proftpd/files/sftp.conf
        - user: root
        - group: root
        - mode: 644
        - show_changes: true
        - template: jinja
        - context:
          sftp: {{ proftpd.SFTP }}

{% if not salt['pillar.get']('proftpd:Modules:mod_sftp') %}
add_sftp_modules:
  file.append:
    - name : {{ proftpd.modules_config }}
    - text: LoadModule mod_sftp.c
{% endif %}
