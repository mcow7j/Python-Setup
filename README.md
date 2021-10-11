

# Python-Setup
Sometimes you might want to have your own local version of Python so you can use packages not installed on the Jupyterhub.
Miniconda provides a reliable and easy way to install and manage python on your computer.
To install packages you can’t be connected to the VPN or the CACI network as security measure stop you connecting to the online library’s which store the packages.  

#### Step 1  
You can install MiniConda from <a href="https://docs.conda.io/en/latest/miniconda.html" target="_blank">here</a> using the appropriate link (generally you will want 64-bit latest version for windows however some people have been having issues with Python 3.9).
#### Step 2 
- Download from this link here or Copy the text at bottom of this readme and save as a .bat script to a place locally on your computer.
- Right-click on it and edit with an editor e.g notepad
- Edit the file path on line 24 so it points at the folder of MiniConda stored on your computer e.g for me it is C:\Users\mcowley\Miniconda3.
- (optional) You can edit the name of the environment you create on lines 49 and 56. By default it is called ds_test.
- Save the file
- Disconnect from vpn/CACI network.
- Now run the file. To do this double left click on the copied file in file explorer. Make sure you are not connected to the VPN or CACI network this will block you downloading any packages.  
#### Step 3 (optional)
- Open the Anaconda prompt (miniconda) from the start menu.
- Activate the enviroment you going to use (e.g use ‘activate ds_test’ command in prompt)
- Use "conda install" to install any bespoke packages you are looking to use. You might need to change channel if the package is not mainstream or in development (you use -c to do this). Generally, if you google "conda install packagex" it will give you the correct command.
- Deactivate the enviroment you using (e.g use ‘deactivate ds_test’ command in prompt)
#### Step 4
- Open the Anaconda prompt (miniconda) from the start menu.
- Activate the enviroment you going to use (e.g use ‘activate ds_test’ command in prompt)
- Open a jupyter notebook and off you go! (use ‘jupyter notebook’ command in prompt and check/select the appropriate kernel e.g. ds_test)

#### A quick word on Environments (more info [here](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands))

Miniconda allows you to set up new environments (which is useful if you are doing projects which require different packages).  It sets up a new environments by copying the base environment (so will have all the packages installed in base environment).
By default you are using your base environment in the prompt. Once you have activated the enviroment (see useful prompt commans), you can install any packages you want to it or open a jupyter notebook!

#### Useful Anaconda prompt commands
- conda -V (prints what version of python you are using)
- conda env list (see what environments are set up)
- activate myenv (lets you use your environment)
- deactivate myenv (go back to base enviroment)
- conda create -n myenv python=3.9 (creates new enviroment with python 3.9)   
- jupyter notebook (open local jupyter notebook provided you installed jupyter packages)
- jupyterlab (open local jupyterlab provided you installed jupyter packages)
- ipython (opens ipython session which is like python terminal)

::---------------------------------------------------------
::-------- setup_selco_python_env 					-------
::---------------------------------------------------------
:: Batch file to setup a conda Python environment 
:: for Selco ofrecasting in 2021
::---------------------------------------------------------
:: History:
:: V0.2 2021-10-08 MC: Altered to install all standard packages.
:: V0.1 2021-10-07 JT: Currently fails to install numpy
::---------------------------------------------------------
@echo off


:: Conda cheat sheets:
:: https://kapeli.com/cheat_sheets/Conda.docset/Contents/Resources/Documents/index
::https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf

::-------------------------------------------------
::-------- First download miniconda from here :
:: https://docs.conda.io/en/latest/miniconda.html
::-------------------------------------------------

::-------- First find conda --------
set conda_location=C:\Users\mcowley\Miniconda3

call %conda_location%\Scripts\activate.bat 
::%root%
echo.
echo -------- CONDA INFO --------
echo.
call conda info
echo.


:: Remove an environment
:: conda remove --name ds_test --all
:: NB: Refer to conda paths as \this_folder rather than C:\this_folder
:: conda list to list all packages in the active environment

echo -------- CONDA ENVIRONMENTS --------
echo.
call conda info --envs
echo.
pause
::-------- Create a new conda environment using Python 3.7, then activate it --------
echo -------- CREATING ENV --------
:: Will remove any pre-existing environment if needed
echo Creating the new environment, including Python...
call conda create --name ds_test -y python=3.8
::=3.7.12
::=3.10.0
echo Environment created.
::python -y
::python
::python=3.8.5.final.0;
call conda activate ds_test
echo New environment activated
echo -------- CONDA ENVIRONMENTS --------
echo.
call conda info -e
echo.

pause
echo Installing numpy...
call conda install -y numpy
echo should have installed numpy (check messages above to check)
echo To install more packages press any key
pause

echo installing pandas... 
call conda install -y pandas

echo installing scikit-learn... 
call conda install -y scikit-learn

echo installing seaborn... 
call conda install -y seaborn

echo installing ipykernel... 
conda install -y -c anaconda ipykernel

echo installing scipy... 
call conda install -y -c anaconda scipy

echo installing jupyter notebook... 
call conda install -y -c conda-forge notebook

echo installing jupyterlab... 
call conda install -y -c conda-forge jupyterlab

echo installing matplotlib... 
call conda install -y -c conda-forge matplotlib

echo installing plotly...
call conda install -y -c plotly plotly

echo installing openpyxl... 
call conda install -y -c anaconda openpyxl

echo installing xlsxwriter... 
call conda install -y -c conda-forge xlsxwriter

echo setup complete

if 1==0 (


	::-------- Install various packages --------
	:: -y to assume Yes when asked for confirmation
:: seaborn automatically loads pandas, python, scipy, numpy
	conda install -y seaborn
	conda install -y numpy
	conda install -y pandas 
	conda install -y scikit-learn
	:: -c to search the following channel for the package
	conda install -y -c anaconda scipy; 
	conda install -y -c anaconda openpyxl;
	conda install -y -c conda-forge jupyterlab; 
	conda install -y -c conda-forge matplotlib
	conda install -y -c conda-forge xlsxwriter;
conda install -y -c plotly plotly;
	

)
echo <<<END>>>
pause
