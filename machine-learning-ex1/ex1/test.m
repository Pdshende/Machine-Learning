clc;
clear all;
close all;
function cost(X,y,theta)
  m = length(y);
  J = 0;
  J = sum(((X*theta).-y).^2)/(2*m)
endfunction
function [theta,J_history] = gradientdescent(X,y,theta,num_iter,alpha)
  m = length(y);
  for i = 1:num_iter
    theta = theta.- (alpha*(1/m)*((((X*theta).-y)'*X))');
     J_history(num_iter) = computeCost(X, y, theta);
  endfor
endfunction
a = load('ex1data1.txt');
x = a(:,1);
y = a(:,2);
%plotData(x,y);
m = length(y);
X = [ones(m,1),x];
theta = zeros(2,1);
cost(X,y,theta);
num_iter = 1500;
alpha = 0.01;
theta = gradientdescent(X,y,theta,num_iter,alpha);
plot(X(:,2), X*theta, '-')
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');