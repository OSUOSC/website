---
title: "Introduction to the CLI"
speaker: "Andrew `smacz` Cziryak"
type: "Meeting"
time: '19:30'
location: 'Caldwell 120'
---

This week's meeting will be an introduction to the command line. We recommend having a Linux distribution installed or having one in a VM so you can follow along.

#### As always, laptops are encouraged and pizza will be provided.

-----

At the end of the meeting, many of you requested that I put up the list of commands that I was working off of throughout the meeting. Below is a copy of the notes that I was working off of. We didn't get through all of them, and I expanded on some of them quite a bit, and some of them have notes (like *NEEDS EXAMPLES*, etc.) but hopefully they're helpful to someone.

# Introduction to the Command Line

<!--resources-->
<!--https://rubytune.com/cheat-->

- `cd ~/`, `cd /home/brutus` and `cd $HOME` and `cd` are equivalent
- root can refer to the "top of a directory tree (e.g. /)" OR a user with elevated privileges (e.g. admin)
- never run a web browser as root . . . . natural selection at its finest

## Commonly Asked Questions

Q) Why won't my terminal let me type anything into the password prompt?

A) blindly type in your password and hit enter . . . . just do it


## Fundamentals

list files in the current directory
```bash
ls
```
----

change directories
```bash
# go to a user's home directory
cd ~

# move up one directory
cd ..

# go to the root directory
cd /
```
----

list files in the current directory, including hidden files
```bash
ls -a
```
----

list files with details (permissions, owner, size) in the current directory
```bash
ls -l
```
----

combine both of the above, i.e. detailed list of files, including hidden files
```bash
ls -al
```
----

any of the following are equivalent
```bash
ls -al
ls -la
ls -l -a
ls -a -l
```
----


create a new duplicate of 'foo' named "bar" in the current directory
```bash
cp foo bar
```
----

relocate/rename a file or folder
```bash
# relocate folder "homework" to a different parent directory
mv ~/documents/homework ~/college/homework

# relocate folder "homework" to a different parent directory AND rename it to "bs"
mv ~/documents/homework ~/college/bs
```
----

create a new folder named "foo" in the current directory
```bash
mkdir foo
```
----

create a new empty file named `baz`
```bash
touch baz
```
----

output the contents of file "helloworld.txt"
```bash
cat helloworld.txt
```
----

show the path to the current directory
```bash
pwd
```
----

view a visual hierarchy of files & folders inside of the current directory
```bash
tree
```
----

delete a file named "foo" in the current directory
```bash
rm foo
```
----

delete an empty directory named "bar"
```bash
rmdir bar
```
----


delete a directory named "baz" *and all its contents*
- *NEEDS EXAMPLES*
```bash
rm -r baz
```
----

outputs file `baz.txt` with line numbers
```bash
nl baz.txt
```
----

reset terminal screen, i.e. clear its output and put your prompt back at the top
<!--what's a better description that doesn't use the word "clear"-->
```bash
clear
```

can also be done with ctrl-l (hold control key and press "l")

----

reset the terminal screen and reinitialize terminal settings - use this when your terminal is showing weird symbols or otherwise in an unknown state
```bash
reset
```
----

view the syntax manual for any given command
```bash
# view the documentation for the command "less"
man less

# view the documentation for the command "tail"
man tail

# you can even view the documentation of "man" with "man" . . . oh man that's confusing
man man
```
----

Execute command `foo` as super-user(full permissions)
```bash
sudo foo
```
----

What do you mean 'permission denied'? Do that last command with super user
```bash
# this is INCREDIBLY DANGEROUS if abused
sudo !!
```
----

Execute graphical program `gparted` as super-user on gnome
```bash
gksu gparted
```
----

Execute graphical program `gparted` as super-user on kde
```bash
kdesudo gparted
```
----

Execute graphical program `gparted` as super-user on any desktop environment
```bash
pkexec gparted
```
----

-->


## Intermediate

conditionally execute commands
```bash
create a folder named "documents" AND navigate to it
mkdir documents && cd documents

```

run a command in the background
```bash
htop &
```
----

list the process id of `firefox`
```bash
pidof firefox
```
----

restart your machine
```bash
shutdown -r now
```
----

restart your machine
```bash
shutdown -h now
```
----

list all files owned by `brutus`
- *NEEDS EXAMPLES*
```bash
find .-user brutus
```
----

change the current user's password
```bash
passwd
```
----

elevate to super user
```bash
su
```
----

switch to user `tux`
```bash
su - tux
```
----

flavors of kill
```bash
# stop process with id "xxxx"
kill xxxx

# stop multiple processes with ids "xxxx", "yyyy", "zzzz"
kill xxxx yyyy zzzz

# stop process with that includes the string "fox" in its name
pkill fox

# stop process with the explicit name "firefox"
killall firefox

# nuke process with the explicit name "firefox"
killall -9 firefox
```
----


## Practical Commands You Should Learn

test your internet connection
```bash
#it works with ip addresses
ping -c 3 8.8.8.8

# or even urls
ping -c 3 google.com
```
**tip:** *this is a great way to troubleshoot DNS issues*

----

list all disk partitions
```bash
df -h
```
----

output kernel version
```bash
 uname -r
```
----

overwrite baz.txt and with "foobar"
```bash
echo "foobar" > baz.txt
```

----
append "foobar" onto the end of baz.txt on a new line. `-e` makes `echo` respect newlines.
```bash
echo -e "foobar-1\nfoobar" >> baz.txt
```
----

print the contents of baz.txt
```bash
cat baz.txt
```
----

write and create bar.txt
```bash
cat > bar.txt
```
----

Find lines that match a pattern in a file
```bash
echo -e "line1\nline2\nline3" > grep_test.txt;
grep '2' 'grep_test.txt'
# Only show one file as soon as a match is found
grep -l 'line' grep_test.txt
# Match multiple patterns
grep -e '2\|3' grep_test.txt
```
----

Substitute patterns in a line or file
```bash
echo "one two three" | sed 's/two/three' sed_test.txt
```
----

Copy one block device to another block device. Known as ['Destroyer of Disks'](http://www.noah.org/wiki/Dd_-_Destroyer_of_Disks)
```bash
dd if=~/Downloads/latest-ubuntu.iso of=/dev/sdb status=progress
```
----

zip the files bar.txt and baz.txt
```bash
zip -r foobar.zip bar.txt baz.txt
```
----

extract foobar.zip
```bash
unzip foobar.zip
```
----

Create tape archive that's gzipped
```bash
tar cvzf /tmp/dest_file.tar.gz /tmp/src_files/
```
----

Extract tape archive that's gzipped
```bash
tar xvzf /tmp/dest_file.tar.gz
```
----

spawn a static web server in the current directory on port 8080
```bash
python -m SimpleHTTPServer 8080
```
----

output ip address
- *NEEDS CLARIFICATION*
```bash
ip addr show
```
----

outputs the machine's hostname, duh
```bash
hostname
```
----


## The Most Important Commands

make a cow say moo
```bash
cowsay moo
```
----

list all cows available for use
```bash
ls /usr/share/cowsay/cows
```
----

use an alternate cow (in this case the unipony)
```bash
cowsay -f unipony "everypony loves me!"
```
----

make people think you're hacking
```bash
cmatrix
```
----

make people think you're hacking incorrectly
```bash
cat /dev/urandom | cmatrix
```
----

make really large text
```bash
toilet hello world
```
----

get helpful advice
```bash
fortune
```
----

git commit with style
```bash
git commit -m $(fortune)
```
----

watch Star Wars
```bash
telnet towel.blinkenlights.nl
```
----

Compose music from entropy in /dev/urandom
```bash
cat /dev/urandom | hexdump -v -e '/1 "%u\n"' | awk '{ split("0,2,4,5,7,9,11,12",a,","); for (i = 0; i < 1; i+= 0.0001) printf("%08X\n", 100*sin(1382*exp((a[$1 % 8]/12)*log(2))*i)) }' | xxd -r -p | aplay -c 2 -f S32_LE -r 16000
```

---

#### todo
- awk
- python
- && (and)
- || (or)
- & (background)
- | (pipe)
- visudo
- git
- apt-get
- pacman
- yum
- systemctl
- wifi-menu
- mogrify
- chmod
- chown
- date
- less
- htop
- figlet
- wget
- curl
- last
- dmesg
- sponge
- xargs
