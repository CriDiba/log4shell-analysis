#!/usr/bin/env python3
import base64
from cryptography.hazmat.primitives import serialization as crypto_serialization
from cryptography.hazmat.backends import default_backend as crypto_default_backend
from cryptography.hazmat.primitives.asymmetric import padding
from pathlib import Path
from colorama import Fore, init
import argparse

RSA_FOLDER = Path(__file__).parent.resolve().joinpath('RSA_KEYS')

parser = argparse.ArgumentParser(description='Decrypt utilty')
parser.add_argument('ciphertext', metavar='ciphertext', type=str, 
    help='Cipher text to decrypt with RSA_KEYS/private.key')

def main(args):
    init(autoreset=True)
    with open(RSA_FOLDER.joinpath('private.key').absolute(), "rb") as key_file:
        private_key = crypto_serialization.load_pem_private_key(
            key_file.read(),
            password=None,
            backend=crypto_default_backend()
        )

    decrypted = private_key.decrypt(base64.b64decode(args.ciphertext), padding=padding.PKCS1v15())
    print(f'{Fore.GREEN}[+] Result:')
    print(base64.b64encode(decrypted))

if __name__ == '__main__':
    main(parser.parse_args())