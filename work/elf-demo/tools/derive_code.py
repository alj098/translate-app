#!/usr/bin/env python3
"""Recover the accepted input for the offline demo sample.

Inputs are the two 8-byte blobs read from .data in evidence/artifacts/disasm.txt:
  g_target @ 0x4010 = 5e 45 13 c6 cd 6e 2b 15
  g_key    @ 0x4018 = 13 37 42 99 ab 0d 5e 71
check_code() computes in[i] ^ g_key[i] and compares with g_target.
"""
target = bytes.fromhex("5e4513c6cd6e2b15")
key = bytes.fromhex("13374299ab0d5e71")
code = bytes(a ^ b for a, b in zip(target, key))
print("derived_code:", code.decode("latin-1"))
