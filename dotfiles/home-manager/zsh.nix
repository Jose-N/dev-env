{ pkgs, ... }:
{
   enable = true;
   enableCompletion = true;
   autosuggestion.enable = true;
   syntaxHighlighting.enable = true;
   shellAliases = {
     lzd = "lazydocker";
     lzg = "lazygit";
     rebuild = "sudo nixos-rebuild switch";
     reload = "home-manager switch";
   };
   sessionVariables = {
     EDITOR = "nvim";
   };
   initExtra =
   ''
     [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
     path+="$HOME/.local/scripts";
     fpath+="$HOME/.local/scripts";
     path+="$HOME/go/bin";
     fpath+="$HOME/go/bin";
   '';
   plugins = [
     {
	name = "p10k";
	file = "powerlevel10k.zsh-theme";
	src = pkgs.fetchFromGitHub {
	  owner = "romkatv";
	  repo = "powerlevel10k";
	  rev = "8fa10f43a0f65a5e15417128be63e68e1d5b1f66";
	  sha256 = "sha256-isxgLWpbBuNoETXCOlJ4nwGSxMwCjoVF5D0dMZWtM5s=";
        };
      }
     {
	name = "zsh-autosuggestions";
	src = pkgs.fetchFromGitHub {
	  owner = "zsh-users";
	  repo = "zsh-autosuggestions";
	  rev = "v0.7.1";
	  sha256 = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
        };
      }
     {
	name = "zsh-syntax-highlighting";
	src = pkgs.fetchFromGitHub {
	  owner = "zsh-users";
	  repo = "zsh-syntax-highlighting";
	  rev = "0.8.0";
	  sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
   ];
   oh-my-zsh = {
	enable = true;
	theme = "robbyrussell";
   };
}
