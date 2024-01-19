

VBoxManage natnetwork add --netname natnet1 --network "10.0.2.0/24" --enable

VBoxManage modifyvm "$VM" --nic1 natnetwork --nat-network1 "natnet1"

VBoxManage modifyvm "$VM" --natpf1 "ssh,tcp,127.0.0.1,2222,,22"

