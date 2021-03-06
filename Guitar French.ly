%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lilypond engraving by Graham Okely
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.16.0"  % necessary for upgrading to future LilyPond versions.
\header{
	title 			=	\markup \override #'(font-size . 8) "Love is Patient"
	composer		=	"Music (c) Graham Okely 1988"
	poet			=	"Lyrics 1st Corinthians 13:4-8"
	tagline			=	"Graham.Vocal@Gmail.com"
	copyright		=	"Graham.Vocal@Gmail.com"
	title 			=	\markup \override #'(font-size . 8) "L'amour est patient"
        translator_to_French 	=	" (French by Andrew Tanner)"
        poet			=	"Lyrics 1st Corinthians 13:4-8 (French by Andrew Tanner)"
}
\paper {
	#(set-default-paper-size "a4")
	head-separation 			=	3\mm
	top-margin 				=	3\mm
        system-system-spacing #'basic-distance 	= 	2\mm  
        system-system-spacing #'padding  	= 	1\mm
	ragged-bottom				=	##f
	ragged-last-bottom			=	##t
	% system-count 				=	#9
myStaffSize = #20
#(define fonts
 (make-pango-font-tree "Go Boom!" 
"Go Boom!" 
"Go Boom!"
(/ myStaffSize 20)))
}
guitarChords = \chordmode {
  % Introduction
  \override ChordName   #'font-size = #+2
  \set majorSevenSymbol = "maj7"
  \set chordChanges = ##t
  f1:7 f1:7 
  % verse 1
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g:m c:7 c2:m7 f:7
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g1:m  bes2 c:m7 bes1
  % Break
  f1:7 f1:7
  % Verse 2
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g:m c:7 c2:m7 f:7
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g1:m
  % Repeated tag
  bes2 c:m7 bes1 f:7
  bes2 c:m7 c1:m7 c1:m7
  bes1
  }
verseMelody =  \relative c' {
	\override Score.MetronomeMark #'padding = #6
	\tempo 4=105
	\time 4/4
	\clef treble
	\key bes \major
	\set fontSize = #+1
	% Introduction
	r1 r1 
	% Love is patient
	f1 f2 d4 f \break		
	%  Love is kind 
	g1 ges2 f 
	% It does not envy
	d8 d fis4 a8 a4. 	
	% it does not boast
	bes8 bes a4 g2	\break	
	%Love is not proud
	r4 c g e c2 r2 
	% Love is not rude
	f1 f4 f4 d2 \break
	% Love is not self seeking
	g1 ges8. ges16 ges4 f f	
	% It is not easily angered
	d8 d fis4 a8 a a4 bes4\( a g4.\) g8
	% It keeps no record of wrongs
	bes4 bes bes8 bes bes4 bes1
	%======================================
	% Break
	r1 r1
	%======================================
	% verse 2
	% Love does not de
	f1 \break f2 d4. d8 		
	%  light in evil 
	g1 ges2 f4 f 
	% But rejoices 
	d4 fis a a \break
	% in the truth it
	bes4 a g4. g8		
	% always protects
	c2 g4 e c2 r2		
	% always trusts
	f1 \break f2 d2 
	% always hopes
	g1 ges2 f	
	% always persevers
	d4 ( fis) a4 a
	bes4 a g2 \break
        bes2 bes4 bes4 bes1 r1
        bes2 bes4 bes4 ~ 
        bes2 ees8 ees4. \fermata | 
        g8 g4. ~ g2 \fermata | 
        f1 \bar "|." 
	\break
}
frenchWords = \lyricmode {
    \override LyricText #'font-size = #+3
    % French
    % Love is pat- ient
    L'amour est pa- tient
    % Love is kind
    L'amour est bon
    % It does not en- vy
    il n'est pas en- vi-eux
    % It does not boast
    ne se vante pas 
    % Love is not proud
    L'amour n'est pas or-_guei-_lleux
    % Love is not rude
    Il-ne fait rien de_hon-_teux
    % Love is not self seek- ing
    Il n'est - pas ego- iste
	    % It is not eas- i- ly a- n- gered
	    % Il n'est pas fac- ile- ment irrite _ _  
	    % (alt. Il ne s'irrite pas)
    Il _ ne s'ir-_ri-_te _ _ pas  _ _  
    % It keeps no rec- ord of wrongs
    Il n'e- prouve pas de ran- cune
	    % il ne garde aucun memoire de maux 
	    % (alt. Il n'eprouve pas de rancune)
    % vese 2
    % Love does not
    L'amour ne se
    % de- light in ev- il
    rejouit pas du mal _
    % but re- joi- ces in the truth
    Mais il se rejouit de la ve-_ri-_te
    % It al- ways pro- tects
    Il pro- tege tou- jours
    % Al- ways trusts
    se fie toujours
    % Al- ways hoes
    espere tou- jours
    % Al-  al- ways per- sev- eres
    per- se- vere tou- _ jours
    % Love ne- ver fails
    L'amour est sans fin
    L'amour est sans est sans est sans fin.
}


% French
\bookpart  {
      \score {
            <<
                \new ChordNames \guitarChords
                \new Voice = "one" \verseMelody
                \new Lyrics \lyricsto "one" \frenchWords
            >>
      }
% --format=png -dresolution=300
}
