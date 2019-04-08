# vagrant
Configuração para Vagrant + vagrantfile

Arquivos para uma instação básica do ubuntu/trusty64, com as seguintes Apps

Webmin,
Phpmyadmin,
Composer,
Swapspace,
Memcached,
rng-tools

A configuração de memória inicial ficou definida para 1024 = 1mb:
machine.memory = 1024

Após a instação pode ser definido para 512 sem problemas.
machine.memory = 512


Definindo o numero de processadores da Máquina Virtual:

Inicalmente definido para 1, se precisar de maior processamento defina conforme os núcleos disponiveis em seu PC host.
machine.customize [ "modifyvm", :id, "--cpus", "1" ]


Att.
Marcelo Pires de Almeida

PS: Configurações baseadas no script da EspecializaTI, com alterações para meu desenvolvimento, qualquer dúvida não tenha receio de me contatar pelo Github.



******************
Usage:

VBoxManage modifyvm         <uuid|vmname>
                            [--name <name>]
                            [--groups <group>, ...]
                            [--description <desc>]
                            [--ostype <ostype>]
                            [--iconfile <filename>]
                            [--memory <memorysize in MB>]
                            [--pagefusion on|off]
                            [--vram <vramsize in MB>]
                            [--acpi on|off]
                            [--pciattach 03:04.0]
                            [--pciattach 03:04.0@02:01.0]
                            [--pcidetach 03:04.0]
                            [--ioapic on|off]
                            [--hpet on|off]
                            [--triplefaultreset on|off]
                            [--apic on|off]
                            [--x2apic on|off]
                            [--paravirtprovider none|default|legacy|minimal|
                                                hyperv|kvm]
                            [--paravirtdebug <key=value> [,<key=value> ...]]
                            [--hwvirtex on|off]
                            [--nestedpaging on|off]
                            [--largepages on|off]
                            [--vtxvpid on|off]
                            [--vtxux on|off]
                            [--pae on|off]
                            [--longmode on|off]
                            [--ibpb-on-vm-exit on|off]
                            [--ibpb-on-vm-entry on|off]
                            [--spec-ctrl on|off]
                            [--l1d-flush-on-sched on|off]
                            [--l1d-flush-on-vm-entry on|off]
                            [--nested-hw-virt on|off]
                            [--cpu-profile "host|Intel 80[86|286|386]"]
                            [--cpuid-portability-level <0..3>
                            [--cpuid-set <leaf[:subleaf]> <eax> <ebx> <ecx> <edx>]
                            [--cpuid-remove <leaf[:subleaf]>]
                            [--cpuidremoveall]
                            [--hardwareuuid <uuid>]
                            [--cpus <number>]
                            [--cpuhotplug on|off]
                            [--plugcpu <id>]
                            [--unplugcpu <id>]
                            [--cpuexecutioncap <1-100>]
                            [--rtcuseutc on|off]
                            [--graphicscontroller none|vboxvga|vmsvga|vboxsvga]
                            [--monitorcount <number>]
                            [--accelerate3d on|off]
                            [--accelerate2dvideo on|off]
                            [--firmware bios|efi|efi32|efi64]
                            [--chipset ich9|piix3]
                            [--bioslogofadein on|off]
                            [--bioslogofadeout on|off]
                            [--bioslogodisplaytime <msec>]
                            [--bioslogoimagepath <imagepath>]
                            [--biosbootmenu disabled|menuonly|messageandmenu]
                            [--biosapic disabled|apic|x2apic]
                            [--biossystemtimeoffset <msec>]
                            [--biospxedebug on|off]
                            [--boot<1-4> none|floppy|dvd|disk|net>]
                            [--nic<1-N> none|null|nat|bridged|intnet|hostonly|
                                        generic|natnetwork]
                            [--nictype<1-N> Am79C970A|Am79C973|
                                            82540EM|82543GC|82545EM|
                                            virtio]
                            [--cableconnected<1-N> on|off]
                            [--nictrace<1-N> on|off]
                            [--nictracefile<1-N> <filename>]
                            [--nicproperty<1-N> name=[value]]
                            [--nicspeed<1-N> <kbps>]
                            [--nicbootprio<1-N> <priority>]
                            [--nicpromisc<1-N> deny|allow-vms|allow-all]
                            [--nicbandwidthgroup<1-N> none|<name>]
                            [--bridgeadapter<1-N> none|<devicename>]
                            [--hostonlyadapter<1-N> none|<devicename>]
                            [--intnet<1-N> <network name>]
                            [--nat-network<1-N> <network name>]
                            [--nicgenericdrv<1-N> <driver>
                            [--natnet<1-N> <network>|default]