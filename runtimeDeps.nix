{ pkgs }:
{
    deps1 = with pkgs; [
        nodePackages.typescript-language-server
        nodePackages.typescript
    ];
    deps2 = with pkgs; [ lazygit ];
}
