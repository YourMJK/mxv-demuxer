// Copyright (c) 2022 David Vogel
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

package main

import (
	"flag"
	"log"
)

func main() {
	flag.Parse()

	filenames := flag.Args()

	if len(filenames) == 0 {
		log.Fatalln("No input file specified.")
	}

	log.Printf("Started mxv-demuxer %v.", version)

	for _, filename := range filenames {
		log.Printf("Starting to demux %q...", filename)
		if err := demuxFile(filename); err != nil {
			log.Printf("Failed to demux %q: %v", filename, err)
		}
	}
}
