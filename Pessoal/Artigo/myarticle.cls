\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}[2006/06/21 Customized article]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{common-article}}
\ProcessOptions

\LoadClass{common-article}

\def\@maketitle{
	\null
	\begin{center}
		{\LARGE \@title \par}
		\vskip 1.5em
		{
			\large
			\begin{tabular}[t]{c}
				\@author \hspace{.3em} <\@email> \\
				\today
			\end{tabular}
		}
	\end{center}
	\par
	\vskip 1.5em
	\printlicense
}