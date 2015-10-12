function test_error = testDataPart(nTest,theta)
%COMPUTER Test Error.
%
%   INPUT:  nTest: 给定任意一个数生成测试数据集.
%           theta: 由训练数据集得到的权重值.
%
%   OUTPUT: test_error: 被误分类数
%    
    [test_data, test_y, ~] = mkdata(nTest);
    test_error = errorrate(test_data,theta,test_y);
end