# SHA-3 calculation

This project includes cpu and gpu (CUDA) high performance SHA3 hash calculation usable with docker.
Project consists of 4 subprojects:
* library - the core of other projects
* sha-3 single hash calculation
* sha-3 batch hashes calculations
* benchmark for single and batch calculations
* test project

## Requirements
All projects require compiler with full C++17 support, CUDA and OpenMP.
Also [CLI11](https://github.com/CLIUtils/CLI11) submodule is used as an auxiliary library.

## Build and run project example
```
./docker-run.sh -b
./docker-run.sh -e --help
./docker-run.sh -e -t 256 -f /data/file.bin
echo -n "toto" | ./docker-run.sh -e -t 256 -
```
## How to test
For building tests, [GTest](https://github.com/google/googletest) framework is required.
In order to check tests, run test executable.
```
./test/sha3_test
```
