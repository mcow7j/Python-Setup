

# Python-Setup

Sometimes you might want to have your own local version of Python so you can use packages not installed on the Jupyterhub.
Miniconda provides a reliable and easy way to install and manage python on your computer.
To install packages you can’t be connected to highly secure networks as security measures stop you connecting to the online library’s which store the packages.  

#### Step 1  
You can install MiniConda from <a href="https://docs.conda.io/en/latest/miniconda.html" target="_blank">here</a> using the appropriate link (generally you will want 64-bit latest version for windows however some people have been having issues with Python 3.9).
#### Step 2 
- Download the batch script stored in <a href="https://github.com/mcow7j/Python-Setup/blob/main/setup_python_env%20v0.4.bat" target="_blank">here</a> to a place locally on your computer. (click this link, click raw, right click save as, and save as .bat file) 
- Now run the file. To do this double left click on the copied file in file explorer.
- Enter all the things it asks you for. You might have to do some exploring in file explorer to find where your Miniconda is stored on your computer e.g for me it is C:\Users\mcowley\Miniconda3.
#### Step 3 (optional)
- Open the Anaconda prompt (miniconda) from the start menu.
- Activate the enviroment you going to use (e.g use ‘activate ds_test’ command in prompt)
- Use "conda install" to install any bespoke packages you are looking to use. You might need to change channel if the package is not mainstream or in development (you use -c to do this). Generally, if you google "conda install packagex" it will give you the correct command.
- Deactivate the enviroment you using (e.g use ‘conda deactivate’ command in prompt)
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
- conda deactivate (go back to base enviroment)
- conda create -n myenv python=3.9 (creates new enviroment with python 3.9)   
- jupyter notebook (open local jupyter notebook provided you installed jupyter packages)
- ipython (opens ipython session which is like python terminal)

#### Next steps (using VS code as your Python editor)

Essentially you need to:
 
- Download vs code
- Install python extension
- Install jupyter extension
- Point it at your new enviroments kernel (top right)

See this <a href="https://blog.openthreatresearch.com/first_jupyter_notebook_vscode" target="_blank">link</a> for further details. 
