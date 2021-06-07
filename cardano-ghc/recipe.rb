class CardanoGHC < FPM::Cookery::Recipe
  description 'Cardano GHC'

  name        'cardano-ghc'
  version     '8.10.5'
  revision    '1'
  maintainer  'Jesus Orosco <chuy08@gmail.com>'
  homepage    'https://www.haskell.org'
  source      "https://downloads.haskell.org/~ghc/#{version}/ghc-#{version}-x86_64-deb9-linux.tar.xz"
  md5         'ccf83311168fed5840ae92eeeaa3b9f7'

  build_depends 'libtinfo5'
  depends 'libtinfo5'

  def build
    configure
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
