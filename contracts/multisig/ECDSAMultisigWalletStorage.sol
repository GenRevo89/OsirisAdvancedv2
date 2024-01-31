// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import { EnumerableSet } from '../data/EnumerableSet.sol';

library ECDSAMultisigWalletStorage {
    struct Layout {
        uint256 quorum;
        EnumerableSet.AddressSet signers;
        mapping(address => mapping(uint256 => bool)) nonces;
    }

    bytes32 internal constant DEFAULT_STORAGE_SLOT =
        keccak256('solidstate.contracts.storage.ECDSAMultisigWallet');

    function layout() internal pure returns (Layout storage l) {
        l = layout(DEFAULT_STORAGE_SLOT);
    }

    function layout(bytes32 slot) internal pure returns (Layout storage l) {
        assembly {
            l.slot := slot
        }
    }
}
