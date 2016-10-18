@version = "1.0.0"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '8.0'
  spec.name         = 'SDOSCore'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'SDOS License' }
  spec.homepage     = 'http://git.sdos.es/ios/SDOSCore'
  spec.summary      = 'Librería de conexión de los frameworks de terceros. En está librería se añaden funcionalidades para facilitar el flujo de trabajo'
  spec.source       = { :git => "http://git.sdos.es/ios/SDOSCore.git", :branch => "feature/core" }
  spec.framework    = ['Foundation', 'UIKit']
  spec.requires_arc = true

  spec.subspec 'Core' do |s1|
    s1.source_files = 'src/Classes/SDOSCore.h'
    s1.subspec 'Categories' do |s2|
      s2.subspec 'Controller' do |s3|
        s3.source_files = 'src/Classes/Categories/Controller/{*.m,*.h}'
      end
      s2.subspec 'JSON' do |s3|
        s3.source_files = 'src/Classes/Categories/JSON/{*.m,*.h}'
      end
      s2.subspec 'UIApplication' do |s3|
        s3.source_files = 'src/Classes/Categories/UIApplication/{*.m,*.h}'
      end
      s2.subspec 'Utilidades' do |s3|
        s3.source_files = 'src/Classes/Categories/Utilidades/{*.m,*.h}'
      end
      s2.subspec 'Octopush' do |s3|
        s3.source_files = 'src/Classes/Categories/Octopush/{*.m,*.h}'
      end
      s2.subspec 'Domain' do |s3|
        s3.source_files = 'src/Classes/Categories/Domain/{*.m,*.h}'
      end
    end
    s1.subspec 'Constants' do |s2|
      s2.source_files = 'src/Classes/Constants/{*.m,*.h}'
    end
    s1.subspec 'CustomTypes' do |s2|
      s2.subspec 'NSDateTime' do |s3|
        s3.source_files = 'src/Classes/CustomTypes/NSDateTime/{*.m,*.h}'
      end
      s2.subspec 'NSTime' do |s3|
        s3.source_files = 'src/Classes/CustomTypes/NSTime/{*.m,*.h}'
      end
    end
    s1.subspec 'Logging' do |s2|
      s2.source_files = 'src/Classes/Logging/{*.m,*.h}'
    end
    s1.subspec 'Protocols' do |s2|
      s2.subspec 'Controller' do |s3|
        s3.source_files = 'src/Classes/Protocols/Controller/{*.m,*.h}'
      end
      s2.subspec 'DAO' do |s3|
        s3.source_files = 'src/Classes/Protocols/DAO/{*.m,*.h}'
      end
      s2.subspec 'Error' do |s3|
        s3.source_files = 'src/Classes/Protocols/Error/{*.m,*.h}'
      end
      s2.subspec 'Loader' do |s3|
        s3.source_files = 'src/Classes/Protocols/Loader/{*.m,*.h}'
      end
      s2.subspec 'Domain' do |s3|
        s3.source_files = 'src/Classes/Protocols/Domain/{*.m,*.h}'
      end
    end
    s1.subspec 'Util' do |s2|
      s2.source_files = 'src/Classes/Util/{*.m,*.h}'
    end
    s1.subspec 'WS' do |s2|
      s2.subspec 'DTO' do |s3|
        s3.source_files = 'src/Classes/WS/DTO/{*.m,*.h}'
      end
      s2.subspec 'ErrorDTO' do |s3|
        s3.source_files = 'src/Classes/WS/ErrorDTO/{*.m,*.h}'
      end
      s2.subspec 'RequestSerializer' do |s3|
        s3.source_files = 'src/Classes/WS/RequestSerializer/{*.m,*.h}'
      end
      s2.subspec 'ResponseSerializer' do |s3|
        s3.source_files = 'src/Classes/WS/ResponseSerializer/{*.m,*.h}'
      end
    end
    s1.subspec 'Domain' do |s2|
      s2.source_files = 'src/Classes/Domain/{*.m,*.h}'
    end
    s1.subspec 'Connections' do |s2|
      s2.source_files = 'src/Classes/Connections/{*.m,*.h}'
      s2.subspec 'KVO' do |s3|
        s3.source_files = 'src/Classes/Connections/KVO/{*.m,*.h}'
      end
    end
    s1.subspec 'Provider' do |s2|
      s2.source_files = 'src/Classes/Provider/{*.m,*.h}'
    end
  end

  spec.dependency 'CocoaLumberjack'
  spec.dependency 'libextobjc'
  spec.dependency 'IQKeyboardManager'
  spec.dependency 'JSONModel'
  spec.dependency 'FLEX'
  spec.dependency 'KZBootstrap'
  spec.dependency 'GBVersionTracking'
  spec.dependency 'Extensions'
  spec.dependency 'MagicalRecord'
  spec.dependency 'AFNetworking'

end