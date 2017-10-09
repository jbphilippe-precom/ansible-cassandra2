Role Name
=========

This role install Cassandra version 2.0.x & 2.1.x

Requirements
------------

- Ubuntu Trusty

Role Variables
--------------
     # Cassandra Roles
     ansible-cassandra2
        - ansible-cassandra-install
        - ansible-cassandra-configure
        - ansible-cassandra-topology
        - ansible-cassandra--securise

     #
     # variables
     #
        cassandra_admin_password: <password_admin_user>
     #ansible-cassandra-install
        #vars
        cassandra_vg_name: vg_vroot
        cassandra_lv_name: lv_cassandra
        #default
        cassandra_lv_size: 10g
        cassandra_datadir: /var/lib/cassandra
        cassandra_version_min: 2.1
     #ansible-cassandra-configure
        #vars
        - - -
        #default
        cassandra_version_min: 2.1
        cassandra_cluster_name: Cluster1
        cassandra_interface: eth1
        cassandra_row_cache_size_mb: 512
        cassandra_add_admin_user: True
        cassandra_conf_file: /etc/cassandra/cassandra.yaml
        cassandra_env_file: /etc/cassandra/cassandra-env.sh
        cassandra_logrotate_file: /etc/logrotate.d/cassandra
     #ansible-cassandra-topology
        #vars
        - - -
        #default
        cassandra_interface: eth1
     #ansible-cassandra--securise
        #vars
        #default
        cassandra_conf_file: /etc/cassandra/cassandra.yaml
        cassandra_interface: eth1
        cassandra_add_admin_user: True
        cassandra_system_auth_replication_factor: 2
        cassandra_thrift_client_api_port: 9160


Dependencies
------------
- - -


Example Playbook
----------------
Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
Note: The group must be named "Cassandra_Cluster" in inventory file

Inventory file example:

        [Cassandra_Cluster]
        fcucassandra01l.btsys.local localisation_dc=GOUP
        fcucassandra02l.btsys.local localisation_dc=SFR
        fcucassandra03l.btsys.local localisation_dc=GOUP
        fcucassandra04l.btsys.local localisation_dc=SFR

Playbook example:

     - name: deploy Cassandra
       hosts: Cassandra_Cluster
       #If not ldap
       remote_user: <your username>
       sudo: yes
       vars:
       roles:
         - ../roles/ansible-cassandra-install
         - ../roles/ansible-cassandra-configure
         - ../roles/ansible-cassandra-topology
         - ../roles/ansible-cassandra-securise


License
-------

BSD


Author Information
------------------

BSO ISL - Fcuza

