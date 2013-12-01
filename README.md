This application is a part of my application to Software Factory.

To build and run te application you need to install the node package manager
(npm).

When npm is installed, dependencies of the project need to be installed. This
can be done with a make target: make install. Essentially this target just
invokes npm install.

Also, the attached CoffeeScript files need to be compiled. This can be done by
"make", or "make build".

To run the application after building, run "node server.js".
