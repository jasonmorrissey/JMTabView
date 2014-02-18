Pod::Spec.new do |s|
  s.name         = 'JMTabView'
  s.version      = '0.0.2'
  s.license      =  :type => 'BSD'
  s.homepage     = 'https://github.com/jasonmorrissey/JMTabView'
  s.authors      =  'Jason Morrissey' => 'http://jasonmorrissey.org'
  s.summary      = 'Stylish and animated tab view for iOS rendered entirely using core graphics.'

# Source Info
  s.platform     =  :ios, '4.3'
  s.source       =  :git => 'https://github.com/tonimoeckel/JMTabView', :tag => '0.0.2'
  s.source_files = 'JMTabView/Classes/**/*.{h,m}'

  s.requires_arc = true
  
# Pod Dependencies

end