class CardanoNode < FPM::Cookery::Recipe
  description 'Cardano Node'

  name        'cardano-node'
  version     '1.27.0'
  revision    '1'
  maintainer  'Jesus Orosco <chuy08@gmail.com>'
  homepage    'https://cardano.org/'
  source      "https://github.com/input-output-hk/cardano-node.git",
                  :with => :git,
                  :tag => "#{version}"

  ENV["CABAL_VERSION"] = "3.4.0.0"
  ENV["GHC_VERSION"] = "8.10.5"
  ENV["LIBSODIUM_VERSION"] = "1.0.16"
  ENV["PKG_CONFIG_PATH"] = "/usr/local/lib/pkgconfig"

  build_depends 'automake',
                'libsystemd-dev',
                'libtinfo5',
                'pkg-config',
                'zlib1g-dev'

  #libffi-dev libgmp-dev libssl-dev libtinfo-dev libsystemd-dev zlib1g-dev make g++ tmux git jq wget libncursesw5 libtool autoconf


  def before_build
    safesystem "dpkg -i #{workdir}/cardano-cabal_$CABAL_VERSION-1_amd64.deb"\
               " #{workdir}/cardano-ghc_$GHC_VERSION-1_amd64.deb"\
               " #{workdir}/cardano-libsodium_$LIBSODIUM_VERSION-3_amd64.deb"

    safesystem "cabal update"
    safesystem "cabal --version"
    safesystem "ghc --version"
  end

  def build
    safesystem "ldconfig"
    safesystem "ldconfig -p | grep sodium"
    safesystem "strings /usr/local/lib/lib/libsodium.so.23 | grep vrf"
    safesystem "cabal configure --with-compiler=/usr/local/bin/ghc"
    safesystem "cabal build all"
  end

  def install
    bin.install "#{workdir}/dist-newstyle/build/x86_64-linux/ghc-$GHC_VERSION/cardano-cli-#{version}/x/cardano-cli/build/cardano-cli/cardano-cli"
    bin.install "#{workdir}/dist-newstyle/build/x86_64-linux/ghc-$GHC_VERSION/cardano-node-#{version}/x/cardano-node/build/cardano-node/cardano-node"
  end
end
