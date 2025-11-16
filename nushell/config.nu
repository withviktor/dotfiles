# Nushell Config File

# External completions
$env.config = {
  ls: {
    use_ls_colors: true
    clickable_links: true
  }
  
  rm: {
    always_trash: false
  }
  
  table: {
    mode: rounded
    index_mode: always
    show_empty: true
  }
  
  explore: {
    exit_esc: true
    command_bar_text: '#C4C9C6'
    status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6'}
    highlight: {bg: 'yellow' fg: 'black'}
    status: {
      error: {fg: 'white' bg: 'red'}
      warn: {}
      info: {}
    }
  }
  
  history: {
    max_size: 100_000
    sync_on_enter: true
    file_format: "plaintext"
    isolation: false
  }
  
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "prefix"
    external: {
      enable: true
      max_results: 100
      completer: null
    }
  }
  
  filesize: {
    metric: false
    format: "auto"
  }
  
  cursor_shape: {
    emacs: line
    vi_insert: line
    vi_normal: block
  }
  
  color_config: {
    separator: white
    leading_trailing_space_bg: { attr: n }
    header: green_bold
    empty: blue
    bool: white
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: {bg: red fg: white}
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
  }
  
  use_grid_icons: true
  footer_mode: "25"
  float_precision: 2
  buffer_editor: "nvim"
  use_ansi_coloring: true
  bracketed_paste: true
  edit_mode: emacs
  shell_integration: true
  render_right_prompt_on_last_line: false
  
  hooks: {
    pre_prompt: [{ null }]
    pre_execution: [{ null }]
    env_change: {
      PWD: [{|before, after| null }]
    }
    display_output: "if (term size).columns >= 100 { table -e } else { table }"
    command_not_found: { null }
  }
  
  menus: [
    {
      name: completion_menu
      only_buffer_difference: false
      marker: "| "
      type: {
        layout: columnar
        columns: 4
        col_width: 20
        col_padding: 2
      }
      style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
      }
    }
    {
      name: history_menu
      only_buffer_difference: true
      marker: "? "
      type: {
        layout: list
        page_size: 10
      }
      style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
      }
    }
  ]
  
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: [emacs, vi_insert, vi_normal]
      event: { send: menu name: history_menu }
    }
  ]
}

# Aliases
alias ll = ls -l
alias la = ls -la
alias g = git
alias gc = git commit -m
alias gst = git status
alias gp = git push
alias vim = nvim
alias v = nvim

$env.config.show_banner = false
