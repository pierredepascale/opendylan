Module:       llvm-internals
Author:       Peter S. Housel
Copyright:    Original Code is Copyright 2009-2010 Gwydion Dylan Maintainers
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define constant <llvm-linkage-kind>
  = one-of(#"private", #"linker-private", #"linker-private-weak",
           #"linker-private-weak-def-auto", #"internal", #"weak", #"weak-odr",
           #"linkonce", #"linkonce-odr", #"available-externally", #"appending",
           #"dllexport", #"common", #"dllimport", #"extern-weak", #"external");

define constant <llvm-visibility-kind>
  = one-of(#"default", #"hidden", #"protected");

define constant <llvm-unnamed-address-kind>
  = one-of(#f, #"global-unnamed-addr", #"local-unnamed-addr");

define abstract class <llvm-global-value> (<llvm-constant-value>)
  constant slot llvm-global-name :: type-union(singleton(#f), <integer>, <string>),
    init-value: #f, init-keyword: name:;
  constant slot llvm-global-linkage-kind :: <llvm-linkage-kind>,
    required-init-keyword: linkage:;
  constant slot llvm-global-visibility-kind :: <llvm-visibility-kind>,
    init-value: #"default", init-keyword: visibility:;
  constant slot llvm-global-unnamed-address :: <llvm-unnamed-address-kind>,
    init-value: #f, init-keyword: unnamed-address:;
  constant slot llvm-global-alignment :: false-or(<integer>),
    init-value: #f, init-keyword: alignment:;
  constant slot llvm-global-section :: false-or(<string>),
    init-value: #f, init-keyword: section:;
end class;

define constant <llvm-global-thread-local-kind>
  = one-of(#f, #t, #"localdynamic", #"initialexec", #"localexec");

define class <llvm-global-variable> (<llvm-global-value>)
  constant slot llvm-global-variable-constant? :: <boolean>,
    required-init-keyword: constant?:;
  constant slot llvm-global-variable-initializer :: false-or(<llvm-constant-value>),
    init-value: #f, init-keyword: initializer:;
  constant slot llvm-global-variable-thread-local :: <llvm-global-thread-local-kind>,
    init-value: #f, init-keyword: thread-local:;
end class;

define class <llvm-global-alias> (<llvm-global-value>)
  constant slot llvm-global-alias-aliasee :: <llvm-constant-value>,
    required-init-keyword: aliasee:;
end class;
