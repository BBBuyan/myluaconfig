return {
    "danymat/neogen",
    config = function()
        require("neogen").setup {
            languages = {
                cs = {
                    template = {
                        annotation_convention = "xmldoc"
                    }
                }
            }
        }
    end
}
