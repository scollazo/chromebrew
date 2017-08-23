require 'package'

class Weather < Package
  description 'This command-line utility is intended to provide quick access to current weather conditions and forecasts.'
  homepage 'http://fungi.yuggoth.org/weather/'
  version '2.3'
  source_url 'http://fungi.yuggoth.org/weather/src/weather-2.3.tar.xz'
  source_sha256 '86148d2f1d59867f637f52558cc2a6b3280fac94df55c6e5af0ce37cc190d146'

  depends_on 'python27' unless File.exists? "#{CREW_PREFIX}/bin/python"

  def self.build
    system "echo 'setpath = $HOME/.weather:#{CREW_PREFIX}/data/weather' >> weatherrc"
    system "if [ ! -d $HOME/.weather ]; then mkdir $HOME/.weather; fi"
    system "if [ ! -f $HOME/.weather/weatherrc ]; then cp weatherrc $HOME/.weather; fi"
  end

  def self.install
    system "mkdir -p #{CREW_DEST_PREFIX}/bin"
    system "mkdir -p #{CREW_DEST_PREFIX}/data/weather"
    system "mkdir -p #{CREW_DEST_PREFIX}/etc"
    system "mkdir -p #{CREW_DEST_PREFIX}/man/man1"
    system "mkdir -p #{CREW_DEST_PREFIX}/man/man5"
    system "cp weather #{CREW_DEST_PREFIX}/bin"
    system "cp weather.py #{CREW_DEST_PREFIX}/bin"
    system "cp airports #{CREW_DEST_PREFIX}/data/weather"
    system "cp places #{CREW_DEST_PREFIX}/data/weather"
    system "cp slist #{CREW_DEST_PREFIX}/data/weather"
    system "cp stations #{CREW_DEST_PREFIX}/data/weather"
    system "cp zctas #{CREW_DEST_PREFIX}/data/weather"
    system "cp zlist #{CREW_DEST_PREFIX}/data/weather"
    system "cp zones #{CREW_DEST_PREFIX}/data/weather"
    system "cp weatherrc #{CREW_DEST_PREFIX}/etc"
    system "cp weather.1 #{CREW_DEST_PREFIX}/man/man1"
    system "cp weatherrc.5 #{CREW_DEST_PREFIX}/man/man5"
  end
end