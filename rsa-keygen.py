#!/usr/bin/env python3
from cryptography.hazmat.primitives import serialization as crypto_serialization
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.backends import default_backend as crypto_default_backend
from pathlib import Path
from colorama import Fore, init


RSA_FOLDER = Path(__file__).parent.resolve().joinpath('RSA_KEYS')

def generate_key_pair():
    key = rsa.generate_private_key(
        backend=crypto_default_backend(),
        public_exponent=65537,
        key_size=2048
    )

    sk = key.private_bytes(
        crypto_serialization.Encoding.PEM,
        crypto_serialization.PrivateFormat.PKCS8,
        crypto_serialization.NoEncryption()
    )

    pk = key.public_key().public_bytes(
        crypto_serialization.Encoding.OpenSSH,
        crypto_serialization.PublicFormat.OpenSSH
    )

    print(f'{Fore.GREEN}[+] Generated secret key and public key for RSA')

    return (sk, pk)

def write_on_file(sk: bytes, pk: bytes):
    RSA_FOLDER.mkdir(parents=True, exist_ok=True)
    print(f'{Fore.YELLOW}[!] Writing keys to {RSA_FOLDER.as_posix()}')
    with open(RSA_FOLDER.joinpath('public.key').absolute(), 'wb') as f:
        f.write(pk)
    with open(RSA_FOLDER.joinpath('private.key').absolute(), 'wb') as f:
        f.write(sk)
    print(f'{Fore.GREEN}[+] Success')

def main():
    init(autoreset=True)
    print(f'{Fore.BLUE}[!] RSA Key Generation script')
    sk, pk = generate_key_pair()
    write_on_file(sk, pk)

if __name__ == '__main__':
    main()