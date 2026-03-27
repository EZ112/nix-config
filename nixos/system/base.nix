{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;

      extraEntries = ''
        search --no-floppy --file --set=win_root /Windows/Boot/EFI/bootmgfw.efi

        if [ -n "$win_root" ]; then
          menuentry "Windows" {
            insmod part_gpt
            insmod ntfs

            set root=($win_root)
            chainloader /Windows/Boot/EFI/bootmgfw.efi
          }
        fi
      '';
    };
    timeout = 5;

    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "Asia/Jakarta";
}
