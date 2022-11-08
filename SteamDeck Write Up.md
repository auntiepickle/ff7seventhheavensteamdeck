![Seventh Heaven Logo](https://i.imgur.com/Dbx8dcd.png)
![Steam Deck Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Steam_Deck_logo_%28pink_orb%29.svg/1200px-Steam_Deck_logo_%28pink_orb%29.svg.png)
 
 # Final Fantasy Seven: Seventh Heaven (Steam Deck Install Guide)
 This guide serves as a walkthrough on how you can get the [Seventh Heaven mod](https://7thheaven.rocks/) for Final Fantasy 7 up and running on the [Steam Deck](https://store.steampowered.com/steamdeck). 
 
 *Everything provided here is as is.*
 ## Requirements
 This guide assumes that you have the Steam version of Final Fantasy 7. It might work for other versions but I am going to assume you have downloaded it through the Steam Store
 
Go ahead and make sure you have downloaded/installed the following resources as we will need them later:
 - A valid copy of Final Fantasy 7
	 - [Installed from the Steam store](https://store.steampowered.com/app/39140/FINAL_FANTASY_VII/)
 - [Bottles](https://usebottles.com/)
	 - Discover store > Bottles
 - [Seventh Heaven mod](https://github.com/tsunamods-codes/7th-Heaven)
	 - Seventh Heaven GitHub > [Latest Release](https://github.com/tsunamods-codes/7th-Heaven/releases/latest)
## Walkthrough
With all the prior components installed lets begin by getting Bottles set up.
### Getting the right Runners and DLL Components
There are a bunch of [known issues with the latest versions of proton and Seventh Heaven](https://github.com/tsunamods-codes/7th-Heaven/issues/19), hopefully this gets fixed in the future but because there are a host of issues we need very specific runners to get this working.

On the Bottles home page, hit the hamburger menu in the top right > Preferences > Runners

Make sure you install the following Runner:

 - Vaniglia-6.23

Now hit DLL Components and install the following DLL Components:
- dxvk-1.9.4
- vkd3d-proton-2.5
- dxvk-nvapi-v0.5.2 **(not sure if needed)**

### Making the custom bottle
Now we need to make our own custom bottle where we can host the game with all our mods.
To do this start by hitting the "+" button in the top left to make a new Bottle

Name it whatever you want but I like "FF7 Seventh Heaven"

 - Select custom in the environment type.
 - Runner we want to be vaniglia-6.2.3
 - Recipe: Custom Recipe
	 - Copy/paste these contents and props to [sjenkins7](https://github.com/sjenkins7) for creating this
 ````
Arch: win64
Creation_Date: '2022-03-05 12:15:48.176125'
Custom_Path: false
DLL_Overrides: {}
DXVK: dxvk-1.9.4
Environment: Gaming
Environment_Variables: {}
Installed_Dependencies:
- dotnet40
- dotnet48
- d3dx9
- msls31
- riched20
- allfonts
- d3dcompiler_43
- d3dcompiler_47
- vcredist2019
Latest_Executables: []
NVAPI: dxvk-nvapi-v0.5.2
Name: 7th Heaven
Parameters:
    aco_compiler: false
    custom_dpi: 96
    discrete_gpu: true
    dxvk: true
    dxvk_hud: false
    dxvk_nvapi: false
    fixme_logs: false
    fsr: false
    fsr_level: 5
    fullscreen_capture: false
    gamemode: false
    gamescope: false
    gamescope_borderless: false
    gamescope_fps: 0
    gamescope_fps_no_focus: 0
    gamescope_fullscreen: true
    gamescope_game_height: 0
    gamescope_game_width: 0
    gamescope_scaling: false
    gamescope_window_height: 0
    gamescope_window_width: 0
    pulseaudio_latency: true
    sync: esync
    take_focus: false
    use_runtime: true
    virtual_desktop: false
    virtual_desktop_res: 1280x720
    vkd3d: false
Path: 7th-Heaven
Runner: vaniglia-6.23
State: 9
Uninstallers:
    allfonts: false
    d3dcompiler_43: false
    d3dcompiler_47: false
    d3dx9: false
    dotnet40: Microsoft .NET Framework 4 Extended
    dotnet48: true
    msls31: false
    riched20: false
    vcredist2019: true
Update_Date: '2022-03-05 13:18:20.710904'
VKD3D: vkd3d-proton-2.5
Versioning: true
Windows: win10
WorkingDir: ''
````

