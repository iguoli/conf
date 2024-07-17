# Print subject, dates info of x509 certification.
printcert () {
    cmd="openssl x509 -noout -in $1 -subject -dates -ext subjectAltName";
    printf "\n%s\n\n" "${cmd}";
    eval "${cmd}"
}

# Print subject, expiration date info of multiple x509 certifications in a single file.
print_certchain () {
    cmd="openssl crl2pkcs7 -nocrl -certfile $1 | openssl pkcs7 -print_certs -noout -text | grep -P '(Subject|Not Before|Not After\s|DNS):'"
    printf "\n%s\n\n" "${cmd}";
    eval "${cmd}"
}
