class CardanoLibSodium < FPM::Cookery::Recipe
  description 'Cardano LibSodium'

  name        'cardano-libsodium'
  version     '1.0.16'
  revision    '3'
  maintainer  'chuy08 <chuy08@gmail.com>'
  homepage    'https://github.com/input-output-hk/libsodium'
  source      "https://github.com/input-output-hk/libsodium.git",
                 :with => :git,
                 :sha  => "004952bb57b2a6d2c033969820c80255e8362615"

  build_depends 'libtool'

  def build
    safesystem "./autogen.sh"
    configure
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
    etc('ld.so.conf.d').install_p(workdir('cardano-libsodium.conf'), 'cardano-libsodium.conf')
  end
end
