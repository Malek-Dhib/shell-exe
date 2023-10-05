if [ $# -ne 3 ]; then
    echo "Usage: $0 nombre1 (+|-|x|/) nombre2"
    exit 1
fi

nombre1="$1"
operation="$2"
nombre2="$3"

operation=${operation//x/*}

resultat=0
case "$operation" in
    +)
        resultat=$(echo "$nombre1 + $nombre2" | bc)
        ;;
    -)
        resultat=$(echo "$nombre1 - $nombre2" | bc)
        ;;
    /)
        if [ "$nombre2" -eq 0 ]; then
            echo "Division par zéro impossible."
            exit 1
        fi
        resultat=$(echo "scale=2; $nombre1 / $nombre2" | bc)
        ;;
    *)
        if [ "$operation" = "*" ]; then
            resultat=$(echo "$nombre1 * $nombre2" | bc)
        else
            echo "Opération non reconnue. Utilisez '+', '-', 'x', ou '/'"
            exit 1
        fi
        ;;
esac

echo "Résultat de l'opération : $resultat"
