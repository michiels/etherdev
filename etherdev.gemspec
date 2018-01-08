Gem::Specification.new do |s|
  s.name = "etherdev"
  s.version = "0.1"
  s.executables << 'etherdev'
  s.homepage = 'https://github.com/michiels/etherdev'
  s.date = "2018-01-05"
  s.summary = "A very simple development framework for Ethereum and Solidity smart contracts"
  s.description = "A clean and simple development framework for Ethereum development and deployment"
  s.authors = ["Michiel Sikkes"]
  s.email = "michiel.sikkes@gmail.com"
  s.files = Dir.glob("lib/**/*") + %w(README.md bin/etherdev)
  s.license = "MIT"
  s.add_dependency 'ethereum.rb', '~> 2.1'
  s.add_dependency 'eth', '~> 0.4'
  s.add_dependency 'thor', '~> 0.20.0'
  s.add_dependency 'minitest', '~> 5.11'
  s.add_dependency 'rake', '~> 12.3'
end
