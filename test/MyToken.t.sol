// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";
import {DeployMyTokenScript} from "../script/DeployMyToken.s.sol";

contract MyTokenTest is Test {
    MyToken token;

    function setUp() public {
        // token = new MyToken();
        DeployMyTokenScript deployMyTokenScript = new DeployMyTokenScript();
        token = deployMyTokenScript.run();
        // token = new DeployMyTokenScript().run();
    }

    function test_runnerIsNotSender() public view {
        assertNotEq(address(this), msg.sender);
    }

    function test_balanceOfSender() public view {
        assertEq(token.balanceOf(msg.sender), 0);
    }

    function test_shouldNotRevertFaucetMint() public {
        uint startBalance = token.balanceOf(address(this));
        uint mintAmount = 1000;
        token.faucet(mintAmount);
        assertEq(token.balanceOf(address(this)), startBalance + mintAmount);
    }

    function test_shouldRevertWithSimpleError() public {
        vm.expectRevert(MyToken.SimpleError.selector);

        token.revertWithSimpleError();
    }
}
