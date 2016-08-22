platform :ios, '7.0'
inhibit_all_warnings!

target 'Zhang_tabBar' do
pod 'AFNetworking', '~> 3.1.0'
pod 'SDWebImage' , '~> 3.7.3'
pod 'MJExtension', '~> 2.5.6'
pod 'MJRefresh', '~> 3.0.7'
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ARCHS'] = 'armv7 arm64'
        end
    end
end

