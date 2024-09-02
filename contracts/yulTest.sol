// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// Yul: Inline assembly in Solidity
// Types: everything is bytes32
contract YulIntro { 
    function test_yul() public pure returns (uint256) {
        uint256 s = 0;
        assembly{
            let x := 1
            x :=2
            s :=2
        }  
        return s;
    }
    function test_types() public pure returns (bool x, uint256 y, bytes32 z) {
        assembly{
            x := 1
            y := 0xaaaaaa
            z := "Hiii YUL"
        }
    }

    function test_add() public pure returns (uint256 x, uint256 y, uint256 z) {
        assembly{
            x := 1
            y := 3
            z := add(x, y)
        }
    }

    function test_if() public pure returns (bool x, bytes32 y) {
        assembly{
            x := 1
            y := "False"
            if  x {
                y := "True"
            }
        }
    }

    function test_switch(uint256 input) public pure returns (uint256 x, bytes32 y) {
        assembly{
            x:= input
            switch x
            case 0 {
                y := keccak256(add(bytes("Case 0"), 0x20), mload(bytes("Case 0")))
            }
            case 1 {
                y := keccak256(add(bytes("Case 1"), 0x20), mload(bytes("Case 1")))
            }
            default {
                y := keccak256(add(bytes("Default"), 0x20), mload(bytes("Default")))
            }
        }
    }
}