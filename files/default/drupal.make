; API version
; ------------
; Every makefile needs to declare its Drush Make API version. This version of
; drush make uses API version `2`.
api = 2

; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.
core = 7.x

; Core project
; ------------
projects[] = drupal

defaults[projects][subdir] = contrib

; Modules
projects[] = backup_migrate
projects[] = ctools
projects[] = views
projects[] = devel
projects[] = features
projects[] = diff
projects[] = token
projects[] = panels
projects[] = panels_everywhere
projects[] = ds
projects[] = pathauto
projects[] = ckeditor
projects[] = entity
projects[] = entityreference
projects[] = field_collection
projects[] = libraries
projects[] = navbar
projects[] = strongarm 
projects[] = page_title
projects[] = metatag
projects[] = xmlsitemap
projects[] = addressfield
projects[] = link
projects[] = date
projects[] = advagg
projects[] = css_emimage
projects[] = email
projects[] = entitycache
projects[] = admin_menu
projects[] = field_group
projects[] = rules
projects[] = htmlmail
projects[] = jquery_update
projects[] = logintoboggan
projects[] = panels_breadcrumbs
projects[] = pm_existing_pages
projects[] = compass

; Themes
projects[omega][subdir] = .
projects[shiny][subdir] = .