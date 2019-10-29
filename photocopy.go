package main

import (
	"flag"
	"fmt"
)

var inPath = flag.String("in", "", "path to input directory")
var outPath = flag.String("out", "", "path to output directory")

func main() {
	flag.Parse()
	flag.Visit(func(f *flag.Flag) {
		fmt.Println(f.Name, f.Value)
	})
}
