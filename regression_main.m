%% Load data in script
load('dataset4.mat');
[mx, nx] = size(X);
n = 1.4;
sigma = 0.00000001;
iteration = 1000000;
itr = zeros(1, iteration);
r = zeros(1, iteration);

%% Create initialTheta and find sigmoid function
initialTheta = zeros(nx,1);
h = computeFunction(X, initialTheta);

%% Run gradient descent algorithm
XT = X.';
theta1 = initialTheta;

h = computeFunction(X, theta1);

theta2 = computeTheta(h, Y, n, theta1, mx, XT);
thetabefore = theta2
diff = theta2-theta1;
diffT = diff.';
i=0;
p = diffT*diff
empiricalError = zeros(1, iteration);
while diffT*diff>=sigma & i<iteration
    i = i+1;
    i
    theta1 = theta2;
    h = computeFunction(X, theta1);
    theta2 = computeTheta(h, Y, n, theta1, mx, XT);
    diff = theta2-theta1;
    diffT = diff.';
    empiricalError(1, i) = computeRisk(mx, Y, h); 
    itr(1,i) = i;
end

 
func = (-theta2(1,1)*(X(:,1))-theta2(3,1)*(X(:,3)))./theta2(2,1);


pos = find(Y==1);
neg = find(Y==0);
plot(X(pos, 1), X(pos, 2), "k+", 'Color', 'r')
hold on
plot(X(neg, 1), X(neg, 2), "ko", 'Color', 'b')
hold on
plot(X(:,1), func)
legend('Y==1','Y==0', 'Decision Boundry');
ylabel('X2 data');
xlabel('X1 data');

f = figure;
plot(itr, empiricalError);
legend('Empirical error');
ylabel('Error');
xlabel('Iteration');
