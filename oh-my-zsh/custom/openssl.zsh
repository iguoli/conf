# Set personal funcitons
printcert () {
    cmd="openssl x509 -noout -in $1 -issuer -subject -dates -ext subjectAltName";
    printf "\n%s\n\n" "${cmd}";
    eval "${cmd}"
}

print_certchain () {
    cmd="openssl crl2pkcs7 -nocrl -certfile $1 | openssl pkcs7 -print_certs -noout -text | grep -P '(Subject|Not Before|Not After\s|DNS):'"
    printf "\n%s\n\n" "${cmd}";
    eval "${cmd}"
}
