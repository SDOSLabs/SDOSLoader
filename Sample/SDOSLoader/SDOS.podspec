@version = "1.0.0"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '8.0'
  spec.name         = 'SDOS'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'SDOS License' }
  spec.homepage     = 'http://git.sdos.es/ios/SDOS'
  spec.summary      = 'Librería de conexión de los frameworks de terceros. En está librería se añaden funcionalidades para facilitar el flujo de trabajo'
  spec.source       = { :git => "http://git.sdos.es/ios/SDOS.git", :branch => "feature/core" }
  spec.framework    = ['Foundation', 'UIKit']
  spec.requires_arc = true
  spec.default_subspecs = ['Core', 'Loader']

  spec.subspec 'Core' do |s1|
    s1.preserve_paths = "src/Scripts/*"
    s1.source_files = 'src/Classes/SDOS.h'
    s1.dependency 'SDOSCore'
  end

  spec.subspec 'Loader' do |s1|
    s1.dependency 'SDOSLoader'
    s1.dependency 'SDOS/Core'
  end
end