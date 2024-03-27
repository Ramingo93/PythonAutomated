# Python Setup and package manager 

Very simple Python batch files to automate the setup of virtual environment, extracting the requirements file, prepare a main temaplate code, ...

## Managing files

<details><summary>1 - projPythonTemplateSetup.bat</summary>
running this file will create a "main.py" file using the "template.py" example, if the main.py file is not already in the folder
</details>

<details><summary>2 - vEnvPythonSetup.bat</summary>
running this file will create a virtual environment where all the packages have to be installed.
  To access this virtual environment, open the command prompt and type
  
  ```
  .venv\Scripts\activate
  ```

Then, having (.vEnv) activated, install the package you need, one by one

  ```
  pip install packageX
  ```

Otherwise, if you have a requirements.txt file you can use the dedicated script
</details>

<details><summary>3 - vEnvPythonRequirementsFreeze.bat</summary>
running this file will create a "requirements.txt" file with the collection of all versioning of libraries.

  This, only if a virtual environment is available
</details>

<details><summary>4 - vEnvPythonRequiremetsInstall.bat</summary>
running this file will install all the libraries reported in the reference file.

  This, only if a requirements.txt file and the virtual environment are available
</details>

<details><summary>4 - RunPythonMain.bat</summary>
running this file will run the main.py file. 

  This, only if a main.py file is available
</details>