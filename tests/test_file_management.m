% Test functions dealing with file management, copy, dicom conversion, etc.

% TODO: add this path only once before running MOxUnit, not in all tests.
addpath(genpath('../'));
PATH_DICOM = 'dicom_unsorted';

function test_suite=test_file_management
    test_functions=localfunctions();
    initTestSuite;

function test_dicomsorts
    mkdir('dicom_sorted')
    % TODO: uncomment once unsorted data are added
%     sortdicoms(PATH_DICOM, 'dicom_sorted')
