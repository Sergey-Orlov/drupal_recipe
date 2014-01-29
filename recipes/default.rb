# Deploy Drupal site.
#require_recipe "drush"
#require_recipe "drupal_skilld::drush_make"

# Copy make file to site.
#cookbook_file "#{node['drupal']['dir']}/example.make" do
#  source "example.make"
#  notifies :restart, resources("service[nginx]"), :delayed
#end

# drush make a default drupal site
#bash "deploy-drupal-site" do
#  code <<-EOH
#(cd #{node['drupal']['dir']}; drush make example.make www --prepare-install)
#  EOH
#  not_if { File.exists?("#{node['drupal']['dir']}/index.php") }
#end

# Download Drupal into project directory
#execute "download-drupal" do
#  cwd node['drupal']['dir']
#  command "drush -y dl drupal-#{node['drupal']['version']} --destination=#{node['drupal']['dir']}"
#  not_if { File.exists?("#{node['drupal']['dir']}/index.php") }
#end

unless File.exists?("#{node['drupal']['dir']}/index.php")
  # Get Drupal tar
  remote_file "#{node['drupal']['dir']}/drupal-#{node['drupal']['version']}.tar.gz" do
    source "http://ftp.drupal.org/files/projects/drupal-#{node['drupal']['version']}.tar.gz"
    mode 0644
    action :create_if_missing
  end
  
  # Extract Drupal
  execute "untar-drupal" do
    cwd node['drupal']['dir']
    command "tar -xzf drupal-#{node['drupal']['version']}.tar.gz -C #{node['drupal']['dir']} --strip-components=1"
  end

  # Create files directory
  directory "#{node['drupal']['dir']}/sites/default/files" do
    mode "0777"
    action :create
  end

  # Install Drupal using given credentials
  execute "install-drupal" do
    cwd node['drupal']['dir']
    command "drush -y site-install -r #{node['drupal']['dir']} --account-name=#{node['drupal']['site']['admin']} --account-pass=#{node['drupal']['site']['pass']} --site-name=\"#{node['drupal']['site']['name']}\" \
--db-url=mysql://#{node['drupal']['db']['user']}:'#{node['drupal']['db']['password']}'@#{node['drupal']['db']['host']}/#{node['drupal']['db']['database']}"
  end

  # Remove drupal tar.gz
  file "#{node['drupal']['dir']}/drupal-#{node['drupal']['version']}.tar.gz" do
    action :delete
  end

  # Create directory for contrib modules
  directory "#{node['drupal']['dir']}/sites/all/modules/contrib" do
    mode "0777"
    action :create
  end

  # Install modules
  if node['drupal']['modules']
    node['drupal']['modules'].each do |m|
      if m.is_a?Array
        drupal_module m.first do
          version m.last
          dir node['drupal']['dir']
        end
      else
        drupal_module m do
          dir node['drupal']['dir']
        end
      end
    end
  end

end