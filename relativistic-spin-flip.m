(* ::Package:: *)

(* ::Section:: *)
(*Definitions\.08\.08\.08\.08\.08\.08\.08\.08\.08\.08\.08\.08\.08*)


(* ::Input:: *)
(*G0=({*)
(* {1, 0, 0, 0},*)
(* {0, 1, 0, 0},*)
(* {0, 0, -1, 0},*)
(* {0, 0, 0, -1}*)
(*});*)
(*G1=({*)
(* {0, 0, 0, 1},*)
(* {0, 0, 1, 0},*)
(* {0, -1, 0, 0},*)
(* {-1, 0, 0, 0}*)
(*});*)
(*G2=({*)
(* {0, 0, 0, -I},*)
(* {0, 0, I, 0},*)
(* {0, I, 0, 0},*)
(* {-I, 0, 0, 0}*)
(*});*)
(*G3=({*)
(* {0, 0, 1, 0},*)
(* {0, 0, 0, -1},*)
(* {-1, 0, 0, 0},*)
(* {0, 1, 0, 0}*)
(*});*)
(**)
(*G5=({*)
(* {0, 0, 1, 0},*)
(* {0, 0, 0, 1},*)
(* {1, 0, 0, 0},*)
(* {0, 1, 0, 0}*)
(*});*)


(* ::Input:: *)
(*$Assumptions={e\[Element]Reals ,p0\[Element]Reals ,p1\[Element]Reals ,p2\[Element]Reals ,p3\[Element]Reals,v0\[Element]Reals,z\[Element]Reals,L\[Element]Reals,e>0,m>0,v0>0,L>0,pz>0, pz\[Element]Reals, py\[Element]Reals, e>m, e-v0>m, e>v0+m, hx>0,hx\[Element]Reals}*)


(* ::Section:: *)
(*Dirac's Eq*)


(* ::Input:: *)
(*etaD = (G0+I G5)/Sqrt[2];*)
(*eta = etaD;*)
(**)


(* ::Input:: *)
(*Pz =Eigenvectors[ G0  e+  m  I G5];*)


(* ::Input:: *)
(* PzA = %*)


(* ::Input:: *)
(*PzC = PzA/. { Sqrt[e^2 - m^2]->pz}*)


(* ::Input:: *)
(*P={{0,0,0,1},{0,0,1,0},{0,1,0,0},{1,0,0,0}};*)
(**)
(*PzD =PzC . P*)


(* ::Input:: *)
(*col[v_]:=List/@v;*)
(**)
(*u1=col[PzD[[3]]];*)
(*u2=col[PzD[[4]]];*)
(**)
(*u3=col[PzD[[1]]];*)
(*u4=col[PzD[[2]]];*)


(* ::Input:: *)
(*u1//MatrixForm*)


(* ::Input:: *)
(*ConjugateTranspose[u1] . u2//FullSimplify*)


(* ::Input:: *)
(*Fu1[ee_,ppz_]:=u1/. {e->ee, pz->ppz}*)
(*Fu2[ee_,ppz_]:=u2/. {e->ee, pz->ppz}*)
(*Fu3[ee_,ppz_]:=u3/. {e->ee, pz->ppz}*)
(*Fu4[ee_,ppz_]:=u4/. {e->ee, pz->ppz}*)


(* ::Input:: *)
(*Fu1[e,p1]*)


(* ::Input:: *)
(*psiIN = a Fu1[e,p1];*)
(*psiR = b Fu1[e,-p1] + bp Fu2[e,-p1];*)
(*psiT = c  Fu1[e-v0,p2]+ cp Fu2[e-v0,p2];*)


(* ::Input:: *)
(*Xm =G0*)


(* ::Input:: *)
(*jin= ConjugateTranspose[psiIN] . Xm . psiIN//FullSimplify*)


(* ::Input:: *)
(*jR= ConjugateTranspose[psiR] . Xm . psiR//FullSimplify*)


(* ::Input:: *)
(*jT = ConjugateTranspose[psiT] . Xm . psiT//FullSimplify*)


(* ::Input:: *)
(*jR/jin/.{p1-> Sqrt[e^2-m^2],p2-> Sqrt[(e-v0)^2-m^2]}//FullSimplify*)


(* ::Input:: *)
(*jT/jin/.{p1-> Sqrt[e^2-m^2],p2-> Sqrt[(e-v0)^2-m^2]}//FullSimplify*)


(* ::Input:: *)
(*nt =((e-m-v0+Sqrt[e^2-m^2-2 e v0+v0^2]) (e+m-v0+Sqrt[e^2-m^2-2 e v0+v0^2]))/(2  (-m^2+e (e+Sqrt[e^2-m^2])) );(*G3*)*)
(*nr = m^2/(m^2-2 e (e+Sqrt[e^2-m^2]));*)


(* ::Input:: *)
(*sol1 = Solve[a Fu1[e,p1]+b Fu1[e,-p1] + bp Fu2[e,-p1]==c  Fu1[e-v0,p2]+ cp Fu2[e-v0,p2],{a,b,c,bp,cp}]//FullSimplify*)


(* ::Input:: *)
(*sol2 = sol1/.{p1-> Sqrt[e^2-m^2],p2-> Sqrt[(e-v0)^2-m^2]}//FullSimplify*)


(* ::Input:: *)
(*Tr1=(c/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Tr2=(cp/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Rf1=(b/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Rf2=(bp/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Ttotal = nt(modsq[ Tr1[[1]] ]+modsq[ Tr2[[1]] ] )//FullSimplify *)


(* ::Input:: *)
(*Limit[Ttotal,v0->\[Infinity]]//FullSimplify*)


(* ::Input:: *)
(*Limit[Ttotal,v0->0]//FullSimplify*)


(* ::Input:: *)
(*Rtot = nr(modsq[ Rf1[[1]] ]+modsq[ Rf2[[1]] ] )//FullSimplify*)


(* ::Input:: *)
(*Limit[Rtot,v0->\[Infinity]]//FullSimplify*)


(* ::Input:: *)
(*Limit[Rtot,v0->0]//FullSimplify*)


(* ::Input:: *)
(*TotP [ee_,v00_,mm_]:=nt(modsq[  Tr1[[1]] ]+modsq[ Tr2[[1]] ] )+nr(  modsq[  Rf1[[1]] ]+modsq[ Rf2[[1]] ])/. {e->ee, v0->v00, m->mm}*)


(* ::Input:: *)
(*Plot3D[TotP [e,v0,1],{e,2,1000},{v0,1,100}]*)


(* ::Input:: *)
(*me=9.1*10^-31;*)
(*cv=3*10^8;*)
(*ev=me*cv^2/(1.6*10^-19);*)
(*mev=me*cv^2/(1.6*10^-19);*)
(*jev=(1.6*10^-19);*)
(*vstep=10^6;*)


(* ::Input:: *)
(*Tup[ee_,v00_,mm_]:= Abs[nt modsq[ Tr1[[1]] ]]/. {e->ee, v0->v00, m->mm}*)
(*Tdn[ee_,v00_,mm_]:= Abs[nt modsq[Tr2[[1]] ]]/. {e->ee, v0->v00, m->mm}*)
(*Rup[ee_,v00_,mm_]:=Abs[ nr modsq[ Rf1[[1]] ]]/. {e->ee, v0->v00, m->mm}*)
(*Rdn[ee_,v00_,mm_]:= Abs[nr modsq[ Rf2[[1]] ]]/. {e->ee, v0->v00, m->mm}*)


(* ::Input:: *)
(*Plot[{Tup[x*(vstep+mev),(vstep+1/2 mev),1/2 mev],Tdn[x*(vstep+mev),(vstep+1/2mev),1/2mev]},{x,1,3},PlotStyle->{{Red,Thick},{Blue,Thick}},Frame->True,FrameLabel->{Style["E/(V\:2080+m)",18,Italic],None},PlotLegends->Placed[{Style["T\:2081",18,Italic],Style["T\:2082",18,Italic]},{0.8,0.2}],ImageSize->{600,600},FrameTicksStyle->Directive[Black,14],PlotRange->All,PlotTheme->"Scientific"]*)
(**)


(* ::Input:: *)
(*Plot[{Rup[x*(vstep+mev),(vstep+1/2mev),1/2mev],Rdn[x*(vstep+mev),(vstep+1/2mev),1/2mev]},{x,1,3},PlotStyle->{{Red,Thick},{Blue,Thick}},PlotRange->{{1,3},{0,1}},Frame->True,FrameLabel->{Style["E/V\:2080",18,Italic],None},PlotLegends->Placed[{Style["R\:2081",18,Italic],Style["R\:2082",18,Italic]},{0.75,0.3}],ImageSize->{900,600},FrameTicksStyle->Directive[Black,14],FrameStyle->Directive[Black,14],(*\:2705 replaces FrameLabelStyle*)PlotTheme->"Scientific",PlotLabel->Style["V\:2080 = 1 MeV",18,Italic]]*)
(**)


(* ::Input:: *)
(*Rup[(vstep+mev),(vstep+1/2mev),1/2mev]*)


(* ::Section:: *)
(*Ajaib's Representation*)


(* ::Input:: *)
(*etaA = -I/Sqrt[2] (G0 . G1 . G5+ G2);*)
(*eta = etaA;*)
(**)


(* ::Input:: *)
(*x1 = ( eta + ConjugateTranspose[eta])/Sqrt[2];*)
(*x2 =  ( eta - ConjugateTranspose[eta])/Sqrt[2];*)


(* ::Input:: *)
(*Pz =Eigenvectors[ x1  e+  m  x2];*)


(* ::Input:: *)
(* PzA = %*)


(* ::Input:: *)
(*PzC = PzA/.  { Sqrt[e^2 - m^2]->pz}*)


(* ::Input:: *)
(*P={{0,0,0,1},{0,0,1,0},{0,1,0,0},{1,0,0,0}};*)
(**)
(*PzD =PzC . P*)


(* ::Input:: *)
(*col[v_]:=List/@v;*)
(**)
(*u1=col[PzD[[3]]];*)
(*u2=col[PzD[[4]]];*)
(**)
(*u3=col[PzD[[1]]];*)
(*u4=col[PzD[[2]]];*)


(* ::Input:: *)
(*u1//MatrixForm*)


(* ::Input:: *)
(*ConjugateTranspose[u1] . u2//FullSimplify*)


(* ::Input:: *)
(*Fu1[ee_,ppz_]:=u1/. {e->ee, pz->ppz}*)
(*Fu2[ee_,ppz_]:=u2/. {e->ee, pz->ppz}*)
(*Fu3[ee_,ppz_]:=u3/. {e->ee, pz->ppz}*)
(*Fu4[ee_,ppz_]:=u4/. {e->ee, pz->ppz}*)


(* ::Input:: *)
(*Fu1[e,p1]*)


(* ::Input:: *)
(*psiIN = a Fu1[e,p1];*)
(*psiR = b Fu1[e,-p1] + bp Fu2[e,-p1];*)
(*psiT = c  Fu1[e-v0,p2]+ cp Fu2[e-v0,p2];*)


(* ::Input:: *)
(*Xm =eta + ConjugateTranspose[eta]*)


(* ::Input:: *)
(*jin= ConjugateTranspose[psiIN] . Xm . psiIN//FullSimplify*)


(* ::Input:: *)
(*jR= ConjugateTranspose[psiR] . Xm . psiR//FullSimplify*)


(* ::Input:: *)
(*jT = ConjugateTranspose[psiT] . Xm . psiT//FullSimplify*)


(* ::Input:: *)
(*jR/jin/.{p1-> Sqrt[e^2-m^2],p2-> Sqrt[(e-v0)^2-m^2]}//FullSimplify*)


(* ::Input:: *)
(*jT/jin/.{p1-> Sqrt[e^2-m^2],p2-> Sqrt[(e-v0)^2-m^2]}//FullSimplify*)


(* ::Input:: *)
(*nt =(e Sqrt[(e^2-m^2-2 e v0+v0^2)/(e^2-m^2)])/(e-v0) ;(*G3*)*)
(*nr = 1;*)


(* ::Input:: *)
(*sol1 = Solve[a Fu1[e,p1]+b Fu1[e,-p1] + bp Fu2[e,-p1]==c  Fu1[e-v0,p2]+ cp Fu2[e-v0,p2],{a,b,c,bp,cp}]//FullSimplify*)


(* ::Input:: *)
(*sol2 = sol1/.{p1-> Sqrt[e^2-m^2],p2-> Sqrt[(e-v0)^2-m^2]}//FullSimplify*)


(* ::Input:: *)
(*Tr1=(c/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Tr2=(cp/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Rf1=(b/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Rf2=(bp/.sol2)/(a/.sol2)//FullSimplify*)


(* ::Input:: *)
(*Ttotal = nt(modsq[ Tr1[[1]] ]+modsq[ Tr2[[1]] ] )//FullSimplify *)


(* ::Input:: *)
(*Limit[Ttotal,v0->\[Infinity]]//FullSimplify*)


(* ::Input:: *)
(*Limit[Ttotal,v0->0]//FullSimplify*)


(* ::Input:: *)
(*Rtot = nr(modsq[ Rf1[[1]] ]+modsq[ Rf2[[1]] ] )//FullSimplify*)


(* ::Input:: *)
(*Limit[Rtot,v0->\[Infinity]]//FullSimplify*)


(* ::Input:: *)
(*Limit[Rtot,v0->0]//FullSimplify*)


(* ::Input:: *)
(*TotP [ee_,v00_,mm_]:=nt(modsq[  Tr1[[1]] ]+modsq[ Tr2[[1]] ] )+nr(  modsq[  Rf1[[1]] ]+modsq[ Rf2[[1]] ])/. {e->ee, v0->v00, m->mm}*)


(* ::Input:: *)
(*Plot3D[TotP [e,v0,1],{e,2,1000},{v0,1,100}]*)


(* ::Input:: *)
(*me=9.1*10^-31;*)
(*cv=3*10^8;*)
(*ev=me*cv^2/(1.6*10^-19);*)
(*mev=me*cv^2/(1.6*10^-19);*)
(*jev=(1.6*10^-19);*)
(*vstep=10^6;*)


(* ::Input:: *)
(*Tup[ee_,v00_,mm_]:= Abs[nt modsq[ Tr1[[1]] ]]/. {e->ee, v0->v00, m->mm}*)
(*Tdn[ee_,v00_,mm_]:= Abs[nt modsq[Tr2[[1]] ]]/. {e->ee, v0->v00, m->mm}*)
(*Rup[ee_,v00_,mm_]:=Abs[ nr modsq[ Rf1[[1]] ]]/. {e->ee, v0->v00, m->mm}*)
(*Rdn[ee_,v00_,mm_]:= Abs[nr modsq[ Rf2[[1]] ]]/. {e->ee, v0->v00, m->mm}*)


(* ::Input:: *)
(*Plot[{Tup[x*(vstep+mev),(vstep+1/2 mev),1/2 mev],Tdn[x*(vstep+mev),(vstep+1/2mev),1/2mev]},{x,1,3},PlotStyle->{{Red,Thick},{Blue,Thick}},Frame->True,FrameLabel->{Style["E/(V\:2080+m)",18,Italic],None},PlotLegends->Placed[{Style["T\:2081",18,Italic],Style["T\:2082",18,Italic]},{0.8,0.2}],ImageSize->{600,600},FrameTicksStyle->Directive[Black,14],PlotRange->All,PlotTheme->"Scientific"]*)
(**)


(* ::Input:: *)
(*Export["step_potential.pdf",%]*)


(* ::Input:: *)
(*Plot[{Rup[x*(vstep+mev),(vstep+1/2mev),1/2mev],Rdn[x*(vstep+mev),(vstep+1/2mev),1/2mev]},{x,1,3},PlotStyle->{{Red,Thick},{Blue,Thick}},PlotRange->{{1,3},{0,1}},Frame->True,FrameLabel->{Style["E/V\:2080",18,Italic],None},PlotLegends->Placed[{Style["R\:2081",18,Italic],Style["R\:2082",18,Italic]},{0.75,0.3}],ImageSize->{900,600},FrameTicksStyle->Directive[Black,14],FrameStyle->Directive[Black,14],(*\:2705 replaces FrameLabelStyle*)PlotTheme->"Scientific",PlotLabel->Style["V\:2080 = 1 MeV",18,Italic]]*)
(**)


(* ::Section:: *)
(*Unitary Equivalence*)


(* ::Input:: *)
(*S1= 1/Sqrt[2] {{-1,0,0,1},{0,1,1,0},{0,1,-1,0},{-1,0,0,-1}};*)


(* ::Input:: *)
(*S1//MatrixForm*)


(* ::Input:: *)
(*S1 . x1 . ConjugateTranspose[S1]- G0//FullSimplify*)


(* ::Input:: *)
(* S1 . x2 . ConjugateTranspose[S1]- I G5*)


(* ::Input:: *)
(*S1 . ConjugateTranspose[S1]//MatrixForm*)
