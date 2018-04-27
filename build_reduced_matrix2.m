function [d_prior]=build_reduced_matrix2(inter_tads,tad_positions,resolution,a_coef,g_s_exp,hic_exp)
ntads=size(tad_positions,1);
row = 1;
for i = 1 : ntads-1
    endI = tad_positions(i,2);
    start_next_I = tad_positions(i+1,1);
%    centerI = (startI+endI)/2;
    indexi_End = ceil(endI*1.0/resolution);
    index_nextI_start = ceil(start_next_I*1.0/resolution);
    if(index_nextI_start == indexi_End)
        index_nextI_start = index_nextI_start + 1;
    end
    if(inter_tads(i)~=0)
        f = inter_tads(i);
        d_prior(i) = 1000 * f^hic_exp;
    else
        gdist = (index_nextI_start-indexi_End)*resolution;
        d_prior(i) = a_coef*1000*(gdist)^g_s_exp;
    end
end
