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
	 **- Make sure you have run it at least once and gotten to the new game screen!**
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

On the Bottles home page, hit the hamburger menu in the top right > Preferences > Runner
Components

Make sure you install the following Runners:
 - Vaniglia-6.23
 - Vaniglia-7.18
 
Now install the following DLL Components:
- DXVK: dxvk-1.9.4
- VKd3d: vkd3d-proton-2.5
- ~~dxvk-nvapi-v0.5.2 **(not sure if needed)**~~

### Making the custom bottle
Now we need to make our own custom bottle where we can host the game with all our mods.
To do this start by hitting the "+" button in the top left to make a new Bottle

Name it whatever you want but I like "FF7SeventhHeaven"

 - Select custom in the environment type.
 - Runner:  soda-7.0.4
 - Recipe: Custom Recipe
	 - Point it at your custom recipe file we downloaded earlier ([ff7heavensd.yml](https://github.com/auntiepickle/ff7seventhheavensteamdeck/blob/main/ff7heavensd.yml))

(This will take a bit to configure so go get a cup of coffee, browse reddit, take a bio break, w/e...)

Once it is done, go into the preferences tab of the newly created bottle and make sure the following options are set under System > Runner Components
- DXVK Version: dxvk-1.9.4
- XKD3D Version: vkd3d-proton-2.5

~~Next, under the Graphics heading, turn off the setting for "Improve Direct3D 9/10/11 Compatibility".~~
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
When 7th Heaven launces the first time, I always get a black screen. To fix this, 
- toggle the "Improve Direct 3D 9/10/11" setting
- reboot the launcher

The next step of the installer will ask you about where FF7 is located. 

 - FF7 Exe: My Computer > FF7DISC1 > FFVII_STEAM > ff7_en.exe
	 - *This will throw an error and make a file called ff7.exe for you and point to that which is correct*
 - Movies: My Computer > FF7DISC1 > FFVII_STEAM > data > movies
 - Textures: My Computer > FF7DISC1 > FFVII_STEAM > mods > textures
 - Library: My Computer > FF7DISC1 > FFVII_STEAM > mods > 7thHeaven
 - 
Hit **Save** and then disable auto mount
 - settings > launcher > disable auto mount
 Next we want to hit the **Play** button. At this point the game should config a bunch of things, attempt to launch and crash, this is expected.

Quit the game by hitting the stop button in Bottles or close in the dialog

Now to test out some mods...

### Installing mods
Change the launcher to Vaniglia-7.18
launch 7th Heaven and nothing should happen as it will silently crash (this was the only way I could get the runner we need to work working, odd workaround I know...)

After doing this, change the runner to be  "Vaniglia-6.23" runner 

Ensure "Improve Direct3D 9/10/11 Compatibility" is enabled

Reboot bottles
Now you can launch 7th Heaven

At this point you should see the screen be black which is expected, simply hover over where the Play button is (top left hand corner) and launch the game to make sure everything is working before we get mods going

If things aren't working yet, I would suggest re-checking the prior steps and also checking that your directory has valid FFNx files in it, as that was the common cause for issues for me at this point

If everything was OK, you can kill the app and turn off "Improve Direct3D 9/10/11 Compatibility".
You are likely done getting everything situated and can focus on mods now!

Whenever you want to configure your install, you must turn off "Improve Direct3D 9/10/11 Compatibility".

Turn off "Improve Direct3D 9/10/11 Compatibility",
Then..
- reboot 7th Heaven, 
- install your mods
- Quit the app,
- toggle on "Improve Direct3D 9/10/11 Compatibility"
- Restart 7th Heaven and hit Play

### Adding Bottles to steam
The last step in our journey is to add bottles to our known steam apps. This way you can run FF7 from Gaming mode.

...Steps to add Steam app Bottles...
Some tips: Once everything is up and running, just remember that you need to enable/re-enable "Improve Direct3D 9/10/11 Compatibility" when you want to change configs in 7th Heaven.

## Looking for help
I have heard rumor that you can get Bottles to load custom bottle configs from Steam but I have failed at any attempts to do so. If someone finds a way to launch the custom FF7 Bottle that's the last thing I would consider we need to make this setup complete for now. 

I always would love any optimizations you figure out after following my guide. I don't claim for this to be perfect but I was able to consistently get 7th Heaven running from scratch by following the instructions in this guide.

Overall, I would say this process is really finicky but once I got everything up and running I didn't have anymore issues. I am hopeful with time many bug fixes can be applied in this space to make things a bit more smooth.


## Common Issues
If you run into issues along the way I noticed a few things go wrong if I didn't follow the steps to a T, here are some things I found helpful to get things up and running
- Missing DotNet installs. I attempted to do this with Vaniglia as the default runner from the get go but for some reason Bottles does not play nicely with dependencies when not using soda. If you notice there is no Microsoft.Net folder in C:/windows, you likely need to restart the bottle config and make sure you have the right runner selected if you cannot get a clean boot of 7th heaven
- FF7 Crashing before mods are installed. It seems there is something going on with the ffnx files and the updater. You'll notice some errors and in general if I couldnt get a clean run of FF7 it was due to ffnx missing its components. You can check this within 7th Heaven hit the Settings > > Game Driver and it should throw an error if it doesn't have FFNx files. To generate these the app needs to start up FF7 at least once which is what we are doing with all the runner configging at the start.
-  
