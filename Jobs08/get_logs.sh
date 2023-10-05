date_actuelle=$(date "+%d-%m-%Y-%H:%M")

repertoire_backup="/home/parallels/shell-exe/Jobs08/Backup"

nom_fichier="number_connection-$date_actuelle"

nombre_connexions=$(journalctl | grep "sshd.*Accepted" | wc -l)

echo "nombre_connexions" > "$repertoire_backup/$nom_fichier"

tar -cf "$repertoire_backup/$nom_fichier.tar" "$repertoire_backup/$nom_fichier" 

rm "$repertoire_backup/$nom_fichier"

