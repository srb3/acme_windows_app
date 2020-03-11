include_recipe 'acme_windows_app::default'

dsc_resource 'Install IIS' do
  resource :windowsfeature
  property :name,  'web-server'
end

service 'w3svc' do
  action [:enable, :start]
end

dsc_resource 'Shutdown Default Website' do
  resource :xWebsite
  property :name, 'Default Web Site'
  property :State, 'Stopped'
  property :PhysicalPath, 'C:\inetpub\wwwroot'
end

directory 'c:/sites/ChefAndDsc' do
  recursive true
end

template 'c:/sites/ChefAndDsc/index.html' do
  source 'index.html'
  action :create
end

dsc_resource 'New Website' do
  resource :xWebsite
  property :name, 'ChefAndDsc'
  property :State, 'Started'
  property :BindingInfo, cim_instance_array(
    'MSFT_xWebBindingInformation',
    protocol: 'http',
    port: 8080)
  property :PhysicalPath, 'c:\sites\ChefAndDsc'
end
