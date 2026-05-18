# Bardware

## What?
Bardware is an extremely lightweight audio patching kit for the Godot game engine by Jesse Gonyou

> **Important Note**: Bardware is not meant to be used in a finished product, since it is a tool to make the composing
process easier. Including Bardware in a finished product only creates extra unnecessary files on the user's computer and
can sometimes add audio artifacts.

## Why?
Working with a composer can be hard. Nobody wants to wait for the developer to implement a piece of audio into a build
and ship it back before an in-game track can be tested, which is why many developers use professional-grade middleware
such as fmod. Most games don't need the power that professional middleware gives them, and don't need the headache that
commercial license compliance entails.

Bardware isn't middleware, it's an audio patching kit. It simply places game audio in a place that a composer can easily
get to, and plays the audio from there. Then, when a composer modifies the copied files, the game will play audio from them instead.

## How...
### ... do I use this in my Godot project?
Bardware is extremely easy to get started with, requiring only 4 simple steps to get started.

1. Copy the addons directory from this repository into your project
2. Enable the `Bardware` plugin in Project Settings
3. Move your audio files into the `res://sound` directory
4. Replace your `AudioStreamPlayer`s, `AudioStreamPlayer2D`s, and `AudioStreamPlayer3D`s with their `BardioStreamPlayer` counterparts
5. Profit!

### ... do I patch in compositions?
Whenever the game is run for the first time, it will copy all of its' audio files into the `user://patchbard` directory.
This is usually one of the following:

- `C:\\Users\\<your username>\\AppData\\Roaming\\Godot\\app_userdata\\<game name>\\patchbard` on Windows,
- `/home/<your username>/.local/share/godot/app_userdata/<game name>/patchbard` on Linux, or
- `/Users/<your username>/Library/Application Support/Godot/app_userdata/<game name>/patchbard` on MacOS.

All you need to do is replace the files in that directory with your own audio, and the game will automatically play them
the next time you launch the game.

### ... do I reset the patchbard directory?
There are two ways you can easily do this. You can either delete the `user://patchbard` directory and relaunch your game, or run the
following GDScript in your project:

```GDScript
BardwareSoundSync.clear_patchbard()
BardwareSoundSync.sync()
```

### ... do I contribute?
While contributions are welcome, it is highly unlikely that I will respond to them in any timely manner. That said, if
you insist on contributing, there is no required code style or linter, just a request that you only submit high-quality,
readable code.

## Who?
**Jesse Gonyou** created this for a personal game project that he is working on with a composer. He didn't want to have
to deal with licensing commercial middleware software for a relatively simple project, so he built this.
