//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minimumUsd = 5 * 1e18;
    
    function fund() public payable{
        // allow users to send cryptocurrencies
        // have a minimum amount sent
        // but how do i send ETH to this contract?
        require(getConversionRate(msg.value) > minimumUsd, "didn't send enough funds!");
    }

    function getPrice() public view returns (uint256) {
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();

        // price of ETH in terms of USD
        // 2000.00000000
        return uint256(price*1e10); // we typecasted because msg.value will be in uint256     
    }

    function getConversionRate(uint256 _ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice*_ethAmount) / 1e18;
        return ethAmountInUsd;

        // 1ETH
        // => 2000_000000000000000000 (2000 DOLLARS)
        // => (2000_000000000000000000 * 1_000000000000000000) / 1e18
        // => $2000 = 1 ETH (2000 with the 18 zeroes)
    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function withdraw() public{}
}
