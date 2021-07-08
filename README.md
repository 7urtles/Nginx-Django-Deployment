# Nginx-Django-Deployment
Script to build/configure an Ngninx server and deploy your Django project to an Ubuntu 20.4 LTS install

Using another operating system or Linux build will require modifying the install script!
----------------------------------------------------------------------------------------

   ***WARNING! This script will overwrite any existing virtual environment named 'venv' if one already exists!!!***

   ***Before using make sure to activate your existing virtual environment and 'pip freeze > requirments.txt'***
   
   ***The Django project you'd like to deploy must be in your home/username directory!!***

Ideally you've set up your project from the repository here:
https://github.com/chparmley/Auto-Django

   An assumed file structure for the install is as such:
   - container_folder
     - project_folder
     - virtual_environment

If you used the Auto-Django setup script it will be:  
- Auto-Django
  - 'Whatever_you_named_your_project'  
  - README.md  
  - venv  

 1. Open a terminal inside the Auto-Django folder 
 2. `git clone https://github.com/chparmley/Nginx-Django-Deployment.git`
 3. `cd Nginx-Django-Deployment`
 4. `chmod +x ./install.sh`
 5. `./install.sh`
 
 6. When asked for your project name use the same name as you did for Auto-Django.  
    - EXAMPLE: if your structure is 'project/venv' then 'project' is your project name.  
    
 *If you need to re-install from requirements.txt now is the time to do that*  

 7. Enter your public ip( EXAMPLE: 54.25.36.254 ), or your domain name ( EXAMPLE: your_domain.com )

 8. Enter your domain or ip in your web browser.

