user 'new' do
  action :create
  shell '/sbin/nologin'
  comment 'This account is for testing something'
  system true
  manage_home false
end
group 'new' do
  members 'new'
  append true
end
yum_repository 'logstash' do
  description "logstash Stable repo"
  baseurl "https://artifacts.elastic.co/packages/5.x/yum"
  gpgkey 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  gpgcheck true
  enabled true
  action :create
end
package 'logstash' do
 allow_downgrade true
 version '5.3.1-1'
 action :install
end
service 'logstash' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
%w[ /usr/share/logstash /etc/logstash /etc/logstash/conf.d /var/log/logstash ].each do |path|
  directory path do
  owner 'new'
  group 'new'
 end
end
%w[ /etc/logstash/startup.options /etc/logstash/log4j2.properties /etc/logstash/jvm.options /etc/logstash/logstash.yml ].each do |filepath|
  file filepath do
    owner 'new'
    group 'new'
  end
end
