const { Contract } = require("ethers");
const {ethers} = require("ethers");

const provider = new ethers.JsonRpcApiProvider("http://127.0.0.1:8545");

const contractAdress = ""; // Aca va un smart contrac generado en remix de la loteria

const abi = ["event VRF()"];

async function main() {
    const contract = new ethers.Contract(contractAdress,abi,provider);

    Contract.on("VRF",() =>{
        console.log("recibi un evento");
    })
    console.log("estoy escuchando evento");
}