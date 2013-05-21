Introduction
============
This is a self-driven tutorial on writing [Opscode Chef](http://www.opscode.com/chef/)'s [cookbooks](http://docs.opscode.com/essentials_cookbooks.html).

__assumption__: the user is using the [workstation](https://github.com/chef-tutorials/workstation.git) repository's vagrant boxes to run this tutorial.

__disclaimer__: The cookbooks written in the tutorial are designed for educational purposes.

Instructions
============
Within the __ubuntu vagrant workstation__:

A. Open the terminal:

You can use the hot-key `Ctrl-Alt-t` to open the terminal.

B. To begin, execute the following commands in the terminal:

```bash
cd ~/tutorials/introduction
git checkout -f step-01
./test-sync-run-solo.sh
```

C. Edit the cookbooks in the cookbooks directory using your favorite text editor to make the `test-sync-run-solo.sh` script pass.

__NOTE__: Explore the cookbooks directory for examples.

e.g. open your workspace by typing the following in the terminal:

```bash
sublime-text ~/tutorials/introduction/cookbooks&
```

D. Once the chef-solo run is complete with no errors, move on to the next step

```bash
git checkout -f step-02
```
E. Run the script and make it pass by editing the cookbook(s)!

```bash
./test-sync-run-solo.sh
```
Repeat D-E with incremented steps until we run out of steps (tags).


Hints
=====
* If you need to access the chef_node, the node that the cookbook is being applied, run `ssh chef_node`
* If you get stuck, look at the `postgresql` cookbook.
* If you get really stuck, feel free to checkout the next step to get the answer. Like so:

```
( If you are currently on step-04 )
git stash
git checkout -f step-05
```

Have a look, then go back:

```
git checkout -f step-04
git stash pop
```

* If you want to check your progress in the tutorial run `git tag` and you can see how many steps are remaining.
