// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Psichedelic is ERC20 {
    uint256 private constant TOTAL_SUPPLY = 1000000000 * (10 ** 18);
    uint256 private constant MAX_TRANSFER_AMOUNT = TOTAL_SUPPLY / 100; // Anti-whale: limit transfers to 1% of total supply

    constructor(
        address liquidityPool,
        address cexListing,
        address developmentTeam,
        address marketing
    )
        ERC20("Psichedelic", "PSI")
    {
        _mint(liquidityPool, TOTAL_SUPPLY * 90 / 100); // 90% for liquidity
        _mint(cexListing, TOTAL_SUPPLY * 69 / 1000); // 6.9% for CEX listings
        _mint(developmentTeam, TOTAL_SUPPLY * 2 / 100); // 2% for development
        _mint(marketing, TOTAL_SUPPLY * 11 / 1000); // 1.1% for marketing
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        require(value <= MAX_TRANSFER_AMOUNT, "Transfer amount exceeds the max transfer amount.");
        return super.transfer(to, value);
    }

    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        require(value <= MAX_TRANSFER_AMOUNT, "Transfer amount exceeds the max transfer amount.");
        return super.transferFrom(from, to, value);
    }
}