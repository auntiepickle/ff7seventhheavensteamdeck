![7th Heaven Logo](https://i.imgur.com/Dbx8dcd.png)
![Steam Deck Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Steam_Deck_logo_%28pink_orb%29.svg/1200px-Steam_Deck_logo_%28pink_orb%29.svg.png)
 
 # Final Fantasy Seven: 7th Heaven (Steam Deck Install Guide)
 This guide serves as a walkthrough on how you can get the [7th Heaven mod](https://7thheaven.rocks/) for Final Fantasy 7 up and running on the [Steam Deck](https://store.steampowered.com/steamdeck). 
 
 *Everything provided here is as is.*
 ## Requirements
 This guide assumes that you have the Steam version of Final Fantasy 7. It might work for other versions but I am going to assume you have downloaded it through the Steam Store
 
Go ahead and make sure you have downloaded/installed the following resources as we will need them later:
 - A valid copy of Final Fantasy 7
	 - [Installed from the Steam store](https://store.steampowered.com/app/39140/FINAL_FANTASY_VII/)
 - [Bottles](https://usebottles.com/)
	 - Discover store > Bottles
	 - Alternatively you can type this to install through flatpak
		 - `flatpak install flathub com.usebottles.bottles`
 - Flatseal
	 - Discover Store FlatSeal
 - [7th Heaven mod](https://github.com/tsunamods-codes/7th-Heaven)
	 - 7th Heaven GitHub > [Latest Release](https://github.com/tsunamods-codes/7th-Heaven/releases/latest)
 - [Custom 7th Heaven Recipe](https://github.com/auntiepickle/ff7seventhheavensteamdeck/blob/main/ff7heavensd.yml)
## Walkthrough
With all the prior components installed lets begin by getting Bottles set up.
### FlatSeal
In order to give access to your Steam libraries, we need to use Flatseal to manage permissions of Bottles.

-   Using  `Flatseal`, we can modify the permissions of any  `flatpak`  installed on our steam deck -- We'll need to modify our  `Bottles`  permissions in order to get the 7th Heaven installer running properly. Launch flatseal. On the left hand side, you will see a list of all flatpaks installed on your system. Scroll through that list until you find Bottles and select it. Now scroll through the right-hand list of options until you see the  `Filesystem`  category. This is where we will configure which files and folders Bottles has access to. For maximum security, I recommend you use the  `Other Files`  toggle, add  `~/Downloads`  and also add whichever steamapps directory your Final Fantasy VII is currently installed within. For example, this could be  `~/.local/share/Steam/steamapps`  for internal memory or  `/run/media/mmcblk0p1/steamapps/`  for the currently inserted sd card. Your configuration should look something like the following screenshot:

### Getting the right Runners and DLL Components
There are a bunch of [known issues with the latest versions of proton and 7th Heaven](https://github.com/tsunamods-codes/7th-Heaven/issues/19), hopefully this gets fixed in the future but because there are a host of issues we need very a specific configuration to get this working.

On the Bottles home page, hit the hamburger menu in the top right > Preferences > Runners

Make sure you install the following Runner:

 - Vaniglia-6.23

Now hit DLL Components and install the following DLL Components:
- DXVK: dxvk-1.9.4
- VKd3d: vkd3d-proton-2.5
- dxvk-nvapi-v0.5.2 **(not sure if needed)**

### Making the custom bottle
Now we need to make our own custom bottle where we can host the game with all our mods.
To do this start by hitting the "+" button in the top left to make a new Bottle

Name it whatever you want but I like "FF7SeventhHeaven"

 - Select custom in the environment type.
 - Runner:  **vaniglia-6.2.3**
 - Recipe: Custom Recipe
	 - Point it at your custom recipe file we downloaded earlier ([ff7heavensd.yml](https://github.com/auntiepickle/ff7seventhheavensteamdeck/blob/main/ff7heavensd.yml))

(This will take a bit to configure so go get a cup of coffee, browse reddit, take a bio break, w/e...)

Once it is done, go into the preferences tab of the newly created bottle and make sure the following options are set under System > Runner Components
- Runner: vaniglia-6.23
- DXVK Version: dxvk-1.9.4
- XKD3D Version: vkd3d-proton-2.5

Next, under the Graphics heading, turn off the setting for "Improve Direct3D 9/10/11 Compatibility".
*There is an issue where the UI renders black and this will avoid it for when we configure 7th Heaven on first launch*
### Hardlinking the game
Depending on where you've installed FFVII, the following command will differ.... 

**When using the Steam Deck's internal memory storage**, you will need to type the following:

```
ln -s ~/.local/share/Steam/steamapps/common/FINAL\ FANTASY\ VII ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/FFVII_STEAM_FOLDER

```

Otherwise,  **if you've installed Final Fantasy VII to an external storage (in this case, the inserted sd card)**  the command will look like the following:

```
ln -s /run/media/mmcblk0p1/steamapps/common/FINAL\ FANTASY\ VII ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/FFVII_STEAM_FOLDER

```

_To summarize, we are creating a symbolic link between our Final Fantasy VII Common directory and our bottle environment where we will run the executable. . Setting it up this way will allow us to make use of the default folder configuration of the installer, and you will simply be able to press "next" at this step of the install._

Next we need to add a few files and folders to the 7th Heaven Folder to complete the config.
### Adding a default drive label of `FF7DISC1` to our C Drive

```
printf 'FF7DISC1' > ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/.windows-label
```
*This step adds the label "FF7DISC1" to your C Drive which avoids the issues where it looks for a disc and cannot find it.*
### Adding some folders for 7th Heaven
7th Heaven stores some mod files in two different directories we will want to create ahead of time. 

    mkdir -p ~/.var/app/com.usebottles.bottles/data/bottles/bottles/FF7SeventhHeaven/drive_c/FFVII_STEAM_FOLDER/mods/{7thHeaven,textures}

Now it's show time and we can install 7th Heaven and configure Final Fantasy 7!

### Installing 7th Heaven
Next we want to run the installer for 7th Heaven. To do this from within the selected Bottle select "Run Executable" and point it at the 7th Heaven installer we downloaded earlier

Follow the default steps and it should launch!

#### Configuring 7th Heaven
The next step of the installer will ask you about where FF7 is located. 

 - FF7 Exe: My Computer > FF7DISC1 > FFVII_STEAM > ff7_en.exe
	 - *This will throw an error and make a file called ff7.exe for you and point to that which is correct*
 - Movies: My Computer > FF7DISC1 > FFVII_STEAM > data > movies
 - Textures: My Computer > FF7DISC1 > FFVII_STEAM > mods > textures
 - Library: My Computer > FF7DISC1 > FFVII_STEAM > mods > 7thHeaven
Hit Save and you should be good to go2
