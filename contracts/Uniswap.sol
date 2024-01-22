//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./interface/IERC20.sol";
import "./interface/IUniswapV2Router.sol";
import "https://github.com/Uniswap/v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";

contract Uniswap{
    address public constant UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address public constant WETH = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;

    event LiquidityRes(uint amountA, uint amountB, uint liquiidty);

    function addLiquidity( // functionality of adding liquidity
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin

    ) public {
        IERC20(tokenA).transferFrom(msg.sender, address(this), amountADesired);
        IERC20(tokenB).transferFrom(msg.sender, address(this), amountBDesired);

        IERC20(tokenA).approve(UNISWAP_V2_ROUTER, amountADesired);
        IERC20(tokenB).approve(UNISWAP_V2_ROUTER, amountBDesired);

        (uint amountA, uint amountB, uint liquidity) = IUniswapV2Router02(UNISWAP_V2_ROUTER).addLiquidity(tokenA, tokenB, amountADesired, amountBDesired, amountAMin, amountBMin, address(this), block.timestamp + 1000);
        emit LiquidityRes(amountA, amountB, liquidity);
        
    }

    // function swapTokens(
    //     uint amountIn,
    //     uint amountOutMin,
    //     address tokenIn,
    //     address tokenOut,
    //     address _to
    //     ) public {

    //     }

}