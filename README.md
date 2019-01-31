[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-ecd.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-ecd)
# Ansible role `ecd`

An Ansible role for install and configure ECD. Specifically, the responsibilities of this role are to:

- install SDS and httpd
- configure the wsgi application

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_ecd_bind_address` | `{{ hostvars[inventory_hostname]['ansible_' + openio_ecd_bind_interface]['ipv4']['address'] }}` | The address that this ecd instance will run on |
| `openio_ecd_bind_interface` | `{{ ansible_default_ipv4.alias }}` | The interface that this ecd instance will run on |
| `openio_ecd_bind_port` | `6017` | Listening port |
| `openio_ecd_gridinit_dir` | `/etc/gridinit.d/{{ openio_ecd_namespace }}` | Path to copy the gridinit conf |
| `openio_ecd_gridinit_file_prefix` | `""` | Maybe set it to {{ openio_ecd_namespace }}- for old gridinit's style |
| `openio_ecd_gridinit_on_die` | `respawn` | Behaviour on failure |
| `openio_ecd_gridinit_start_at_boot` | `true` | Start at system boot |
| `openio_ecd_namespace` | `OPENIO` | Namespace |
| `openio_ecd_pid_directory` | `/run/oio/sds/{{ openio_ecd_namespace }}` | Folder for pid file |
| `openio_ecd_serviceid` | `0` |	ID in gridinit |
| `openio_ecd_socket_directory` | `"/run/oio/sds/{{ openio_ecd_namespace }}/{{ openio_ecd_servicename }}"` | Folder for socket file |
| `openio_ecd_version` | `latest` | Install a specific version |
| `openio_ecd_volume` | `/var/lib/oio/sds/{{ openio_ecd_namespace }}/{{ openio_ecd_servicename }}"` | Path to store data |
| `openio_ecd_wsgi_processes` | `{{ ansible_processor_vcpus }}` | Defines the number of daemon processes that should be started in this process group |
| `openio_ecd_wsgi_threads` | `1` | Defines the number of threads to be created to handle requests in each daemon process within the process group |

## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  become: true
  vars:
    NS: OPENIO
  roles:
    - role: users
    - role: repo
    - role: gridinit
      openio_gridinit_namespace: "{{ NS }}"
    - role: role_under_test
      openio_ecd_namespace: "{{ NS }}"
```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
