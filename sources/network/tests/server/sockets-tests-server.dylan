Module:       sockets-tests-server
Synopsis:     Sockets Tests Server
Author:       Jason Trenouth
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define method main () => ()
  run-servers();
  wait-for-servers()
end method main;

begin
  main();
end;

ignore(unregister-server);

