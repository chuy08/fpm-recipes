class CardanoCabal < FPM::Cookery::Recipe
  description 'Cardano Cabal'

  name        'cardano-cabal'
  version     '3.4.0.0'
  revision    '1'
  maintainer  'Jesus Orosco <chuy08@gmail.com>'
  homepage    'https://www.haskell.org'
  source      "https://downloads.haskell.org/~cabal/cabal-install-#{version}/cabal-install-#{version}-x86_64-ubuntu-16.04.tar.xz"
  md5         '15cdae41c16bf909680a3ee2716761c0'

  def build
  end

  def install
    bin.install 'cabal'
  end
end
