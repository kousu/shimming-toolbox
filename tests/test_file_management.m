% Test functions dealing with file management, copy, dicom conversion, etc.

% TODO: add this path only once before running MOxUnit, not in all tests.
addpath(genpath('../'));

function test_suite=test_file_management
    test_functions=localfunctions();
    initTestSuite;

function test_dicomsorts
    sortdicoms('dicom_unsorted/', 'dicom_sorted/');
    assert(isfile('dicom_sorted/06_a_gre_DYNshim/echo_11.5/acdc_95p-HC7;NC1,2-0001-0001.dcm'));
