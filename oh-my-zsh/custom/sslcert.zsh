# Print subject, dates info of x509 certification.
print_certfile () {
    cmd="openssl x509 -noout -in $1 -issuer -subject -dates -ext subjectAltName";
    printf "\n%s\n\n" "${cmd}";
    eval "${cmd}"
}

# Print subject, expiration date info of multiple x509 certifications in a single file.
print_certchainfile () {
    cmd="openssl crl2pkcs7 -nocrl -certfile $1 | openssl pkcs7 -print_certs -noout -text | grep -P '(Subject|Not Before|Not After\s|DNS):'"
    printf "\n%s\n\n" "${cmd}";
    eval "${cmd}"
}

print_https_cert () {
  cmd="echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -issuer -subject -dates -ext subjectAltName"
  printf "\n%s\n\n" "${cmd}"
  eval "${cmd}"
}
