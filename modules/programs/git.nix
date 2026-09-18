{ pkgs, ... }:

{
  inputs.sops-nix.url = "github:Mic92/sops-nix";

  sops.secrets."git/email" = { };
  sops.secrets."git/smtp-pass" = { };

  programs.git.config = {
    user.name = "Bui Nguyen Nhu Quynh";
    # email comes from the secret at login
    credential.helper = "libsecret";
    sendemail = {
      smtpserver     = "smtp.gmail.com";
      smtpserverport = 587;
      smtpencryption = "tls";
      smtpuser       = "kaylovefoss@gmail.com";
      # password pulled from sops, never in the nix file
    };
  };
}
