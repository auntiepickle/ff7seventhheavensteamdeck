#!/bin/bash
ln -s ~/.local/share/Steam/steamapps/common/FINAL\ FANTASY\ VII ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/FFVII_STEAM_FOLDER
printf 'FF7DISC1' > ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/.windows-label
mkdir -p ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/FFVII_STEAM_FOLDER/mods/{7thHeaven,textures}
cp -r ~/Downloads/ff7seventhheavensteamdeck-main/FF7SeventhHeavenSteamDeckResources/FFNx-FF7_1998-v1.14.0.0/* ~/.local/share/Steam/steamapps/common/FINAL\ FANTASY\ VII
mkdir  ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/Program\ Files/7th\ Heaven/Resources/Game\ Driver/
cp -r ~/Downloads/ff7seventhheavensteamdeck-main/FF7SeventhHeavenSteamDeckResources/FFNx-FF7_1998-v1.14.0.0/* ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/Program\ Files/7th\ Heaven/Resources/Game\ Driver/
