name 'acme_windows_app'
maintainer 'Steve Brown'
maintainer_email 'sbrown@chef.io'
license 'Apache-2.0'
description 'Installs/Configures acme_windows_app'
long_description 'Installs/Configures acme_windows_app'
version '0.1.0'
chef_version '>= 14.0'

%w(windows).each do |os|
  supports os
end


issues_url 'https://github.com/srb3/acme_windows_app/issues'
source_url 'https://github.com/srb3/acme_windows_app'
