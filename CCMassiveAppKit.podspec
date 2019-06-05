
Pod::Spec.new do |s|

  s.name         = "CCMassiveAppKit"
  s.version      = "0.0.1"
  s.summary      = "CCMassiveAppKit promote develop efficient.This kit dependency common dependency library AFNetworking, MJRefresh"

  s.description  = <<-DESC
TODO: Add long description of the pod here.
                   DESC

  s.homepage     = "https://github.com/libing0924/CCMassiveAppKit.git"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.platform     = :ios, '8.0'
  s.author           = { 'libing0924' => '404044359@qq.com' }
  s.source           = { :git => 'https://github.com/libing0924/CCMassiveAppKit.git', :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CCMassiveAppKit/MassiveKit/*.{h,m}'
  s.dependency 'AFNetworking'
  s.dependency 'MJRefresh'
  s.dependency 'CCSimpleAppKit'
    

end
