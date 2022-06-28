async function willnevercall() {

//  list accounts
let accounts = await ethers.provider.listAccounts();
// get balamce of account
(await ethers.provider.getBalance(accounts[0])).toString();

// To impersonate
await hre.network.provider.request({
  method: "hardhat_impersonateAccount",
  params: ["0x364d6D0333432C3Ac016Ca832fb8594A8cE43Ca6"],
});

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
    "from": accounts[7],
    "to": king.address,
    // "gas": "0x76c0", // 30400
    // "gasPrice": "0x9184e72a000", // 10000000000000
    // "value" : ""
    "value": "0x9184e7", // 2441406250 idk what this is 
    // "data": "0xdd365b8b"
  }],
});
}

