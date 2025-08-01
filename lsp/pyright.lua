return {
    -- Installed with 'npm i -g pyright'
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { "python" },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
        '.git',
    },
    settings = {
        pyright = {
            -- disableLanguageServices = true,
        },
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
            },
        },
    },
}
