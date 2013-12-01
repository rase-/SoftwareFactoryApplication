This application is a part of my application to Software Factory.

To build and run te application you need to install the node package manager
(npm). Take a look at the website: https://npmjs.org/

When npm is installed, dependencies of the project need to be installed. This
can be done with a make target: "make install". Essentially this target just
invokes npm install.

Also, the attached CoffeeScript files need to be compiled. This can be done by
"make", or "make build".

To run the application after building, invoke "make run". Since the app is a
web application, you need to make an HTTP request to get the statistics for the
given tasks. To view frequencies by category, send an http request with e.g.
curl like so: "curl localhost:3000/category.txt". To view by location: "curl localhost:3000/location.txt".
