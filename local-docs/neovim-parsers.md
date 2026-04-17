
I moved away from nvim-treesitter a while ago. The reason actually was that after switching
from master to main branch some of my parsers stopped working, so I decided to figure out how
to set up these myself. And it was actually pretty simple.

First thing you need is tree-sitter-cli, I've installed it with brew install tree-sitter-cli. Then:

Find out the parsers you need. Google them, their names are usually tree-sitter-<lang>.
As an example, I will take Go language:

```sh
git clone https://github.com/tree-sitter/tree-sitter-go ~/my/location/tree-sitter-go
cd ~/my/location/tree-sitter-go
tree-sitter generate  # Might not need to run this part if a grammar.js is already present
tree-sitter build
```

You will get a parser file in current directory, usually it's either .so or .dylib file. In my case, it's go.dylib

```sh
mv go.dylib ~/.config/nvim/parser/go.dylib
```
The name of the parser should be the same as language name (open any file in neovim and type :echo &filetype to get the name)

Now you can run `:checkhealth vim.treesitter`. Neovim should find this new parser you've built

The next step is to download .scm files for your parser. You can find some of them in tree-sitter repository, in queries/ dir, but usually it's better to download them from nvim-treesitter repo. There are more queries for folding, injections, etc. The easiest way for me was to:


```sh
git clone https://github.com/nvim-treesitter/nvim-treesitter ~/my/location/nvim-treesitter 
cd !$ 
cp -r runtime/queries ~/.config/nvim/queries
```

Done!

Some of the parsers are installed via pacman and neovim are automatically able
to find those.

### NOTE:
In the case of the python parser I had to manually compile it at the
correct version (not latest commit), copy the output over to the `parser/`-dir.
```sh
tree-sitter generate src/grammar.json
tree-sitter build -o <filename>
cp <filename> .../nvim/parser/
```
Then I had to manually add vim.treesitter.start() in `ftplugin/python.lua` to
run this command once opening python files.
