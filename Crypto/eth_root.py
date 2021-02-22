#!/usr/bin/env python3
# pip3 install gmpy2
import gmpy2
from Crypto.Util.number import long_to_bytes

# ciphertext
ct = 43472086389850415096247084780348896011812363316852707174406536413629129
e = 3

# extract eth root of ct
msg = gmpy2.iroot(ct, e)[0]
print(long_to_bytes(msg))
