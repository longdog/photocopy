package main

import (
	"flag"
	"fmt"
)

var inArg = flag.String("in", "", "Path to input directory")
var outArg = flag.String("out", "", "Path to output directory")
var verArg = flag.Bool("v", false, "Print version")
var version = "dev"

func main() {
	flag.Parse()
	if *verArg {
		fmt.Printf("Photocopy v. %s\n", version)
	}
}
