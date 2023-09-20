const Psichedelic = artifacts.require("Psichedelic");

module.exports = function(deployer) {
  const liquidityPool = '0x97c7ee50c7eb54724f65856ff07bdf2505c45048';
  const cexListing = '0x94bc6138fdc3697d123996b8eb518285172c619a';
  const developmentTeam = '0x22fe086fa36834d0b5cf677add2d4f65aeef9611';
  const marketing = '0x61e1faa35b29eef7bf6cf9edf8e286fc92ea54ba';
  deployer.deploy(Psichedelic, liquidityPool, cexListing, developmentTeam, marketing);
};