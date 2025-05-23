local M = {}

M.ensure_installed = {
  'cmakelang',
  'cmakelint',
  'hadolint',
  'markdownlint-cli2',
  'taplo',
}
-- yaml schema support

M.schema_store = {
  'b0o/SchemaStore.nvim',
  lazy = true,
  version = false, -- last release is way too old
}

-- 'neovim/nvim-lspconfig',
M.lsp = {
  servers = {
    neocmake = {},
    dockerls = {},
    docker_compose_language_service = {},
    jsonls = {
      -- lazy-load schemastore when needed
      on_new_config = function(new_config)
        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
      end,
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    },

    ocamllsp = {
      filetypes = {
        'ocaml',
        'ocaml.menhir',
        'ocaml.interface',
        'ocaml.ocamllex',
        'reason',
        'dune',
      },
      root_dir = function(fname)
        return require('lspconfig.util').root_pattern(
          '*.opam',
          'esy.json',
          'package.json',
          '.git',
          'dune-project',
          'dune-workspace',
          '*.ml'
        )(fname)
      end,
    },

    yamlls = {
      -- Have to add this for yamlls to understand that we support line folding
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
      -- lazy-load schemastore when needed
      on_new_config = function(new_config)
        new_config.settings.yaml.schemas =
          vim.tbl_deep_extend('force', new_config.settings.yaml.schemas or {}, require('schemastore').yaml.schemas())
      end,
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          keyOrdering = false,
          format = {
            enable = true,
          },
          validate = true,
          schemaStore = {
            -- Must disable built-in schemaStore support to use
            -- schemas from SchemaStore.nvim plugin
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = '',
          },
        },
      },
    },
  },
}
