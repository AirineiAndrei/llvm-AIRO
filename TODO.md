# Plan and Ideas (also tracking)

## Main
- [x] Build llvm, custom clang to force unroll on some hardcoded value 
- [x] Link my lib in llvm and call a function that determined unroll parameter
- [ ] Basic IPC to Python decision maker, pipe
- [ ] Serialize Loop information (json) and send to python, receive const value as unroll loop
- [ ] Fetch some code and use the compiler to build (one by one for now)
- [ ] Give data to model and setup RL
- [ ] Tune model

## Possible Optimizations

- [ ] Advanced IPC, maybe over sockets?
- [ ] Compile multiple files at the same time, decision maker should be aware of sessions and handle them accordingly
- [ ] Unlikely that gpu is needed, I don't think cloud is a feasible improvement

## Future stuff

- [ ] Handle more heuristics
- [ ] Model Improvements
