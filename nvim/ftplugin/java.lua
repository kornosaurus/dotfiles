local bundles = {
  vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
}

local java_test_bundles = vim.split(vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
local excluded = {
  "com.microsoft.java.test.runner-jar-with-dependencies.jar",
  "jacocoagent.jar",
}
for _, java_test_jar in ipairs(java_test_bundles) do
  local fname = vim.fn.fnamemodify(java_test_jar, ":t")
  if not vim.tbl_contains(excluded, fname) then
    table.insert(bundles, java_test_jar)
  end
end

local config = {
  name = "jdtls",
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
  },
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),
  settings = {
    java = {
      project = {
        referencedLibraries = {
          vim.fn.getcwd() .. "/target/generated-sources/openapi",
        }
      },
    }
  },
  init_options = {
    bundles = bundles
  },
}

require('jdtls').start_or_attach(config)
