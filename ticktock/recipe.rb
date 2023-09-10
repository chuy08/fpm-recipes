class Ruby23 < FPM::Cookery::Recipe
  description 'A simple, fast work queue'

  name        'ticktock'
  version     '0.12.1'
  revision    '1'
  maintainer  'chuy08 <chuy08@gmail.com>'
  homepage    'https://github.com/ytyou/ticktock' 
  source      "https://github.com/ytyou/ticktock/archive/refs/tags/v0.12.1.zip"
  description 'Tick Tock TSDB'
  md5         'e19ab25ebd5a158e37ad448498a082de'

  #post_install   'post-install'
  #post_uninstall 'post-uninstall'
  build_depends 'zlib1g-dev'

  def before_build
  #  safesystem "mv #{builddir}/ruby-#{version} #{builddir}/ruby"
  #  safesystem "mv #{builddir}/ruby/ruby-#{version} #{builddir}/ruby-#{version}"
  end

  def build
    chdir 'ticktock-0.12.1' do
      safesystem "make -f Makefile.ubuntu all"
    end
  end

  def install
    bin.install "#{builddir}/v#{version}/#{name}-#{version}/bin/tt"
    etc("#{name}").install "#{builddir}/v#{version}/#{name}-#{version}/conf/tt.conf"
  end
end