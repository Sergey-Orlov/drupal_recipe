# Project settings
default['drupal']['dir'] = "/var/www"

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

# List of modules to enable
default['drupal']['modules'] = [
	"ctools",
	"devel",
	"views",
	"views_ui",
	"admin_menu",
	"features",
	"diff",
	"backup_migrate",
	"panels",
	"page_manager",
	"panels_everywhere",
	"pathauto",
	"entity",
	"entityreference",
	"rules",
	"libraries",
	"strongarm",
	"date_api",
	"date",
	"date_popup",
	"jquery_update",
	"advagg",
	"css_emimage",
	"compass",
	"xmlsitemap",
	"shiny",
	"omega"
]