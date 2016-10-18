@version = "1.0.0"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '8.0'
  spec.name         = 'SDOSLoader'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'SDOS License' }
  spec.homepage     = 'http://git.sdos.es/ios/SDOSLoader'
  spec.summary      = 'Librería de conexión de los frameworks de terceros. En está librería se añaden funcionalidades para facilitar el flujo de trabajo'
  spec.source       = { :git => "http://git.sdos.es/ios/SDOSLoader.git", :branch => "feature/core" }
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
  end

  spec.dependency 'CocoaLumberjack'
  spec.dependency 'MBProgressHUD'
  spec.dependency 'M13ProgressSuite'
  spec.dependency 'MaterialControlsCustom'
  spec.dependency 'SDOSCore'
end