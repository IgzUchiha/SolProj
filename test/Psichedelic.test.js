const Psichedelic = artifacts.require("Psichedelic");

contract("Psichedelic", accounts => {
  it("should put 900000000 PSI in the liquidityPool account", async () => {
    const instance = await Psichedelic.deployed();
    const liquidityPool = '0x97c7ee50c7eb54724f65856ff07bdf2505c45048'; // replace with the actual address
    const balance = await instance.balanceOf(liquidityPool);
    assert.equal(balance.toString(), '900000000000000000000000000', "900000000 PSI wasn't in the liquidityPool account");
  });
});