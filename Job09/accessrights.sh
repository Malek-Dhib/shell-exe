csv_file="/home/parallels/shell-exe/Job09/Shell_Userlist.csv"

if [ ! -f "$csv_file" ]; then
  echo "Le fichier CSV n'existe pas."
  exit 1
fi

# Fonction pour créer ou mettre à jour un utilisateur
create_or_update_user() {
  username="$1"
  prenom="$2"
  nom="$3"
  mdp="$4"
  role="$5"

if id "$username" &>/dev/null; then
    # Mise à jour de l'utilisateur existant
    sudo usermod -c "$prenom $nom" -p "$mdp" "$username"
    echo "L'utilisateur $prenom ($username) a été mis à jour."

    # Ajouter l'utilisateur au groupe approprié
    if [ "$role" == "Admin" ]; then
     sudo usermod -aG sudo "$username"
      echo "L'utilisateur $prenom ($username) a été ajouté au groupe sudo."
    elif [ "$role" == "User" ]; then
     sudo usermod -aG users "$username"
      echo "L'utilisateur $prenom ($username) a été ajouté au groupe users."
    else
      echo "Rôle non reconnu : $role"
    fi
  else
    # Création d'un nouvel utilisateur
    sudo useradd -m -s /bin/bash -p "$mdp" --badname "$username"
    echo "L'utilisateur $prenom ($username) a été créé."

    # Ajouter l'utilisateur au groupe approprié
    if [ "$role" == "Admin" ]; then
     sudo usermod -aG sudo "$username"
      echo "L'utilisateur $prenom ($username) a été ajouté au groupe sudo."
    elif [ "$role" == "User" ]; then
     sudo usermod -aG users "$username"
      echo "L'utilisateur $prenom ($username) a été ajouté au groupe users."
    else
      echo "Rôle non reconnu : $role"
    fi
  fi
}

# Lecture du fichier CSV
tail -n +2 "$csv_file" | while IFS=$',' read -r id prenom nom mdp role; do
  # Création du nom d'utilisateur au format "nom-prenom"
  username="${nom}-${prenom}"

  # Appel de la fonction pour créer ou mettre à jour l'utilisateur
  create_or_update_user "$username" "$prenom" "$nom" "$mdp" "$role"
done

echo "Terminé."
