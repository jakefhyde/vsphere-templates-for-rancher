/*
    DESCRIPTION:
    Microsoft Windows Server 2022 variables used by the Packer Plugin for VMware vSphere (vsphere-iso).
*/

// Installation Operating System Metadata
vm_inst_os_language                 = "en-US"
vm_inst_os_keyboard                 = "en-US"
vm_inst_os_image_standard_core      = "Windows Server 2022 SERVERSTANDARDCORE"
vm_inst_os_image_standard_desktop   = "Windows Server 2022 SERVERSTANDARD"
vm_inst_os_kms_key_standard         = "VDYBN-27WPP-V4HQT-9VMD4-VMK7H"
vm_inst_os_image_datacenter_core    = "Windows Server 2022 SERVERDATACENTERCORE"
vm_inst_os_image_datacenter_desktop = "Windows Server 2022 SERVERDATACENTER"
vm_inst_os_kms_key_datacenter       = "WX4NM-KYWYW-QJJR4-XV3QB-6VM33"

// Guest Operating System Metadata
vm_guest_os_language           = "en-US"
vm_guest_os_keyboard           = "en-US"
vm_guest_os_timezone           = "UTC"
vm_guest_os_family             = "windows"
vm_guest_os_name               = "server"
vm_guest_os_version            = "2022"
vm_guest_os_edition_standard   = "standard"
vm_guest_os_edition_datacenter = "datacenter"
vm_guest_os_experience_core    = "core"
vm_guest_os_experience_desktop = "dexp"

// Virtual Machine Guest Operating System Setting
vm_guest_os_type = "windows2019srv_64Guest"

// Virtual Machine Hardware Settings
vm_firmware              = "efi-secure"
vm_cdrom_type            = "sata"
vm_cpu_sockets           = 1
vm_cpu_cores             = 2
vm_cpu_hot_add           = false
vm_mem_size              = 8192
vm_mem_hot_add           = false
vm_disk_size             = 80000
vm_disk_controller_type  = ["pvscsi"]
vm_disk_thin_provisioned = true
vm_network_card          = "vmxnet3"

// Removable Media Settings
iso_path           = "iso/windows/server"
iso_file           = "en-us_windows_server_2022_updated_feb_2022_x64_dvd_d4a089c1.iso"
iso_checksum_type  = "sha256"
iso_checksum_value = "5140AC5FB8F48EFDF4BFCF1E7BE14030F9164A824F12A9D08A45CDC72DAC8D15"

// Boot Settings
vm_boot_order       = "disk,cdrom"
vm_boot_wait        = "2s"
vm_boot_command     = ["<spacebar>"]
vm_shutdown_command = "shutdown /s /t 10 /f /d p:4:1 /c \"Shutdown by Packer\""

// Communicator Settings
communicator_port    = 5985
communicator_timeout = "12h"

// Provisioner Settings
scripts = ["scripts/windows/windows-prepare.ps1"]
inline = [
  "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))",
  "choco feature enable -n allowGlobalConfirmation"
]
