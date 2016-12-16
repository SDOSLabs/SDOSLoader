@version = "1.0.0"
Pod::Spec.new do |spec|
  spec.ios.deployment_target = '8.0'
  spec.tvos.deployment_target = '9.0'
  spec.name         = 'SDOSLoader'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'SDOS License' }
  spec.homepage     = 'http://git.sdos.es/ios/SDOSLoader'
  spec.summary      = 'Librería para la creación y manejo de vistas tipo loader'
  spec.source       = { :git => "http://git.sdos.es/ios/SDOSLoader.git", :tag => "v#{spec.version}" }
  spec.framework    = ['Foundation', 'UIKit']
  spec.requires_arc = true

  spec.subspec 'Loader' do |s2|
    s2.source_files = 'src/Classes/SDOSLoader.h'
    s2.subspec 'Manager' do |s3|
      s3.source_files = 'src/Classes/Manager/{*.m,*.h}'
    end
    s2.subspec 'Object' do |s3|
      s3.source_files = 'src/Classes/Object/{*.m,*.h}'
    end
    s2.subspec 'Private' do |s3|
      s3.source_files = 'src/Classes/Private/{*.m,*.h}'
    end
    s2.subspec 'Protocols' do |s3|
      s3.source_files = 'src/Classes/Protocols/{*.m,*.h}'
    end
    s2.subspec 'SDOSMaterialControlCustom' do |s3|
      s3.source_files = 'src/Classes/SDOSMaterialControlCustom/**/{*.m,*.h}'
    end
  end

  spec.dependency 'MBProgressHUD', '~> 1.0'
  spec.dependency 'PureLayout', '~> 3.0'
  spec.dependency 'SDOSLocalizableString', '~> 1.0'

end
