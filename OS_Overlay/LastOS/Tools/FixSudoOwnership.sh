#https://askubuntu.com/questions/452860/usr-bin-sudo-must-be-owned-by-uid-0-and-have-the-setuid-bit-set


#As you'll read on this answer on SO, this problem is not as hard as people are making it. You can get the sudo command working again without a reinstall by following these simple steps:

#Log out as the current user, then log back in as root.
#Execute chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
#Log out as root, then log back in as the current user.
#This does the trick and is much quicker and less painful than the "nuclear option" recommended in other answers.

#If your root password is not set, you can boot in Recovery Mode to set it.

#Note that this will resolve the titular error /usr/bin/sudo must be owned by uid 0 and have the setuid bit set but if like the OP you did more than mess up the permissions of the /usr/bin/sudo file, a more "nuclear" option may in fact make more sense.


chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
