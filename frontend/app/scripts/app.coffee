'use strict'

angular.module('frontendApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider, $httpProvider) ->
    $httpProvider.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
