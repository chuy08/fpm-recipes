class Bash51 < FPM::Cookery::Recipe
  description 'Bash for Ubuntu 18'

  name        'bash51'
  version     '5.1'
  revision    '1'
  homepage    'https://www.gnu.org/software/bash/' 
  source      "http://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz"
  description 'Bash 5 for Ubuntu Bionic'
  md5         'bb91a17fd6c9032c26d0b2b78b50aff5'

  #post_install   'post-install'
  #post_uninstall 'post-uninstall'

  def build
    configure
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end

