cookbook_path [
   File.expand_path('../../berks-cookbooks', __FILE__),
   "site-cookbooks",
]

role_path        "roles"
environment_path [ "environments" , File.join(ROOT, "test/integration/environments") ]
data_bag_path    "data_bags"
solo.true
