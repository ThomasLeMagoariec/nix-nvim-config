{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
    name = "alpha";
    inherit src;
}
