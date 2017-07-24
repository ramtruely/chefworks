include_recipe 'chef-sugar'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch_user 'elasticsearch' do
  username 'elasticsearch'
  groupname 'elasticsearch'
  shell '/bin/bash'
  comment 'Elasticsearch User'

  action :create
end
elasticsearch_install 'my_es_installation' do
  type 'package' # type of install
  version '5.3.1'
  action :install # could be :remove as well
end
ruby elasticsearch_configure 'elasticsearch'

elasticsearch_service 'elasticsearch' do
  supports :status => true, :restart => true, :reload => true
end


