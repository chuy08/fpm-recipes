class Ruby23 < FPM::Cookery::Recipe
  description 'A simple, fast work queue'

  name        'ruby23'
  version     '2.3.8'
  revision    '1'
  maintainer  'Jesus Orosco <chuy08@gmail.com>'
  homepage    'https://www.ruby-lang.org/' 
  source      "https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.zip"
  description 'Ruby 2.3.8 for Centos7'
  md5         '8783c9d5fa0f0ca88cc63c0a8562f365'

  #post_install   'post-install'
  #post_uninstall 'post-uninstall'

  def before_build
    safesystem "mv #{builddir}/ruby-#{version} #{builddir}/ruby"
    safesystem "mv #{builddir}/ruby/ruby-#{version} #{builddir}/ruby-#{version}"
  end

  def build
    configure
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end

