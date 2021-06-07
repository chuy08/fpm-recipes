class Conky < FPM::Cookery::Recipe
  description 'A simple, fast work queue'

  name        'conky'
  version     '1.12.2'
  revision    '1'
  maintainer  'Jesus Orosco <chuy08@gmail.com>'
  homepage    'https://github.com/brndnmtthws/conky' 
  source      "https://github.com/brndnmtthws/conky/archive/refs/tags/v#{version}.zip"
  description 'Conky for Ubuntu Bionic'
  md5         '3d609229a5c6e41cc43b47436562fe16'

  build_depends 'libcurl4-openssl-dev'
                'libimlib2-dev',
                'liblua5.3-dev',
                'ncurses-dev',
                'xorg-dev'

  def build_dir 
    FPM::Cookery::Path.new("build")
  end

  def before_build
    safesystem "mv #{builddir}/v#{version}/#{name}-#{version}/* #{builddir}/v#{version}/."
    build_dir.mkdir
  end

  def build
   chdir build_dir do
    safesystem "cmake ../"	  
    make
   end
  end

  def install
    chdir build_dir do
      make :install, 'DESTDIR' => destdir
    end
  end
end
