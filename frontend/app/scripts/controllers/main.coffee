'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $http) ->
      $http.get "localhost:3000/data.json"
          .success (data) -> $scope.data = data
