accept-license:
  cmd.run:
    - name: echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    - unless: debconf-get-selections | grep -q shared/accepted-oracle-license-v1-1
    - user: root
    
jdk7:
  pkg.installed:
    - name: oracle-java7-installer
    - pkgrepo: java7_ppa
    - require:
      - cmd: accept-license
      - cmd: java7_ppa
      
java7_ppa:
  cmd.run:
    - name: add-apt-repository ppa:webupd8team/java --yes && apt-get update
    - user: root
