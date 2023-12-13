/*
    DESCRIPTION:
    Microsoft Windows Server 2019 variables used by the Packer Plugin for VMware vSphere (vsphere-iso).
*/

// Installation Operating System Metadata
vm_inst_os_language                 = "en-US"
vm_inst_os_keyboard                 = "en-US"
vm_inst_os_image_standard_core      = "Windows Server 2019 SERVERSTANDARDCORE"
vm_inst_os_image_standard_desktop   = "Windows Server 2019 SERVERSTANDARD"
vm_inst_os_kms_key_standard         = "N69G4-B89J2-4G8F4-WWYCC-J464C"
vm_inst_os_image_datacenter_core    = "Windows Server 2019 SERVERDATACENTERCORE"
vm_inst_os_image_datacenter_desktop = "Windows Server 2019 SERVERDATACENTER"
vm_inst_os_kms_key_datacenter       = "WMDGN-G9PQG-XVVXX-R3X43-63DFG"

/*
  Selecting OS versions via an index is more reliable than using
   the string value of the OS version. For both Windows 2019 and 2022
   ISO's, the order will be the same as below.
*/
vm_inst_os_image_standard_core_index = 1
vm_inst_os_image_standard_desktop_index = 2
vm_inst_os_image_datacenter_core_index = 3
vm_inst_os_image_datacenter_desktop_index = 4

// Guest Operating System Metadata
vm_guest_os_language           = "en-US"
vm_guest_os_keyboard           = "en-US"
vm_guest_os_timezone           = "UTC"
vm_guest_os_family             = "windows"
vm_guest_os_name               = "server"
vm_guest_os_version            = "2019"
vm_guest_os_edition_standard   = "standard"
vm_guest_os_edition_datacenter = "datacenter"
vm_guest_os_experience_core    = "core"
vm_guest_os_experience_desktop = "dexp"

// Virtual Machine Guest Operating System Setting
vm_guest_os_type = "windows2019srv_64Guest"

// Virtual Machine Hardware Settings
vm_firmware              = "efi-secure"
vm_cdrom_type            = "sata"
// vm_cpu_sockets is equivalent
// to the amount of vCPU's assigned
// to an instance. This name
// differs from upstream.
vm_cpu_sockets           = 2
vm_cpu_cores             = 1
vm_cpu_hot_add           = false
vm_mem_size              = 8192
vm_mem_hot_add           = false
vm_disk_size             = 40000
vm_disk_controller_type  = ["pvscsi"]
vm_disk_thin_provisioned = true
vm_network_card          = "vmxnet3"

// Removable Media Settings
// Note that these are specific
// to the current vSphere environment,
// and should changed when ISOs are uploaded
// or removed
iso_path           = "iso"
iso_file           = "windows_2019_evaluation_edition.iso"
iso_checksum_type  = "sha256"
iso_checksum_value = "6dae072e7f78f4ccab74a45341de0d6e2d45c39be25f1f5920a2ab4f51d7bcbb"

// Boot Settings
vm_boot_order       = "disk,cdrom"
vm_boot_wait        = "2s"
vm_boot_command     = ["<spacebar>"]
vm_shutdown_command = "shutdown /s /t 10 /f /d p:4:1 /c \"Shutdown by Packer\""

// Communicator Settings
communicator_port    = 5985
communicator_timeout = "12h"

// Provisioner Settings
preparationScripts = ["scripts/windows/windows-prepare.ps1"]
finishScripts = ["scripts/windows/windows-finish.ps1"]
