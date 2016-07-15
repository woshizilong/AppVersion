Pod::Spec.new do |spec|
  spec.name = "AppVersion"
  spec.version = "1.0.0"
  spec.summary = "Sample version system for App."
  spec.homepage = "https://github.com/woshizilong/AppVersion"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "kaba" => 'woshizilong@hotmail.com' }
  spec.social_media_url = "http://twitter.com/woshizilong"

  spec.platform = :ios, "7.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/woshizilong/AppVersion.git", tag: "v#{spec.version}", submodules: true }

  spec.source_files = "AppVersion/**/*.{h,swift}"
end