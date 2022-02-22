--local nvim_lsp = require'lspconfig'


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'intelephense' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    settings = {
        intelephense = {
            stubs = { 
              "aerospike",
              "amqp",
              "apache",
              "apcu",
              "ast",
              "bcmath",
              "blackfire",
              "bz2",
              "calendar",
              "cassandra",
              "com_dotnet",
              "Core",
              "couchbase",
              "couchbase_v3",
              "crypto",
              "ctype",
              "cubrid",
              "curl",
              "date",
              "dba",
              "decimal",
              "dio",
              "dom",
              "ds",
              "enchant",
              "Ev",
              "event",
              "exif",
              "fann",
              "FFI",
              "ffmpeg",
              "fileinfo",
              "filter",
              "fpm",
              "ftp",
              "gd",
              "gearman",
              "genesis",
              "geoip",
              "geos",
              "gettext",
              "gmagick",
              "gmp",
              "gnupg",
              "grpc",
              "hash",
              "http",
              "ibm_db2",
              "iconv",
              "igbinary",
              "imagick",
              "imap",
              "inotify",
              "interbase",
              "intl",
              "json",
              "judy",
              "ldap",
              "leveldb",
              "libevent",
              "libsodium",
              "libvirt-php",
              "libxml",
              "lua",
              "LuaSandbox",
              "lzf",
              "mailparse",
              "mapscript",
              "mbstring",
              "mcrypt",
              "memcache",
              "memcached",
              "meminfo",
              "meta",
              "ming",
              "mongo",
              "mongodb",
              "mosquitto-php",
              "mqseries",
              "msgpack",
              "mssql",
              "mysql",
              "mysql_xdevapi",
              "mysqli",
              "ncurses",
              "newrelic",
              "oauth",
              "oci8",
              "odbc",
              "openssl",
              "parallel",
              "Parle",
              "pcntl",
              "pcov",
              "pcre",
              "pdflib",
              "PDO",
              "pdo_ibm",
              "pdo_mysql",
              "pdo_pgsql",
              "pdo_sqlite",
              "pgsql",
              "Phar",
              "phpdbg",
              "polylang",
              "posix",
              "pspell",
              "pthreads",
              "radius",
              "rar",
              "rdkafka",
              "readline",
              "recode",
              "redis",
              "Reflection",
              "regex",
              "rpminfo",
              "rrd",
              "SaxonC",
              "session",
              "shmop",
              "SimpleXML",
              "snmp",
              "soap",
              "sockets",
              "sodium",
              "solr",
              "SPL",
              "SplType",
              "SQLite",
              "sqlite3",
              "sqlsrv",
              "ssh2",
              "standard",
              "stats",
              "stomp",
              "suhosin",
              "superglobals",
              "svm",
              "svn",
              "sybase",
              "sync",
              "sysvmsg",
              "sysvsem",
              "sysvshm",
              "tidy",
              "tokenizer",
              "uopz",
              "uv",
              "v8js",
              "wddx",
              "win32service",
              "winbinder",
              "wincache",
              "xcache",
              "xdebug",
              "xhprof",
              "xlswriter",
              "xml",
              "xmlreader",
              "xmlrpc",
              "xmlwriter",
              "xsl",
              "xxtea",
              "yaf",
              "yaml",
              "yar",
              "zend",
              "wordpress",
              "wordpress-globals",
              "wp-cli",
              "Zend OPcache",
              "ZendCache",
              "ZendDebugger",
              "ZendUtils",
              "zip",
              "zlib",
              "zmq",
              "zookeeper",
              "zstd",
            },
            files = {
                maxSize = 5000000;
            };
        };
    },
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
