# tempgen.nvim

Your good ol' handy friend `cp` meets with `telescope.nvim`.

<!--toc:start-->

- [What is Tempgen?](#what-is-tempgen)
- [Demo](#demo)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contribution](#contribution)
- [TODO](#todo)
<!--toc:end-->

## <a id='what-is-tempgen'/> What is `tempgen.nvim`?

`tempgen.nvim` allows people to scaffold their files as easy as fuzzy finding a file via `telescope.nvim`.

It allows users to store their **templates** wherever they want and then later on reference them inside files - based on their **filetype**.

## <a id='demo'/> Demo

<img src="./assets/tempgen-demo.gif"/>

## <a id='installation'/> Installation

You can install this plugin, like any other by using your favorite plugin manager.

This plugin depends on `nvim-telescope/telescope.nvim`.

Here's the installation for `lazy.nvim`:

```lua
{
    "acikgozb/tempgen.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    opts = {
        path = "path/to/your/templates"
    }
}
```

## <a id='configuration'/> Configuration

The confiugration itself is pretty easy and straightforward.
Basically, you need to provide a path to your templates to allow `tempgen.nvim` to reference it later on in your Neovim buffer.

A couple of notes regarding the template path:

- The path can be pretty much anything you want.
  As long as your user has read permissions to your path, `tempgen.nvim` can pick it up.
- You can organize your template path however you want.
  Feel free to use nested directories to organize your templates.

Currently, the Telescope pane is not customizable, this plugin uses your base configuration for Telescope.

## <a id='usage'/> Usage

The plugin comes with a command called `Tempgen`. In your current Neovim buffer, executing `:Tempgen` opens up Telescope, allowing you to see your templates.

You can fuzzy find your desired template through Telescope, and when you select it, your current buffer gets replaced by the selected template.

The main gist here is - your buffer's `filetype` should match with your template's **extension**. Otherwise it won't be seen on Telescope.

To check the filetype, you can execute `:lua print(vim.bo.filetype)`.

## <a id='contribution'/> Contribution

Originally, I did not created this repository to publicly share the plugin, I just wanted version control throughout the development. But later on, I thought it would be nice to share the experience and see whether people develop interest or not.

So I don't expect this plugin to have any contribution at all, but just in case, feel free to open an issue or even a PR if you encounter any errors or if you see some nice improvements.

## <a id='todo'/> TODO

Here are the main points I found throughout my daily usage for a couple weeks:

- `filetype` - `extension` mapping: Originally I thought it would be nice to directly tie buffer filetype with templates' extensions, to organize the templates by their name. However in time, I realized this clutters the template names way too much than expected, so I'll implement a 1-1 file extension mapping instead.
- Tests: If you checked the code itself, it's pretty dead simple and does not have any tests. But it's a good practice to have tests to show the intention and as a self reference.
- `checkhealth` support: This one is needed for people to see whether the plugin is installed correctly or not.
- Code documentation: I would love to enable `:help` for this plugin, to have the documentation directly inside Neovim.
