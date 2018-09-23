ansible-role-1password-cli
==========================

[![Apache-2.0 License](https://img.shields.io/github/license/bluk/ansible-role-1password-cli.svg)][license] [![Build Status](https://travis-ci.org/bluk/ansible-role-1password-cli.svg?branch=master)][travis-ci]

An [Ansible](https://www.ansible.com) role to install [1Password CLI](https://support.1password.com/command-line/) tools.

See the [release notes for the 1Password CLI](https://app-updates.agilebits.com/product_history/CLI).

Requirements
------------

It is assumed that `curl`, `gpg`, and `unzip` are available.

Role Variables
--------------

* `op_cli_version` - The version of the tool (e.g. `0.5.3`).

* `op_cli_platform` - The platform of the tool to install (e.g. `linux_amd64` or `darwin_amd64`).

* `op_cli_install_path` - The path to install the tool.

Dependencies
------------

No dependencies.

Example Playbook
----------------

```
- hosts: servers
  roles:
     - role: bluk.1password-cli
       vars:
         op_cli_version: 0.5.3
         op_cli_platform: darwin_amd64
         op_cli_install_path: /usr/local/bin
```

License
-------

[Apache 2.0][license]

[license]: https://github.com/bluk/ansible-role-1password-cli/blob/master/LICENSE
[travis-ci]: https://travis-ci.org/bluk/ansible-role-1password-cli
