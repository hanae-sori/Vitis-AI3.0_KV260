# Vitis-AI_kv260
<table class="sphinxhide">
 <tr>
   <td align="center"><img src="https://raw.githubusercontent.com/Xilinx/Image-Collateral/main/xilinx-logo.png" width="30%"/><h1>Vitis AI</h1><h0>Adaptable & Real-Time AI Inference Acceleration</h0>
   </td>
 </tr>
</table>

![Release Version](https://img.shields.io/github/v/release/Xilinx/Vitis-AI)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)



## CUDA GPU Host Initial Preparation
If you are leveraging a Vitis AI Docker Image with CUDA-capable GPU acceleration, you must install the NVIDIA Container Toolkit, which enables GPU support inside the Docker container.

For Ubuntu distributions, NVIDIA driver and Container Toolkit installation can generally be accomplished as in the following example (use sudo for non-root users):
```
apt purge nvidia* libnvidia*
apt install nvidia-driver-xxx
apt install nvidia-container-toolkit
```
A simple test to confirm driver installation is to execute `nvidia-smi`. This command can be used as an initial test outside of the Docker environment, and also can be used as a simple test inside of a Docker container following the installation of Docker and the Nvidia Container Toolkit.
```
Mon Oct 14 00:54:24 2024
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.183.01             Driver Version: 565.90       CUDA Version: 12.7     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce RTX 3080        On  | 00000000:09:00.0  On |                  N/A |
|  0%   51C    P8              41W / 370W |   2314MiB / 12288MiB |     30%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+

+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A       559      G   /Xwayland                                 N/A      |
+---------------------------------------------------------------------------------------+
```



## Install Vitis-AI
The first step is to clone and follow the install steps for Vitis AI on the host machine.
```
git clone https://github.com/Xilinx/Vitis-AI
cd Vitis-AI
```
[Ubuntu Desktop LTS](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Ubuntu-Desktop-LTS)




## System Update

You can view the GUI (Ubuntu Desktop) on a monitor connected through the HDMI port on the FPGA board. However, for better convenience and control, I recommend using a Serial Terminal or connecting to the system via SSH for accessing and interacting with the environment. These methods tend to be more reliable, especially for remote management or troubleshooting purposes.

### Terminal
>![MobaXterm logo](./xterm_logo.png)
>
>[MobaXterm](https://mobaxterm.mobatek.net/)
>Enhanced terminal for Windows with X11 server, tabbed SSH client, network tools and much more(UART)

>* Serial(UART) Communication
>
>Speed (Baudrate): 115,200
>
>Data Bits: 8
> 
>Stop Bits: 1
> 
>Parity: None
> 
>Flow Control: None

* Username: **ubuntu**
* Password: **ubuntu**

```
sudo apt install net-tools
```

>* SSH
>  
>Use the Ubuntu username and password, and for the Remote host (IP address), find it using the `ifconfig` command in the terminal (either through the GUI or Serial Terminal) on the KV260. Make sure to set the port to 22.
>
>*To transfer files in `/root/jupyter_notebook/` using MobaXterm, you will need root SSH access permissions*
>
>```
>sudo passwd root # make root password
>sudo vim /etc/ssh/sshd_config
>```
> * PermitRootLogin yes
>   
> * PasswordAuthentication yes
>   
> * ChallengeResponseAuthentication no
>
>```
>service sshd reload
>```

```
sudo dpkg-reconfigure -plow unattended-upgrades
```
--`NO`
```
sudo apt-get install git
sudo apt update
sudo apt -f install
sudo apt full-upgrade
sudo snap install xlnx-config --classic --channel=2.x
sudo xlnx-config.sysinit
```

### ** !Do not upgrade the Ubuntu version! **

![ubuntu upgrade](./ubuntu_upgrade.png)

### --keep the local version currently installed



## Install PYNQ

```
git clone https://github.com/Xilinx/Kria-PYNQ.git
cd Kria-PYNQ
sudo bash install.sh -b KV260
sudo apt autoremove
sudo reboot
```
```
sudo /usr/local/share/pynq-venv/bin/python3 -m pip install --upgrade pip
sudo /usr/local/share/pynq-venv/bin/python3 -m pip install torch torchvision pillow opencv-python
sudo /usr/local/share/pynq-venv/bin/python3 -m pip install --upgrade jupyter
```



## Test PYNQ
```
sudo ./selftest.sh #/path-Kria-PYNQ/ sudo ./home/ubuntu/Kria-PYNQ/selftest.sh
```



## Open Jupyter notebooks

Open Chrome on a PC that is on the **Local Area Network** as the Kria and type this in the address bar:`kria:9090/lab`

* Password: **xilinx**



## OpenCV Face Detection Webcam.ipynb
`/kv260/video/OpenCV Face Detection Webcam.ipynb`



## OpenCV Face Detection Webcam.ipynb
`/pynq-dpu/dpu_mnist_classifier.ipynb`
> ----> 1 raw_data = mnist.test_images()
> 
> HTTPError: HTTP Error 403: Forbidden

There are some issues downloading the MNIST dataset due to server problems. Please use the ipynb project that have uploaded.


* * *
## Reference

[Getting Started with Kria KV260 Vision AI Starter Kit (Ubuntu 22.04)](https://www.amd.com/en/products/system-on-modules/kria/k26/kv260-vision-starter-kit/getting-started-ubuntu/getting-started.html)

[Vitis AI](https://xilinx.github.io/Vitis-AI/3.5/html/index.html)

[Vitis AI github](https://github.com/Xilinx/Vitis-AI)

[PYNQ](https://github.com/Xilinx/PYNQ/)

* * *
* * *
