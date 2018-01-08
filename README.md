# Welcome to EtherDev

EtherDev is an Ethereum blockchain development toolkit that includes everything you need to compile, test, and deploy Ethereum Smart Contracts.

EtherDev lets you develop and test your Solidity Smart Contracts with your favorite language and testing framework: Ruby and MiniTest. Developing and testing your contracts will feel very similar as developing other Ruby frameworks and libraries, like for example Ruby on Rails.

## Getting Started

1. Install EtherDev at the command prompt if you haven't yet:

    ```
    $ gem install etherdev
    ```

2. At the command prompt, create a new EtherDev project:
    ```
    $ etherdev new myproject
    ```

    where "myproject" is your desired new project name.

3. Install and run the Ganache personal development Ethereum blockchain

    Go to http://truffleframework.com/ganache/ and install Ganache for your platform. Then run a personal blockchain on your machine for fast and easy
  testing of your contracts.

4. Change directory to `myproject` and run the sample contract:

    ```
    $ cd myproject
    $ bin/rake
    ```

Congratulations! You've compiled, deploy and tested the functionality of the
Greeter contract that's available by default in your project. You can now add
your other contracts to the `contracts/` folder and add your tests for them to
`tests/`.

## License

EtherDev is released under the [MIT License](https://opensource.org/licenses/MIT)
