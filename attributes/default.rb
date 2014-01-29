# Project settings
default['drupal']['dir'] = "/var/www"
default['drupal']['version'] = "7.26"

# DB Credentials
default['drupal']['db']['database'] = "demo"
default['drupal']['db']['user'] = "root"
default['drupal']['db']['password'] = ""
default['drupal']['db']['host'] = "localhost"

# Site Credentials
default['drupal']['site']['admin'] = "admin"
default['drupal']['site']['pass'] = "admin"
default['drupal']['site']['name'] = "Drupal"
default['drupal']['site']['host'] = "localhost"

# List of modules to install
default['drupal']['modules'] = ["ctools", "devel", "views", "admin_menu", "features", "diff", "shiny", "omega"]