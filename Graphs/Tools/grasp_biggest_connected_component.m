%Selects the subgraph associated to the biggest connected component of a
%graph.
%
%   graph = GRASP_BIGGEST_CONNECTED_COMPONENT(graph) find the biggest
%   connected component and returns it.
%
%   [..., nodes] = GRASP_BIGGEST_CONNECTED_COMPONENT(...) also returns
%   the set of selected nodes.
%
% Authors:
%  - Benjamin Girault <benjamin.girault@ens-lyon.fr>
%  - Benjamin Girault <benjamin.girault@usc.edu>

% Copyright Benjamin Girault, École Normale Supérieure de Lyon, FRANCE /
% Inria, FRANCE (2015)
% Copyright Benjamin Girault, University of Sourthern California, Los
% Angeles, California, USA (2017-2018)
% 
% benjamin.girault@ens-lyon.fr
% benjamin.girault@usc.edu
% 
% This software is a computer program whose purpose is to provide a Matlab
% / Octave toolbox for handling and displaying graph signals.
% 
% This software is governed by the CeCILL license under French law and
% abiding by the rules of distribution of free software.  You can  use, 
% modify and/ or redistribute the software under the terms of the CeCILL
% license as circulated by CEA, CNRS and INRIA at the following URL
% "http://www.cecill.info". 
% 
% As a counterpart to the access to the source code and  rights to copy,
% modify and redistribute granted by the license, users are provided only
% with a limited warranty  and the software's author,  the holder of the
% economic rights,  and the successive licensors  have only  limited
% liability. 
% 
% In this respect, the user's attention is drawn to the risks associated
% with loading,  using,  modifying and/or developing or reproducing the
% software by the user in light of its specific status of free software,
% that may mean  that it is complicated to manipulate,  and  that  also
% therefore means  that it is reserved for developers  and  experienced
% professionals having in-depth computer knowledge. Users are therefore
% encouraged to load and test the software's suitability as regards their
% requirements in conditions enabling the security of their systems and/or 
% data to be ensured and,  more generally, to use and operate it in the 
% same conditions as regards security. 
% 
% The fact that you are presently reading this means that you have had
% knowledge of the CeCILL license and that you accept its terms.

function [graph, nodes] = grasp_biggest_connected_component(graph)
    % Load the matlab-bgl toolbox for 'components'
    grasp_start_opt_3rd_party('MatlabBGL');
    
    % Find the biggest connected component
    [conn_comps, sizes] = components(sparse(graph.A));
    [~, biggest_cc] = max(sizes);
    nodes = find(conn_comps == biggest_cc);
    
    % Select only the nodes of that component
    graph = grasp_subgraph(graph, nodes);
end