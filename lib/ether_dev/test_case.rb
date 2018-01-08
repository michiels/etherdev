module EtherDev
  class TestCase < ::Minitest::Test
    def setup
      @formatter = Ethereum::Formatter.new
      contract_name = self.class.name.dup
      contract_name.slice!("Test")

      @config = YAML.load(File.open("config/blockchain.yml"))[ENV["BLOCKCHAIN_ENV"] || "test"] || {}
      @client = Ethereum::HttpClient.create(@config["rpc"], true)

      @contract = Ethereum::Contract.create(file: "contracts/#{contract_name}.sol", client: @client)
      Eth.configure { |c| c.chain_id = @client.net_version["result"].to_i }

      @default_key = nil
      @default_account = nil

      if private_key = @config["account_key"]
        @default_key = Eth::Key.new priv: private_key
        @default_account = @default_key.address
      else
        @default_account = @client.default_account
      end

      @contract.key = @default_key if @default_key.present?
      @contract.sender = @default_account
    end

    protected

    def signing_account?
      @default_key.present?
    end
  end
end
