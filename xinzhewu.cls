%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% XinzheWu V.3.0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xinzhewu}[14/05/2018]

%\LoadClass[12pt,a4paper]{book}	% notez le "twoside", essentiellement pour alterner les en-tete et pieds de page gauche et droit si on veut utliser les fancyhead. 
\LoadClass[twoside,12pt,a4paper]{book}

\RequirePackage[utf8]{inputenc} 
\RequirePackage[french, english]{babel}
\RequirePackage{ifpdf, color}
\RequirePackage{textcomp}

\RequirePackage[T1]{fontenc} 
\RequirePackage{lmodern} 
\RequirePackage{tikz} 
\RequirePackage{fix-cm}
\RequirePackage{graphicx} 
\RequirePackage{sectsty} 
\RequirePackage{shorttoc} 
\RequirePackage{fancyhdr} 
\RequirePackage{pifont} 
\RequirePackage[inner=30mm,outer=20mm,top=30mm,bottom=20mm]{geometry}

\RequirePackage{setspace} 
\RequirePackage{framed} 
\RequirePackage{color}

\onehalfspacing 

\RequirePackage{ifthen} 

\RequirePackage{csquotes} 
\frenchspacing
\FrenchFootnotes



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
\def\@makechapterhead#1{%
  \vspace*{30\p@}%
  {\parindent \z@ \raggedright \reset@font
            \scshape \Huge \@chapapp{} \thechapter
            \vspace*{10\p@}
        \par\nobreak
        \interlinepenalty\@M
    \huge \bfseries #1\par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 40\p@
  }}
\def\@makeschapterhead#1{%
 \vspace*{0\p@}%
  {\parindent \z@ \raggedright \reset@font
            \scshape \vphantom{\@chapapp{} \thechapter}
        \par\nobreak
        \interlinepenalty\@M
    \huge \bfseries #1 \par\nobreak
    %\vspace*{1\p@}%
    \hrulefill
    \par\nobreak
    \vskip 60\p@
  }}


%%%%%%%%%%% Tete de parties %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\newcommand*{\jolipart}[1]{%
	\begin{center}
		\begin{Huge}\color{black}
			#1
		\end{Huge}
		\end{center}
		\vspace{1cm}		
	\begin{center}
%\begin{Huge}
		%\ding{167}
	%\end{Huge}	
	\hrulefill
	\end{center}		
	}


\parttitlefont{\jolipart}

\partnumberfont{\sc\normalsize}



\definecolor{grisfonce}{RGB}{49,49,49}
\definecolor{grisclair}{RGB}{111,111,111}
\definecolor{blanc}{RGB}{255,255,255}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\iffalse

%\RequirePackage[style=verbose-trad1,hyperref,backend=biber]{biblatex} %Pour le style 
\RequirePackage[style=ieee,hyperref,backend=biber]{biblatex} %Pour le style 



\bibliography{biblio} %Nom du fichier bibtex a utiliser.
\defbibheading{primary}{\section*{Sources primaires}} % Categorie (sous forme de section) pour le tri de la bibliographie.

\defbibheading{secondary}{\section*{Sources secondaires}} % Categorie (sous forme de section) pour le tri de la bibliographie.

\renewcommand*{\newunitpunct}{\addcomma\space} % Virgule entre les parties d'une reference (merci a Josquin Debaz)

%%%% Ajustements pour la bibliographie
%\DeclareFieldFormat[article]{volume}{\textbf{#1}}  %Le numero de volume en gras
\DeclareFieldFormat[article]{number}{\textit{#1}} %Le numero dans le volume en italique
%\DeclareFieldFormat{pages}{page(s): #1} % page(s) en toutes lettres, si on veut...

\renewcommand{\mkibid}[1]{\emph{#1}} %Les locutions latines en italique (comme ibid, loc.cit. , etc.) Merci à Josquin Debaz

% Et pour mettre le in en italique dans la reférence biblio (merci encore à Josquin Debaz)
\DefineBibliographyStrings{french}{%
        in = {\emph{in}}%
}
\fi

%%%%%%%%%%%%%%%%%% Interligne simple pour citations et vers %%%%%%%%%

%
\let\orig@quote\quote
\let\endorig@quote\endquote
\renewenvironment*{quote}
	{\begin{orig@quote}\begin{singlespace}}
	{\end{singlespace}\end{orig@quote}}

\let\old@quotation\quotation
\let\endold@quotation\endquotation
\renewenvironment*{quotation}
	{\begin{old@quotation}\begin{singlespace}}
        {\end{singlespace}\end{old@quotation}}

\let\old@verse\verse
\let\endold@verse\endverse
\renewenvironment*{verse}
	{\begin{old@verse}\begin{singlespace}}
        {\end{singlespace}\end{old@verse}}

%%%%%%%%%%%%%%%% TITRE THESE PAGE DE GARDE %%%%%%%%%%%%%%%%

%logo universite

\newcommand*{\logouniversite}[1]{\gdef\@logouniversite{#1}}
\logouniversite{}

\newcommand*{\scalelogouniversite}[1]{\gdef\@scalelogouniversite{#1}}
\scalelogouniversite{}

% Logo Labo
\newcommand*{\logolabo}[1]{\gdef\@logolabo{#1}}
\logolabo{}

\newcommand*{\scalelogolabo}[1]{\gdef\@scalelogolabo{#1}}
\scalelogolabo{}

% Nom de l'universite
\newcommand*{\nomdeuniversite}[1]{\gdef\@nomdeuniversite{#1}}
\nomdeuniversite{}

%%%% Eventuel sous-titre
\newcommand{\lesoustitre}[1]{\gdef\@lesoustitre{#1}}
\lesoustitre{}

%%%% Discipline
\newcommand{\discipline}[1]{\gdef\@discipline{#1}}
\discipline{}

%%%% Nom du directeur de these
\newcommand{\dirdethese}[1]{\gdef\@dirdethese{#1}}
\dirdethese{}

%%%% Titre du directeur de these
\newcommand{\titredudirdethese}[1]{\gdef\@titredudirdethese{#1}}
\titredudirdethese{}


%%%% Jury
\newcommand{\jury}[1]{\gdef\@jury{#1}}
\jury{}

%%%% Laboratoire / department / unité
\newcommand{\unite}[1]{\gdef\@unite{#1}}
\unite{}

%%%%% Ecole doctorale
\newcommand{\ecoledoc}[1]{\gdef\@ecoledoc{#1}}
\ecoledoc{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%mise en page de la page de garde
\makeatletter
\def\maketitle{%
	\thispagestyle{empty}
	\clearpage
	\begin{tikzpicture}[remember picture,overlay,line width=0mm]
  \draw [draw=white,fill=white]
    (current page.north west) rectangle (\paperwidth,1);
  \node[xshift=0\paperwidth,yshift=2cm,text=white,font=\bf\Large] {
  %\includegraphics[scale=\@scalelogouniversite]{\@logouniversite}
  };
  \node[xshift=.6\paperwidth,yshift=2cm,text=white,font=\bf\Large] {
 % \includegraphics[scale=\@scalelogolabo]{\@logolabo}
  };
   \node at (current page.center)
{\parbox{15.5cm}{

	\begin{center}
		\textsc{\LARGE \textbf{TH\`ESE DE DOCTORAT}}\\ 
	\end{center}
\begin{center}
	\textsc{\large{pr\'esent\'ee \`a}}
\end{center}
\begin{center}
 \textsc{\large \@nomdeuniversite}
\end{center}
\begin{center}
		\textsc{\large{par}}
\end{center}
\begin{center}
\textsc{\large \textbf{{\@author}}}
\end{center}
%\begin{center}
%\begin{huge}
%\end{huge}
%\end{center}
\begin{center}
\textbf{Sp\'ecialit\'e de doctorat : \@discipline}
\end{center}
\begin{center}
%\@unite \\
\@ecoledoc
\end{center}
\vspace{0.4cm}
\noindent\rule{15.5cm}{0.5mm}
	\begin{center}
		{\setlength{\baselineskip}{1.1\baselineskip}
		\begin{huge}
			\textbf{\@title}
		\end{huge}
		\par}
	\end{center}

\noindent\rule{15.5cm}{0.5mm}

\bigskip

\vspace{0.2cm}
	\textsc{Membres du jury:}
	\begin{small}
		\@jury
	\end{small}
	\begin{flushright}
		\textbf{Th\`ese pr\'ent\'ee et soutenue \`a} \@date
	\end{flushright}
}
};
\end{tikzpicture}
}

\makeatother



\makeatletter
\def\maketitle{%
	\thispagestyle{empty}
	\clearpage
	\begin{tikzpicture}[remember picture,overlay,line width=0mm]
	\draw [draw=white,fill=white]
	(current page.north west) rectangle (\paperwidth,1);
	\node[xshift=0\paperwidth,yshift=2cm,text=white,font=\bf\Large] {
		%\includegraphics[scale=\@scalelogouniversite]{\@logouniversite}
	};
	\node[xshift=.6\paperwidth,yshift=2cm,text=white,font=\bf\Large] {
		% \includegraphics[scale=\@scalelogolabo]{\@logolabo}
	};
	\node at (current page.center)
	{\parbox{15.5cm}{
			
			\begin{center}
			\textsc{\LARGE \textbf{TH\`ESE DE DOCTORAT}}\\ 
			\end{center}
			\begin{center}
			\textsc{\large{pr\'esent\'ee \`a}}
			\end{center}
			\begin{center}
			\textsc{\large \@nomdeuniversite}
			\end{center}
			\begin{center}
			\textsc{\large{par}}
			\end{center}
			\begin{center}
			\textsc{\large \textbf{{\@author}}}
			\end{center}
			%\begin{center}
			%\begin{huge}
			%\end{huge}
			%\end{center}
			\begin{center}
			\textbf{Sp\'ecialit\'e de doctorat : \@discipline}
			\end{center}
			\begin{center}
			%\@unite \\
			\@ecoledoc
			\end{center}
			\vspace{0.4cm}
			\noindent\rule{15.5cm}{0.5mm}
			\begin{center}
			{\setlength{\baselineskip}{1.2\baselineskip}
				\begin{huge}
				\textbf{\@title}
				\end{huge}
				\par}
			\end{center}
			\vspace{0.4cm}
			%	\begin{center}
			
			%\textbf{\@lesoustitre}
			%	\end{center}
			\noindent\rule{15.5cm}{0.5mm}
			%	\begin{flushright}
			%		\textsc{Par : \textbf{\@author}}
			%	\end{flushright}
			%\vspace{1cm}
			\bigskip
			\begin{flushleft}
			\textbf{Th\`ese dirig\'ee par} \textsc{\@dirdethese}, \@titredudirdethese
			\end{flushleft}

			\textsc{Membres du jury:}
			\begin{small}
			\@jury
			\end{small}
			\begin{flushright}
			\textbf{Th\`ese pr\'ent\'ee et soutenue \`a} \@date
			\end{flushright}
		}
	};
	\end{tikzpicture}
}

\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\newcommand{\clearemptydoublepage}{%
   \newpage{\pagestyle{empty}\cleardoublepage}}
%%%% .... et utiliser la commande \clearemptydoublepage juste avant le \chapter


    \fancyhf{}                       % on annule le fancy automatique
   

%%%%%%%%%% Gerer les en tetes dans les frontmatter mainmatter et backmatter

\RequirePackage{etoolbox}

\appto\frontmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\chaptermark}[1]{\markboth{\textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\leftmark}   % \rightmark = section courante
    \fancyhead[LE]{\small\leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre
}

\appto\mainmatter{\pagestyle{fancyplain}
\renewcommand{\sectionmark}[1]{\markright{\textit{\thesection.\ #1}}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ \textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\rightmark}   % \rightmark = section courante
%    \fancyhead[LE]{\small Partie~\thepart, \leftmark} % \leftmark = chapitre courant
    \fancyhead[LE]{\small \leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre
}     

\appto\backmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ #1}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{}   % \rightmark = section courante
    \fancyhead[LE]{} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}               % marque la page au centre

} 


% Couleurs :


\definecolor{fondtitre}{RGB}{85,85,85}
\definecolor{fonddeboite}{RGB}{232,232,232}
\definecolor{shadecolor}{RGB}{232,232,232}

\ProcessOptions

\newcommand*{\boitemagique}[2]{
\begin{center}
\begin{tikzpicture}
% la boite
\node[rectangle,draw=fondtitre!100,fill=fonddeboite!100,inner sep=10pt, inner ysep=20pt] (mabox)
{
\begin{minipage}{12cm}
#2
\end{minipage}
};
% le titre de la boite
\node[fill=fondtitre!100, text=white, rectangle] at (mabox.north) {\sffamily\textbf{#1}};
\end{tikzpicture}
\end{center}
}

\newcommand*{\boitesimple}[1]{%
\begin{center}
\begin{minipage}{12cm}
\begin{shaded}
	#1
\end{shaded}
\end{minipage}
\end{center}
}