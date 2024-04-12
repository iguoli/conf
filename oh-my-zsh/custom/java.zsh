# Java on macOS
if type java >/dev/null 2>&1; then
    case $(uname) in
        Darwin)
            export JAVA_HOME=$(/usr/libexec/java_home) ;;
        Linux)
            export JAVA_HOME=$(readlink -f $(which java) | sed 's:/bin/java::')
            ;;
    esac
fi
