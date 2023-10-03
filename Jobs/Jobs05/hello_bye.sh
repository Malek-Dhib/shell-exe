if [ $# -ne 1 ]; then
    echo "Usage: $0 [Hello|Bye]"
    exit 1
fi

argument="$1"

if [ "$argument" = "Hello" ]; then
    echo "Bonjour, je suis un script !"
elif [ "$argument" = "Bye" ]; then
    echo "Au revoir et bonne journée !"
else
    echo "Argument non reconnu. Utilisez 'Hello' ou 'Bye'."
fi
