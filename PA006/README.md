
## Usage

### Testing the fortran code
1. Clean, build, and run 
2. (needs a file matrix.txt containing 12 reals separated by spaces)
```bash
make test
```

3. build 
```bash
make
```

4. Clean binaries
```
make clean
```

### Executing The python notebook
1. Install requirements
2. It's recommended to use a virtualenv
3. `pip install -r requirements.txt`
4. Now you can open the notebook in software that supports it. 
5. You can run jupyter like this
   1. `jupyter notebook`
   2. alternatively you can use the full lab
      1. `jupyter-lab`
6. now select `compiled_vs_interpreted.ipynb` in the browser
7. Just click "run all" its usually a double play sign.
8. The notebook also builds and executes the fortran code