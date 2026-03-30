return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  opts = function()
    local lombok_bin = vim.fn.exepath('lombok')
    local lombok_jar = ''

    if lombok_bin ~= '' then
      local real_bin_path = vim.fn.resolve(lombok_bin)
      local package_root = vim.fn.fnamemodify(real_bin_path, ':h:h')
      local possible_jars = {
        package_root .. '/share/java/lombok.jar',
        package_root .. '/share/java/lombok/lombok.jar',
      }

      for _, path in ipairs(possible_jars) do
        if vim.fn.filereadable(path) == 1 then
          lombok_jar = path
          break
        end
      end
    end

    return {
      cmd = { vim.fn.exepath('jdtls') },
      lombok_jar = lombok_jar,
    }
  end,
  config = function(_, opts)
    local function attach_jdtls()
      local fname = vim.api.nvim_buf_get_name(0)
      local root_dir = vim.fs.root(fname, { '.git', 'mvnw', 'gradlew', 'pom.xml' })
      local project_name = root_dir and vim.fs.basename(root_dir)
      local cmd = vim.deepcopy(opts.cmd)

      if opts.lombok_jar ~= '' then
        table.insert(cmd, string.format('--jvm-arg=-javaagent:%s', opts.lombok_jar))
      end

      if project_name then
        vim.list_extend(cmd, {
          '-configuration',
          vim.fn.stdpath('cache') .. '/jdtls/' .. project_name .. '/config',
          '-data',
          vim.fn.stdpath('cache') .. '/jdtls/' .. project_name .. '/workspace',
        })
      end

      require('jdtls').start_or_attach({
        cmd = cmd,
        root_dir = root_dir,
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  -- Grabs Java from your active devenv shell
                  path = vim.fn.exepath('java'):gsub('/bin/java', ''),
                  default = true,
                },
              },
            },
          },
        },
      })
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = attach_jdtls,
    })

    if vim.bo.filetype == 'java' then
      attach_jdtls()
    end
  end,
}
