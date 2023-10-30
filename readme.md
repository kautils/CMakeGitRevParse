### CMakeGitRevParse
* execute "git rev parse" and get result as string.
### example 
```cmake
include(CMakeGitRevParse.cmake) 
CMakeGitRevParse( __hash 
        VALUE HEADs 
        DIR "path to local repogitory on your machine.")
message(${__hash})
```