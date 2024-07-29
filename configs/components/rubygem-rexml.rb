component 'rubygem-rexml' do |pkg, settings, platform|
  pkg.version '3.3.2'
  pkg.md5sum '55d213401f5e6a7a83ff3d2cd64a23fe'

  # If the platform is solaris with sparc architecture in agent-runtime-7.x project, we want to gem install rexml
  # ignoring the dependencies, this is because the pl-ruby version used in these platforms is ancient so it gets
  # confused when installing rexml. It tries to install rexml's dependency 'strscan' by building native extensions
  # but fails. We can ignore insalling that since strscan is already shipped with ruby 2 as its default gem.
  if platform.name =~ /solaris-(10|11)-sparc/ && settings[:ruby_version].to_i < 3
    settings["#{pkg.get_name}_gem_install_options".to_sym] = "--ignore-dependencies"
  end
  
  instance_eval File.read('configs/components/_base-rubygem.rb')


  # We gem installed rexml to 3.3.2 in ruby 3 for CVE-2024-35176 and CVE-2024-39908. Since rexml is a bundled gem in ruby 3, we end up having 
  # two versions of rexml -- 1) the bundled version shipped with ruby 3 (3.2.5) and 2) the one we manually installed with 
  # the above gem install command.
  # So, we run gem cleanup so that it deletes the older version 3.2.5. 
  # Note: We won't need to cleanup and install rexml once we upgrade to ruby >= 3.3.3
  pkg.install do
    steps = []
    if name == 'rexml' && settings[:ruby_version].to_i == 3
      steps << "#{settings[:gem_cleanup]} #{name}"
    end
    steps
  end
end
