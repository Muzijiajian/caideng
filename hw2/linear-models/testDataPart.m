function test_error = testDataPart(nTest,theta)
%COMPUTER Test Error.
%
%   INPUT:  nTest: ��������һ�������ɲ������ݼ�.
%           theta: ��ѵ�����ݼ��õ���Ȩ��ֵ.
%
%   OUTPUT: test_error: ���������
%    
    [test_data, test_y, ~] = mkdata(nTest);
    test_error = errorrate(test_data,theta,test_y);
end