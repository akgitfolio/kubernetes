echo "full config $(kubectl config view
)"

echo "current ctx name: $(kubectl config current-context)"
echo "ctx from view; $(kubectl config view -o jsonpath='{.current-context}')"
echo "get user detials $(kubectl config view -o jsonpath='{.contexts[?(@.name == "'$(kubectl config current-context)'")].context.user}'
)"

