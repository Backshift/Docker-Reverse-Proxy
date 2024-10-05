openssl genpkey -algorithm RSA -out certs/key.pem -pkeyopt rsa_keygen_bits:2048
openssl req -new -key certs/key.pem -out certs/csr.pem
openssl x509 -req -days 365 -in certs/csr.pem -signkey certs/key.pem -out certs/crt.pem