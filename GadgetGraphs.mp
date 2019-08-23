% GadgetGraphs.mp -- drawing the graphs of gadgets.
% Szilárd Szalay, Wigner Research Centre for Physics, Budapest.
%
% compiling:
% simple compiling: 
%     mpost GadgetGraphs.mp
% if there are LaTeX labels:
%     TEX=pdflatex mpost GadgetGraphs.mp
% The script a2ping is for converting .eps figures to .pdf figures,
% while not screwing up the bounding box.
% It gives an error message, but it works fine...
% One can use the bash script for multiple conversions:
%     for f in fig_Gadget*.eps; do ./a2ping.pl $f; done
%     << or >>
%     for f in fig_Gadget*.eps; do epspdf $f; done

% setting the sizes (also in DWaveGraphs.mp) are needed


% ** declarations for metaposting **********************************************
prologues := 3;	% needed if there are LaTeX labels and also for converting to pdf

% for writing out the indices:
numeric showindices;
showindices := 0;       % hide the indices
%showindices := 1;      % show the indices

if showindices=1:
        input TEX;
        TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}");
        TEXPOST("\end{document}");
fi;


% ** units *********************************************************************

%numeric ut; ut := 24bp; 
numeric ut; ut := 30bp; 

numeric dt; dt := .2ut;			% size of a vertex
%numeric dt; dt := .15ut;		% size of a vertex
numeric it; it := 1.5bp; % 0.7bp	% width of an edge

% ** drawing routines **********************************************************

% default vertex for data qubit
vardef grvertexdata(expr A) =
	draw A withpen pencircle scaled dt withcolor black;
enddef;

% default vertex for aux qubit
vardef grvertexaux(expr A) =
	draw A withpen pencircle scaled dt withcolor red;
%	draw A withpen pencircle scaled dt withcolor black;
%	draw A withpen pencircle scaled (dt-2it) withcolor red;
%	draw A withpen pencircle scaled (dt-1.2it) withcolor red;
enddef;

% default edge for the graph
vardef gredge(expr A,B) =
	draw A--B withpen pencircle scaled it withcolor black;
enddef;


% ** gadget definitions ********************************************************

picture gadget[];


% internal database, don't touch direclty, only through "gdadd..." routines.
string gdlabel[];
numeric gdNvert[];
pair gdvert[][];
numeric gdverttype[][];		% 0: data, 1: aux
numeric gdNedge[];
numeric gdedge[][][];

numeric gd,gdN;
gd := 0;

def gdadd(expr gdl)=
	gd := gd+1;
	gdlabel[gd] := gdl;
	gdNedge[gd] := 0;
	gdNvert[gd] := 0;
enddef;

def gdaddvert(expr A,t)=
	gdvert[gd][ gdNvert[gd] ] := A;
	gdverttype[gd][ gdNvert[gd] ] := t;
	gdNvert[gd] := gdNvert[gd]+1;
	
enddef;

def gdaddedge(expr ei,ej)=
	gdedge[gd][ gdNedge[gd] ][0] := ei;
	gdedge[gd][ gdNedge[gd] ][1] := ej;
	gdNedge[gd] := gdNedge[gd]+1;
enddef;


% ** 4+1 gadgets ***************************************************************

gdadd("41_K5");
gdaddvert((0,+ut*0.3),1);
for i = 0 upto 3:
	gdaddvert(ut*dir(i*360/4+45),0);
	gdaddedge(0,i+1);
	gdaddedge(i+1,(i+1) mod 4 +1);
endfor;
gdaddedge(1,3);
gdaddedge(2,4);

gdadd("41_K5-e");
gdaddvert((0,+ut*0.3),1);
for i = 0 upto 3:
	gdaddvert(ut*dir(i*360/4+45),0);
	gdaddedge(0,i+1);
endfor;
gdaddedge(1,3);
gdaddedge(2,4);
gdaddedge(1, 4);
gdaddedge(2, 3);
gdaddedge(3, 4);

gdadd("41_star");
gdaddvert((0,0),1);
for i = 0 upto 3:
	gdaddvert(ut*dir(i*360/4+45),0);
	gdaddedge(0,i+1);
endfor;

% ** drawing the figures and output ********************************************

gdN := gd;

for gd = 1 upto gdN:
gadget[gd]:= image(
	for ie = 0 upto gdNedge[gd]-1:
		gredge( gdvert[gd][gdedge[gd][ie][0]], gdvert[gd][gdedge[gd][ie][1]] );
	endfor;
	for iv = 0 upto gdNvert[gd]-1:
		if gdverttype[gd][iv] = 0:
			grvertexdata(gdvert[gd][iv]);
		elseif gdverttype[gd][iv] = 1:
			grvertexaux(gdvert[gd][iv]);
		fi;
		if showindices=1:
			if iv =0 : 
				label.top(TEX("$b_a$"), gdvert[gd][iv] ); 
			elseif iv = 3: 
			 	label.ulft(TEX("$b_"&decimal(iv)&"$"), gdvert[gd][iv] ); 
			else:
			 	label.urt(TEX("$b_"&decimal(iv)&"$"), gdvert[gd][iv] ); 
			fi; 

		fi;
	endfor;
);
endfor;


for gd = 1 upto gdN:
	show gdlabel[gd];
	outputtemplate := "fig_Gadget"&gdlabel[gd]&".eps";
	beginfig(0) draw gadget[gd]; endfig;
endfor;

end;


