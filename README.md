# Bash Script execution for remote deployment of web artifacts 💻 
### Execute a bash script on a virtual machine remotely deploying web artifacts on virtual servers.

## Aim 🎯 

- Deploy a static HTML website to multiple virtual machines
- The ```remote_hosts``` file has the list of all the virtual machines where the site would be deployed
- The ```webdeploy.sh``` file uses a for loop which logs into each VM and pushes the ```websetup.sh``` file
- The ```websetup.sh``` file has all the commands to deploy the website on the respective virtual machine

#### This approach can be used to make configurations, update packages, and take backups from hundreds of virtual servers. 

#### Alternatively, another DevOps tool called **ANSIBLE** is also used to make configuration changes

## Required Files 📁 

1. **Vagrantfile** containing the configuration of the vagrant box and other requirements of the VMs
2. **remote_hosts** file for listing the remote VMs
3. **websetup.sh** shell script for the deployment of the artifact
4. **webdeploy.sh** shell script for the execution of **websetup.sh** remotely

#### Explanation of Vagrantfile

The Vagrantfile has the name of the vagrant box which will spin up the VMs

It also has the IP addresses, RAM, and hostname information for each virtual machine

## Execution 👨‍💻

1. Spin up the virtual machines.

   > vagrant up

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/587abc9a-7c9c-4f21-8966-303ce7864ff0)

2. Check the status of the virtual machines.

   > vagrant status

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/a56cdb8c-d343-4524-9855-b9a464280c21)

3. Add IP addresses of remote VMs into the ```/etc/hosts``` file of the "scriptbox" machine.

   This will be used for DNS resolution.

   > vi /etc/hosts
   
   > cat /etc/hosts

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/a3032b55-77bd-406b-b4e7-0934a18312c5)

4. Ping the remote VMs using hostnames to check the connectivity.

   > ping -c 5 web01
   
   > ping -c 5 web02

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/b9906500-f9e6-4dc0-b31f-3112da8ed54c)

5. Add a new user "devops" and a password to the remote VMs for executing the script (do the same for web02).

    > adduser devops
    
    > passwd devops

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/79e95c6c-0ad8-4c54-97e8-5bff36cf8b8d)

6. Generate a public and private key.

   A public and private key would be generated which would be used for authentication. The script will use a key-based login when executing remotely.

    > ssh-key-gen

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/f4d29aaa-9e49-4544-b8f6-177db989ea35)

7. Add the public key to the remote VMs which would be used for authentication (do the same for web02)

    The public key acts as a lock and the private key acts as the key which opens the lock during authentication.

    > ssh-copy-id devops@web01
    
    > ssh-copy-id devops@web01

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/1ecf6ed7-0fbd-46ab-84a1-ccdb6db870eb)

8. Add the helper script for artifact deployment "webdeploy.sh"

    > vi webdeploy.sh
    
    > chmod +x webdeploy.sh

   ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/daf58e76-8049-4401-bb6e-938bf61f4f24)

9. Add the script which has the commands for deployment "websetup.sh"

    > vi websetup.sh
    
    > chmod +x websetup.sh

    ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/4d59f45d-9ef5-4072-b086-c381060c6ce8)
    
10. Execute the helper script on the "scriptbox" machine to start the deployment on remote machines

    > ./webdeploy.sh

    ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/07054ed8-36b5-4734-8d5a-e87995ee7981)

11. Check the output on the corresponding IP addresses of the remote servers

    ![image](https://github.com/Vedant-MAHAjan/Bash-Scripting/assets/88843623/0f7ec1ae-9864-4ac5-af3c-8a69926be19e)



