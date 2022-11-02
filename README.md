# Friday Night Funkin' - Psych Engine WAVENAMI Ver.
A Version of an Engine that was originally used on [Mind Games Mod](https://gamebanana.com/mods/301107), but now it has more improvements that includes more features or fixes!

## Installation Guide From Psych Engine:
You must have [the most up-to-date version of Haxe](https://haxe.org/download/), seriously, stop using 4.1.5, it misses some stuff.

Follow a [Friday Night Funkin' Source Code Compilation Tutorial](https://github.com/ninjamuffin99/Funkin#build-instructions), after this you will need to install LuaJIT.

To install LuaJIT do this: `haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit` on a Command prompt/PowerShell

...Or if you don't want your mod to be able to run .lua scripts, delete the "LUA_ALLOWED" line on Project.xml

If you get an error about StatePointer when using Lua, run `haxelib remove linc_luajit` into Command Prompt/PowerShell, then re-install linc_luajit.

If you want video support on your mod, simply do `haxelib install hxCodec` on a Command prompt/PowerShell

otherwise, you can delete the "VIDEOS_ALLOWED" Line on Project.xml.