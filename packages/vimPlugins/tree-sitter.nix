{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "tree-sitter";
  inherit src;
}
