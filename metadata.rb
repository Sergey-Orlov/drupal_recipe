maintainer       "Sergey Orlov"
description      "Deploy Drupal and install necessary modules"

depends "drush"

%w{ debian }.each do |os|
  supports os
end
