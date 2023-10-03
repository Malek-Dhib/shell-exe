if [ $# -ne 2 ]; then
    echo "Usage: $0 nouveauFichier.txt contenu.txt"
    exit 1
fi

nouveau_fichier="$1"
contenu_fichier="$2"

cat $contenu_fichier > $nouveau_fichier

if [ $? -eq 0 ]; then
    echo "Le contenu du fichier source a été copié dans le nouveau fichier : $nouveau_fichier"
else
    echo "Une erreur s'est produite lors de la copie du fichier."
fi
