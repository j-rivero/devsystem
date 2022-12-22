# Overview

Chef repo template ready to use with knife-zero.

Read tutorial - [Provisioning remote server accessible by SSH with Chef and knife-zero](https://gist.github.com/maxivak/75eabc7ff292dd86c07ddc95add75953).


Directory structure:
* berks-cookbooks — Chef cookbooks managed by Berkshelf
* site-cookbooks - custom cookbooks
* data_bags — Chef Data Bags
* nodes — Chef nodes (folder with roles for each machine)
* roles — Chef roles (role is a group of recipes and additional attributes)
* environments— Chef environments




# Quick start

* edit 	Berfkshelf
include external cookbooks


* install external cookbooks using Berkshelf
```
berks install
```



* add roles for your servers

example `roles/myrole.json`:
```
{
  "name": "myrole",
  "description": "my sample role",
  "json_class": "Chef::Role",

  "default_attributes": {
    "var1": "some-value-1"
  },

  "run_list": [
    "recipe[chef-cookbook-example-1]",
    "recipe[temp1]"
  ]
}

```

specify the list of recipes to run and default attributes.


* bootstrap the server (one time)
```
knife zero bootstrap 11.22.33.44 --ssh-user ubuntu --ssh-password mypass --node-name mynode1
```

it will create file nodes/mynode1.json with server attributes.


* server attributes

if you have additional attributes for this server - use attributes file (see example servers/myserver.json).

* run provision with attributes
```
knife zero converge  "name:mynode1"  --ssh-user root --ssh-password root --json-attributes servers/myserver.json --override-runlist "role[myrole]"
```

it will run all recipes specified in role file 'roles/myrole.json'.
Attributes in file `servers/myserver.json` will override default attributes specified in role.

see more options for knife zero converge [here](http://knife-zero.github.io/20_getting_started/).



# Cookbooks

* add custom cookbook

```
cd site-cookbooks
chef generate cookbook example1
```

it will create a new folder `site-cookbooks/example1` with cookbook.




# Roles

* add roles to roles/ folder



# Attributes

* attributes for servers

* place in folder /servers


