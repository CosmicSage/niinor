
let oa = await contract.owner();
await contract.contributions(oa).then(function(balance) { balanceInstance = balance});
// balanceInstance.words[0];


let trano = {from:player, value: toWei('0.01')};
await contract.sendTransaction(trano, function (e, r) {console.log(`err is ${e}`); console.log(`response is ${r}`)});

