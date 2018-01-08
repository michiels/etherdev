module EtherDev
  module ProjectTemplates
    def project_templates
      templates = {}
      templates["Gemfile"] = <<~'EOS'
        gem "etherdev"
        gem "ethereum.rb", github: "michiels/ethereum.rb", branch: "fixes-for-etherdev"
      EOS

      templates["Rakefile"] = <<~'EOS'
        spec = Gem::Specification.find_by_name 'etherdev'
        load "#{spec.gem_dir}/lib/ether_dev/test_task.rake"
      EOS

      templates["blockchain.yml"] = <<~'EOS'
        # You can use the Project Orca test Ethereum blockchain to easily
        # test and stage your contracts and interact with them in your team
        # or from other deployed apps.
        #
        # Sign up at https://projectorca.net and uncomment the following:
        #
        # development:
        #  rpc: https://rpc.projectorca.net
        #  # Put your private account key here:
        #  account_key:  c38dbe6e3725e012ec5e1d114ccc9061bb02946e5efdd1b2c7e0856897cfa0ef
        test:
          rpc: http://localhost:7545
      EOS

      templates["Greeter.sol"] = <<~'EOS'
        contract mortal {
          /* Define variable owner of the type address */
          address owner;

          /* This function is executed at initialization and sets the owner of the contract */
          function mortal() { owner = msg.sender; }

          /* Function to recover the funds on the contract */
          function kill() { if (msg.sender == owner) selfdestruct(owner); }
        }

        contract greeter is mortal {
          /* Define variable greeting of the type string */
          string greeting;

          /* This runs when the contract is executed */
          function greeter(string _greeting) public {
              greeting = _greeting;
          }

          /* Main function */
          function greet() constant returns (string) {
              return greeting;
          }
        }
      EOS

      templates["test_helper.rb"] = <<~'EOS'
        require "ether_dev/test_helper"
      EOS

      templates["greeter_test.rb"] = <<~'EOS'
        require "test_helper"

        class GreeterTest < EtherDev::TestCase
          def test_greet
            @contract.deploy_and_wait("Hello, World!")

            assert_equal "Hello, World!", @contract.call.greet()
          end
        end
      EOS

      templates
    end
  end
end
