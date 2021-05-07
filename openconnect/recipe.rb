class Openconncet < FPM::Cookery::Recipe
  description 'Openconnect SSL VPN Client for Cisco Anyconnect'

  name        'openconnect'
  version     '8.10'
  revision    '1'
  homepage    'https://gitlab.com/openconnect/openconnect'
  source      "https://gitlab.com/openconnect/openconnect/-/archive/v8.10/openconnect-v#{version}.zip"
  md5         '41f985bb6423deee8b25d5ed2c5b8a23'

  #post_install   'post-install'
  #post_uninstall 'post-uninstall'

  def build_dir 
    FPM::Cookery::Path.new("build") 
  end

  def before_build
    #safesystem "cp #{workdir}/vpnc-script #{builddir}/v#{version}"
    #safesystem "mv #{builddir}/v#{version}/openconnect-v#{version} #{builddir}/openconnect-v#{version}"
    #build_dir.mkdir
  end

  def build
    chdir "#{builddir}/openconnect-v#{version}/openconnect-v#{version}" do
       safesystem "./autogen.sh --with-vpnc-script=/etc/vpnc/vpnc-script"
       safesystem "./configure --libdir=/usr/local"
       make
    end
  end

  def install
     chdir "#{builddir}/openconnect-v#{version}/openconnect-v#{version}" do
        make :install, 'DESTDIR' => destdir
     end
  end
end
