#download and install jboss 7.1.1

download-jboss:
  cmd.run:
    - name: wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz
    - cwd: /tmp
    - unless: test -e /tmp/jboss-as-7.1.1.Final.tar.gz || test -e /opt/jboss-as-7.1.1.Final

unpack-jboss:
  cmd.run:
    - name: tar -xf /tmp/jboss-as-7.1.1.Final.tar.gz && mv /tmp/jboss-as-7.1.1.Final /opt/jboss-as-7.1.1.Final
    - user: root
    - unless: test -e /opt/jboss-as-7.1.1.Final
    - cwd: /tmp
    - require:
      - cmd: download-jboss
  file.symlink:
    - name: /opt/jboss-as
    - target: /opt/jboss-as-7.1.1.Final
    - require:
      - cmd: unpack-jboss

chown-jboss:
  cmd.run:
    - name: chown -R jboss-as:jboss-as /opt/jboss-as-7.1.1.Final
    - user: root
    - require:
      - cmd: unpack-jboss
      - user: jboss-as

jboss-as:
  user.present:
    - shell: /bin/false
    - groups:
      - jboss-as
    - require:
      - cmd: download-jboss
      - group: jboss-as
  group.present:
    - name: jboss-as

jboss-service:
  file.managed:
    - name: /etc/init.d/jboss-as
    - source: salt://jboss-as
    - user: root
    - group: root
    - mode: 744
  cmd.wait:
    - name: update-rc.d jboss-as defaults
    - watch:
      - file: jboss-service
  service.running:
    - name: jboss-as
    - reload: True
    
    
    
    
