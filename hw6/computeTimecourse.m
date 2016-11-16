function [ times,states ] = computeTimecourse( qMatrix,initState,numSteps )
%COMPUTETIMECOURSE Summary of this function goes here
%   Detailed explanation goes here

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
    
    %sample uniformly, then use lambda to decide which state
    %   to transition to
    sampledR = rand(1);
    sampledLambda = sampledR*lambdaBar;
    curState = find(cumsum(qMatrix(curState,:))>sampledLambda,1,'first');
    
    states(i) = curState;
    times(i) = curT;
    
end

end

