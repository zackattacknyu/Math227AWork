function [ times,states ] = computeTimecourse( qMatrix,initState,numSteps )
%COMPUTETIMECOURSE
%
%Input:
%   qMatrix - matrix for graph where entry (i,j) corresponds to the edge
%               from state i to state j
%   initState - starting state
%   numSteps - number of steps to compute
%
%Output:
%   times - time elapsed after each step
%   states - current state at each step

times = zeros(1,numSteps); %time point
states = zeros(1,numSteps); %current state at each point

states(1) = initState;
times(1) = 0;

curT = 0;
curState = initState;

for i = 2:numSteps
    
    %lambdaBar to use to sample time to transition
    lambdaBar = sum(qMatrix(curState,:));
    
    %sample time from exponential dist
    sampledT = sampleFromDist(lambdaBar,1);
    curT = curT + sampledT;
    
    %get uniform sample
    sampledR = rand(1);
    
    %put it in 0 to lambdaBar range
    sampledLambda = sampledR*lambdaBar;
    
    %find which state that value corresponds to
    curState = find(cumsum(qMatrix(curState,:))>sampledLambda,1,'first');
    
    states(i) = curState;
    times(i) = curT;
    
end

end

