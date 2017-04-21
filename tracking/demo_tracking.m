%% DEMO_TRACKING
%
% Running the MDNet tracker on a given sequence.
%
% Hyeonseob Nam, 2015
%

clear;

addpath('../utils')
addpath('../matconvnet')
addpath('../matconvnet/matlab')
addpath('../matconvnet/matlab/mex')

seqList = importdata('/home/gayathri/mdnet_new/pretraining/seqList/vot16-otb.txt')
for i = 1:length(seqList)
	conf = genConfig('otb',seqList{i})
	% conf = genConfig('otb','Diving');
	% conf = genConfig('vot2016','ball1');

	switch(conf.dataset)
    	case 'otb'
    	    net = fullfile('../models','mdnet_vot16-otb.mat');
    	    %net = fullfile('../models','mdnet_vot-otb.mat');
    	case 'vot2014'
        	net = fullfile('../models','mdnet_otb-vot14.mat');
    	case 'vot2015'
        	net = fullfile('../models','mdnet_otb-vot15.mat');
		case 'vot2016'
			net = fullfile('../models','mdnet_otb-vot16.mat');
	end

	result = mdnet_run(conf.imgList, conf.gt(1,:), net);

	result

end
