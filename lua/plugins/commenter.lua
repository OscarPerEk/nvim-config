-- comment with leader / or gcc (in normal mode), gc (invisual)
return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
}
