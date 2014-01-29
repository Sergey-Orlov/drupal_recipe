case node[:platform]
when "debian", "ubuntu"
  bash "install-drush_make" do
    code <<-EOH
(cd /tmp; wget http://ftp.drupal.org/files/projects/drush_make-6.x-2.3.tar.gz)
(cd /tmp; tar zxvf drush_make-6.x-2.3.tar.gz)
(mkdir -p ~/.drush)
(cd /tmp; mv drush_make ~/.drush/)
    EOH
    not_if { File.exists?(File.expand_path("~/.drush/drush_make/drush_make.drush.inc")) }
  end
end
