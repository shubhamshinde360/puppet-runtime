platform 'osx-14-arm64' do |plat|
  plat.inherit_from_default

  packages = %w[automake cmake pkg-config]
  plat.provision_with "su test -c '/opt/homebrew/bin/brew install #{packages.join(' ')}'"

  plat.output_dir File.join('apple', '14', 'PC1', 'arm64')
end
