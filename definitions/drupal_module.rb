#Download / enable Drupal modules

define :drupal_module, :action => :install, :dir => nil, :version => nil do
  case params[:action]
  when :download
    if params[:dir] == nil then
      log("drupal_module_install requires a working drupal dir") { level :fatal }
      raise "drupal_module_install requires a working drupal dir"
    end
    execute "drush_dl_module #{params[:name]}" do
      cwd params[:dir]
      command "drush -y dl #{params[:name]}"
      not_if "drush -r #{params[:dir]} pm-list |grep '(#{params[:name]})' |grep '#{params[:version]}'"
    end
  when :install
    if params[:dir] == nil then
      log("drupal_module_install requires a working drupal dir") { level :fatal }
      raise "drupal_module_install requires a working drupal dir"
    end
    execute "drush_en_module #{params[:name]}" do
      cwd params[:dir]
      command "drush -y en #{params[:name]}"
      not_if "drush -r #{params[:dir]} pm-list |grep '(#{params[:name]})' |grep -i 'enabled'"
    end
  else
    log "drupal_source action #{params[:name]} is unrecognized."
  end
end