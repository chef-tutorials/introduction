#!/usr/bin/env sh
CHEF_SOLO_BOX="10.10.10.5"

sudo chown -R vagrant:vagrant /var/chef

#########################################
# TEST
#########################################

knife cookbook test -a -o cookbooks -c $HOME/.chef/knife.rb || { echo "[chef-tutorial]FATAL: Failed ruby syntax test!!!" ; exit 1; }

echo '';echo '';
echo '[chef-tutorial]INFO: Ruby syntax test passed!'
echo ''

foodcritic -f any cookbooks || { echo "[chef-tutorial]FATAL: Failed foodcritic (lint) test!!!" ; exit 1; }

echo ''
echo '[chef-tutorial]INFO: Foodcritic (lint) test passed!'
echo ''

#########################################
# SYNC
#########################################

rsync -az --delete `pwd`/cookbooks/* root@$CHEF_SOLO_BOX:/var/chef/cookbooks/ || { echo "[chef-tutorial]FATAL: Failed syncing the cookbooks to the chef_node!!!" ; exit 1; }
rsync -az --delete `pwd`/run_list.json root@$CHEF_SOLO_BOX:/var/chef/run_list.json || { echo "[chef-tutorial]FATAL: Failed syncing the run_list to the chef_node!!!" ; exit 1; }

echo ''
echo '[chef-tutorial]INFO: Cookbooks directory and run_list synchronization to chef_node was successful!'
echo ''

#########################################
# RUN SOLO
#########################################

ssh root@$CHEF_SOLO_BOX "/opt/vagrant_ruby/bin/chef-solo -j /var/chef/run_list.json" || { echo "[chef-tutorial]FATAL: Failed chef-solo run!!!" ; exit 1; }

echo ''
echo '[chef-tutorial]INFO: Examine the success message, then proceed to the next step!'
echo ''
