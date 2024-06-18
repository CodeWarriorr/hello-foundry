// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.26;

import {SolidStateERC20} from "solidstate/token/ERC20/SolidStateERC20.sol";

contract MyToken is SolidStateERC20 {
    error SimpleError();

    constructor() SolidStateERC20() {
        _setName("MyToken");
        _setSymbol("MTK");
        _setDecimals(18);

        _mint(msg.sender, 1000000 * 10 ** _decimals());
    }

    function faucet(uint256 amount) external {
        _mint(msg.sender, amount);
    }

    function revertWithSimpleError() pure external {
        require(false, SimpleError());
    }
}
