module EtherDev
  class CLI < Thor
    desc "deploy FILE [private key]", "compiles a contract via Solidity"
    def deploy(filename, private_key = nil)
      config = YAML.load(File.open("config.yml"))["development"] || {}

      key = ::Eth::Key.new priv: (private_key || config["account_key"])
      client = Ethereum::HttpClient.new(config["rpc"])

      contract = Ethereum::Contract.create(file: "contracts/#{filename}", client: client)
      contract.key = key
      puts "Deploying contract..."
      contract.deploy_and_wait()
      puts "Deployed contract to #{contract.address}"
    end

    desc "new PROJECTNAME", "generates a new EtherDev project PROJECTNAME"
    def new(project_name)
      require "ether_dev/generators/project_generator"

      generator = ProjectGenerator.new(project_name)
      generator.generate
    end
  end
end
