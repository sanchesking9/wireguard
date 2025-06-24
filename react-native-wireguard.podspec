require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-wireguard"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                   Native iOS module to manage WireGuard VPN using WireGuardKit in React Native.
                   DESC
  s.homepage     = "https://github.com/sanchesking9/wireguard"
  s.license      = "MIT"
  s.author       = { "sanchesking9" => "you@example.com" }
  s.platform     = :ios, "15.0"
  s.source       = { :git => "https://github.com/sanchesking9/wireguard.git", :tag => "#{s.version}" }
  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency "WireGuardKit"

  s.swift_version = "5.0"

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_OPTIMIZATION_LEVEL' => '-Onone'
  }
end
