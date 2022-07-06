async function willnevercall() {

//  list accounts
let accounts = await ethers.provider.listAccounts();
// get balamce of account
(await ethers.provider.getBalance(accounts[0])).toString();

// To impersonate
await hre.network.provider.request({method: "hardhat_impersonateAccount",params: [accounts[7]]});

// To send money
await hre.network.provider.request({
  method: "eth_sendTransaction",
  params: [{
    "from": accounts[0],
    "to": accounts[7],
    // "gas": "0x76c0", // 30400
    // "gasPrice": "0x9184e72a000", // 10000000000000
    "value" : "0x1388"
    // "value": "0x9184e72a", // 2441406250
    // "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
  }],
});

// Send malicions zero money
await hre.network.provider.request({
  method: "eth_sendTransaction",
  params: [{
    "from": accounts[0],
    "to": k.address,
    // "gas": "0x76c0", // 30400
    // "gasPrice": "0x9184e72a000", // 10000000000000
    // "value" : ""
    "value": `0x${1e+10.toString(16)}`, // 2441406250 idk what this is
    "data": "0x20755ce80000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002a30783865463344336464463235383732363843614635626536423030346139374435386363334463633100000000000000000000000000000000000000000000"
  }],
});
}
