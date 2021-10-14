import { expect } from "chai";
import { ethers } from "hardhat";

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello, world!", "GM");
    await greeter.deployed();

    expect(await greeter.getName()).to.equal("Hello, world!");

    const setGreetingTx = await greeter.setName("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await greeter.getName()).to.equal("Hola, mundo!");
  });
});
