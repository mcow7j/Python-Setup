::---------------------------------------------------------
::-------- setup_selco_python_env 					-------
::---------------------------------------------------------
:: Batch file to setup a conda Python environment
:: for Selco ofrecasting in 2021
::---------------------------------------------------------
:: History:
:: V0.5 2021-10-13 MC: added more package bundles
:: V0.4 2021-10-11 MC: Asks user to input variables
:: V0.3 2021-10-11 MC: Altered to make editing easier and install different ENVIRONMENTS.
:: V0.2 2021-10-08 MC: Altered to install all standard packages.
:: V0.1 2021-10-07 JT: Currently fails to install numpy
::---------------------------------------------------------
@echo off

::-------------------------------------------------
::--------- variables to edit -------------------
::-------------------------------------------------

:: set path of conda on your pc
::set conda_location=C:\Users\mcowley\Miniconda3
echo.
echo ----- set miniconda path  -----
echo enter the path of miniconda for your machine e.g mine is C:\Users\mcowley\Miniconda3
echo you might need to use file explorer to do this
echo.
set /p conda_location="Enter conda_location and press Enter: "


:: python version you want to install
:: set python_version=3.8
echo.
echo ----- set python_version  -----
echo.
echo enter the version of python you would like to install (I recommend 3.8)
echo.
set /p python_version="Enter python_version and press Enter: "


:: name of the enviroment you want to create
:: set env_name=ds_1
echo.
echo ----- set env_name  -----
echo.
echo enter the name for enviroment you are about to create below e.g ds_1
echo.
set /p env_name="Enter Enviroment name and press Enter: "


:: which set of packages you want to install (choose from default, forecasting,
:: image_labs, ds_hardcore, sql_test, nltk_lab)
:: set packages_bundle=default

echo.
echo ----- set packages_bundle -----
echo.
echo enter which set of packages you want to install.
echo.
echo current options are: default, forecasting,image_labs, ds_hardcore,sql_test, nltk_lab
echo.
echo (if in doubt use default)
echo.
set /p packages_bundle="Enter Packages Bundle and press Enter: "
echo ----- set env_name  -----

:: set packages_for_interacting_with_ms_office=y

echo.
echo ----- set packages_for_interacting_with_ms_office -----
echo.
echo Would you like you install packages for interacting with excel and powerpoint?
echo.
echo options are [y, n] would recommend n.
echo.
set /p packages_for_interacting_with_ms_office="Enter y or n and press Enter: "

echo.

echo ----------------------------------------------------
echo ------ You have chosen the following options: ------
echo ----------------------------------------------------
echo.
echo conda_location: "%conda_location%"
echo python_version: "%python_version%"
echo env_name: "%env_name%"
echo packages_bundle: "%packages_bundle%"
echo packages_for_interacting_with_ms_office: "%packages_for_interacting_with_ms_office%"
pause




::-------------------------------------------------
::--------- end of variables to edit ------------
::-------------------------------------------------



:: Conda cheat sheets:
:: https://kapeli.com/cheat_sheets/Conda.docset/Contents/Resources/Documents/index
::https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf

::-------------------------------------------------
::-------- First download miniconda from here :
:: https://docs.conda.io/en/latest/miniconda.html
::-------------------------------------------------

::-------- First find conda --------

call %conda_location%\Scripts\activate.bat

echo.
echo -------- CURRENT CONDA INFO --------
echo.
call conda info
echo.


:: Remove an environment
:: conda remove --name ds_test --all
:: NB: Refer to conda paths as \this_folder rather than C:\this_folder
:: conda list to list all packages in the active environment

echo -------- CURRENT CONDA ENVIRONMENTS --------
echo.
call conda info --envs
echo.
pause
::-------- Create a new conda environment, then activate it --------
echo -------- CURRENT CREATING ENV --------
:: Will remove any pre-existing environment if needed
echo Creating the new environment, including Python...
call conda create --name %env_name% -y python=%python_version%
echo Environment created.


call conda activate %env_name%
echo New environment activated
echo -------- CURRENT CONDA ENVIRONMENTS --------
echo.
call conda info -e
echo.

pause
echo will now install a package to test everything is working
echo Installing numpy...
call conda install -y numpy
echo should have installed numpy (check messages above to check)
echo To install all base packages press any button.
echo The first time you do this can take a while (15minsish)
pause

echo installing pandas...
call conda install -y pandas

echo installing scikit-learn...
call conda install -y scikit-learn

echo installing seaborn...
call conda install -y seaborn

echo installing scipy...
call conda install -y -c conda-forge scipy

echo installing ipykernel...
call conda install -y -c conda-forge ipykernel

echo installing statsmodels...
call conda install -y -c conda-forge statsmodels

echo installing jupyter notebook...
call conda install -y -c conda-forge notebook

echo installing matplotlib...
call conda install -y -c conda-forge matplotlib

echo installing plotly...
call conda install -y -c plotly plotly

echo installing pyreadstat (used for reading sas files)...
call conda install -y -c conda-forge pyreadstat

echo installing pyarrow (used for feather format)...
call conda install -y -c conda-forge pyarrow

echo --- finished installing all base packages check for errors ---
pause

if %packages_bundle%==default (
echo.
echo all default packages installed
)

if %packages_for_interacting_with_ms_office%==y (

echo press any button to install packages to interact with excel and powerpoint
pause

echo installing python-pptx
call conda install -y -c conda-forge python-pptx

echo installing openpyxl...
call conda install -y -c conda-forge openpyxl

echo installing xlsxwriter...
call conda install -y -c conda-forge xlsxwriter

echo finished installing ms office packages
)

if  %packages_bundle%==forecasting (

echo press any button to install packages for forecasting
pause

echo installing sktime...
call conda install -y -c conda-forge sktime

echo installing pmdarima...
call conda install -y -c conda-forge pmdarima

echo installing pystan...
call conda install -y -c conda-forge pystan

echo installing fbprohpet...
call conda install -y -c conda-forge fbprophet


echo finished installing forecasting packages
echo check above for installation errors especially fbprophet

)

if  %packages_bundle%==image_labs (
echo press any button to install packages for image_labs
echo ***WARNING these will take a while go get some tea***
pause

echo installing scikit-image...
call conda install -y -c conda-forge scikit-image

echo installing geopandas...
call conda install -y geopandas

echo installing gdal...
call conda install -y -c conda-forge gdal

echo installing rasterio...
call conda install -y -c conda-forge rasterio

echo installing  pytorch...
call conda install pytorch torchvision torchaudio cudatoolkit=10.2 -y -c pytorch

echo installing  ipyleaflet...
call conda install -y -c conda-forge ipyleaflet

echo installing  tqdm...
call conda install -y -c conda-forge tqdm

echo finished installing image_labs packages
)

if  %packages_bundle%==ds_hardcore (
echo press any button to install packages for hardcore data science
echo ***WARNING these will take a while go get some tea***
pause

echo installing  networkx...
call conda install -y -c conda-forge networkx

echo installing geopandas...
call conda install -y geopandas

echo installing SHAP package for random forest analysis...
call conda install -y -c conda-forge shap

echo installing  pytorch...
call conda install pytorch torchvision torchaudio cudatoolkit=10.2 -y -c pytorch

echo finished installing ds_hardcore packages
)

if %packages_bundle%==sql_test (

echo press any button to install sql_test specific packages
pause

echo installing  psycopg2...
call conda install -y -c conda-forge psycopg2


echo.
echo all sql packages installed
)

if %packages_bundle%==nltk_lab (

echo press any button to install nltk_lab specific packages
pause

echo installing downgraded version of scipy...
call conda install -y -c conda-forge scipy=1.6.1

echo installing nltk...
call conda install -y -c conda-forge nltk

echo.
echo all nltk packages installed
)


echo session complete. "%env_name%" enviroment setup. press any button to shut prompt.
pause
echo <<<END>>>
