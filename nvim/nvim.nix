pkgs:

{
	enable = true;
	extraConfig = ''
	set number relativenumber
	'';
	extraLuaConfig = ''
	'';
	plugins = 
	[
	(pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.c p.go p.java p.python]))
	];
};
