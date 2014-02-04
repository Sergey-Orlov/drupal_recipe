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
projects[] = ctools
projects[] = views
projects[] = devel
projects[] = admin_menu
projects[] = features
projects[] = diff

; Themes
projects[omega][subdir] = .
projects[shiny][subdir] = .