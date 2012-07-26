#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.8
# from Racc grammer file "".
#

require 'racc/parser.rb'
module Liquor
  class Parser < Racc::Parser

module_eval(<<'...end parser.racc/module_eval...', 'parser.racc', 183)
  attr_reader :errors, :ast

  def initialize(tags={})
    super()

    @errors = []
    @ast    = nil
    @tags   = tags
  end

  def success?
    @errors.empty?
  end

  def parse(string)
    @errors.clear
    @ast = nil

    begin
      @stream = Lexer.lex(string, @tags)
      @ast = do_parse
    rescue Liquor::SyntaxError => e
      @errors << e
    end

    success?
  end

  def next_token
    tok = @stream.shift
    [ tok[0], tok ] if tok
  end

  TOKEN_NAME_MAP = {
    :comma    => ',',
    :dot      => '.',
    :lblock   => '{%',
    :rblock   => '%}',
    :linterp  => '{{',
    :rinterp  => '}}',
    :lbracket => '[',
    :rbracket => ']',
    :lparen   => '(',
    :rparen   => ')',
    :pipe     => '|',
    :op_not   => '!',
    :op_mul   => '*',
    :op_div   => '/',
    :op_mod   => '%',
    :op_plus  => '+',
    :op_minus => '-',
    :op_eq    => '==',
    :op_neq   => '!=',
    :op_lt    => '<',
    :op_leq   => '<=',
    :op_gt    => '>',
    :op_geq   => '>=',
    :keyword  => 'keyword argument name',
    :kwarg    => 'keyword argument',
    :ident    => 'identifier',
  }

  def on_error(error_token_id, error_token, value_stack)
    if token_to_str(error_token_id) == "$end"
      raise Liquor::SyntaxError.new("unexpected end of stream")
    else
      type, (loc, value) = error_token
      type = TOKEN_NAME_MAP[type] || type
      raise Liquor::SyntaxError.new("unexpected token `#{type}'", loc)
    end
  end

  def retag(nodes)
    loc = nodes.map { |node| node[1] }.compact
    first, *, last = loc
    return first if last.nil?

    {
      line:  first[:line],
      start: first[:start],
      end:    last[:end],
    }
  end

  def reduce_tag_args(list)
    list.each_slice(2).reduce([]) { |args, (k, v)|
      if v[0] == :block
        args << [ :blockarg, retag([ k, v ]), k, v[2] || [] ]
      else
        args << [ :kwarg,    retag([ k, v ]), k, v          ]
      end
    }
  end
...end parser.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
    75,    94,    43,     6,    95,     6,     5,     6,     5,    42,
     5,    26,    30,    34,    35,    32,    33,    29,    27,    25,
    31,     2,    28,     2,    26,     2,    94,     6,    39,    95,
     5,    27,    25,    36,    37,    26,    30,    34,    35,    32,
    33,    29,    27,    25,    31,     2,    28,    94,    26,    94,
    95,     6,    95,   100,     5,    27,    25,    36,    37,    26,
    30,    34,    35,    32,    33,    29,    27,    25,    31,     2,
    28,    67,    22,    92,    23,     6,    96,    71,     5,    76,
    40,    36,    37,    26,    30,    34,    35,    32,    33,    29,
    27,    25,    31,     2,    28,    83,    71,   105,     7,     6,
    81,    51,     5,    67,   109,    36,    37,    26,    30,    34,
    35,    32,    33,    29,    27,    25,    31,     2,    28,    74,
   nil,    50,   nil,   nil,   nil,    51,   nil,   nil,   nil,    36,
    37,    26,    30,    34,    35,    32,    33,    29,    27,    25,
    31,   nil,    28,   nil,   nil,    50,   nil,   nil,   nil,    71,
   nil,   nil,   nil,    36,    37,    26,    30,    34,    35,    32,
    33,    29,    27,    25,    31,   nil,    28,    13,    15,    51,
   nil,   nil,    21,   nil,    14,   nil,   nil,    36,    37,   nil,
   nil,    19,   nil,    13,    15,    20,   nil,   nil,    21,    50,
    14,   nil,   nil,    16,   nil,   nil,   nil,    19,   nil,    13,
    15,    20,   nil,   nil,    21,    99,    14,   nil,   nil,    16,
   nil,   nil,   nil,    19,    13,    15,    26,    20,   nil,    21,
   nil,    14,    29,    27,    25,    16,   nil,    28,    19,    13,
    15,    26,    20,   nil,    21,   nil,    14,    29,    27,    25,
    16,   nil,    28,    19,    13,    15,    26,    20,   nil,    21,
   nil,    14,    29,    27,    25,    16,   nil,    28,    19,   nil,
    13,    15,    20,   nil,   nil,    21,   104,    14,   nil,   nil,
    16,   nil,   nil,   nil,    19,    13,    15,    26,    20,   nil,
    21,   nil,    14,    29,    27,    25,    16,   nil,    28,    19,
    13,    15,    26,    20,   nil,    21,   nil,    14,    29,    27,
    25,    16,   nil,    28,    19,    13,    15,    26,    20,   nil,
    21,   nil,    14,    29,    27,    25,    16,   nil,    28,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
    13,    15,   nil,    20,   nil,    21,   nil,    14,   nil,   nil,
   nil,    16,   nil,   nil,    19,    13,    15,   nil,    20,   nil,
    21,   nil,    14,   nil,   nil,   nil,    16,   nil,   nil,    19,
   nil,   nil,   nil,    20,   nil,   nil,   nil,    80,    13,    15,
    71,    16,   nil,    21,   nil,    14,   nil,   nil,    13,    15,
   nil,   nil,    19,    21,   nil,    14,    20,   nil,   nil,   nil,
   nil,   nil,    19,   nil,    16,   nil,    20,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    16,    26,    30,    34,    35,    32,
    33,    29,    27,    25,    31,   nil,    28,   nil,   nil,   nil,
   nil,   nil,    72,   nil,   nil,   nil,   nil,    36,    37,    26,
    30,    34,    35,    32,    33,    29,    27,    25,    31,   nil,
    28,   nil,   nil,   nil,    86,   nil,   nil,   nil,   nil,   nil,
   nil,    36,    37,    26,    30,    34,    35,    32,    33,    29,
    27,    25,    31,   nil,    28,    38,   nil,   nil,   nil,    24,
   nil,   nil,   nil,   nil,   nil,    36,    37,    26,    30,    34,
    35,    32,    33,    29,    27,    25,    31,   nil,    28,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    36,
    37,    26,    30,    34,    35,    32,    33,    29,    27,    25,
    31,   nil,    28,    26,    30,    34,    35,    32,    33,    29,
    27,    25,    31,    36,    28 ]

racc_action_check = [
    46,   105,    18,     0,   105,    80,     0,     4,    80,    18,
     4,    46,    46,    46,    46,    46,    46,    46,    46,    46,
    46,     0,    46,    80,    55,     4,   102,     3,    12,   102,
     3,    55,    55,    46,    46,   102,   102,   102,   102,   102,
   102,   102,   102,   102,   102,     3,   102,    92,    56,   109,
    92,    99,   109,    97,    99,    56,    56,   102,   102,    97,
    97,    97,    97,    97,    97,    97,    97,    97,    97,    99,
    97,    81,     6,    89,     7,     2,    94,    69,     2,    47,
    13,    97,    97,    69,    69,    69,    69,    69,    69,    69,
    69,    69,    69,     2,    69,    68,    67,   101,     1,   104,
    66,    48,   104,    38,   107,    69,    69,    48,    48,    48,
    48,    48,    48,    48,    48,    48,    48,   104,    48,    43,
   nil,    48,   nil,   nil,   nil,    78,   nil,   nil,   nil,    48,
    48,    78,    78,    78,    78,    78,    78,    78,    78,    78,
    78,   nil,    78,   nil,   nil,    78,   nil,   nil,   nil,    85,
   nil,   nil,   nil,    78,    78,    85,    85,    85,    85,    85,
    85,    85,    85,    85,    85,   nil,    85,    22,    22,    22,
   nil,   nil,    22,   nil,    22,   nil,   nil,    85,    85,   nil,
   nil,    22,   nil,    95,    95,    22,   nil,   nil,    95,    22,
    95,   nil,   nil,    22,   nil,   nil,   nil,    95,   nil,    75,
    75,    95,   nil,   nil,    75,    95,    75,   nil,   nil,    95,
   nil,   nil,   nil,    75,    71,    71,    59,    75,   nil,    71,
   nil,    71,    59,    59,    59,    75,   nil,    59,    71,    14,
    14,    61,    71,   nil,    14,   nil,    14,    61,    61,    61,
    71,   nil,    61,    14,   100,   100,    62,    14,   nil,   100,
   nil,   100,    62,    62,    62,    14,   nil,    62,   100,   nil,
    19,    19,   100,   nil,   nil,    19,   100,    19,   nil,   nil,
   100,   nil,   nil,   nil,    19,    20,    20,    58,    19,   nil,
    20,   nil,    20,    58,    58,    58,    19,   nil,    58,    20,
    21,    21,    57,    20,   nil,    21,   nil,    21,    57,    57,
    57,    20,   nil,    57,    21,     5,     5,    60,    21,   nil,
     5,   nil,     5,    60,    60,    60,    21,   nil,    60,     5,
    25,    25,   nil,     5,   nil,    25,   nil,    25,   nil,   nil,
   nil,     5,   nil,   nil,    25,    26,    26,   nil,    25,   nil,
    26,   nil,    26,   nil,   nil,   nil,    25,   nil,   nil,    26,
    42,    42,   nil,    26,   nil,    42,   nil,    42,   nil,   nil,
   nil,    26,   nil,   nil,    42,    28,    28,   nil,    42,   nil,
    28,   nil,    28,   nil,   nil,   nil,    42,   nil,   nil,    28,
    29,    29,   nil,    28,   nil,    29,   nil,    29,   nil,   nil,
   nil,    28,   nil,   nil,    29,    30,    30,   nil,    29,   nil,
    30,   nil,    30,   nil,   nil,   nil,    29,   nil,   nil,    30,
    31,    31,   nil,    30,   nil,    31,   nil,    31,   nil,   nil,
   nil,    30,   nil,   nil,    31,    32,    32,   nil,    31,   nil,
    32,   nil,    32,   nil,   nil,   nil,    31,   nil,   nil,    32,
    33,    33,   nil,    32,   nil,    33,   nil,    33,   nil,   nil,
   nil,    32,   nil,   nil,    33,    34,    34,   nil,    33,   nil,
    34,   nil,    34,   nil,   nil,   nil,    33,   nil,   nil,    34,
    35,    35,   nil,    34,   nil,    35,   nil,    35,   nil,   nil,
   nil,    34,   nil,   nil,    35,    36,    36,   nil,    35,   nil,
    36,   nil,    36,   nil,   nil,   nil,    35,   nil,   nil,    36,
    37,    37,   nil,    36,   nil,    37,   nil,    37,   nil,   nil,
   nil,    36,   nil,   nil,    37,    51,    51,   nil,    37,   nil,
    51,   nil,    51,   nil,   nil,   nil,    37,   nil,   nil,    51,
   nil,   nil,   nil,    51,   nil,   nil,   nil,    51,    40,    40,
    40,    51,   nil,    40,   nil,    40,   nil,   nil,    27,    27,
   nil,   nil,    40,    27,   nil,    27,    40,   nil,   nil,   nil,
   nil,   nil,    27,   nil,    40,   nil,    27,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    27,    41,    41,    41,    41,    41,
    41,    41,    41,    41,    41,   nil,    41,   nil,   nil,   nil,
   nil,   nil,    41,   nil,   nil,   nil,   nil,    41,    41,    73,
    73,    73,    73,    73,    73,    73,    73,    73,    73,   nil,
    73,   nil,   nil,   nil,    73,   nil,   nil,   nil,   nil,   nil,
   nil,    73,    73,    11,    11,    11,    11,    11,    11,    11,
    11,    11,    11,   nil,    11,    11,   nil,   nil,   nil,    11,
   nil,   nil,   nil,   nil,   nil,    11,    11,    45,    45,    45,
    45,    45,    45,    45,    45,    45,    45,   nil,    45,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    45,
    45,    64,    64,    64,    64,    64,    64,    64,    64,    64,
    64,   nil,    64,    63,    63,    63,    63,    63,    63,    63,
    63,    63,    63,    64,    63 ]

racc_action_pointer = [
    -5,    98,    67,    19,    -1,   300,    67,    74,   nil,   nil,
   nil,   610,    -1,    68,   224,   nil,   nil,   nil,    -1,   255,
   270,   285,   162,   nil,   nil,   315,   330,   543,   360,   375,
   390,   405,   420,   435,   450,   465,   480,   495,    98,   nil,
   533,   562,   345,   114,   nil,   634,    -2,    51,    94,   nil,
   nil,   510,   nil,   nil,   nil,    11,    35,   279,   264,   203,
   294,   218,   233,   670,   658,   nil,    75,    89,    65,    70,
   nil,   209,   nil,   586,   nil,   194,   nil,   nil,   118,   nil,
    -3,    66,   nil,   nil,   nil,   142,   nil,   nil,   nil,    64,
   nil,   nil,    43,   nil,    49,   178,   nil,    46,   nil,    43,
   239,    88,    22,   nil,    91,    -3,   nil,    95,   nil,    45,
   nil ]

racc_action_default = [
    -1,   -55,    -1,    -1,    -1,   -55,   -55,   -55,    -2,    -3,
    -4,   -55,   -55,    -7,   -55,    -9,   -10,   -11,   -30,   -55,
   -55,   -34,   -55,   111,    -5,   -55,   -55,   -55,   -55,   -55,
   -55,   -55,   -55,   -55,   -55,   -55,   -55,   -55,   -55,    -6,
   -38,   -55,   -55,   -55,   -15,   -16,   -33,   -55,   -55,   -44,
   -45,   -55,   -17,   -18,   -19,   -20,   -21,   -22,   -23,   -24,
   -25,   -26,   -27,   -28,   -29,   -39,   -41,   -38,   -55,   -38,
   -36,   -55,    -8,   -55,   -14,   -34,   -31,   -43,   -55,   -46,
    -1,   -55,   -42,   -12,   -35,   -38,   -13,   -32,   -48,   -55,
   -40,   -37,   -55,   -47,   -55,   -55,   -49,   -55,   -50,    -1,
   -55,   -55,   -55,   -52,    -1,   -55,   -54,   -55,   -51,   -55,
   -53 ]

racc_goto_table = [
     1,    11,     8,     9,    10,    47,    65,    68,    49,    79,
    41,    12,    70,    98,   103,    44,    45,   nil,    48,   nil,
   nil,    52,    53,    54,    55,    56,    57,    58,    59,    60,
    61,    62,    63,    64,    77,    93,    69,   nil,    73,    82,
   nil,    84,   nil,   nil,   nil,   106,   nil,    78,   108,    90,
   nil,   nil,   110,   nil,   nil,   nil,   nil,    91,   nil,    87,
   nil,   nil,   nil,   nil,    88,   nil,   nil,    85,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    89,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    97,   nil,   nil,   nil,   nil,   102,   nil,   nil,   101,
   nil,   nil,   nil,   nil,   107 ]

racc_goto_check = [
     1,     4,     1,     1,     1,     9,    11,     8,    13,    14,
     4,     5,    10,    16,    17,     4,     4,   nil,     4,   nil,
   nil,     4,     4,     4,     4,     4,     4,     4,     4,     4,
     4,     4,     4,     4,    13,    15,     4,   nil,     4,    10,
   nil,    10,   nil,   nil,   nil,    15,   nil,     4,    15,    11,
   nil,   nil,    15,   nil,   nil,   nil,   nil,    10,   nil,     9,
   nil,   nil,   nil,   nil,    13,   nil,   nil,     4,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     1,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     4,   nil,   nil,   nil,   nil,     4,   nil,   nil,     1,
   nil,   nil,   nil,   nil,     1 ]

racc_goto_pointer = [
   nil,     0,   nil,   nil,    -4,     6,   nil,   nil,   -33,   -16,
   -28,   -32,   nil,   -14,   -42,   -57,   -82,   -86 ]

racc_goto_default = [
   nil,   nil,     3,     4,    46,   nil,    18,    17,   nil,   nil,
   nil,   nil,    66,   nil,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 38, :_reduce_none,
  2, 38, :_reduce_2,
  2, 38, :_reduce_3,
  2, 38, :_reduce_4,
  3, 39, :_reduce_5,
  3, 39, :_reduce_6,
  1, 43, :_reduce_none,
  3, 43, :_reduce_8,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  4, 41, :_reduce_12,
  4, 41, :_reduce_13,
  3, 41, :_reduce_14,
  2, 41, :_reduce_15,
  2, 41, :_reduce_16,
  3, 41, :_reduce_17,
  3, 41, :_reduce_18,
  3, 41, :_reduce_19,
  3, 41, :_reduce_20,
  3, 41, :_reduce_21,
  3, 41, :_reduce_22,
  3, 41, :_reduce_23,
  3, 41, :_reduce_24,
  3, 41, :_reduce_25,
  3, 41, :_reduce_26,
  3, 41, :_reduce_27,
  3, 41, :_reduce_28,
  3, 41, :_reduce_29,
  1, 41, :_reduce_none,
  3, 44, :_reduce_31,
  3, 46, :_reduce_32,
  1, 46, :_reduce_33,
  0, 46, :_reduce_34,
  2, 45, :_reduce_35,
  1, 45, :_reduce_36,
  3, 47, :_reduce_37,
  0, 47, :_reduce_38,
  3, 42, :_reduce_39,
  3, 48, :_reduce_40,
  1, 48, :_reduce_41,
  2, 49, :_reduce_42,
  4, 40, :_reduce_43,
  3, 40, :_reduce_44,
  1, 50, :_reduce_45,
  2, 50, :_reduce_46,
  4, 51, :_reduce_47,
  2, 51, :_reduce_48,
  2, 52, :_reduce_49,
  2, 52, :_reduce_50,
  4, 53, :_reduce_51,
  3, 53, :_reduce_52,
  4, 54, :_reduce_53,
  2, 54, :_reduce_54 ]

racc_reduce_n = 55

racc_shift_n = 111

racc_token_table = {
  false => 0,
  :error => 1,
  :comma => 2,
  :dot => 3,
  :endtag => 4,
  :ident => 5,
  :integer => 6,
  :keyword => 7,
  :lblock => 8,
  :lblock2 => 9,
  :lbracket => 10,
  :linterp => 11,
  :lparen => 12,
  :op_div => 13,
  :op_eq => 14,
  :op_gt => 15,
  :op_geq => 16,
  :op_lt => 17,
  :op_leq => 18,
  :op_minus => 19,
  :op_mod => 20,
  :op_mul => 21,
  :op_neq => 22,
  :op_not => 23,
  :op_plus => 24,
  :pipe => 25,
  :plaintext => 26,
  :rblock => 27,
  :rbracket => 28,
  :rinterp => 29,
  :rparen => 30,
  :string => 31,
  :tag_ident => 32,
  :op_uminus => 33,
  :op_neg => 34,
  :op_and => 35,
  :op_or => 36 }

racc_nt_base = 37

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "comma",
  "dot",
  "endtag",
  "ident",
  "integer",
  "keyword",
  "lblock",
  "lblock2",
  "lbracket",
  "linterp",
  "lparen",
  "op_div",
  "op_eq",
  "op_gt",
  "op_geq",
  "op_lt",
  "op_leq",
  "op_minus",
  "op_mod",
  "op_mul",
  "op_neq",
  "op_not",
  "op_plus",
  "pipe",
  "plaintext",
  "rblock",
  "rbracket",
  "rinterp",
  "rparen",
  "string",
  "tag_ident",
  "op_uminus",
  "op_neg",
  "op_and",
  "op_or",
  "$start",
  "block",
  "interp",
  "tag",
  "expr",
  "filter_chain",
  "primary_expr",
  "tuple",
  "function_args",
  "tuple_content",
  "function_keywords",
  "filter_chain_cont",
  "filter_call",
  "tag_first_cont",
  "tag_first_cont2",
  "tag_next_cont",
  "tag_next_cont2",
  "tag_next_cont3" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'parser.racc', 22)
  def _reduce_2(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 24)
  def _reduce_3(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 26)
  def _reduce_4(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 30)
  def _reduce_5(val, _values, result)
     result = [ :interp, retag(val), val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 32)
  def _reduce_6(val, _values, result)
     result = [ :interp, retag(val), val[1] ] 
    result
  end
.,.,

# reduce 7 omitted

module_eval(<<'.,.,', 'parser.racc', 37)
  def _reduce_8(val, _values, result)
     result = [ val[1][0], retag(val), *val[1][2..-1] ] 
    result
  end
.,.,

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

module_eval(<<'.,.,', 'parser.racc', 44)
  def _reduce_12(val, _values, result)
     result = [ :call,   retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 46)
  def _reduce_13(val, _values, result)
     result = [ :index,  retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 48)
  def _reduce_14(val, _values, result)
     result = [ :access, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 50)
  def _reduce_15(val, _values, result)
     result = [ :uminus, retag(val), val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 52)
  def _reduce_16(val, _values, result)
     result = [ :not, retag(val), val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 54)
  def _reduce_17(val, _values, result)
     result = [ :mul, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 56)
  def _reduce_18(val, _values, result)
     result = [ :div, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 58)
  def _reduce_19(val, _values, result)
     result = [ :mod, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 60)
  def _reduce_20(val, _values, result)
     result = [ :plus, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 62)
  def _reduce_21(val, _values, result)
     result = [ :minus, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 64)
  def _reduce_22(val, _values, result)
     result = [ :eq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 66)
  def _reduce_23(val, _values, result)
     result = [ :neq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 68)
  def _reduce_24(val, _values, result)
     result = [ :lt, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 70)
  def _reduce_25(val, _values, result)
     result = [ :leq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 72)
  def _reduce_26(val, _values, result)
     result = [ :gt, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 74)
  def _reduce_27(val, _values, result)
     result = [ :geq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 76)
  def _reduce_28(val, _values, result)
     result = [ :and, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 78)
  def _reduce_29(val, _values, result)
     result = [ :or, retag(val), val[0], val[2] ] 
    result
  end
.,.,

# reduce 30 omitted

module_eval(<<'.,.,', 'parser.racc', 83)
  def _reduce_31(val, _values, result)
     result = [ :tuple, retag(val), val[1].compact ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 87)
  def _reduce_32(val, _values, result)
     result = [ val[0], *val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 89)
  def _reduce_33(val, _values, result)
     result = [ val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 91)
  def _reduce_34(val, _values, result)
     result = [ ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 95)
  def _reduce_35(val, _values, result)
     result = [ :args, retag(val), val[0], val[1][2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 97)
  def _reduce_36(val, _values, result)
     result = [ :args, retag(val), nil, val[0][2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 101)
  def _reduce_37(val, _values, result)
     name = val[0][2].to_sym
        tail = val[2][2]
        loc  = retag([ val[0], val[1] ])

        if tail.include? name
          @errors << SyntaxError.new("duplicate keyword argument `#{val[0][2]}'",
              tail[name][1])
        end

        hash = {
          name => [ val[1][0], loc, *val[1][2..-1] ]
        }.merge(tail)

        result = [ :keywords, retag([ loc, val[2] ]), hash ]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 117)
  def _reduce_38(val, _values, result)
     result = [ :keywords, nil, {} ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 121)
  def _reduce_39(val, _values, result)
     result = [ val[0], *val[2] ].
            reduce { |tree, node| node[3][2] = tree; node }
      
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 127)
  def _reduce_40(val, _values, result)
     result = [ val[0], *val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 129)
  def _reduce_41(val, _values, result)
     result = [ val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 133)
  def _reduce_42(val, _values, result)
     ident_loc = val[0][1]
        empty_args_loc = { line:  ident_loc[:line],
                           start: ident_loc[:end] + 1,
                           end:   ident_loc[:end] + 1, }
        result = [ :call, val[0][1], val[0],
                   [ :args, val[1][1] || empty_args_loc, nil, val[1][2] ] ]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 143)
  def _reduce_43(val, _values, result)
     result = [ :tag, retag(val), val[1], val[2], *reduce_tag_args(val[3][2]) ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 145)
  def _reduce_44(val, _values, result)
     result = [ :tag, retag(val), val[1], nil,    *reduce_tag_args(val[2][2]) ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 153)
  def _reduce_45(val, _values, result)
     result = [ :cont,  retag(val), [] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 155)
  def _reduce_46(val, _values, result)
     result = [ :cont,  retag(val), [ val[0], *val[1][2] ] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 159)
  def _reduce_47(val, _values, result)
     result = [ :cont2, val[0][1],  [ [:block, val[0][1], val[1] ], *val[3] ] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 161)
  def _reduce_48(val, _values, result)
     result = [ :cont2, retag(val), [ val[0], *val[1][2] ] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 165)
  def _reduce_49(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 167)
  def _reduce_50(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 171)
  def _reduce_51(val, _values, result)
     result = [ [:block, val[0][1], val[1] ], *val[3] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 173)
  def _reduce_52(val, _values, result)
     result = [ val[0], val[1], *val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 177)
  def _reduce_53(val, _values, result)
     result = [ [:block, val[0][1], val[1] ], *val[3] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.racc', 179)
  def _reduce_54(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Liquor
