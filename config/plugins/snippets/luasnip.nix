{ pkgs, ... }:
let
  # Define all snippets inline
  snippetsDir = pkgs.writeTextDir "all.lua" ''
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local d = ls.dynamic_node
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep

    -- Helper function to get current date
    local function get_date()
        return os.date("%Y-%m-%d")
    end

    -- Helper function to get current author
    local function get_author()
        return "Arjun Salunkhe" 
    end

    -- Helper function to generate parameter documentation dynamically
    local function generate_param_docs(args, parent, user_args)
        local params = args[1][1] or ""
        local nodes = {}
        
        if params:match("%S") then
            local param_list = {}
            for param in params:gmatch("([^,]+)") do
                param = param:match("^%s*(.-)%s*$") -- trim whitespace
                if param and param ~= "" then
                    local param_name = param:match("(%w+)%s*$") or param
                    table.insert(param_list, param_name)
                end
            end
            
            for idx, param_name in ipairs(param_list) do
                table.insert(nodes, t(" * @param "))
                table.insert(nodes, t(param_name))
                table.insert(nodes, t(" "))
                table.insert(nodes, i(idx + 2))
                table.insert(nodes, t({" - Description of " .. param_name, ""}))
            end
        end
        
        return sn(nil, nodes)
    end

    return {
        -- Basic Doxygen documentation
        s({
            trig = "/doc",
            dscr = "Basic Doxygen documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @brief {}
     * @param {} {}
     * @return {} {}
     * @author {}
     * @date {}
     */]], {
            i(1, "Brief description"),
            i(2, "param_name"),
            i(3, "Parameter description"),
            i(4, "return_type"),
            i(5, "Return description"),
            f(get_author, {}),
            f(get_date, {})
        })),

        -- Advanced Doxygen documentation with dynamic params
        s({
            trig = "/adoc",
            dscr = "Advanced Doxygen documentation with auto params",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @brief {}
     * 
     * {}
     * 
    {}
     * @return {} - {}
     * 
     * @note {}
     * @see {}
     * @author {}
     * @date {}
     */]], {
            i(1, "Brief description of the function"),
            i(2, "Detailed description"),
            d(3, generate_param_docs, {2}),
            i(4, "ReturnType"),
            i(5, "Return description"),
            i(6, "Additional notes"),
            i(7, "Related functions"),
            f(get_author, {}),
            f(get_date, {})
        })),

        -- Multi-parameter function documentation
        s({
            trig = "/mdoc",
            dscr = "Multi-parameter function documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @brief {}
     * 
     * {}
     * 
     * @param {} {} - {}
     * @param {} {} - {}
     * @param {} {} - {}
     * @return {} - {}
     * @throws {} {}
     * @author {}
     * @date {}
     */]], {
            i(1, "Brief function description"),
            i(2, "Detailed description"),
            i(3, "param1"), i(4, "type1"), i(5, "desc1"),
            i(6, "param2"), i(7, "type2"), i(8, "desc2"),
            i(9, "param3"), i(10, "type3"), i(11, "desc3"),
            i(12, "return_type"), i(13, "return_desc"),
            i(14, "ExceptionType"), i(15, "exception_condition"),
            f(get_author, {}),
            f(get_date, {})
        })),

        -- Class documentation
        s({
            trig = "/class",
            dscr = "Class documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @class {}
     * @brief {}
     * 
     * {}
     * 
     * @author {}
     * @date {}
     * @version {}
     */]], {
            i(1, "ClassName"),
            i(2, "Brief class description"),
            i(3, "Detailed class description"),
            f(get_author, {}),
            f(get_date, {}),
            i(4, "1.0")
        })),

        -- File header documentation
        s({
            trig = "/file",
            dscr = "File header documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @file {}
     * @brief {}
     * 
     * {}
     * 
     * @author {}
     * @date {}
     * @copyright {}
     */]], {
            i(1, "filename.h"),
            i(2, "Brief file description"),
            i(3, "Detailed file description"),
            f(get_author, {}),
            f(get_date, {}),
            i(4, "Copyright notice")
        })),

        -- Simple function template
        s({
            trig = "/func",
            dscr = "Simple function with documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @brief {}
     * @param {} {}
     * @return {} {}
     */
    {} {}({}) {{
        {}
        return {};
    }}]], {
            i(1, "Function description"),
            i(2, "param_name"),
            i(3, "Parameter description"),
            i(4, "return_type"),
            i(5, "Return description"),
            i(6, "return_type"),
            i(7, "function_name"),
            i(8, "parameters"),
            i(9, "// Implementation"),
            i(10, "value")
        }))
    }
  '';

  # C-specific snippets
  cSnippetsDir = pkgs.writeTextDir "c.lua" ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    return {
        -- C function with documentation
        s({
            trig = "/cfunc",
            dscr = "C function with Doxygen documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @brief {}
     * @param {} {}
     * @return {} {}
     */
    {} {}({}) {{
        {}
        return {};
    }}]], {
            i(1, "Function description"),
            i(2, "param_name"),
            i(3, "Parameter description"),
            i(4, "return_type"),
            i(5, "Return description"),
            i(6, "return_type"),
            i(7, "function_name"),
            i(8, "parameters"),
            i(9, "// Implementation"),
            i(10, "value")
        })),

        -- C struct with documentation
        s({
            trig = "/cstruct",
            dscr = "C struct with documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @struct {}
     * @brief {}
     * 
     * {}
     */
    typedef struct {{
        {} {};  /**< {} */
        {} {};  /**< {} */
    }} {};]], {
            i(1, "StructName"),
            i(2, "Brief struct description"),
            i(3, "Detailed description"),
            i(4, "int"), i(5, "member1"), i(6, "Member 1 description"),
            i(7, "char*"), i(8, "member2"), i(9, "Member 2 description"),
            i(10, "struct_name_t")
        }))
    }
  '';

  # C++ specific snippets
  cppSnippetsDir = pkgs.writeTextDir "cpp.lua" ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    return {
        -- C++ class with documentation
        s({
            trig = "/cppclass",
            dscr = "C++ class with Doxygen documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @class {}
     * @brief {}
     * 
     * {}
     */
    class {} {{
    private:
        {} {};  /**< {} */

    public:
        /**
         * @brief Constructor
         * @param {} {}
         */
        {}({} {});
        
        /**
         * @brief Destructor
         */
        ~{}();
        
        /**
         * @brief {}
         * @param {} {}
         * @return {} {}
         */
        {} {}({});
    }};]], {
            i(1, "ClassName"),
            i(2, "Brief class description"),
            i(3, "Detailed class description"),
            i(4, "ClassName"),
            i(5, "int"), i(6, "member_var"), i(7, "Member variable description"),
            i(8, "param_name"), i(9, "Parameter description"),
            i(10, "ClassName"),
            i(11, "param_type"), i(12, "param_name"),
            i(13, "ClassName"),
            i(14, "Method description"),
            i(15, "method_param"), i(16, "Method parameter description"),
            i(17, "return_type"), i(18, "Return description"),
            i(19, "return_type"), i(20, "method_name"), i(21, "parameters")
        })),

        -- C++ method documentation
        s({
            trig = "/cppmethod",
            dscr = "C++ method with documentation",
            snippetType = "snippet"
        },
        fmt([[
    /**
     * @brief {}
     * @param {} {}
     * @return {} {}
     * @throws {} {}
     */
    {} {}({}) {{
        {}
        return {};
    }}]], {
            i(1, "Method description"),
            i(2, "param_name"), i(3, "Parameter description"),
            i(4, "return_type"), i(5, "Return description"),
            i(6, "ExceptionType"), i(7, "Exception condition"),
            i(8, "return_type"), i(9, "method_name"), i(10, "parameters"),
            i(11, "// Implementation"),
            i(12, "value")
        }))
    }
  '';
in
{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };

    # Load all snippets from the Nix store
    fromLua = [
      {
        paths = snippetsDir;
        lazyLoad = true;
      }
      {
        paths = cSnippetsDir;
        include = [ "c" ];
        lazyLoad = true;
      }
      {
        paths = cppSnippetsDir;
        include = [
          "cpp"
          "cxx"
          "cc"
        ];
        lazyLoad = true;
      }
    ];
  };

  keymaps = [
    {
      mode = [ "i" ];
      key = "<Tab>";
      action.__raw = ''
        function()
          local luasnip = require('luasnip')
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            return "<Tab>"
          end
        end
      '';
      options = {
        silent = true;
        expr = true;
        desc = "Expand snippet or jump to next placeholder";
      };
    }
    {
      mode = [ "s" ];
      key = "<Tab>";
      action.__raw = ''
        function()
          local luasnip = require('luasnip')
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            return "<Tab>"
          end
        end
      '';
      options = {
        silent = true;
        expr = true;
        desc = "Jump to next snippet placeholder";
      };
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<S-Tab>";
      action.__raw = ''
        function()
          local luasnip = require('luasnip')
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            return "<S-Tab>"
          end
        end
      '';
      options = {
        silent = true;
        expr = true;
        desc = "Jump to previous snippet placeholder";
      };
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-k>";
      action.__raw = ''
        function()
          local luasnip = require('luasnip')
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          end
        end
      '';
      options = {
        silent = true;
        desc = "Select next choice in snippet";
      };
    }
  ];
}
