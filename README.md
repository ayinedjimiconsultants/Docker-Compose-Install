Installation de Docker Compose sur Windows
Ce script PowerShell a été conçu pour simplifier le téléchargement et l'installation de docker-compose.exe sur les systèmes d'exploitation Windows, en l'ajoutant automatiquement au PATH système.

Table des matières
Description

Prérequis

Utilisation

Notes importantes

Crédits

Description
Le script effectue les opérations suivantes :

Définit le chemin de destination pour docker-compose.exe (C:\Program Files\Docker).

Télécharge la dernière version stable de docker-compose.exe depuis le dépôt GitHub officiel de Docker.

Crée le répertoire de destination si celui-ci n'existe pas.

Copie le fichier téléchargé dans le répertoire spécifié.

Ajoute le répertoire de destination à la variable d'environnement Path du système, permettant d'exécuter docker-compose depuis n'importe quel terminal.

Vérifie le succès du téléchargement et de l'installation en exécutant la commande docker-compose version.

Prérequis
Système d'exploitation : Windows (64-bit)

Permissions : Vous devez exécuter PowerShell en tant qu'Administrateur pour que le script puisse créer des dossiers dans C:\Program Files et modifier les variables d'environnement système.

Accès Internet : Une connexion Internet est nécessaire pour télécharger le fichier docker-compose.exe.

Utilisation
Enregistrez le script : Copiez le contenu du script PowerShell fourni et enregistrez-le dans un fichier nommé, par exemple, install-docker-compose.ps1.

Exécutez en tant qu'administrateur :

Faites un clic droit sur le fichier install-docker-compose.ps1.

Sélectionnez "Exécuter avec PowerShell".

Confirmez l'élévation des privilèges si l'UAC (User Account Control) vous le demande.

Alternativement, ouvrez PowerShell en tant qu'administrateur (recherchez "PowerShell" dans le menu Démarrer, puis "Exécuter en tant qu'administrateur") et naviguez jusqu'au répertoire où vous avez enregistré le script, puis exécutez-le :

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force # Si vous rencontrez des problèmes d'exécution de script
.\install-docker-compose.ps1

Notes importantes
Redémarrage de la session PowerShell : Après l'exécution du script, il est impératif de redémarrer votre session PowerShell (ou votre terminal de commande) pour que les modifications apportées à la variable d'environnement Path soient prises en compte.

Version : Le script est configuré pour télécharger la version v2.27.0 de Docker Compose. Si une version plus récente est disponible, vous devrez mettre à jour l'URL $composeUrl dans le script.

Emplacement : Le script installe Docker Compose dans C:\Program Files\Docker. Assurez-vous que cet emplacement est approprié pour votre configuration.

Crédits
Réalisé par : Ayi NEDJIMI Consultants
