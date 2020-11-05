@version = "3.1.0"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '9.0'
  spec.name         = 'SDOSLoader'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/SDOSLabs/SDOSLoader'
  spec.summary      = 'Librería para la creación y manejo de vistas tipo loader'
  spec.source       = { :git => "https://github.com/SDOSLabs/SDOSLoader.git", :tag => "#{spec.version}" }
  spec.framework    = ['Foundation', 'UIKit']
  spec.requires_arc = true

  spec.subspec 'Loader' do |s2|
    s2.preserve_paths = 'src/Classes/*'
    s2.source_files = ['src/Classes/*{*.m,*.h,*.swift}', 'src/Classes/**/*{*.m,*.h,*.swift}']
  end

  spec.dependency 'MBProgressHUD', '~> 1.2'
  spec.dependency 'M13ProgressSuite'#, '~> 1.3'
  spec.dependency 'DGActivityIndicatorView'#, '~> 2.2'
  spec.dependency 'SDOSCustomLoader', '~> 1.1'
  spec.dependency 'SDOSSwiftExtension', '~> 1.1'

end
