cookbook_path    [
                     File.expand_path('../../berks-cookbooks', __FILE__),
                     "site-cookbooks",
                 ]

node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
#encrypted_data_bag_secret "data_bag_key"

# berkshelf
#knife[:before_bootstrap] = "berks vendor"
#knife[:before_converge]  = "berks vendor"

knife[:before_bootstrap] = "chef exec berks vendor"
knife[:before_converge]  = "chef exec berks vendor"


#knife[:berkshelf] = true
#knife[:berkshelf_path] = "cookbooks"


ssl_verify_mode :verify_none


knife[:ssh_attribute] = "knife_zero.host"
