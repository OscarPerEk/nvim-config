-- ga to align visually selected blocks (e.g. ga: or ga=)
return {
	{
		"junegunn/vim-easy-align",
		keys = {
			{ "ga", "<Plug>(EasyAlign)", mode = "x", desc = "Easy Align" },
			{ "ga", "<Plug>(EasyAlign)", mode = "n", desc = "Easy Align" },
		},
	},
}
