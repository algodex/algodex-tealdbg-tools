function main() {
    const args = process.argv;
    console.log(args[2]);
    const fs = require('fs');
    const asa_dex = require(args[2] + '/asa_dex_teal.js');
    const algo_dex = require(args[2] + '/dex_teal.js');
    fs.writeFileSync('/tmp/asa_dex.teal', asa_dex.getASAOrderBookApprovalProgram());
    fs.writeFileSync('/tmp/dex.teal', algo_dex.getAlgoOrderBookApprovalProgram());
}

main();
