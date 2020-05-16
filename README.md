# Sdl2AdaGeneratedBindings

This is a library I created for the use of the SDL2 library in the ADA language.
The bindings are thin and were created using information from this [site](https://www.adacore.com/gems/gem-59)

```
g++ -c -fdump-ada-spec -C /usr/include/time.h
```

```g++``` is used to try and make generated files that have better named variables
The ```-C``` includes the headers comments
The file chunk ```/usr/include/time.h``` is the path to the header file that ada bindings will be created from.
The ```-fdump-ada-spec``` will generate bindings for the listed header file and recursively create ada bindings for all headers that are dependencies of the listed header file.

If the recursive ada bindings are not required, instead use ```-fdump-ada-spec-slim```

