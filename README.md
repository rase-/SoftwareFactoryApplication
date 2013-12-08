This application is a part of my application to Software Factory.

To build and run te application you need to install the node package manager
(npm). Take a look at the website: https://npmjs.org/

When npm is installed, dependencies of the project need to be installed. This
can be done with a make target: `make install`. Essentially this target just
invokes npm install.

Also, the attached CoffeeScript files need to be compiled. This can be done
with `make`, or `make build`.

To run the application after building, invoke `make run`. Since the app is a
web application, you need to make an HTTP request to get the statistics for the
given tasks. To view frequencies by category, send a request with e.g.
curl like so: `curl localhost:3000/category.txt`. To view by location: `curl localhost:3000/location.txt`.

While running the server, after any first request, the data is cached in
memory. Any request after the first are thus fast. If you wish to reload
everything and rebuild the cache, you can do any request like normal, but you
should add a url parameter to the end like so:  
`curl 'http://localhost:3000/category.txt?useCached=false'`  
`curl 'http://localhost:3000/location.txt?useCached=false'`  

To view a visual representation of the data, you can go to the `frontend` directory in a separate terminal instance (while the server is running) and open index.html in any (almost) browser that supports JavaScript. Do not fear. If no prior requests have been made to the server, there is a delay before showing the chart while the server is downloading the data. If this was your first reqeuest to the server, the data will now be cached.
