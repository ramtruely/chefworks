user 'new' do 
  action :create 
  shell '/sbin/nologin'
  comment 'This account is for testing something' 
  system true 
  manage_home false
end
group 'new' do
  members 'new'
  action :create
end
yum_repository 'filebeat' do
  description "filebeat Stable repo"
  gpgchek true
  baseurl "https://artifacts.elastic.co/packages/5.x/yum"
  gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  enabled true
  action :create
end
package 'filebeat' do
 allow_downgrade true
 version '5.3.1-1'
 action :install
end
service 'filebeat' do
 supports :status => true, :restart => true, :reload => true
 init_command '/etc/init.d/filebeat :start'
 action [:enable, :start]
end
%w[ /usr/share/filebeat /usr/share/filebeat/bin /etc/filebeat /var/lib/filebeat /var/log/filebeat ].each do |path|
  directory path do
    owner 'new'
    group 'new'
    mode 'new'
    recursive true
    action :create
  end
end

  