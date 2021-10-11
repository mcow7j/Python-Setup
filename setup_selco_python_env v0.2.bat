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

echo installing statsmodels...
call conda install -y -c conda-forge statsmodels

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

echo <<<END>>>
pause
