import { ethers } from "hardhat";
import { YulIntro } from "../typechain-types";

async function main() {

  const contract = await ethers.deployContract("YulIntro",[], {});

  const yul = await contract.waitForDeployment() as YulIntro;

  console.log(
    `contract: 
        test_yul:
              ${ await yul.test_yul()}
        test_types:
              ${ await yul.test_types()}
        test_add:
              ${ await yul.test_add()}
        test_if:
              ${ await yul.test_if()}
        test_switch:
              ${ await yul.test_switch()}
    `
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
