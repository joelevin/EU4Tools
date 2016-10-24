# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'EU4Tools' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for EU4Tools
    pod 'RxSwift',    '3.0.0-rc.1'
    pod 'RxCocoa',    '3.0.0-rc.1'
  target 'EU4ToolsTests' do
    inherit! :search_paths
    pod 'RxBlocking', '3.0.0-rc.1'
    pod 'RxTest',     '3.0.0-rc.1'
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
        config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
      end
    end
  end

end