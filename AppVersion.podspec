Pod::Spec.new do |spec|
  spec.name = "AppVersion"
  spec.version = "1.0.0"
  spec.summary = "Sample version system for App."
  spec.description = <<-DESC
                     AppVersion is a Swift Library, compare version numbers.
                     The representation is:
                     * Comparable
                     * Equatable
                     * StringLiteralConvertible
                     DESC
  spec.homepage = "https://github.com/woshizilong/AppVersion"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "kaba" => 'woshizilong@hotmail.com' }
  spec.social_media_url = "https://github.com/woshizilong"

  spec.platform = :ios, "8.1"
  spec.requires_arc = true
  spec.source = { :git => "https://github.com/woshizilong/AppVersion.git", :tag => "#{spec.version}"}

  spec.source_files = "AppVersion/**/*.{h,swift}"
end