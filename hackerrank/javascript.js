#!/usr/local/bin/node

function processData(input) {
    //Enter your code here
    lines = input.split("\n")
    console.log(lines)
} 

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});