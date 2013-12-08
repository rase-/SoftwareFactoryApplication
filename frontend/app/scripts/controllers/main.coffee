'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $http) ->
      $http.get("http://localhost:3000/data.json")
          .success (data) -> 
            console.log JSON.stringify(data)
            $scope.data = data
