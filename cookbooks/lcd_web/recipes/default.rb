include_recipe 'lcd_web::users'

['net-tools', 'httpd' ].each do |pkg|
   package pkg
end

service 'httpd' do
  action [:enable, :start]
end


package node['app']['language'] do
  action :install
end


template '/var/www/html/index.html' do
     source 'index.html.erb'
      owner 'apache'
      group 'apache'
      variables(
           greeting_scope: 'World',
           greeting: node['greeting'],
           fqdn: node['fqdn']
     )
end


           
