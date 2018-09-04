@version = "2.0.1"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '8.0'
  spec.name         = 'SDOSLoader'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'SDOS License' }
  spec.homepage     = 'https://svrgitpub.sdos.es/iOS/SDOSLoader'
  spec.summary      = 'Librería para la creación y manejo de vistas tipo loader'
  spec.source       = { :git => "https://svrgitpub.sdos.es/iOS/SDOSLoader.git", :tag => "v#{spec.version}" }
  spec.framework    = ['Foundation', 'UIKit']
  spec.requires_arc = true

  spec.subspec 'Loader' do |s2|
    s2.preserve_paths = 'src/Classes/*'
    s2.source_files = ['src/Classes/*{*.m,*.h,*.swift}', 'src/Classes/**/*{*.m,*.h,*.swift}']
  end

  spec.dependency 'MBProgressHUD', '~> 1.1'
  spec.dependency 'M13ProgressSuite', '~> 1.2'
  spec.dependency 'DGActivityIndicatorView', '~> 2.1'

end
