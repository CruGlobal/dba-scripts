# cheat_sheet.org.sh
# The contents of this file are released under the GNU General Public License. Feel free to reuse the contents of this work, as long as the resultant works give proper attribution and are made publicly available under the GNU General Public License.
# Best viewed in emacs org-mode.
# Alternately, one can keep this cheat sheet handy by adding the following line to ~/.bashrc:
#
# alias cheatsheet="less ~/path_to_cheat_sheet.org.sh" 


* Reference:
** Basics:
*** Getting help:

# View the manual for target command
man command

# Get help with a target command (probably the same as above, but not always):
command -h

# In case you forget the name of a command, print possible commands relating to any given word:
apropos word

# View index of help pages:
info

*** Command Line Utilities:
**** Basic File and Directory Operations:
# Print current working directory:
pwd

# Show files in current directory:
ls

# Show maximum information about all files, including hidden:
ls -a

# Recurse into subdirectories and list those as well:
ls -R

# List files by modification time, most recent first.
ls -lt

# Move/rename a file or directory (be careful that you don't move the source over a destination with the same name):
mv source destination

# Delete target forever (be very careful), use -r recursive flag for directories:
rm target

# Copy file or directory:
cp source destination

# Mount filesytem:
mount /dev/device_name /media/device_name

# Unmount:
umount /media/device_name

# Forensically clone filesystems and do other low-level operations on files. Be careful with this one. Can be destructive:
dd

# Work with disk partitions:
parted

# Filesystem creation tool:
mkfs

**** System Administration:

# Execute command as an administrator (can be destructive/insecure. Use only for system administration tasks):
sudo command

# Become system administrator:
sudo -s

# Quit system administration:
exit

# Forgot to type sudo in front of a command and already hit enter? Repeat the last command using sudo:
sudo !!

***** Installing software from a .tgz (also known as a tarball):

# First, unzip the tarball (see section on tar, below)
# Next, move into unzipped directory:
cd software_directory

# Always read README first if it is provided, in case there are any modifications to the procedure outlined below:
cat README

# Automatically check for appropriate configurations and generate a MAKE file in the directory:
./configure

# Compile software. May require sudo:
make

# Move files into their appropriate locations. May also require sudo:
make install

# Clean up files in directory, in case make command fails, or just to remove unnecessary cruft:
make clean

***** Ubuntu/Debian Software repositories:

# Check distro repositories for software updates:
sudo apt-get update

# Download and install updates (update first):
sudo apt-get upgrade

# Search for package in the repositories:
apt-cache search keyword

# Get more detail on one specific package:
apt-cache show package_name

# Download and install a package:
sudo apt-get install package_name

# View the output of a command in a more convenient format:
command | less

**** Working With Files:

# Print a file in terminal:
cat file

# Find files matching filename:
locate filename

# See the version of a program or the location of the program
which appname

# Search through filename for matches to phrase:
grep phrase filename

# Search through output of a command for phrase:
command | grep phrase

**** Working With Processes:

# List all running processes:
ps -e

# Standard system monitor showing a more extensive view of all processes and system resources:
top

# Like top, but with a better, cleaner interface:
htop

# Stop a process from using all system resources and lagging computer:
renice process_name

# Kill misbehaving process (use sparingly, last resort, try 'renice' command first):
pkill process name

# Start a process in the background
command &

# Start a process in the background and have it keep running after you log off
nohup command &

**** Compression and Encryption:

# Make a simple compressed backup of files or directories:
tar -cvzf backup_output.tgz target_files_or_directories

# Open a compressed .tgz or .tar.gz file:
tar -xvf target.tgz

# Encrypt a file:
gpg -o outputfilename.gpg -c target_file

# Decrypt a file:
gpg -o outputfilename -d target.gpg

# Zip and encrypt a directory simultaneously:
gpg-zip -o encrypted_filename.tgz.gpg -c -s file_to_be_encrypted

*** The Bash shell:
**** File Name expansions:
# Current user's home directory:
~/

# Current directory:
./

# Parent directory:
../

# Or even (Two parent directories down):
../../

# All files in target directory. (Be very careful.):
/*

**** Output Redirects:

# Redirect output of one command into the input of another with a pipe:
command_1 | command_2

# Or even:

command_1 | command_2 | command_3

# Redirect output to a file:
command > file

# Or:

file > file

# Or even, to redirect in a different direction:
file < file

# Append output rather than writing over the target file:

file_or_command >> file

# Works like |, but it writes output to both target and terminal:
tee target

# Redirect standard output and error to /dev/null, where it is deleted.
command > /dev/null 2>&1

**** Controlling Execution:
# Wait until command 1 is finished to execute command 2
command_1 ; command_2

# Or even:
command_1 ; command_2 ; command_3

# && acts like ; but only executes command_2 if command_1 indicates that it succeeded without error by returning 0.
command_1 && command_2

# || acts like && but only executes command_2 if command_1 indicates an error by returning 1.
command_1 || command_2

**** Bash Wildcards:
# Zero or more characters:
*

# Matches "phrase" and any number of trailing characters:
phrase*

# Matches any incidences of "phrase" with any trailing or leading chars:
*phrase*

# Matches any one char:
?

# Matches any of the characters listed inside brackets:
[chars]

# Matches a range of chars between a-z:
[a-z]

** Advanced:
*** Command Line Utilities, Continued:
**** Networking:

# Configure network interfaces:
ifconfig

# Configure wireless network interfaces:
iwconfig

# Connect to a remote server.
ssh username@ip_address

# Forward X from target to current machine (Get a remote desktop. Somewhat obscure, but very useful):
ssh -X username@ip_address

# Copy files/directory over the network from one machine to another recursively:
scp -r source_filename:username@ip_address target_filename:target_username@target_ip_address

# Copy only changes between files or directories (super efficient way to sync directories, works either locally or with remote servers using username@ip_address:optionalport, just like ssh):
rsync source target

# Check to see if target is online and responding
ping ip_address

# View network route to target:
traceroute6 ip_address

# Network Monitor
netstat

# View firewall rules
iptables -L

# Scan this machine(localhost) to check for open ports:
nmap localhost

***** wget:

# download a file over http:
wget http://example.com/folder/file 

# complete a partially downloaded file:
wget -c http://example.com/folder/file

# start download in background:
wget -b wget -c http://example.com/folder/file

# download a file from ftp server:
wget --ftp-user=USER --ftp-password=PASS ftp://example.com/folder/file

***** netcat:

# Listen for input from network on recieving_port, dump it to a file (insecure, but handy):
netcat -l recieving_port > file_copied

# Pipe the output of a command to a target ip and port over the network:
command | netcat -w number_of_seconds_before_timeout target_ip target_port

# Use tar to compress and output a file as a stream, pipe it to a target ip and port over the network:
sudo tar -czf - filename | netcat -w number_of_seconds_before_timeout target_ip target_port

**** Users and Groups:
# Change owner of a file or directory:
chown user_name:group_name directory_name

# Change privileges over file or directory (see man page for details.)
chmod

# Create a new user:
adduser

# Change user privileges (be very careful with this one):
usermod

# Delete user
deluser

# Print groups:
groups

# Create a new group:
groupadd

# Change group privileges:
groupmod

# Delete group:
delgroup

# Temporarily become a different user:
su username

# Print usernames of logged in users:
users

# Write one line to another user from your terminal:
talk

# Interactive talk program to talk to other users from terminal (must be installed from repositories.):
ytalk

**** Working With Files, Continued:
# View what processes are using what files:
lsof

# View the differences between two files:
diff file_1 file_2

# Output the top number_of_lines of file:
head -n number_of_lines file

# Like head, but it outputs the last -n lines:
tail -n number_of_lines file

# Checksum a file:
md5sum file

# Checksum every file in a directory (install this one from repositories.):
md5deep directory

# Checksum a file (better algorithm with no hash collisions):
sha1sum

# Same operation as md5deep, but using sha1:
sha1deep

# Call command every few number_of_seconds, and highlight difference in output:
watch -d -n number_of_seconds command

# Execute command, print how long it took:
time command

# View files in directory from largest to smallest:
du -a directory | sort -n -r | less

# remove spaces from filenames in current directory:
rename -n 's/[\s]/''/g' *

# change capitals to lowercase in filenames in current directory:
rename 'y/A-Z/a-z/' *

***** Environment and Hardware:
# print motherboard information
dmidecode

# Print full date and time:
date

# Print the hostname of this machine:
echo $HOSTNAME

# Print information about current linux distro:
lsb_release -a

# Or even:

more /etc/issue

# Print linux kernel version:
uname -a

# Print information about kernel modules:
lsmod

# Configure kernel modules (never do this ;p ):
modprobe

# View Installed packages:
dpkg --get-selections

# Print environment variables:
printenv 

# List hardware connected via PCI ports:
lspci

# List hardware connected via USB ports:
lsusb

# Print hardware info stored in BIOS:
sudo dmidecode

# Dump captured data off of wireless card:
dumpcap

# Dump info about keyboard drivers:
dumpkeys

***** Ubuntu System Administration, Advanced (Continued):

# Add a Personal Package Archive from Ubuntu Launchpad:
add-apt-repository

# Install a .deb file from command line:
sudo dpkg -i package.deb

**** Python:

# Update pip (Python package manager):
pip install -U pip

# search pip repos for a library:
pip search library_name

# create a virtual python environment to allow install of many different versions of the same Python modules:
virtualenv dirname --no-site-packages

# connect to a virtual python environment
source dirname/bin/activate

# disconnect from a virtual python environment:
deactivate

# install package into virtual python environment from outside:
pip install packagename==version_number -E dirname

# export python virtual environment into a shareable format:
pip freeze -E dirname > requirements.txt

# import python virtual environment from a requirements.txt file:
pip install -E dirname -r requirements.txt

**** git (all commands must be performed in the same directory as .git folder):

# Start a new git project:
git init

git config user.name "user_name"

git config user.email "email"

# Make a copy of a git (target can be specified either locally or remotely, via any number of protocols):
git clone target

# Commit changes to a git:
git commit -m "message"

# Get info on current repository:
git status

# Show change log for current repository:
git log

# Update git directory from another repository:
git pull [target]

# Push branch to other repository:
git push [target]

# Create a new branch:
git branch [branchname]

# Switch to target branch:
git checkout [branchname]

# Delete a branch:
git branch -d [branchname]

# Merge two branches:
git merge [branchname] [branchname]

# Show all branches of a project:
git branch

*** Virtualization:

#clone a virtual machine (this works, it's been tested):
vboxmanage clonehd virtual_machine_name.vdi --format VDI ~/target_virtual_machine_name.vdi

#mount a shared virtual folder:
#you need to make sure you have the right kernel modules. You can do this with modprobe, but this package works instead in a ubuntu-specific way.

sudo apt-get install virtualbox-ose-guest-utils

sudo mount -t vboxsf name_of_shared_folder_specified_in_Virtualbox path_of_mountpoint

*** mysql:

# Get help:
help

# Show databases:
show databases;

# Choose a database to use:
use database_name_here;

# Show database schema:
show tables;

# Delete database:
DROP DATABASE databasename;

# New database:
CREATE DATABASE databasename;

# Create a new user:
CREATE USER username@localhost IDENTIFIED BY 'password';

# Show users:
select * from mysql.user;

# Delete a user:
delete from mysql.user WHERE User='user_name';

# Give user access to all tables (make them root). the "%" means that they can sign in remotely, from any machine, not just localhost.:
grant all privileges on *.* to someusr@"%" identified by 'password';

# give certain privileges to a user on a certain database:
grant select,insert,update,delete,create,drop on somedb.* to someusr@"%" identified by 'password';

# Tell mysql to use new user priv policies:
flush privileges;

# change user password:
use mysql;

update user set password='password'('newpassword') where User='user_name';

# mysql command line args:
# export text file with commands to rebuild all mysql tables:
mysqldump databasename > dumpfilename.txt

# restore from a dump:
mysql -u username -p < dumpfilename.txt

# dump entire database:
mysqldump -u username -p --opt databasename > dumpfile.sql

# restore from entire database dump:
mysql -u username -p --database=databasename < dumpfile.sql