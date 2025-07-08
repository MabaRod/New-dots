#!/bin/bash

# Instalar paquetes necesarios
sudo dnf install -y i3 i3blocks gcc zsh lightdm rofi feh htop kitty

# Función para copiar configuraciones
copyi3() {
    cp -r ./i3/ ~/.config/i3
    mkdir -p ~/.config/i3blocks
    cp -r ./i3blocks/ ~/.config/i3blocks
    mkdir -p ~/.config/kitty
    cp -r ./kitty/ ~/.config/kitty
}

# Función para hacer backup
backup() {
    mkdir -p ~/Documents/myConfigs
    cp -r ~/.config/kitty ~/Documents/myConfigs
    cp -r ~/.config/i3 ~/Documents/myConfigs
    cp -r ~/.config/i3blocks ~/Documents/myConfigs
}

# Confirmación del usuario
echo "⚠️  ESTO SOBRESCRIBIRÁ TUS CONFIGS DE i3, ¿QUIERES HACER BACKUP?"
read -p "Sí o no? [y/n]: " respuesta

case "$respuesta" in
    [yY])
        echo "Haciendo backup y copiando nuevos archivos..."
        backup
        copyi3
        ;;
    [nN])
        echo "Saltando backup. Copiando archivos directamente..."
        copyi3
        ;;
    *)
        echo "❌ Respuesta inválida. Usa 'y' o 'n'."
        ;;
esac

