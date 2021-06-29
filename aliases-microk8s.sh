alias kubectl='microk8s kubectl'

function kap() {
    while true ; do
        dir="$1" ; shift
        if [ -z "$dir" ] ; then break ; fi

        find "$dir" -iname 'namespace.yaml' -exec cat '{}' '+' |
	    microk8s kubectl apply -f -

	find "$dir" -not -iname 'namespace.yaml'  \
		         -iname '*.yaml' -exec cat '{}' '+' |
	    microk8s kubectl apply -f -
    done
}

function kel() {
    while true ; do
        dir="$1" ; shift
        if [ -z "$dir" ] ; then break ; fi

        find "$dir" -not -iname 'namespace.yaml' \
                         -iname '*.yaml' -exec cat '{}' '+' |
	    microk8s kubectl delete -f -
    done
}

eval "$( kubectl completion "$( basename "$SHELL" )" )"
