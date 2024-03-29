class Openconncet < FPM::Cookery::Recipe
  description 'Openconnect SSL VPN Client for Cisco Anyconnect'

  name        'openconnect'
  version     '9.12'
  revision    '1'
  maintainer  'chuy08 <chuy08@gmail.com>'
  homepage    'https://gitlab.com/openconnect/openconnect'
  source      "https://gitlab.com/openconnect/openconnect/-/archive/v#{version}/openconnect-v#{version}.zip"
  md5         '643f566480764f53bfcc9665edb8f2e1'

  build_depends 'automake',
                'gettext',
                'liblz4-dev',
                'libssl-dev',
                'libtool',
                'libxml2-dev',
                'pkg-config',
                'zlib1g-dev'

  def build
    chdir "#{builddir}/openconnect-v#{version}/openconnect-v#{version}" do
       safesystem "./autogen.sh"
       safesystem "./configure --libdir=/usr/local --with-vpnc-script=/etc/vpnc/vpnc-script"
       make
    end
  end

  def install
     chdir "#{builddir}/openconnect-v#{version}/openconnect-v#{version}" do
        make :install, 'DESTDIR' => destdir
     end
     # http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/HEAD:/vpnc-script
     etc('vpnc').install_p(workdir('vpnc-script'), 'vpnc-script')
  end
end
