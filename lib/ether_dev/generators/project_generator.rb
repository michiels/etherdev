require "ether_dev/generators/project_templates"

module EtherDev
  class ProjectGenerator
    include ProjectTemplates

    def initialize(project_name)
      @project_name = project_name
    end

    def generate
      $stdout.sync = true
      create_directory(@project_name)
      create_file(project_templates["Gemfile"], @project_name, "Gemfile")
      create_file(project_templates["Rakefile"], @project_name, "Rakefile")

      create_directory(@project_name, "contracts")
      create_file(project_templates["Greeter.sol"], @project_name, "contracts", "Greeter.sol")

      create_directory(@project_name, "config")
      create_file(project_templates["blockchain.yml"], @project_name, "config", "blockchain.yml")

      create_directory(@project_name, "test")
      create_file(project_templates["test_helper.rb"], @project_name, "test", "test_helper.rb")

      create_directory(@project_name, "test", "contracts")
      create_file(project_templates["greeter_test.rb"], @project_name, "test", "contracts", "greeter_test.rb")

      run_bundler

      puts
      puts
      puts <<~EOF
        🎉🎉🎉 Get started with EtherDev\n

        Your new EtherDev project is now generated. Now start Ganache and run
        the following command to compile, deploy and test the example Greeter.sol
        contract:

        $ bundle exec rake

        Check out the Wiki for next steps:
        https://github.com/michiels/ruby-etherdev/wiki
      EOF
    end

    private

    def create_directory(directory_name, *args)
      directory_path = File.join([directory_name] + args)
      FileUtils.mkdir_p(directory_path)
      puts "- Created #{directory_path}"
    end

    def create_file(template, directory_name, *args)
      filepath = File.join([directory_name] + args)
      File.open(filepath, "w+") do |f|
        f.write template
      end
      puts "- Generated file #{filepath}"
    end

    def run_bundler
      puts
      puts "Running bundler..."
      IO.popen("cd #{@project_name} && bundle install") do |io|
        while (line = io.gets) do
          puts line
        end
      end
    end
  end
end
