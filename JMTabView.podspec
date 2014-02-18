Pod::Spec.new do |s|
  s.name     = 'JMTabView'
  s.version  = '0.0.2'
  s.platform = :ios
  s.summary  = 'Stylish and animated tab view for iOS rendered entirely using core graphics.'
  s.license  = 'BSD'
  s.homepage = 'https://github.com/jasonmorrissey/JMTabView'
  s.author   = { 'Jason Morrissey' => 'http://jasonmorrissey.org/' }
  s.source   = { :git => 'https://github.com/tonimoeckel/JMTabView.git',
                 :tag => '0.0.2' }
  s.source_files = 'JMTabView/Classes/**/*.{h,m}'
end