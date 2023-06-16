package main

import data.dockerfile_scanner

deny[msg] {
   input[i].Cmd == "add"
   val := concat(" ", input[i].Value)
   msg = sprintf("Use COPY instead of ADD: %s", [val])
}

