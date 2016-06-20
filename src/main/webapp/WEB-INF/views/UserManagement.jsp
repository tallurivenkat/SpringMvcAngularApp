<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>User Management </title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="UserController as vm">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">User Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="vm.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="vm.user.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Emp Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="vm.user.username" id="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                       <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="vm.user.address" id="address" class="form-control input-sm" required placeholder="Enter your Address."/>
                              </div>
                          </div>
                      </div> 
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="active">Active</label>
                              <div class="col-md-3">
                                  <input type="checkbox" ng-model="vm.user.active" id="email"   />
                                  
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!vm.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="vm.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Users </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th> <a href="#" ng-click="orderByField='id'; reverseSort = !reverseSort">
          ID <span ng-show="orderByField == 'id'"><span ng-show="!reverseSort">^</span><span ng-show="reverseSort">v</span></span>
          </a></th>
                              <th><a href="#" ng-click="orderByField='username'; reverseSort = !reverseSort">
            Emp Name <span ng-show="orderByField == 'username'"><span ng-show="!reverseSort">^</span><span ng-show="reverseSort">v</span></span>
          </a></th>
                              <th><a href="#" ng-click="orderByField='address'; reverseSort = !reverseSort">
            Address <span ng-show="orderByField == 'address'"><span ng-show="!reverseSort">^</span><span ng-show="reverseSort">v</span></span>
          </a></th>
                              <th><a href="#" ng-click="orderByField='active'; reverseSort = !reverseSort">
            Active <span ng-show="orderByField == 'active'"><span ng-show="!reverseSort">^</span><span ng-show="reverseSort">v</span></span>
          </a></th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="user in vm.users |orderBy:orderByField:reverseSort">
                              <td><span ng-bind="user.id"></span></td>
                              <td><span ng-bind="user.username"></span></td>
                              <td><span ng-bind="user.address"></span></td>
                              <td><span ng-bind="user.active"></span></td>
                              <td>
                              <button type="button" ng-click="vm.edit(user.id)" class="btn btn-success custom-width">Edit</button>                             
                                <button type="button" ng-click="vm.remove(user.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
       <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/user.svc.js' />"></script>
      <script src="<c:url value='/static/js/controller/user.ctrl.js' />"></script>
  </body>
</html>

