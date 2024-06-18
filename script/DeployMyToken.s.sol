// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyTokenScript is Script {
    function setUp() public {}

    function run() external returns (MyToken) {
        //read env variables and choose EOA for transaction signing
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address deployerAddress = vm.envAddress("PUBLIC_KEY");

        vm.startBroadcast(deployerPrivateKey);

        MyToken token = new MyToken();

        vm.stopBroadcast();

        return token;
    }
}
