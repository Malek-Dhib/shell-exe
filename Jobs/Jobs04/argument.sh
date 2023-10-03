if [ $# -ne 2 ]; then
    echo "Usage: $0 nouveauFichier.txt contenu.txt"
    exit 1
fi

copier_fichier="$1"
coller_fichier="$2"

cp $1 $2

if [ $? -eq 0 ]; then
    echo "Le contenu du fichier source a été copié dans le nouveau fichier : $nouveau_fichier"
else
    echo "Une erreur s'est produite lors de la copie du fichier."
fi
