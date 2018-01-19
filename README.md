Cython presentation for TeachTeachesTech @ MobPro 2017-01-19

Create a virtual env with Python 3
* cd into the repo
* run: mkvirtualenv cython_prezo --python=python3.6 -a .

Install cython and jupyter
* run: pip install -r requirements.txt

Fire up the notebook
* run: jupyter notebook TechTeachesTechCythonPres.ipynb

If you want to mess around in the terminal, you can compile and annotate .pyx
files by cd-ing into the directory where they live and running:
cythonize -a -i filename.pyx

NB: You also need a C-compiler, if you are on mac, you probably have clang.
Linux users will have gcc instaled by default.
