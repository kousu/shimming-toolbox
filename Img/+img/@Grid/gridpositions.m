function [x,y,z] = gridpositions( Self )
%GRIDPOSITIONS  Return [x,y,z]: Three 2- or 3-D arrays of voxel positions 
% 
% [x,y,z] = Self.gridpositions( ) 
%
% Returns three 3D arrays of doubles, each element containing the
% location [units: mm] of the corresponding voxel with respect to 
% DICOM's 'Reference Coordinate System'.

    % Arrays of voxel row, column, and slice indices
    [iRows,iColumns,iSlices] = ndgrid( [0:1:Self.size(1)-1], ...
                      [0:1:Self.size(2)-1], ...
                      [0:1:Self.size(3)-1] ) ; 

    % Rotation and Scaling matrix: RS  
    RS = Self.rotation * diag(Self.spacing) ;

    % Scale and rotate to align row direction with x-axis, column direction
    % with y-axis, slice with z-axis; then translate w.r.t origin (via ImagePositionPatient)
    x = ( RS(1,1)*iRows + RS(1,2)*iColumns + RS(1,3)*iSlices ) + Self.imagePositionPatient(1) ;
    y = ( RS(2,1)*iRows + RS(2,2)*iColumns + RS(2,3)*iSlices ) + Self.imagePositionPatient(2) ;
    z = ( RS(3,1)*iRows + RS(3,2)*iColumns + RS(3,3)*iSlices ) + Self.imagePositionPatient(3) ;

end

