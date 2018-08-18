# CMake Project Template

Cross platform cmake project template.
You can build this project on Linux(gcc) or Windows(MSVC)

## Build

### on Linux(gcc)

```
$ ./build.sh debug      # debug build. lib name will be `libcalcd.a`
$ ./build.sh release    # release build. lib name will be `libcalc.a`
```

### on Windows(msvc)

1. In Visual Studio 2017, `File | Open | CMake` and select CMakeLists.txt
2. Select Configuration `x64-Debug` or `x64-Relase`
3. Right click on CMakeLists.txt and generate CMake cache
4. Right click on CMakeLists.txt and `Build | All`

If you already built on Linux (e.g. on WSL), generating cache perhaps failed.

If generating cache failed, please remove dist and retry.

## Directories and Files

* `bin` - output of binaries
* `lib` - output of static libraries
* `dist` - CMake working directory. There is CMakeCache.txt
* `build.sh` - Linux build script
* `CMakeSettings.json` - Visual Studio build setting
* `calc.h`, `calc.cpp` - calc library
* `main.cpp` - binary entry point
* `.vscode` - VSCode debug setting on WSL (correctly speaking, this settings have no relation to this project)
