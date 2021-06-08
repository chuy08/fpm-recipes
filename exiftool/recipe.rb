class Exiftool < FPM::Cookery::Recipe
  description 'A simple, fast work queue'

  name        'exiftool'
  version     '12.13'
  revision    '1'
  maintainer  'chuy08 <chuy08@gmail.com>'
  homepage    'https://exiftool.org' 
  source      "https://exiftool.org/Image-ExifTool-#{version}.tar.gz"
  description 'Read, Write and Edit Meta Information!'
  md5         'c1d44d478d76e72cbc73e74ced71d2ab'

  #post_install   'post-install'
  #post_uninstall 'post-uninstall'

  def build
    sh 'perl Makefile.PL'
    make 'test'
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end

