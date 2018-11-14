import numpy as numpy
import math
import matplotlib.pyplot as plt
import scipy as sp
import array
import matplotlib.ticker as ticker

from matplotlib import gridspec


plt.rc('text', usetex=True)
font = {'family' : 'sans-serif', 'sans-serif' : 'Helvetica',
          'weight' : 'bold',
          'size'   : 15.}
plt.rc('font', **font )
 
plt.rc('text.latex', preamble=r'\usepackage{cmbright}')

gs = gridspec.GridSpec(1, 3,
                       width_ratios=[1,1,1]
                       )

fig = plt.figure(figsize=(12,4.2),dpi=500)

p1 = fig.add_subplot(gs[0])

p1.yaxis.grid()

x1 = [0,1,2,3,4,5,6,7,8]
y1 = [17.75,10.8,5.1,2.93,1.58,0.99,0.55,0.41,0.4]
y2 = [6.19,3.39,2.06,1.06,0.59,0.286,0.157,0.0758,0.062]
y3 = [5.69,3.20,1.69,0.99,0.46,0.23,0.116,0.056,0.050]
y4 = [6.79,3.73,1.83,1.10,0.52,0.24,0.117,0.059,0.053]

wy1 = [17.75,17.5/2,17.5/4,17.5/8,17.5/16,17.5/32,17.5/64,17.5/128,17.5/256]
wy2 = [6.19,6.19/2,6.19/4,6.19/8,6.19/16,6.19/32,6.19/64,6.19/128,6.19/256]
wy3 = [5.69,3.20,1.69,0.99,0.46,0.23,0.116,0.056,0.050]
wy4 = [6.79,3.73,1.83,1.10,0.52,0.24,0.117,0.059,0.053]

xlabels1 = ['1','2','4','8','16','32','64','128','256']
p1.set_yscale('log')

p1.plot(x1,y1,'h-',label='SOR (CPU)',markersize='8',mfc='None',mec='b',mew='1.2',lw='1.2')
p1.plot(x1,y2,'h-',label='Jacobi (CPU)',markersize='8',mfc='None',mec='g',mew='1.2',lw='1.2')
p1.plot(x1,y3,'h-',label='No preconditioner (CPU)',markersize='8',mfc='None',mec='black',mew='1.2',lw='1.2',c='black')
p1.plot(x1,y4,'h-',label='UCGLE (CPU)',markersize='8',c='r',mfc='None',mec='r',mew='1.2',lw='1.2')
p1.plot(x1,wy1,'--',label='SOR (CPU) opt',c='b')
p1.plot(x1,wy2,'--',label='SOR (CPU) opt',c='g')
p1.set_xticks(x1)
p1.set_xticklabels(xlabels1)
p1.set_xlabel('CPU core count',size='11')
p1.set_ylabel('Time (s)', size='11')
p1.set_xlim(-1,9)
p1.set_ylim(0.003,70)
p1.tick_params(axis='y', labelsize=8.8,which='both')
p1.tick_params(axis='x', labelsize=8.8)
#1.set_xticklabels(xlabels1)

###########################

p2 = fig.add_subplot(gs[1])
p2.yaxis.grid()

p2.set_yscale('log')
x2 = [2,4,8,16,32,64,128]
yy1 = [9.8/4,5.1/4,2.23/4,1.55/4,0.84/4,0.55/4,0.577/4]
yy2 = [3.59/4,2.06/4,1.03/4,0.58/4,0.266/4,0.1907/4,0.1858/4]
yy3 = [3.20/4,1.69/4,0.89/4,0.46/4,0.25/4,0.166/4,0.166/4]
yy4 = [3.93/4,1.93/4,1.10/4,0.59/4,0.27/4,0.172/4,0.177/4]

xlabels2 = ['','2','4','8','16','32','64','128']

p2.plot(yy1,'^-',label='SOR (GPU)',markersize='6',mec='b',mew='1.2',lw='1.2')
p2.plot(yy2,'^-',label='Jacobi (GPU)',markersize='6',mec='g',mew='1.2',lw='1.2')
p2.plot(yy3,'^-',label='No preconditioner (GPU)',markersize='6',mec='black',mew='1.2',lw='1.2',c='black')
p2.plot(yy4,'^-',label='UCGLE (GPU)',markersize='6',c='r',mec='r',mew='1.2',lw='1.2')
p2.set_xlabel('GPU count', size='11')
p2.set_xlim(-1,7)
p2.set_ylim(0.003,70)
p2.tick_params(axis='y', labelsize=8.8,which='both')
p2.tick_params(axis='x', labelsize=8.8)
p2.set_xticklabels(xlabels2)

p2.set_title(r'\textbf{(a)} \textbf{Solve Time Per Iteration}', size='12', y=1.12);

#p1.legend(loc='upper right',prop={'size':7},ncol=2,frameon=True)
#p2.legend(loc ='lower left', prop={'size':7},ncol=2,frameon=True)


##########################################

p3 = fig.add_subplot(gs[2])

p3.yaxis.grid()

x1 = [0,1,2,3,4,5,6,7,8]
y1 = [191,217,218,227,219,219,230,223,223]
y2 = [346,380,387,387,387,387,387,387,387]
y3 = [396,400,400,400,400,400,400,400,400]
y4 = [74,74,74,74,74,74,74,74,74]

xlabels1 = ['1','2','4','8','16','32','64','128','256']

p3.plot(x1,y1,'h-',label='SOR (CPU)',markersize='8',mfc='None',mec='b',mew='1.2',lw='1.2')
p3.plot(x1,y2,'h-',label='Jacobi (CPU)',markersize='8',mfc='None',mec='g',mew='1.2',lw='1.2')
p3.plot(x1,y3,'h-',label='No preconditioner (CPU)',markersize='8',mfc='None',mec='black',mew='1.2',lw='1.2',c='black')
p3.plot(x1,y4,'h-',label='UCGLE (CPU)',markersize='8',c='r',mfc='None',mec='r',mew='1.2',lw='1.2')
p3.set_xticks(x1)
p3.set_xticklabels(xlabels1)
p3.set_xlabel('CPU core count',size='11')
p3.set_ylabel('Iteration Number',size='11')
p3.set_xlim(-1,9)
p3.set_ylim(0,500)
p3.tick_params(axis='y', labelsize=8.8,which='both')
p3.tick_params(axis='x', labelsize=8.8)
#1.set_xticklabels(xlabels1)

###########################

p4 = p3.twiny()
x2 = [2,4,8,16,32,64]
yy1 = [191,217,218,233,233,233]
yy2 = [346,380,387,387,387,387]
yy3 = [396,400,400,400,400,400]
yy4 = [83,83,83,83,83,83]

xlabels2 = ['','1','2','4','8','16','32']

p4.plot(yy1,'^-',label='SOR (GPU)',markersize='6',mec='b',mew='1.2',lw='1.2')
p4.plot(yy2,'^-',label='Jacobi (GPU)',markersize='6',mec='g',mew='1.2',lw='1.2')
p4.plot(yy3,'^-',label='No preconditioner (GPU)',markersize='6',mec='black',mew='1.2',lw='1.2',c='black')
p4.plot(yy4,'^-',label='UCGLE (GPU)',markersize='6',c='r',mec='r',mew='1.2',lw='1.2')
p4.set_xlabel('GPU count', size='11')
p4.set_xlim(-1,6)
p4.set_ylim(0,500)
p4.tick_params(axis='y', labelsize=8.8,which='both')
p4.tick_params(axis='x', labelsize=8.8)
p4.set_xticklabels(xlabels2)

p3.set_title(r'\textbf{(b)} \textbf{Iteration Numbers}', size='12', y=1.12);

#p3.legend(loc='upper right',prop={'size':7},ncol=2,frameon=True)
#p4.legend(loc ='lower left', prop={'size':7},ncol=2,frameon=True)

p1.xaxis.grid()
p2.xaxis.grid()
#p3.xaxis.grid()
#p4.xaxis.grid(linestyle='-.',lw='0.1')
#plt.tight_layout(pad=.8,h_pad=.3)
plt.tight_layout(w_pad=1.6)

plt.savefig("scalable2.eps",dpi=500)
#plt.show()